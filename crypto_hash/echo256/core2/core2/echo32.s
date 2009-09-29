#---------------------------------------------------------------------------#
# Implementation of the ECHO hash function in its 256-bit outputs variant.  #
# Optimized for Intel Core2, 32-bit mode                                    #
#                                                                           #
# Date:     30 Jul 2009                                                     #
#                                                                           #
# Authors:  Ryad Benadjila  <ryadbenadjila@gmail.com>                       #
#           Olivier Billet  <billet@eurecom.fr>                             #
#---------------------------------------------------------------------------#
# -- Machine type PW
# mark_description "Intel(R) C++ Compiler Professional for applications running on IA-32, Version 11.0    Build 20090131 %s";
# mark_description "-long_double -DLENGTH=256 -O1 -DCOMPIL -msse3 -S";
	.file "echo32.c"
	.text
..TXTST0:
# -- Begin  Compress
# mark_begin;
       .align    2,0x90
	.globl Compress
Compress:
..B1.1:                         # Preds ..B1.0
                                # LOE ebx ebp esi edi
..B1.4:                         # Preds ..B1.1
# Begin ASM
# Begin ASM
        .intel_syntax noprefix
# End ASM                                                       #494.0
        pusha                                                   #495.0
# Begin ASM
        mov    dword ptr [SHA3_R], 8
# End ASM                                                       #497.0
# Begin ASM
        mov    eax, dword ptr [SHA3_S+264]
# End ASM                                                       #502.0
# Begin ASM
        mov    ecx, dword ptr [SHA3_S+264]
# End ASM                                                       #503.0
# Begin ASM
        mov    edx, eax
# End ASM                                                       #504.0
# Begin ASM
        sar    edx, 31
# End ASM                                                       #505.0
# Begin ASM
        add    eax, dword ptr [SHA3_S+256]
# End ASM                                                       #506.0
# Begin ASM
        adc    edx, dword ptr [SHA3_S+260]
# End ASM                                                       #507.0
# Begin ASM
        mov    dword ptr [SHA3_CNT],   0
# End ASM                                                       #508.0
# Begin ASM
        mov    dword ptr [SHA3_CNT+4], 0
# End ASM                                                       #509.0
# Begin ASM
        test   ecx, ecx
# End ASM                                                       #510.0
# Begin ASM
        mov    dword ptr [SHA3_S+256], eax
# End ASM                                                       #511.0
# Begin ASM
        mov    dword ptr [SHA3_S+260], edx
# End ASM                                                       #512.0
# Begin ASM
        je     L2
# End ASM                                                       #513.0
# Begin ASM
        mov    dword ptr [SHA3_CNT],   eax
# End ASM                                                       #514.0
# Begin ASM
        mov    dword ptr [SHA3_CNT+4], edx
# End ASM                                                       #515.0
# Begin ASM
        L2:
# End ASM                                                       #516.0
# Begin ASM
        mov    edx, dword ptr [SHA3_CNT+4]
# End ASM                                                       #517.0
# Begin ASM
        mov    dword ptr [SHA3_S+264], 0
# End ASM                                                       #518.0
# Begin ASM
        mov    eax, dword ptr [SHA3_CNT]
# End ASM                                                       #519.0
# Begin ASM
        cmp    edx, 0
# End ASM                                                       #520.0
# Begin ASM
        ja     OVERFLOW
# End ASM                                                       #521.0
# Begin ASM
        cmp    eax, -130
# End ASM                                                       #523.0
# Begin ASM
        ja     OVERFLOW
# End ASM                                                       #528.0
# Begin ASM
        NO_OVERFLOW1:
# End ASM                                                       #531.0
# Begin ASM
        movaps  xmm0, [SHA3_S]
# End ASM                                                       #533.0
# Begin ASM
        movaps  xmm1, [SHA3_S+16]
# End ASM                                                       #533.0
# Begin ASM
        movaps  xmm2, [SHA3_S+2*16]
# End ASM                                                       #533.0
# Begin ASM
        movaps  xmm3, [SHA3_S+3*16]
# End ASM                                                       #533.0
# Begin ASM
        pxor    xmm0, [SHA3_S+4*16]
# End ASM                                                       #533.0
# Begin ASM
        pxor    xmm1, [SHA3_S+4*16+16]
# End ASM                                                       #533.0
# Begin ASM
        pxor    xmm2, [SHA3_S+4*16+2*16]
# End ASM                                                       #533.0
# Begin ASM
        pxor    xmm3, [SHA3_S+4*16+3*16]
# End ASM                                                       #533.0
# Begin ASM
        pxor    xmm0, [SHA3_S+8*16]
# End ASM                                                       #533.0
# Begin ASM
        pxor    xmm1, [SHA3_S+8*16+16]
# End ASM                                                       #533.0
# Begin ASM
        pxor    xmm2, [SHA3_S+8*16+2*16]
# End ASM                                                       #533.0
# Begin ASM
        pxor    xmm3, [SHA3_S+8*16+3*16]
# End ASM                                                       #533.0
# Begin ASM
        pxor    xmm0, [SHA3_S+12*16]
# End ASM                                                       #533.0
# Begin ASM
        pxor    xmm1, [SHA3_S+12*16+16]
# End ASM                                                       #533.0
# Begin ASM
        pxor    xmm2, [SHA3_S+12*16+2*16]
# End ASM                                                       #533.0
# Begin ASM
        pxor    xmm3, [SHA3_S+12*16+3*16]
# End ASM                                                       #533.0
# Begin ASM
        movaps  [OLDCV],	   xmm0
# End ASM                                                       #533.0
# Begin ASM
        movaps  [OLDCV+16],   xmm1
# End ASM                                                       #533.0
# Begin ASM
        movaps  [OLDCV+2*16], xmm2
# End ASM                                                       #533.0
# Begin ASM
        movaps  [OLDCV+3*16], xmm3
# End ASM                                                       #533.0
# Begin ASM
        xor    ebx,ebx
# End ASM                                                       #538.0
# Begin ASM
        xor    edx,edx
# End ASM                                                       #539.0
# Begin ASM
        mov    [SHA3_ESP], esp
# End ASM                                                       #541.0
# Begin ASM
        LABEL_BIG_ROUND_NO1:
# End ASM                                                       #543.0
# Begin ASM
        mov    ecx, [SHA3_S+0]
# End ASM                                                       #544.0
# Begin ASM
        mov    eax, [SHA3_S+0+4]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #544.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #544.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #544.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #544.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #544.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #544.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #544.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #544.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #544.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #544.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #544.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #544.0
# Begin ASM
        mov    ecx, [SHA3_S+0+8]
# End ASM                                                       #544.0
# Begin ASM
        mov    eax, [SHA3_S+0+12]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #544.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #544.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #544.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #544.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #544.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #544.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #544.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #544.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #544.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #544.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #544.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #544.0
# Begin ASM
        mov    [SHA3_S+0+8],  ebp
# End ASM                                                       #544.0
# Begin ASM
        mov    [SHA3_S+0+12], esi
# End ASM                                                       #544.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #544.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #544.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #544.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #544.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #544.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #544.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #544.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #544.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #544.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #544.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #544.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #544.0
# Begin ASM
        mov    ecx, [SHA3_S+0+8]
# End ASM                                                       #544.0
# Begin ASM
        mov    eax, [SHA3_S+0+12]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #544.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #544.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #544.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #544.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #544.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #544.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #544.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #544.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #544.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #544.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #544.0
# Begin ASM
        mov    [SHA3_S+0],    edi
# End ASM                                                       #544.0
# Begin ASM
        mov    [SHA3_S+0+4],  esp
# End ASM                                                       #544.0
# Begin ASM
        mov    [SHA3_S+0+8],  ebp
# End ASM                                                       #544.0
# Begin ASM
        mov    [SHA3_S+0+12], esi
# End ASM                                                       #544.0
# Begin ASM
        mov    ecx, [SHA3_S+16]
# End ASM                                                       #544.0
# Begin ASM
        mov    eax, [SHA3_S+16+4]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #544.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #544.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #544.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #544.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #544.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #544.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #544.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #544.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #544.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #544.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #544.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #544.0
# Begin ASM
        mov    ecx, [SHA3_S+16+8]
# End ASM                                                       #544.0
# Begin ASM
        mov    eax, [SHA3_S+16+12]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #544.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #544.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #544.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #544.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #544.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #544.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #544.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #544.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #544.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #544.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #544.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #544.0
# Begin ASM
        mov    [SHA3_S+16+8],  ebp
# End ASM                                                       #544.0
# Begin ASM
        mov    [SHA3_S+16+12], esi
# End ASM                                                       #544.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #544.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #544.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #544.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #544.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #544.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #544.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #544.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #544.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #544.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #544.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #544.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #544.0
# Begin ASM
        mov    ecx, [SHA3_S+16+8]
# End ASM                                                       #544.0
# Begin ASM
        mov    eax, [SHA3_S+16+12]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #544.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #544.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #544.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #544.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #544.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #544.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #544.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #544.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #544.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #544.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #544.0
# Begin ASM
        mov    [SHA3_S+16],    edi
# End ASM                                                       #544.0
# Begin ASM
        mov    [SHA3_S+16+4],  esp
# End ASM                                                       #544.0
# Begin ASM
        mov    [SHA3_S+16+8],  ebp
# End ASM                                                       #544.0
# Begin ASM
        mov    [SHA3_S+16+12], esi
# End ASM                                                       #544.0
# Begin ASM
        mov    ecx, [SHA3_S+32]
# End ASM                                                       #544.0
# Begin ASM
        mov    eax, [SHA3_S+32+4]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #544.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #544.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #544.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #544.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #544.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #544.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #544.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #544.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #544.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #544.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #544.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #544.0
# Begin ASM
        mov    ecx, [SHA3_S+32+8]
# End ASM                                                       #544.0
# Begin ASM
        mov    eax, [SHA3_S+32+12]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #544.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #544.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #544.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #544.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #544.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #544.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #544.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #544.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #544.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #544.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #544.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #544.0
# Begin ASM
        mov    [SHA3_S+32+8],  ebp
# End ASM                                                       #544.0
# Begin ASM
        mov    [SHA3_S+32+12], esi
# End ASM                                                       #544.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #544.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #544.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #544.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #544.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #544.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #544.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #544.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #544.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #544.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #544.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #544.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #544.0
# Begin ASM
        mov    ecx, [SHA3_S+32+8]
# End ASM                                                       #544.0
# Begin ASM
        mov    eax, [SHA3_S+32+12]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #544.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #544.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #544.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #544.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #544.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #544.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #544.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #544.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #544.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #544.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #544.0
# Begin ASM
        mov    [SHA3_S+32],    edi
# End ASM                                                       #544.0
# Begin ASM
        mov    [SHA3_S+32+4],  esp
# End ASM                                                       #544.0
# Begin ASM
        mov    [SHA3_S+32+8],  ebp
# End ASM                                                       #544.0
# Begin ASM
        mov    [SHA3_S+32+12], esi
# End ASM                                                       #544.0
# Begin ASM
        mov    ecx, [SHA3_S+48]
# End ASM                                                       #544.0
# Begin ASM
        mov    eax, [SHA3_S+48+4]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #544.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #544.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #544.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #544.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #544.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #544.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #544.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #544.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #544.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #544.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #544.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #544.0
# Begin ASM
        mov    ecx, [SHA3_S+48+8]
# End ASM                                                       #544.0
# Begin ASM
        mov    eax, [SHA3_S+48+12]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #544.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #544.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #544.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #544.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #544.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #544.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #544.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #544.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #544.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #544.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #544.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #544.0
# Begin ASM
        mov    [SHA3_S+48+8],  ebp
# End ASM                                                       #544.0
# Begin ASM
        mov    [SHA3_S+48+12], esi
# End ASM                                                       #544.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #544.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #544.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #544.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #544.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #544.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #544.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #544.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #544.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #544.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #544.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #544.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #544.0
# Begin ASM
        mov    ecx, [SHA3_S+48+8]
# End ASM                                                       #544.0
# Begin ASM
        mov    eax, [SHA3_S+48+12]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #544.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #544.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #544.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #544.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #544.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #544.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #544.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #544.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #544.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #544.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #544.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #544.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #544.0
# Begin ASM
        mov    [SHA3_S+48],    edi
# End ASM                                                       #544.0
# Begin ASM
        mov    [SHA3_S+48+4],  esp
# End ASM                                                       #544.0
# Begin ASM
        mov    [SHA3_S+48+8],  ebp
# End ASM                                                       #544.0
# Begin ASM
        mov    [SHA3_S+48+12], esi
# End ASM                                                       #544.0
# Begin ASM
        mov    ecx, [SHA3_S+64]
# End ASM                                                       #545.0
# Begin ASM
        mov    eax, [SHA3_S+64+4]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #545.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #545.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #545.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #545.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #545.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #545.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #545.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #545.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #545.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #545.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #545.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #545.0
# Begin ASM
        mov    ecx, [SHA3_S+64+8]
# End ASM                                                       #545.0
# Begin ASM
        mov    eax, [SHA3_S+64+12]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #545.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #545.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #545.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #545.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #545.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #545.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #545.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #545.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #545.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #545.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #545.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #545.0
# Begin ASM
        mov    [SHA3_S+64+8],  ebp
# End ASM                                                       #545.0
# Begin ASM
        mov    [SHA3_S+64+12], esi
# End ASM                                                       #545.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #545.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #545.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #545.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #545.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #545.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #545.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #545.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #545.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #545.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #545.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #545.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #545.0
# Begin ASM
        mov    ecx, [SHA3_S+64+8]
# End ASM                                                       #545.0
# Begin ASM
        mov    eax, [SHA3_S+64+12]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #545.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #545.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #545.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #545.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #545.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #545.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #545.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #545.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #545.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #545.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #545.0
# Begin ASM
        mov    [SHA3_S+64],    edi
# End ASM                                                       #545.0
# Begin ASM
        mov    [SHA3_S+64+4],  esp
# End ASM                                                       #545.0
# Begin ASM
        mov    [SHA3_S+64+8],  ebp
# End ASM                                                       #545.0
# Begin ASM
        mov    [SHA3_S+64+12], esi
# End ASM                                                       #545.0
# Begin ASM
        mov    ecx, [SHA3_S+80]
# End ASM                                                       #545.0
# Begin ASM
        mov    eax, [SHA3_S+80+4]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #545.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #545.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #545.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #545.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #545.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #545.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #545.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #545.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #545.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #545.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #545.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #545.0
# Begin ASM
        mov    ecx, [SHA3_S+80+8]
# End ASM                                                       #545.0
# Begin ASM
        mov    eax, [SHA3_S+80+12]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #545.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #545.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #545.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #545.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #545.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #545.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #545.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #545.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #545.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #545.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #545.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #545.0
# Begin ASM
        mov    [SHA3_S+80+8],  ebp
# End ASM                                                       #545.0
# Begin ASM
        mov    [SHA3_S+80+12], esi
# End ASM                                                       #545.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #545.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #545.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #545.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #545.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #545.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #545.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #545.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #545.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #545.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #545.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #545.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #545.0
# Begin ASM
        mov    ecx, [SHA3_S+80+8]
# End ASM                                                       #545.0
# Begin ASM
        mov    eax, [SHA3_S+80+12]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #545.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #545.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #545.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #545.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #545.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #545.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #545.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #545.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #545.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #545.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #545.0
# Begin ASM
        mov    [SHA3_S+80],    edi
# End ASM                                                       #545.0
# Begin ASM
        mov    [SHA3_S+80+4],  esp
# End ASM                                                       #545.0
# Begin ASM
        mov    [SHA3_S+80+8],  ebp
# End ASM                                                       #545.0
# Begin ASM
        mov    [SHA3_S+80+12], esi
# End ASM                                                       #545.0
# Begin ASM
        mov    ecx, [SHA3_S+96]
# End ASM                                                       #545.0
# Begin ASM
        mov    eax, [SHA3_S+96+4]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #545.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #545.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #545.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #545.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #545.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #545.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #545.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #545.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #545.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #545.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #545.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #545.0
# Begin ASM
        mov    ecx, [SHA3_S+96+8]
# End ASM                                                       #545.0
# Begin ASM
        mov    eax, [SHA3_S+96+12]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #545.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #545.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #545.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #545.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #545.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #545.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #545.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #545.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #545.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #545.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #545.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #545.0
# Begin ASM
        mov    [SHA3_S+96+8],  ebp
# End ASM                                                       #545.0
# Begin ASM
        mov    [SHA3_S+96+12], esi
# End ASM                                                       #545.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #545.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #545.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #545.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #545.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #545.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #545.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #545.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #545.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #545.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #545.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #545.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #545.0
# Begin ASM
        mov    ecx, [SHA3_S+96+8]
# End ASM                                                       #545.0
# Begin ASM
        mov    eax, [SHA3_S+96+12]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #545.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #545.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #545.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #545.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #545.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #545.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #545.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #545.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #545.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #545.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #545.0
# Begin ASM
        mov    [SHA3_S+96],    edi
# End ASM                                                       #545.0
# Begin ASM
        mov    [SHA3_S+96+4],  esp
# End ASM                                                       #545.0
# Begin ASM
        mov    [SHA3_S+96+8],  ebp
# End ASM                                                       #545.0
# Begin ASM
        mov    [SHA3_S+96+12], esi
# End ASM                                                       #545.0
# Begin ASM
        mov    ecx, [SHA3_S+112]
# End ASM                                                       #545.0
# Begin ASM
        mov    eax, [SHA3_S+112+4]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #545.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #545.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #545.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #545.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #545.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #545.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #545.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #545.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #545.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #545.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #545.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #545.0
# Begin ASM
        mov    ecx, [SHA3_S+112+8]
# End ASM                                                       #545.0
# Begin ASM
        mov    eax, [SHA3_S+112+12]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #545.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #545.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #545.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #545.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #545.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #545.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #545.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #545.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #545.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #545.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #545.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #545.0
# Begin ASM
        mov    [SHA3_S+112+8],  ebp
# End ASM                                                       #545.0
# Begin ASM
        mov    [SHA3_S+112+12], esi
# End ASM                                                       #545.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #545.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #545.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #545.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #545.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #545.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #545.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #545.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #545.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #545.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #545.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #545.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #545.0
# Begin ASM
        mov    ecx, [SHA3_S+112+8]
# End ASM                                                       #545.0
# Begin ASM
        mov    eax, [SHA3_S+112+12]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #545.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #545.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #545.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #545.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #545.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #545.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #545.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #545.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #545.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #545.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #545.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #545.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #545.0
# Begin ASM
        mov    [SHA3_S+112],    edi
# End ASM                                                       #545.0
# Begin ASM
        mov    [SHA3_S+112+4],  esp
# End ASM                                                       #545.0
# Begin ASM
        mov    [SHA3_S+112+8],  ebp
# End ASM                                                       #545.0
# Begin ASM
        mov    [SHA3_S+112+12], esi
# End ASM                                                       #545.0
# Begin ASM
        mov    ecx, [SHA3_S+128]
# End ASM                                                       #546.0
# Begin ASM
        mov    eax, [SHA3_S+128+4]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #546.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #546.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #546.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #546.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #546.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #546.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #546.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #546.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #546.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #546.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #546.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #546.0
# Begin ASM
        mov    ecx, [SHA3_S+128+8]
# End ASM                                                       #546.0
# Begin ASM
        mov    eax, [SHA3_S+128+12]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #546.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #546.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #546.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #546.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #546.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #546.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #546.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #546.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #546.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #546.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #546.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #546.0
# Begin ASM
        mov    [SHA3_S+128+8],  ebp
# End ASM                                                       #546.0
# Begin ASM
        mov    [SHA3_S+128+12], esi
# End ASM                                                       #546.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #546.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #546.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #546.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #546.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #546.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #546.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #546.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #546.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #546.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #546.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #546.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #546.0
# Begin ASM
        mov    ecx, [SHA3_S+128+8]
# End ASM                                                       #546.0
# Begin ASM
        mov    eax, [SHA3_S+128+12]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #546.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #546.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #546.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #546.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #546.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #546.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #546.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #546.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #546.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #546.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #546.0
# Begin ASM
        mov    [SHA3_S+128],    edi
# End ASM                                                       #546.0
# Begin ASM
        mov    [SHA3_S+128+4],  esp
# End ASM                                                       #546.0
# Begin ASM
        mov    [SHA3_S+128+8],  ebp
# End ASM                                                       #546.0
# Begin ASM
        mov    [SHA3_S+128+12], esi
# End ASM                                                       #546.0
# Begin ASM
        mov    ecx, [SHA3_S+144]
# End ASM                                                       #546.0
# Begin ASM
        mov    eax, [SHA3_S+144+4]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #546.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #546.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #546.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #546.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #546.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #546.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #546.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #546.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #546.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #546.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #546.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #546.0
# Begin ASM
        mov    ecx, [SHA3_S+144+8]
# End ASM                                                       #546.0
# Begin ASM
        mov    eax, [SHA3_S+144+12]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #546.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #546.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #546.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #546.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #546.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #546.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #546.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #546.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #546.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #546.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #546.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #546.0
# Begin ASM
        mov    [SHA3_S+144+8],  ebp
# End ASM                                                       #546.0
# Begin ASM
        mov    [SHA3_S+144+12], esi
# End ASM                                                       #546.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #546.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #546.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #546.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #546.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #546.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #546.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #546.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #546.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #546.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #546.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #546.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #546.0
# Begin ASM
        mov    ecx, [SHA3_S+144+8]
# End ASM                                                       #546.0
# Begin ASM
        mov    eax, [SHA3_S+144+12]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #546.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #546.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #546.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #546.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #546.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #546.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #546.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #546.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #546.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #546.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #546.0
# Begin ASM
        mov    [SHA3_S+144],    edi
# End ASM                                                       #546.0
# Begin ASM
        mov    [SHA3_S+144+4],  esp
# End ASM                                                       #546.0
# Begin ASM
        mov    [SHA3_S+144+8],  ebp
# End ASM                                                       #546.0
# Begin ASM
        mov    [SHA3_S+144+12], esi
# End ASM                                                       #546.0
# Begin ASM
        mov    ecx, [SHA3_S+160]
# End ASM                                                       #546.0
# Begin ASM
        mov    eax, [SHA3_S+160+4]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #546.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #546.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #546.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #546.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #546.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #546.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #546.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #546.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #546.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #546.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #546.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #546.0
# Begin ASM
        mov    ecx, [SHA3_S+160+8]
# End ASM                                                       #546.0
# Begin ASM
        mov    eax, [SHA3_S+160+12]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #546.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #546.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #546.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #546.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #546.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #546.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #546.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #546.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #546.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #546.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #546.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #546.0
# Begin ASM
        mov    [SHA3_S+160+8],  ebp
# End ASM                                                       #546.0
# Begin ASM
        mov    [SHA3_S+160+12], esi
# End ASM                                                       #546.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #546.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #546.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #546.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #546.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #546.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #546.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #546.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #546.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #546.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #546.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #546.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #546.0
# Begin ASM
        mov    ecx, [SHA3_S+160+8]
# End ASM                                                       #546.0
# Begin ASM
        mov    eax, [SHA3_S+160+12]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #546.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #546.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #546.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #546.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #546.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #546.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #546.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #546.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #546.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #546.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #546.0
# Begin ASM
        mov    [SHA3_S+160],    edi
# End ASM                                                       #546.0
# Begin ASM
        mov    [SHA3_S+160+4],  esp
# End ASM                                                       #546.0
# Begin ASM
        mov    [SHA3_S+160+8],  ebp
# End ASM                                                       #546.0
# Begin ASM
        mov    [SHA3_S+160+12], esi
# End ASM                                                       #546.0
# Begin ASM
        mov    ecx, [SHA3_S+176]
# End ASM                                                       #546.0
# Begin ASM
        mov    eax, [SHA3_S+176+4]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #546.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #546.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #546.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #546.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #546.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #546.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #546.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #546.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #546.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #546.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #546.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #546.0
# Begin ASM
        mov    ecx, [SHA3_S+176+8]
# End ASM                                                       #546.0
# Begin ASM
        mov    eax, [SHA3_S+176+12]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #546.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #546.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #546.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #546.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #546.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #546.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #546.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #546.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #546.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #546.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #546.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #546.0
# Begin ASM
        mov    [SHA3_S+176+8],  ebp
# End ASM                                                       #546.0
# Begin ASM
        mov    [SHA3_S+176+12], esi
# End ASM                                                       #546.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #546.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #546.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #546.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #546.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #546.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #546.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #546.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #546.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #546.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #546.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #546.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #546.0
# Begin ASM
        mov    ecx, [SHA3_S+176+8]
# End ASM                                                       #546.0
# Begin ASM
        mov    eax, [SHA3_S+176+12]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #546.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #546.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #546.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #546.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #546.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #546.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #546.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #546.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #546.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #546.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #546.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #546.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #546.0
# Begin ASM
        mov    [SHA3_S+176],    edi
# End ASM                                                       #546.0
# Begin ASM
        mov    [SHA3_S+176+4],  esp
# End ASM                                                       #546.0
# Begin ASM
        mov    [SHA3_S+176+8],  ebp
# End ASM                                                       #546.0
# Begin ASM
        mov    [SHA3_S+176+12], esi
# End ASM                                                       #546.0
# Begin ASM
        mov    ecx, [SHA3_S+192]
# End ASM                                                       #547.0
# Begin ASM
        mov    eax, [SHA3_S+192+4]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #547.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #547.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #547.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #547.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #547.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #547.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #547.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #547.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #547.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #547.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #547.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #547.0
# Begin ASM
        mov    ecx, [SHA3_S+192+8]
# End ASM                                                       #547.0
# Begin ASM
        mov    eax, [SHA3_S+192+12]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #547.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #547.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #547.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #547.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #547.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #547.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #547.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #547.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #547.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #547.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #547.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #547.0
# Begin ASM
        mov    [SHA3_S+192+8],  ebp
# End ASM                                                       #547.0
# Begin ASM
        mov    [SHA3_S+192+12], esi
# End ASM                                                       #547.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #547.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #547.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #547.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #547.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #547.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #547.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #547.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #547.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #547.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #547.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #547.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #547.0
# Begin ASM
        mov    ecx, [SHA3_S+192+8]
# End ASM                                                       #547.0
# Begin ASM
        mov    eax, [SHA3_S+192+12]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #547.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #547.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #547.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #547.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #547.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #547.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #547.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #547.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #547.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #547.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #547.0
# Begin ASM
        mov    [SHA3_S+192],    edi
# End ASM                                                       #547.0
# Begin ASM
        mov    [SHA3_S+192+4],  esp
# End ASM                                                       #547.0
# Begin ASM
        mov    [SHA3_S+192+8],  ebp
# End ASM                                                       #547.0
# Begin ASM
        mov    [SHA3_S+192+12], esi
# End ASM                                                       #547.0
# Begin ASM
        mov    ecx, [SHA3_S+208]
# End ASM                                                       #547.0
# Begin ASM
        mov    eax, [SHA3_S+208+4]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #547.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #547.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #547.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #547.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #547.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #547.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #547.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #547.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #547.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #547.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #547.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #547.0
# Begin ASM
        mov    ecx, [SHA3_S+208+8]
# End ASM                                                       #547.0
# Begin ASM
        mov    eax, [SHA3_S+208+12]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #547.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #547.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #547.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #547.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #547.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #547.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #547.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #547.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #547.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #547.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #547.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #547.0
# Begin ASM
        mov    [SHA3_S+208+8],  ebp
# End ASM                                                       #547.0
# Begin ASM
        mov    [SHA3_S+208+12], esi
# End ASM                                                       #547.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #547.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #547.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #547.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #547.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #547.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #547.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #547.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #547.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #547.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #547.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #547.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #547.0
# Begin ASM
        mov    ecx, [SHA3_S+208+8]
# End ASM                                                       #547.0
# Begin ASM
        mov    eax, [SHA3_S+208+12]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #547.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #547.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #547.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #547.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #547.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #547.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #547.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #547.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #547.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #547.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #547.0
# Begin ASM
        mov    [SHA3_S+208],    edi
# End ASM                                                       #547.0
# Begin ASM
        mov    [SHA3_S+208+4],  esp
# End ASM                                                       #547.0
# Begin ASM
        mov    [SHA3_S+208+8],  ebp
# End ASM                                                       #547.0
# Begin ASM
        mov    [SHA3_S+208+12], esi
# End ASM                                                       #547.0
# Begin ASM
        mov    ecx, [SHA3_S+224]
# End ASM                                                       #547.0
# Begin ASM
        mov    eax, [SHA3_S+224+4]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #547.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #547.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #547.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #547.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #547.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #547.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #547.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #547.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #547.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #547.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #547.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #547.0
# Begin ASM
        mov    ecx, [SHA3_S+224+8]
# End ASM                                                       #547.0
# Begin ASM
        mov    eax, [SHA3_S+224+12]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #547.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #547.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #547.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #547.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #547.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #547.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #547.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #547.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #547.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #547.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #547.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #547.0
# Begin ASM
        mov    [SHA3_S+224+8],  ebp
# End ASM                                                       #547.0
# Begin ASM
        mov    [SHA3_S+224+12], esi
# End ASM                                                       #547.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #547.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #547.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #547.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #547.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #547.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #547.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #547.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #547.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #547.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #547.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #547.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #547.0
# Begin ASM
        mov    ecx, [SHA3_S+224+8]
# End ASM                                                       #547.0
# Begin ASM
        mov    eax, [SHA3_S+224+12]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #547.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #547.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #547.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #547.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #547.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #547.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #547.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #547.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #547.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #547.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #547.0
# Begin ASM
        mov    [SHA3_S+224],    edi
# End ASM                                                       #547.0
# Begin ASM
        mov    [SHA3_S+224+4],  esp
# End ASM                                                       #547.0
# Begin ASM
        mov    [SHA3_S+224+8],  ebp
# End ASM                                                       #547.0
# Begin ASM
        mov    [SHA3_S+224+12], esi
# End ASM                                                       #547.0
# Begin ASM
        mov    ecx, [SHA3_S+240]
# End ASM                                                       #547.0
# Begin ASM
        mov    eax, [SHA3_S+240+4]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #547.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #547.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #547.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #547.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #547.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #547.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #547.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #547.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #547.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #547.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #547.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #547.0
# Begin ASM
        mov    ecx, [SHA3_S+240+8]
# End ASM                                                       #547.0
# Begin ASM
        mov    eax, [SHA3_S+240+12]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #547.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #547.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #547.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #547.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #547.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #547.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #547.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #547.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #547.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #547.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #547.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #547.0
# Begin ASM
        mov    [SHA3_S+240+8],  ebp
# End ASM                                                       #547.0
# Begin ASM
        mov    [SHA3_S+240+12], esi
# End ASM                                                       #547.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #547.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #547.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #547.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #547.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #547.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #547.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #547.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #547.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #547.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #547.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #547.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #547.0
# Begin ASM
        mov    ecx, [SHA3_S+240+8]
# End ASM                                                       #547.0
# Begin ASM
        mov    eax, [SHA3_S+240+12]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #547.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #547.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #547.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #547.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #547.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #547.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #547.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #547.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #547.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #547.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #547.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #547.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #547.0
# Begin ASM
        mov    [SHA3_S+240],    edi
# End ASM                                                       #547.0
# Begin ASM
        mov    [SHA3_S+240+4],  esp
# End ASM                                                       #547.0
# Begin ASM
        mov    [SHA3_S+240+8],  ebp
# End ASM                                                       #547.0
# Begin ASM
        mov    [SHA3_S+240+12], esi
# End ASM                                                       #547.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*0]
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm1, [SHA3_S+16*5]
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm2, [SHA3_S+16*10]
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm3, [SHA3_S+16*15]
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm4, xmm0
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm4, xmm1
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm5, xmm2
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm5, xmm3
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm6, xmm0
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm6, xmm3
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm7, xmm4
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm7, xmm5
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm0, xmm4
# End ASM                                                       #548.0
# Begin ASM
        psllw    xmm0, 1
# End ASM                                                       #548.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #548.0
# Begin ASM
        psrlw    xmm4, 7
# End ASM                                                       #548.0
# Begin ASM
        pand     xmm4, [MEM_CST+16]
# End ASM                                                       #548.0
# Begin ASM
        pmullw   xmm4, [MEM_CST+32]
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm4, xmm0
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm0, xmm5
# End ASM                                                       #548.0
# Begin ASM
        psllw    xmm0, 1
# End ASM                                                       #548.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #548.0
# Begin ASM
        psrlw    xmm5, 7
# End ASM                                                       #548.0
# Begin ASM
        pand     xmm5, [MEM_CST+16]
# End ASM                                                       #548.0
# Begin ASM
        pmullw   xmm5, [MEM_CST+32]
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm5, xmm0
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm0, xmm6
# End ASM                                                       #548.0
# Begin ASM
        psllq    xmm0, 1
# End ASM                                                       #548.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #548.0
# Begin ASM
        psrlq    xmm6, 7
# End ASM                                                       #548.0
# Begin ASM
        pand     xmm6, [MEM_CST+16]
# End ASM                                                       #548.0
# Begin ASM
        pmullw   xmm6, [MEM_CST+32]
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm6, xmm0
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm0,  [SHA3_S]
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm0,  xmm7
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm0,  xmm4
# End ASM                                                       #548.0
# Begin ASM
        movaps   [SHA3_S],   xmm0
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16]
# End ASM                                                       #548.0
# Begin ASM
        movaps   [SHA3_S+16*5], xmm0
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm1,     xmm4
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm1,     xmm5
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm1,     xmm6
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm1,     xmm7
# End ASM                                                       #548.0
# Begin ASM
        movaps   [SHA3_S+16], xmm1
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*2]
# End ASM                                                       #548.0
# Begin ASM
        movaps   [SHA3_S+16*10], xmm0
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm2,      xmm7
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm2,      xmm5
# End ASM                                                       #548.0
# Begin ASM
        movaps   [SHA3_S+16*2],  xmm2
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*3]
# End ASM                                                       #548.0
# Begin ASM
        movaps   [SHA3_S+16*15], xmm0
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm3,  xmm7
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm3,  xmm6
# End ASM                                                       #548.0
# Begin ASM
        movaps   [SHA3_S+16*3], xmm3
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*4]
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm1, [SHA3_S+16*9]
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm2, [SHA3_S+16*14]
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm3, [SHA3_S+16*15]
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm4, xmm0
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm4, xmm1
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm5, xmm2
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm5, xmm3
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm6, xmm0
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm6, xmm3
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm7, xmm4
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm7, xmm5
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm0, xmm4
# End ASM                                                       #548.0
# Begin ASM
        psllw    xmm0, 1
# End ASM                                                       #548.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #548.0
# Begin ASM
        psrlw    xmm4, 7
# End ASM                                                       #548.0
# Begin ASM
        pand     xmm4, [MEM_CST+16]
# End ASM                                                       #548.0
# Begin ASM
        pmullw   xmm4, [MEM_CST+32]
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm4, xmm0
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm0, xmm5
# End ASM                                                       #548.0
# Begin ASM
        psllw    xmm0, 1
# End ASM                                                       #548.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #548.0
# Begin ASM
        psrlw    xmm5, 7
# End ASM                                                       #548.0
# Begin ASM
        pand     xmm5, [MEM_CST+16]
# End ASM                                                       #548.0
# Begin ASM
        pmullw   xmm5, [MEM_CST+32]
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm5, xmm0
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm0, xmm6
# End ASM                                                       #548.0
# Begin ASM
        psllq    xmm0, 1
# End ASM                                                       #548.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #548.0
# Begin ASM
        psrlq    xmm6, 7
# End ASM                                                       #548.0
# Begin ASM
        pand     xmm6, [MEM_CST+16]
# End ASM                                                       #548.0
# Begin ASM
        pmullw   xmm6, [MEM_CST+32]
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm6, xmm0
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*4]
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm0,  xmm7
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm0,  xmm4
# End ASM                                                       #548.0
# Begin ASM
        movaps   [SHA3_S+16*4], xmm0
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*5]
# End ASM                                                       #548.0
# Begin ASM
        movaps   [SHA3_S+16*9], xmm0
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm1,  xmm4
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm1,  xmm5
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm1,  xmm6
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm1,  xmm7
# End ASM                                                       #548.0
# Begin ASM
        movaps   [SHA3_S+16*5], xmm1
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*6]
# End ASM                                                       #548.0
# Begin ASM
        movaps   [SHA3_S+16*14], xmm0
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm2,  xmm7
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm2,  xmm5
# End ASM                                                       #548.0
# Begin ASM
        movaps   [SHA3_S+16*6], xmm2
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*7]
# End ASM                                                       #548.0
# Begin ASM
        movaps   [SHA3_S+16*15], xmm0
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm3,  xmm7
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm3,  xmm6
# End ASM                                                       #548.0
# Begin ASM
        movaps   [SHA3_S+16*7], xmm3
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*8]
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm1, [SHA3_S+16*13]
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm2, [SHA3_S+16*10]
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm3, [SHA3_S+16*15]
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm4, xmm0
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm4, xmm1
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm5, xmm2
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm5, xmm3
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm6, xmm0
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm6, xmm3
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm7, xmm4
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm7, xmm5
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm0, xmm4
# End ASM                                                       #548.0
# Begin ASM
        psllw    xmm0, 1
# End ASM                                                       #548.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #548.0
# Begin ASM
        psrlw    xmm4, 7
# End ASM                                                       #548.0
# Begin ASM
        pand     xmm4, [MEM_CST+16]
# End ASM                                                       #548.0
# Begin ASM
        pmullw   xmm4, [MEM_CST+32]
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm4, xmm0
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm0, xmm5
# End ASM                                                       #548.0
# Begin ASM
        psllw    xmm0, 1
# End ASM                                                       #548.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #548.0
# Begin ASM
        psrlw    xmm5, 7
# End ASM                                                       #548.0
# Begin ASM
        pand     xmm5, [MEM_CST+16]
# End ASM                                                       #548.0
# Begin ASM
        pmullw   xmm5, [MEM_CST+32]
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm5, xmm0
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm0, xmm6
# End ASM                                                       #548.0
# Begin ASM
        psllq    xmm0, 1
# End ASM                                                       #548.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #548.0
# Begin ASM
        psrlq    xmm6, 7
# End ASM                                                       #548.0
# Begin ASM
        pand     xmm6, [MEM_CST+16]
# End ASM                                                       #548.0
# Begin ASM
        pmullw   xmm6, [MEM_CST+32]
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm6, xmm0
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*8]
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm0,  xmm7
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm0,  xmm4
# End ASM                                                       #548.0
# Begin ASM
        movaps   [SHA3_S+16*8], xmm0
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*9]
# End ASM                                                       #548.0
# Begin ASM
        movaps   [SHA3_S+16*13], xmm0
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm1,  xmm4
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm1,  xmm5
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm1,  xmm6
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm1,  xmm7
# End ASM                                                       #548.0
# Begin ASM
        movaps   [SHA3_S+16*9], xmm1
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm2,  xmm7
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm2,  xmm5
# End ASM                                                       #548.0
# Begin ASM
        movaps   [SHA3_S+16*10], xmm2
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*11]
# End ASM                                                       #548.0
# Begin ASM
        movaps   [SHA3_S+16*15], xmm0
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm3,      xmm7
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm3,      xmm6
# End ASM                                                       #548.0
# Begin ASM
        movaps   [SHA3_S+16*11], xmm3
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*12]
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm1, [SHA3_S+16*13]
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm2, [SHA3_S+16*14]
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm3, [SHA3_S+16*15]
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm4, xmm0
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm4, xmm1
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm5, xmm2
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm5, xmm3
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm6, xmm0
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm6, xmm3
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm7, xmm4
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm7, xmm5
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm0, xmm4
# End ASM                                                       #548.0
# Begin ASM
        psllw    xmm0, 1
# End ASM                                                       #548.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #548.0
# Begin ASM
        psrlw    xmm4, 7
# End ASM                                                       #548.0
# Begin ASM
        pand     xmm4, [MEM_CST+16]
# End ASM                                                       #548.0
# Begin ASM
        pmullw   xmm4, [MEM_CST+32]
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm4, xmm0
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm0, xmm5
# End ASM                                                       #548.0
# Begin ASM
        psllw    xmm0, 1
# End ASM                                                       #548.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #548.0
# Begin ASM
        psrlw    xmm5, 7
# End ASM                                                       #548.0
# Begin ASM
        pand     xmm5, [MEM_CST+16]
# End ASM                                                       #548.0
# Begin ASM
        pmullw   xmm5, [MEM_CST+32]
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm5, xmm0
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm0, xmm6
# End ASM                                                       #548.0
# Begin ASM
        psllq    xmm0, 1
# End ASM                                                       #548.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #548.0
# Begin ASM
        psrlq    xmm6, 7
# End ASM                                                       #548.0
# Begin ASM
        pand     xmm6, [MEM_CST+16]
# End ASM                                                       #548.0
# Begin ASM
        pmullw   xmm6, [MEM_CST+32]
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm6, xmm0
# End ASM                                                       #548.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*12]
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm0,  xmm7
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm0,  xmm4
# End ASM                                                       #548.0
# Begin ASM
        movaps   [SHA3_S+16*12], xmm0
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm1,  xmm4
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm1,  xmm5
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm1,  xmm6
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm1,  xmm7
# End ASM                                                       #548.0
# Begin ASM
        movaps   [SHA3_S+16*13], xmm1
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm2,  xmm7
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm2,  xmm5
# End ASM                                                       #548.0
# Begin ASM
        movaps   [SHA3_S+16*14], xmm2
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm3,  xmm7
# End ASM                                                       #548.0
# Begin ASM
        pxor     xmm3,  xmm6
# End ASM                                                       #548.0
# Begin ASM
        movaps   [SHA3_S+16*15], xmm3
# End ASM                                                       #548.0
# Begin ASM
        subd [SHA3_R], 1
# End ASM                                                       #549.0
# Begin ASM
        jne LABEL_BIG_ROUND_NO1
# End ASM                                                       #550.0
# Begin ASM
        jmp END
# End ASM                                                       #551.0
# Begin ASM
        OVERFLOW:
# End ASM                                                       #553.0
# Begin ASM
        mov    ecx, eax
# End ASM                                                       #554.0
# Begin ASM
        mov    ebx, edx
# End ASM                                                       #555.0
# Begin ASM
        add    ecx, 128
# End ASM                                                       #557.0
# Begin ASM
        adc    ebx, 0
# End ASM                                                       #562.0
# Begin ASM
        cmp    ebx, edx
# End ASM                                                       #563.0
# Begin ASM
        je     NO_OVERFLOW2
# End ASM                                                       #564.0
# Begin ASM
        movaps  xmm0, [SHA3_S]
# End ASM                                                       #566.0
# Begin ASM
        movaps  xmm1, [SHA3_S+16]
# End ASM                                                       #566.0
# Begin ASM
        movaps  xmm2, [SHA3_S+2*16]
# End ASM                                                       #566.0
# Begin ASM
        movaps  xmm3, [SHA3_S+3*16]
# End ASM                                                       #566.0
# Begin ASM
        pxor    xmm0, [SHA3_S+4*16]
# End ASM                                                       #566.0
# Begin ASM
        pxor    xmm1, [SHA3_S+4*16+16]
# End ASM                                                       #566.0
# Begin ASM
        pxor    xmm2, [SHA3_S+4*16+2*16]
# End ASM                                                       #566.0
# Begin ASM
        pxor    xmm3, [SHA3_S+4*16+3*16]
# End ASM                                                       #566.0
# Begin ASM
        pxor    xmm0, [SHA3_S+8*16]
# End ASM                                                       #566.0
# Begin ASM
        pxor    xmm1, [SHA3_S+8*16+16]
# End ASM                                                       #566.0
# Begin ASM
        pxor    xmm2, [SHA3_S+8*16+2*16]
# End ASM                                                       #566.0
# Begin ASM
        pxor    xmm3, [SHA3_S+8*16+3*16]
# End ASM                                                       #566.0
# Begin ASM
        pxor    xmm0, [SHA3_S+12*16]
# End ASM                                                       #566.0
# Begin ASM
        pxor    xmm1, [SHA3_S+12*16+16]
# End ASM                                                       #566.0
# Begin ASM
        pxor    xmm2, [SHA3_S+12*16+2*16]
# End ASM                                                       #566.0
# Begin ASM
        pxor    xmm3, [SHA3_S+12*16+3*16]
# End ASM                                                       #566.0
# Begin ASM
        movaps  [OLDCV],	   xmm0
# End ASM                                                       #566.0
# Begin ASM
        movaps  [OLDCV+16],   xmm1
# End ASM                                                       #566.0
# Begin ASM
        movaps  [OLDCV+2*16], xmm2
# End ASM                                                       #566.0
# Begin ASM
        movaps  [OLDCV+3*16], xmm3
# End ASM                                                       #566.0
# Begin ASM
        xor    ebx,ebx
# End ASM                                                       #571.0
# Begin ASM
        xor    edx,edx
# End ASM                                                       #572.0
# Begin ASM
        mov    [SHA3_ESP], esp
# End ASM                                                       #574.0
# Begin ASM
        LABEL_BIG_ROUND_O:
# End ASM                                                       #575.0
# Begin ASM
        mov    ecx, [SHA3_S+0]
# End ASM                                                       #576.0
# Begin ASM
        mov    eax, [SHA3_S+0+4]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #576.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #576.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #576.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #576.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #576.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #576.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #576.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #576.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #576.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #576.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #576.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #576.0
# Begin ASM
        mov    ecx, [SHA3_S+0+8]
# End ASM                                                       #576.0
# Begin ASM
        mov    eax, [SHA3_S+0+12]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #576.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #576.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #576.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #576.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #576.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #576.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #576.0
# Begin ASM
        xor    esp, [SHA3_CNT+4]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #576.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #576.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #576.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #576.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #576.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #576.0
# Begin ASM
        addd   [SHA3_CNT+4], 1
# End ASM                                                       #576.0
# Begin ASM
        mov    [SHA3_S+0+8],  ebp
# End ASM                                                       #576.0
# Begin ASM
        mov    [SHA3_S+0+12], esi
# End ASM                                                       #576.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #576.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #576.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #576.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #576.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #576.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #576.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #576.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #576.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #576.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #576.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #576.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #576.0
# Begin ASM
        mov    ecx, [SHA3_S+0+8]
# End ASM                                                       #576.0
# Begin ASM
        mov    eax, [SHA3_S+0+12]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #576.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #576.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #576.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #576.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #576.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #576.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #576.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #576.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #576.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #576.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #576.0
# Begin ASM
        mov    [SHA3_S+0],    edi
# End ASM                                                       #576.0
# Begin ASM
        mov    [SHA3_S+0+4],  esp
# End ASM                                                       #576.0
# Begin ASM
        mov    [SHA3_S+0+8],  ebp
# End ASM                                                       #576.0
# Begin ASM
        mov    [SHA3_S+0+12], esi
# End ASM                                                       #576.0
# Begin ASM
        mov    ecx, [SHA3_S+16]
# End ASM                                                       #576.0
# Begin ASM
        mov    eax, [SHA3_S+16+4]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #576.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #576.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #576.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #576.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #576.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #576.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #576.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #576.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #576.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #576.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #576.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #576.0
# Begin ASM
        mov    ecx, [SHA3_S+16+8]
# End ASM                                                       #576.0
# Begin ASM
        mov    eax, [SHA3_S+16+12]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #576.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #576.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #576.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #576.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #576.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #576.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #576.0
# Begin ASM
        xor    esp, [SHA3_CNT+4]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #576.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #576.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #576.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #576.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #576.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #576.0
# Begin ASM
        addd   [SHA3_CNT+4], 1
# End ASM                                                       #576.0
# Begin ASM
        mov    [SHA3_S+16+8],  ebp
# End ASM                                                       #576.0
# Begin ASM
        mov    [SHA3_S+16+12], esi
# End ASM                                                       #576.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #576.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #576.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #576.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #576.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #576.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #576.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #576.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #576.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #576.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #576.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #576.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #576.0
# Begin ASM
        mov    ecx, [SHA3_S+16+8]
# End ASM                                                       #576.0
# Begin ASM
        mov    eax, [SHA3_S+16+12]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #576.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #576.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #576.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #576.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #576.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #576.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #576.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #576.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #576.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #576.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #576.0
# Begin ASM
        mov    [SHA3_S+16],    edi
# End ASM                                                       #576.0
# Begin ASM
        mov    [SHA3_S+16+4],  esp
# End ASM                                                       #576.0
# Begin ASM
        mov    [SHA3_S+16+8],  ebp
# End ASM                                                       #576.0
# Begin ASM
        mov    [SHA3_S+16+12], esi
# End ASM                                                       #576.0
# Begin ASM
        mov    ecx, [SHA3_S+32]
# End ASM                                                       #576.0
# Begin ASM
        mov    eax, [SHA3_S+32+4]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #576.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #576.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #576.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #576.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #576.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #576.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #576.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #576.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #576.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #576.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #576.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #576.0
# Begin ASM
        mov    ecx, [SHA3_S+32+8]
# End ASM                                                       #576.0
# Begin ASM
        mov    eax, [SHA3_S+32+12]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #576.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #576.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #576.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #576.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #576.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #576.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #576.0
# Begin ASM
        xor    esp, [SHA3_CNT+4]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #576.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #576.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #576.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #576.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #576.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #576.0
# Begin ASM
        addd   [SHA3_CNT+4], 1
# End ASM                                                       #576.0
# Begin ASM
        mov    [SHA3_S+32+8],  ebp
# End ASM                                                       #576.0
# Begin ASM
        mov    [SHA3_S+32+12], esi
# End ASM                                                       #576.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #576.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #576.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #576.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #576.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #576.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #576.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #576.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #576.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #576.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #576.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #576.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #576.0
# Begin ASM
        mov    ecx, [SHA3_S+32+8]
# End ASM                                                       #576.0
# Begin ASM
        mov    eax, [SHA3_S+32+12]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #576.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #576.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #576.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #576.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #576.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #576.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #576.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #576.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #576.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #576.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #576.0
# Begin ASM
        mov    [SHA3_S+32],    edi
# End ASM                                                       #576.0
# Begin ASM
        mov    [SHA3_S+32+4],  esp
# End ASM                                                       #576.0
# Begin ASM
        mov    [SHA3_S+32+8],  ebp
# End ASM                                                       #576.0
# Begin ASM
        mov    [SHA3_S+32+12], esi
# End ASM                                                       #576.0
# Begin ASM
        mov    ecx, [SHA3_S+48]
# End ASM                                                       #576.0
# Begin ASM
        mov    eax, [SHA3_S+48+4]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #576.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #576.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #576.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #576.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #576.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #576.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #576.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #576.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #576.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #576.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #576.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #576.0
# Begin ASM
        mov    ecx, [SHA3_S+48+8]
# End ASM                                                       #576.0
# Begin ASM
        mov    eax, [SHA3_S+48+12]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #576.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #576.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #576.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #576.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #576.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #576.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #576.0
# Begin ASM
        xor    esp, [SHA3_CNT+4]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #576.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #576.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #576.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #576.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #576.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #576.0
# Begin ASM
        addd   [SHA3_CNT+4], 1
# End ASM                                                       #576.0
# Begin ASM
        mov    [SHA3_S+48+8],  ebp
# End ASM                                                       #576.0
# Begin ASM
        mov    [SHA3_S+48+12], esi
# End ASM                                                       #576.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #576.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #576.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #576.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #576.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #576.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #576.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #576.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #576.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #576.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #576.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #576.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #576.0
# Begin ASM
        mov    ecx, [SHA3_S+48+8]
# End ASM                                                       #576.0
# Begin ASM
        mov    eax, [SHA3_S+48+12]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #576.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #576.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #576.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #576.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #576.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #576.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #576.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #576.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #576.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #576.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #576.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #576.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #576.0
# Begin ASM
        mov    [SHA3_S+48],    edi
# End ASM                                                       #576.0
# Begin ASM
        mov    [SHA3_S+48+4],  esp
# End ASM                                                       #576.0
# Begin ASM
        mov    [SHA3_S+48+8],  ebp
# End ASM                                                       #576.0
# Begin ASM
        mov    [SHA3_S+48+12], esi
# End ASM                                                       #576.0
# Begin ASM
        mov    ecx, [SHA3_S+64]
# End ASM                                                       #577.0
# Begin ASM
        mov    eax, [SHA3_S+64+4]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #577.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #577.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #577.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #577.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #577.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #577.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #577.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #577.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #577.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #577.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #577.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #577.0
# Begin ASM
        mov    ecx, [SHA3_S+64+8]
# End ASM                                                       #577.0
# Begin ASM
        mov    eax, [SHA3_S+64+12]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #577.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #577.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #577.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #577.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #577.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #577.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #577.0
# Begin ASM
        xor    esp, [SHA3_CNT+4]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #577.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #577.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #577.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #577.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #577.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #577.0
# Begin ASM
        addd   [SHA3_CNT+4], 1
# End ASM                                                       #577.0
# Begin ASM
        mov    [SHA3_S+64+8],  ebp
# End ASM                                                       #577.0
# Begin ASM
        mov    [SHA3_S+64+12], esi
# End ASM                                                       #577.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #577.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #577.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #577.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #577.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #577.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #577.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #577.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #577.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #577.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #577.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #577.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #577.0
# Begin ASM
        mov    ecx, [SHA3_S+64+8]
# End ASM                                                       #577.0
# Begin ASM
        mov    eax, [SHA3_S+64+12]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #577.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #577.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #577.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #577.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #577.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #577.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #577.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #577.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #577.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #577.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #577.0
# Begin ASM
        mov    [SHA3_S+64],    edi
# End ASM                                                       #577.0
# Begin ASM
        mov    [SHA3_S+64+4],  esp
# End ASM                                                       #577.0
# Begin ASM
        mov    [SHA3_S+64+8],  ebp
# End ASM                                                       #577.0
# Begin ASM
        mov    [SHA3_S+64+12], esi
# End ASM                                                       #577.0
# Begin ASM
        mov    ecx, [SHA3_S+80]
# End ASM                                                       #577.0
# Begin ASM
        mov    eax, [SHA3_S+80+4]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #577.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #577.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #577.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #577.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #577.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #577.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #577.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #577.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #577.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #577.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #577.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #577.0
# Begin ASM
        mov    ecx, [SHA3_S+80+8]
# End ASM                                                       #577.0
# Begin ASM
        mov    eax, [SHA3_S+80+12]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #577.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #577.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #577.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #577.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #577.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #577.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #577.0
# Begin ASM
        xor    esp, [SHA3_CNT+4]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #577.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #577.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #577.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #577.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #577.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #577.0
# Begin ASM
        addd   [SHA3_CNT+4], 1
# End ASM                                                       #577.0
# Begin ASM
        mov    [SHA3_S+80+8],  ebp
# End ASM                                                       #577.0
# Begin ASM
        mov    [SHA3_S+80+12], esi
# End ASM                                                       #577.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #577.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #577.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #577.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #577.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #577.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #577.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #577.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #577.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #577.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #577.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #577.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #577.0
# Begin ASM
        mov    ecx, [SHA3_S+80+8]
# End ASM                                                       #577.0
# Begin ASM
        mov    eax, [SHA3_S+80+12]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #577.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #577.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #577.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #577.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #577.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #577.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #577.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #577.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #577.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #577.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #577.0
# Begin ASM
        mov    [SHA3_S+80],    edi
# End ASM                                                       #577.0
# Begin ASM
        mov    [SHA3_S+80+4],  esp
# End ASM                                                       #577.0
# Begin ASM
        mov    [SHA3_S+80+8],  ebp
# End ASM                                                       #577.0
# Begin ASM
        mov    [SHA3_S+80+12], esi
# End ASM                                                       #577.0
# Begin ASM
        mov    ecx, [SHA3_S+96]
# End ASM                                                       #577.0
# Begin ASM
        mov    eax, [SHA3_S+96+4]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #577.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #577.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #577.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #577.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #577.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #577.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #577.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #577.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #577.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #577.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #577.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #577.0
# Begin ASM
        mov    ecx, [SHA3_S+96+8]
# End ASM                                                       #577.0
# Begin ASM
        mov    eax, [SHA3_S+96+12]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #577.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #577.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #577.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #577.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #577.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #577.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #577.0
# Begin ASM
        xor    esp, [SHA3_CNT+4]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #577.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #577.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #577.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #577.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #577.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #577.0
# Begin ASM
        addd   [SHA3_CNT+4], 1
# End ASM                                                       #577.0
# Begin ASM
        mov    [SHA3_S+96+8],  ebp
# End ASM                                                       #577.0
# Begin ASM
        mov    [SHA3_S+96+12], esi
# End ASM                                                       #577.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #577.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #577.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #577.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #577.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #577.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #577.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #577.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #577.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #577.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #577.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #577.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #577.0
# Begin ASM
        mov    ecx, [SHA3_S+96+8]
# End ASM                                                       #577.0
# Begin ASM
        mov    eax, [SHA3_S+96+12]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #577.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #577.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #577.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #577.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #577.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #577.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #577.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #577.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #577.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #577.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #577.0
# Begin ASM
        mov    [SHA3_S+96],    edi
# End ASM                                                       #577.0
# Begin ASM
        mov    [SHA3_S+96+4],  esp
# End ASM                                                       #577.0
# Begin ASM
        mov    [SHA3_S+96+8],  ebp
# End ASM                                                       #577.0
# Begin ASM
        mov    [SHA3_S+96+12], esi
# End ASM                                                       #577.0
# Begin ASM
        mov    ecx, [SHA3_S+112]
# End ASM                                                       #577.0
# Begin ASM
        mov    eax, [SHA3_S+112+4]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #577.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #577.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #577.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #577.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #577.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #577.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #577.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #577.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #577.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #577.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #577.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #577.0
# Begin ASM
        mov    ecx, [SHA3_S+112+8]
# End ASM                                                       #577.0
# Begin ASM
        mov    eax, [SHA3_S+112+12]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #577.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #577.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #577.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #577.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #577.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #577.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #577.0
# Begin ASM
        xor    esp, [SHA3_CNT+4]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #577.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #577.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #577.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #577.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #577.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #577.0
# Begin ASM
        addd   [SHA3_CNT+4], 1
# End ASM                                                       #577.0
# Begin ASM
        mov    [SHA3_S+112+8],  ebp
# End ASM                                                       #577.0
# Begin ASM
        mov    [SHA3_S+112+12], esi
# End ASM                                                       #577.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #577.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #577.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #577.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #577.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #577.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #577.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #577.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #577.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #577.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #577.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #577.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #577.0
# Begin ASM
        mov    ecx, [SHA3_S+112+8]
# End ASM                                                       #577.0
# Begin ASM
        mov    eax, [SHA3_S+112+12]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #577.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #577.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #577.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #577.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #577.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #577.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #577.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #577.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #577.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #577.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #577.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #577.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #577.0
# Begin ASM
        mov    [SHA3_S+112],    edi
# End ASM                                                       #577.0
# Begin ASM
        mov    [SHA3_S+112+4],  esp
# End ASM                                                       #577.0
# Begin ASM
        mov    [SHA3_S+112+8],  ebp
# End ASM                                                       #577.0
# Begin ASM
        mov    [SHA3_S+112+12], esi
# End ASM                                                       #577.0
# Begin ASM
        mov    ecx, [SHA3_S+128]
# End ASM                                                       #578.0
# Begin ASM
        mov    eax, [SHA3_S+128+4]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #578.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #578.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #578.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #578.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #578.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #578.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #578.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #578.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #578.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #578.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #578.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #578.0
# Begin ASM
        mov    ecx, [SHA3_S+128+8]
# End ASM                                                       #578.0
# Begin ASM
        mov    eax, [SHA3_S+128+12]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #578.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #578.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #578.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #578.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #578.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #578.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #578.0
# Begin ASM
        xor    esp, [SHA3_CNT+4]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #578.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #578.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #578.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #578.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #578.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #578.0
# Begin ASM
        addd   [SHA3_CNT+4], 1
# End ASM                                                       #578.0
# Begin ASM
        mov    [SHA3_S+128+8],  ebp
# End ASM                                                       #578.0
# Begin ASM
        mov    [SHA3_S+128+12], esi
# End ASM                                                       #578.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #578.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #578.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #578.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #578.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #578.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #578.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #578.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #578.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #578.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #578.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #578.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #578.0
# Begin ASM
        mov    ecx, [SHA3_S+128+8]
# End ASM                                                       #578.0
# Begin ASM
        mov    eax, [SHA3_S+128+12]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #578.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #578.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #578.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #578.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #578.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #578.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #578.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #578.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #578.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #578.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #578.0
# Begin ASM
        mov    [SHA3_S+128],    edi
# End ASM                                                       #578.0
# Begin ASM
        mov    [SHA3_S+128+4],  esp
# End ASM                                                       #578.0
# Begin ASM
        mov    [SHA3_S+128+8],  ebp
# End ASM                                                       #578.0
# Begin ASM
        mov    [SHA3_S+128+12], esi
# End ASM                                                       #578.0
# Begin ASM
        mov    ecx, [SHA3_S+144]
# End ASM                                                       #578.0
# Begin ASM
        mov    eax, [SHA3_S+144+4]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #578.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #578.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #578.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #578.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #578.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #578.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #578.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #578.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #578.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #578.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #578.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #578.0
# Begin ASM
        mov    ecx, [SHA3_S+144+8]
# End ASM                                                       #578.0
# Begin ASM
        mov    eax, [SHA3_S+144+12]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #578.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #578.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #578.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #578.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #578.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #578.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #578.0
# Begin ASM
        xor    esp, [SHA3_CNT+4]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #578.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #578.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #578.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #578.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #578.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #578.0
# Begin ASM
        addd   [SHA3_CNT+4], 1
# End ASM                                                       #578.0
# Begin ASM
        mov    [SHA3_S+144+8],  ebp
# End ASM                                                       #578.0
# Begin ASM
        mov    [SHA3_S+144+12], esi
# End ASM                                                       #578.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #578.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #578.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #578.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #578.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #578.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #578.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #578.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #578.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #578.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #578.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #578.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #578.0
# Begin ASM
        mov    ecx, [SHA3_S+144+8]
# End ASM                                                       #578.0
# Begin ASM
        mov    eax, [SHA3_S+144+12]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #578.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #578.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #578.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #578.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #578.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #578.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #578.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #578.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #578.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #578.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #578.0
# Begin ASM
        mov    [SHA3_S+144],    edi
# End ASM                                                       #578.0
# Begin ASM
        mov    [SHA3_S+144+4],  esp
# End ASM                                                       #578.0
# Begin ASM
        mov    [SHA3_S+144+8],  ebp
# End ASM                                                       #578.0
# Begin ASM
        mov    [SHA3_S+144+12], esi
# End ASM                                                       #578.0
# Begin ASM
        mov    ecx, [SHA3_S+160]
# End ASM                                                       #578.0
# Begin ASM
        mov    eax, [SHA3_S+160+4]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #578.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #578.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #578.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #578.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #578.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #578.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #578.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #578.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #578.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #578.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #578.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #578.0
# Begin ASM
        mov    ecx, [SHA3_S+160+8]
# End ASM                                                       #578.0
# Begin ASM
        mov    eax, [SHA3_S+160+12]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #578.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #578.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #578.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #578.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #578.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #578.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #578.0
# Begin ASM
        xor    esp, [SHA3_CNT+4]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #578.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #578.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #578.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #578.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #578.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #578.0
# Begin ASM
        addd   [SHA3_CNT+4], 1
# End ASM                                                       #578.0
# Begin ASM
        mov    [SHA3_S+160+8],  ebp
# End ASM                                                       #578.0
# Begin ASM
        mov    [SHA3_S+160+12], esi
# End ASM                                                       #578.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #578.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #578.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #578.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #578.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #578.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #578.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #578.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #578.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #578.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #578.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #578.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #578.0
# Begin ASM
        mov    ecx, [SHA3_S+160+8]
# End ASM                                                       #578.0
# Begin ASM
        mov    eax, [SHA3_S+160+12]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #578.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #578.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #578.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #578.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #578.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #578.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #578.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #578.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #578.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #578.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #578.0
# Begin ASM
        mov    [SHA3_S+160],    edi
# End ASM                                                       #578.0
# Begin ASM
        mov    [SHA3_S+160+4],  esp
# End ASM                                                       #578.0
# Begin ASM
        mov    [SHA3_S+160+8],  ebp
# End ASM                                                       #578.0
# Begin ASM
        mov    [SHA3_S+160+12], esi
# End ASM                                                       #578.0
# Begin ASM
        mov    ecx, [SHA3_S+176]
# End ASM                                                       #578.0
# Begin ASM
        mov    eax, [SHA3_S+176+4]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #578.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #578.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #578.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #578.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #578.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #578.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #578.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #578.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #578.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #578.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #578.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #578.0
# Begin ASM
        mov    ecx, [SHA3_S+176+8]
# End ASM                                                       #578.0
# Begin ASM
        mov    eax, [SHA3_S+176+12]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #578.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #578.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #578.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #578.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #578.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #578.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #578.0
# Begin ASM
        xor    esp, [SHA3_CNT+4]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #578.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #578.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #578.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #578.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #578.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #578.0
# Begin ASM
        addd   [SHA3_CNT+4], 1
# End ASM                                                       #578.0
# Begin ASM
        mov    [SHA3_S+176+8],  ebp
# End ASM                                                       #578.0
# Begin ASM
        mov    [SHA3_S+176+12], esi
# End ASM                                                       #578.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #578.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #578.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #578.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #578.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #578.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #578.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #578.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #578.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #578.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #578.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #578.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #578.0
# Begin ASM
        mov    ecx, [SHA3_S+176+8]
# End ASM                                                       #578.0
# Begin ASM
        mov    eax, [SHA3_S+176+12]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #578.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #578.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #578.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #578.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #578.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #578.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #578.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #578.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #578.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #578.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #578.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #578.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #578.0
# Begin ASM
        mov    [SHA3_S+176],    edi
# End ASM                                                       #578.0
# Begin ASM
        mov    [SHA3_S+176+4],  esp
# End ASM                                                       #578.0
# Begin ASM
        mov    [SHA3_S+176+8],  ebp
# End ASM                                                       #578.0
# Begin ASM
        mov    [SHA3_S+176+12], esi
# End ASM                                                       #578.0
# Begin ASM
        mov    ecx, [SHA3_S+192]
# End ASM                                                       #579.0
# Begin ASM
        mov    eax, [SHA3_S+192+4]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #579.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #579.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #579.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #579.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #579.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #579.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #579.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #579.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #579.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #579.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #579.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #579.0
# Begin ASM
        mov    ecx, [SHA3_S+192+8]
# End ASM                                                       #579.0
# Begin ASM
        mov    eax, [SHA3_S+192+12]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #579.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #579.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #579.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #579.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #579.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #579.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #579.0
# Begin ASM
        xor    esp, [SHA3_CNT+4]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #579.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #579.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #579.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #579.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #579.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #579.0
# Begin ASM
        addd   [SHA3_CNT+4], 1
# End ASM                                                       #579.0
# Begin ASM
        mov    [SHA3_S+192+8],  ebp
# End ASM                                                       #579.0
# Begin ASM
        mov    [SHA3_S+192+12], esi
# End ASM                                                       #579.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #579.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #579.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #579.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #579.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #579.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #579.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #579.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #579.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #579.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #579.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #579.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #579.0
# Begin ASM
        mov    ecx, [SHA3_S+192+8]
# End ASM                                                       #579.0
# Begin ASM
        mov    eax, [SHA3_S+192+12]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #579.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #579.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #579.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #579.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #579.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #579.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #579.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #579.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #579.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #579.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #579.0
# Begin ASM
        mov    [SHA3_S+192],    edi
# End ASM                                                       #579.0
# Begin ASM
        mov    [SHA3_S+192+4],  esp
# End ASM                                                       #579.0
# Begin ASM
        mov    [SHA3_S+192+8],  ebp
# End ASM                                                       #579.0
# Begin ASM
        mov    [SHA3_S+192+12], esi
# End ASM                                                       #579.0
# Begin ASM
        mov    ecx, [SHA3_S+208]
# End ASM                                                       #579.0
# Begin ASM
        mov    eax, [SHA3_S+208+4]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #579.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #579.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #579.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #579.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #579.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #579.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #579.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #579.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #579.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #579.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #579.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #579.0
# Begin ASM
        mov    ecx, [SHA3_S+208+8]
# End ASM                                                       #579.0
# Begin ASM
        mov    eax, [SHA3_S+208+12]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #579.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #579.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #579.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #579.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #579.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #579.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #579.0
# Begin ASM
        xor    esp, [SHA3_CNT+4]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #579.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #579.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #579.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #579.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #579.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #579.0
# Begin ASM
        addd   [SHA3_CNT+4], 1
# End ASM                                                       #579.0
# Begin ASM
        mov    [SHA3_S+208+8],  ebp
# End ASM                                                       #579.0
# Begin ASM
        mov    [SHA3_S+208+12], esi
# End ASM                                                       #579.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #579.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #579.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #579.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #579.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #579.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #579.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #579.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #579.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #579.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #579.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #579.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #579.0
# Begin ASM
        mov    ecx, [SHA3_S+208+8]
# End ASM                                                       #579.0
# Begin ASM
        mov    eax, [SHA3_S+208+12]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #579.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #579.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #579.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #579.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #579.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #579.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #579.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #579.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #579.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #579.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #579.0
# Begin ASM
        mov    [SHA3_S+208],    edi
# End ASM                                                       #579.0
# Begin ASM
        mov    [SHA3_S+208+4],  esp
# End ASM                                                       #579.0
# Begin ASM
        mov    [SHA3_S+208+8],  ebp
# End ASM                                                       #579.0
# Begin ASM
        mov    [SHA3_S+208+12], esi
# End ASM                                                       #579.0
# Begin ASM
        mov    ecx, [SHA3_S+224]
# End ASM                                                       #579.0
# Begin ASM
        mov    eax, [SHA3_S+224+4]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #579.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #579.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #579.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #579.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #579.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #579.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #579.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #579.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #579.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #579.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #579.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #579.0
# Begin ASM
        mov    ecx, [SHA3_S+224+8]
# End ASM                                                       #579.0
# Begin ASM
        mov    eax, [SHA3_S+224+12]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #579.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #579.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #579.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #579.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #579.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #579.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #579.0
# Begin ASM
        xor    esp, [SHA3_CNT+4]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #579.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #579.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #579.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #579.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #579.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #579.0
# Begin ASM
        addd   [SHA3_CNT+4], 1
# End ASM                                                       #579.0
# Begin ASM
        mov    [SHA3_S+224+8],  ebp
# End ASM                                                       #579.0
# Begin ASM
        mov    [SHA3_S+224+12], esi
# End ASM                                                       #579.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #579.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #579.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #579.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #579.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #579.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #579.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #579.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #579.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #579.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #579.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #579.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #579.0
# Begin ASM
        mov    ecx, [SHA3_S+224+8]
# End ASM                                                       #579.0
# Begin ASM
        mov    eax, [SHA3_S+224+12]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #579.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #579.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #579.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #579.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #579.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #579.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #579.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #579.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #579.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #579.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #579.0
# Begin ASM
        mov    [SHA3_S+224],    edi
# End ASM                                                       #579.0
# Begin ASM
        mov    [SHA3_S+224+4],  esp
# End ASM                                                       #579.0
# Begin ASM
        mov    [SHA3_S+224+8],  ebp
# End ASM                                                       #579.0
# Begin ASM
        mov    [SHA3_S+224+12], esi
# End ASM                                                       #579.0
# Begin ASM
        mov    ecx, [SHA3_S+240]
# End ASM                                                       #579.0
# Begin ASM
        mov    eax, [SHA3_S+240+4]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #579.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #579.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #579.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #579.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #579.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #579.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #579.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #579.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #579.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #579.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #579.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #579.0
# Begin ASM
        mov    ecx, [SHA3_S+240+8]
# End ASM                                                       #579.0
# Begin ASM
        mov    eax, [SHA3_S+240+12]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #579.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #579.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #579.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #579.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #579.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #579.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #579.0
# Begin ASM
        xor    esp, [SHA3_CNT+4]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #579.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #579.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #579.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #579.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #579.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #579.0
# Begin ASM
        addd   [SHA3_CNT+4], 1
# End ASM                                                       #579.0
# Begin ASM
        mov    [SHA3_S+240+8],  ebp
# End ASM                                                       #579.0
# Begin ASM
        mov    [SHA3_S+240+12], esi
# End ASM                                                       #579.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #579.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #579.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #579.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #579.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #579.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #579.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #579.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #579.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #579.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #579.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #579.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #579.0
# Begin ASM
        mov    ecx, [SHA3_S+240+8]
# End ASM                                                       #579.0
# Begin ASM
        mov    eax, [SHA3_S+240+12]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #579.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #579.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #579.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #579.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #579.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #579.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #579.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #579.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #579.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #579.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #579.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #579.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #579.0
# Begin ASM
        mov    [SHA3_S+240],    edi
# End ASM                                                       #579.0
# Begin ASM
        mov    [SHA3_S+240+4],  esp
# End ASM                                                       #579.0
# Begin ASM
        mov    [SHA3_S+240+8],  ebp
# End ASM                                                       #579.0
# Begin ASM
        mov    [SHA3_S+240+12], esi
# End ASM                                                       #579.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*0]
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm1, [SHA3_S+16*5]
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm2, [SHA3_S+16*10]
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm3, [SHA3_S+16*15]
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm4, xmm0
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm4, xmm1
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm5, xmm2
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm5, xmm3
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm6, xmm0
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm6, xmm3
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm7, xmm4
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm7, xmm5
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm0, xmm4
# End ASM                                                       #580.0
# Begin ASM
        psllw    xmm0, 1
# End ASM                                                       #580.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #580.0
# Begin ASM
        psrlw    xmm4, 7
# End ASM                                                       #580.0
# Begin ASM
        pand     xmm4, [MEM_CST+16]
# End ASM                                                       #580.0
# Begin ASM
        pmullw   xmm4, [MEM_CST+32]
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm4, xmm0
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm0, xmm5
# End ASM                                                       #580.0
# Begin ASM
        psllw    xmm0, 1
# End ASM                                                       #580.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #580.0
# Begin ASM
        psrlw    xmm5, 7
# End ASM                                                       #580.0
# Begin ASM
        pand     xmm5, [MEM_CST+16]
# End ASM                                                       #580.0
# Begin ASM
        pmullw   xmm5, [MEM_CST+32]
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm5, xmm0
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm0, xmm6
# End ASM                                                       #580.0
# Begin ASM
        psllq    xmm0, 1
# End ASM                                                       #580.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #580.0
# Begin ASM
        psrlq    xmm6, 7
# End ASM                                                       #580.0
# Begin ASM
        pand     xmm6, [MEM_CST+16]
# End ASM                                                       #580.0
# Begin ASM
        pmullw   xmm6, [MEM_CST+32]
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm6, xmm0
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm0,  [SHA3_S]
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm0,  xmm7
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm0,  xmm4
# End ASM                                                       #580.0
# Begin ASM
        movaps   [SHA3_S],   xmm0
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16]
# End ASM                                                       #580.0
# Begin ASM
        movaps   [SHA3_S+16*5], xmm0
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm1,     xmm4
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm1,     xmm5
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm1,     xmm6
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm1,     xmm7
# End ASM                                                       #580.0
# Begin ASM
        movaps   [SHA3_S+16], xmm1
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*2]
# End ASM                                                       #580.0
# Begin ASM
        movaps   [SHA3_S+16*10], xmm0
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm2,      xmm7
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm2,      xmm5
# End ASM                                                       #580.0
# Begin ASM
        movaps   [SHA3_S+16*2],  xmm2
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*3]
# End ASM                                                       #580.0
# Begin ASM
        movaps   [SHA3_S+16*15], xmm0
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm3,  xmm7
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm3,  xmm6
# End ASM                                                       #580.0
# Begin ASM
        movaps   [SHA3_S+16*3], xmm3
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*4]
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm1, [SHA3_S+16*9]
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm2, [SHA3_S+16*14]
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm3, [SHA3_S+16*15]
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm4, xmm0
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm4, xmm1
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm5, xmm2
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm5, xmm3
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm6, xmm0
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm6, xmm3
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm7, xmm4
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm7, xmm5
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm0, xmm4
# End ASM                                                       #580.0
# Begin ASM
        psllw    xmm0, 1
# End ASM                                                       #580.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #580.0
# Begin ASM
        psrlw    xmm4, 7
# End ASM                                                       #580.0
# Begin ASM
        pand     xmm4, [MEM_CST+16]
# End ASM                                                       #580.0
# Begin ASM
        pmullw   xmm4, [MEM_CST+32]
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm4, xmm0
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm0, xmm5
# End ASM                                                       #580.0
# Begin ASM
        psllw    xmm0, 1
# End ASM                                                       #580.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #580.0
# Begin ASM
        psrlw    xmm5, 7
# End ASM                                                       #580.0
# Begin ASM
        pand     xmm5, [MEM_CST+16]
# End ASM                                                       #580.0
# Begin ASM
        pmullw   xmm5, [MEM_CST+32]
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm5, xmm0
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm0, xmm6
# End ASM                                                       #580.0
# Begin ASM
        psllq    xmm0, 1
# End ASM                                                       #580.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #580.0
# Begin ASM
        psrlq    xmm6, 7
# End ASM                                                       #580.0
# Begin ASM
        pand     xmm6, [MEM_CST+16]
# End ASM                                                       #580.0
# Begin ASM
        pmullw   xmm6, [MEM_CST+32]
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm6, xmm0
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*4]
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm0,  xmm7
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm0,  xmm4
# End ASM                                                       #580.0
# Begin ASM
        movaps   [SHA3_S+16*4], xmm0
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*5]
# End ASM                                                       #580.0
# Begin ASM
        movaps   [SHA3_S+16*9], xmm0
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm1,  xmm4
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm1,  xmm5
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm1,  xmm6
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm1,  xmm7
# End ASM                                                       #580.0
# Begin ASM
        movaps   [SHA3_S+16*5], xmm1
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*6]
# End ASM                                                       #580.0
# Begin ASM
        movaps   [SHA3_S+16*14], xmm0
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm2,  xmm7
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm2,  xmm5
# End ASM                                                       #580.0
# Begin ASM
        movaps   [SHA3_S+16*6], xmm2
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*7]
# End ASM                                                       #580.0
# Begin ASM
        movaps   [SHA3_S+16*15], xmm0
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm3,  xmm7
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm3,  xmm6
# End ASM                                                       #580.0
# Begin ASM
        movaps   [SHA3_S+16*7], xmm3
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*8]
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm1, [SHA3_S+16*13]
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm2, [SHA3_S+16*10]
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm3, [SHA3_S+16*15]
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm4, xmm0
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm4, xmm1
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm5, xmm2
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm5, xmm3
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm6, xmm0
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm6, xmm3
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm7, xmm4
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm7, xmm5
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm0, xmm4
# End ASM                                                       #580.0
# Begin ASM
        psllw    xmm0, 1
# End ASM                                                       #580.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #580.0
# Begin ASM
        psrlw    xmm4, 7
# End ASM                                                       #580.0
# Begin ASM
        pand     xmm4, [MEM_CST+16]
# End ASM                                                       #580.0
# Begin ASM
        pmullw   xmm4, [MEM_CST+32]
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm4, xmm0
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm0, xmm5
# End ASM                                                       #580.0
# Begin ASM
        psllw    xmm0, 1
# End ASM                                                       #580.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #580.0
# Begin ASM
        psrlw    xmm5, 7
# End ASM                                                       #580.0
# Begin ASM
        pand     xmm5, [MEM_CST+16]
# End ASM                                                       #580.0
# Begin ASM
        pmullw   xmm5, [MEM_CST+32]
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm5, xmm0
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm0, xmm6
# End ASM                                                       #580.0
# Begin ASM
        psllq    xmm0, 1
# End ASM                                                       #580.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #580.0
# Begin ASM
        psrlq    xmm6, 7
# End ASM                                                       #580.0
# Begin ASM
        pand     xmm6, [MEM_CST+16]
# End ASM                                                       #580.0
# Begin ASM
        pmullw   xmm6, [MEM_CST+32]
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm6, xmm0
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*8]
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm0,  xmm7
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm0,  xmm4
# End ASM                                                       #580.0
# Begin ASM
        movaps   [SHA3_S+16*8], xmm0
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*9]
# End ASM                                                       #580.0
# Begin ASM
        movaps   [SHA3_S+16*13], xmm0
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm1,  xmm4
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm1,  xmm5
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm1,  xmm6
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm1,  xmm7
# End ASM                                                       #580.0
# Begin ASM
        movaps   [SHA3_S+16*9], xmm1
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm2,  xmm7
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm2,  xmm5
# End ASM                                                       #580.0
# Begin ASM
        movaps   [SHA3_S+16*10], xmm2
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*11]
# End ASM                                                       #580.0
# Begin ASM
        movaps   [SHA3_S+16*15], xmm0
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm3,      xmm7
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm3,      xmm6
# End ASM                                                       #580.0
# Begin ASM
        movaps   [SHA3_S+16*11], xmm3
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*12]
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm1, [SHA3_S+16*13]
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm2, [SHA3_S+16*14]
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm3, [SHA3_S+16*15]
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm4, xmm0
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm4, xmm1
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm5, xmm2
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm5, xmm3
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm6, xmm0
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm6, xmm3
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm7, xmm4
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm7, xmm5
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm0, xmm4
# End ASM                                                       #580.0
# Begin ASM
        psllw    xmm0, 1
# End ASM                                                       #580.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #580.0
# Begin ASM
        psrlw    xmm4, 7
# End ASM                                                       #580.0
# Begin ASM
        pand     xmm4, [MEM_CST+16]
# End ASM                                                       #580.0
# Begin ASM
        pmullw   xmm4, [MEM_CST+32]
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm4, xmm0
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm0, xmm5
# End ASM                                                       #580.0
# Begin ASM
        psllw    xmm0, 1
# End ASM                                                       #580.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #580.0
# Begin ASM
        psrlw    xmm5, 7
# End ASM                                                       #580.0
# Begin ASM
        pand     xmm5, [MEM_CST+16]
# End ASM                                                       #580.0
# Begin ASM
        pmullw   xmm5, [MEM_CST+32]
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm5, xmm0
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm0, xmm6
# End ASM                                                       #580.0
# Begin ASM
        psllq    xmm0, 1
# End ASM                                                       #580.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #580.0
# Begin ASM
        psrlq    xmm6, 7
# End ASM                                                       #580.0
# Begin ASM
        pand     xmm6, [MEM_CST+16]
# End ASM                                                       #580.0
# Begin ASM
        pmullw   xmm6, [MEM_CST+32]
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm6, xmm0
# End ASM                                                       #580.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*12]
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm0,  xmm7
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm0,  xmm4
# End ASM                                                       #580.0
# Begin ASM
        movaps   [SHA3_S+16*12], xmm0
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm1,  xmm4
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm1,  xmm5
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm1,  xmm6
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm1,  xmm7
# End ASM                                                       #580.0
# Begin ASM
        movaps   [SHA3_S+16*13], xmm1
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm2,  xmm7
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm2,  xmm5
# End ASM                                                       #580.0
# Begin ASM
        movaps   [SHA3_S+16*14], xmm2
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm3,  xmm7
# End ASM                                                       #580.0
# Begin ASM
        pxor     xmm3,  xmm6
# End ASM                                                       #580.0
# Begin ASM
        movaps   [SHA3_S+16*15], xmm3
# End ASM                                                       #580.0
# Begin ASM
        subd [SHA3_R], 1
# End ASM                                                       #581.0
# Begin ASM
        jne LABEL_BIG_ROUND_O
# End ASM                                                       #582.0
# Begin ASM
        jmp END
# End ASM                                                       #583.0
# Begin ASM
        NO_OVERFLOW2:
# End ASM                                                       #585.0
# Begin ASM
        mov    dword ptr [SHA3_S+264], 0
# End ASM                                                       #586.0
# Begin ASM
        movaps  xmm0, [SHA3_S]
# End ASM                                                       #588.0
# Begin ASM
        movaps  xmm1, [SHA3_S+16]
# End ASM                                                       #588.0
# Begin ASM
        movaps  xmm2, [SHA3_S+2*16]
# End ASM                                                       #588.0
# Begin ASM
        movaps  xmm3, [SHA3_S+3*16]
# End ASM                                                       #588.0
# Begin ASM
        pxor    xmm0, [SHA3_S+4*16]
# End ASM                                                       #588.0
# Begin ASM
        pxor    xmm1, [SHA3_S+4*16+16]
# End ASM                                                       #588.0
# Begin ASM
        pxor    xmm2, [SHA3_S+4*16+2*16]
# End ASM                                                       #588.0
# Begin ASM
        pxor    xmm3, [SHA3_S+4*16+3*16]
# End ASM                                                       #588.0
# Begin ASM
        pxor    xmm0, [SHA3_S+8*16]
# End ASM                                                       #588.0
# Begin ASM
        pxor    xmm1, [SHA3_S+8*16+16]
# End ASM                                                       #588.0
# Begin ASM
        pxor    xmm2, [SHA3_S+8*16+2*16]
# End ASM                                                       #588.0
# Begin ASM
        pxor    xmm3, [SHA3_S+8*16+3*16]
# End ASM                                                       #588.0
# Begin ASM
        pxor    xmm0, [SHA3_S+12*16]
# End ASM                                                       #588.0
# Begin ASM
        pxor    xmm1, [SHA3_S+12*16+16]
# End ASM                                                       #588.0
# Begin ASM
        pxor    xmm2, [SHA3_S+12*16+2*16]
# End ASM                                                       #588.0
# Begin ASM
        pxor    xmm3, [SHA3_S+12*16+3*16]
# End ASM                                                       #588.0
# Begin ASM
        movaps  [OLDCV],	   xmm0
# End ASM                                                       #588.0
# Begin ASM
        movaps  [OLDCV+16],   xmm1
# End ASM                                                       #588.0
# Begin ASM
        movaps  [OLDCV+2*16], xmm2
# End ASM                                                       #588.0
# Begin ASM
        movaps  [OLDCV+3*16], xmm3
# End ASM                                                       #588.0
# Begin ASM
        xor    ebx,ebx
# End ASM                                                       #593.0
# Begin ASM
        xor    edx,edx
# End ASM                                                       #594.0
# Begin ASM
        mov    [SHA3_ESP], esp
# End ASM                                                       #596.0
# Begin ASM
        LABEL_BIG_ROUND_NO2:
# End ASM                                                       #598.0
# Begin ASM
        mov    ecx, [SHA3_S+0]
# End ASM                                                       #599.0
# Begin ASM
        mov    eax, [SHA3_S+0+4]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #599.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #599.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #599.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #599.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #599.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #599.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #599.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #599.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #599.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #599.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #599.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #599.0
# Begin ASM
        mov    ecx, [SHA3_S+0+8]
# End ASM                                                       #599.0
# Begin ASM
        mov    eax, [SHA3_S+0+12]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #599.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #599.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #599.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #599.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #599.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #599.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #599.0
# Begin ASM
        xor    esp, [SHA3_CNT+4]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #599.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #599.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #599.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #599.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #599.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #599.0
# Begin ASM
        mov    [SHA3_S+0+8],  ebp
# End ASM                                                       #599.0
# Begin ASM
        mov    [SHA3_S+0+12], esi
# End ASM                                                       #599.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #599.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #599.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #599.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #599.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #599.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #599.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #599.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #599.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #599.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #599.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #599.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #599.0
# Begin ASM
        mov    ecx, [SHA3_S+0+8]
# End ASM                                                       #599.0
# Begin ASM
        mov    eax, [SHA3_S+0+12]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #599.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #599.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #599.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #599.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #599.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #599.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #599.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #599.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #599.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #599.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #599.0
# Begin ASM
        mov    [SHA3_S+0],    edi
# End ASM                                                       #599.0
# Begin ASM
        mov    [SHA3_S+0+4],  esp
# End ASM                                                       #599.0
# Begin ASM
        mov    [SHA3_S+0+8],  ebp
# End ASM                                                       #599.0
# Begin ASM
        mov    [SHA3_S+0+12], esi
# End ASM                                                       #599.0
# Begin ASM
        mov    ecx, [SHA3_S+16]
# End ASM                                                       #599.0
# Begin ASM
        mov    eax, [SHA3_S+16+4]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #599.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #599.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #599.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #599.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #599.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #599.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #599.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #599.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #599.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #599.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #599.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #599.0
# Begin ASM
        mov    ecx, [SHA3_S+16+8]
# End ASM                                                       #599.0
# Begin ASM
        mov    eax, [SHA3_S+16+12]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #599.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #599.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #599.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #599.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #599.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #599.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #599.0
# Begin ASM
        xor    esp, [SHA3_CNT+4]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #599.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #599.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #599.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #599.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #599.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #599.0
# Begin ASM
        mov    [SHA3_S+16+8],  ebp
# End ASM                                                       #599.0
# Begin ASM
        mov    [SHA3_S+16+12], esi
# End ASM                                                       #599.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #599.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #599.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #599.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #599.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #599.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #599.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #599.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #599.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #599.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #599.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #599.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #599.0
# Begin ASM
        mov    ecx, [SHA3_S+16+8]
# End ASM                                                       #599.0
# Begin ASM
        mov    eax, [SHA3_S+16+12]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #599.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #599.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #599.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #599.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #599.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #599.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #599.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #599.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #599.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #599.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #599.0
# Begin ASM
        mov    [SHA3_S+16],    edi
# End ASM                                                       #599.0
# Begin ASM
        mov    [SHA3_S+16+4],  esp
# End ASM                                                       #599.0
# Begin ASM
        mov    [SHA3_S+16+8],  ebp
# End ASM                                                       #599.0
# Begin ASM
        mov    [SHA3_S+16+12], esi
# End ASM                                                       #599.0
# Begin ASM
        mov    ecx, [SHA3_S+32]
# End ASM                                                       #599.0
# Begin ASM
        mov    eax, [SHA3_S+32+4]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #599.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #599.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #599.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #599.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #599.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #599.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #599.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #599.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #599.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #599.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #599.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #599.0
# Begin ASM
        mov    ecx, [SHA3_S+32+8]
# End ASM                                                       #599.0
# Begin ASM
        mov    eax, [SHA3_S+32+12]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #599.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #599.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #599.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #599.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #599.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #599.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #599.0
# Begin ASM
        xor    esp, [SHA3_CNT+4]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #599.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #599.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #599.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #599.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #599.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #599.0
# Begin ASM
        mov    [SHA3_S+32+8],  ebp
# End ASM                                                       #599.0
# Begin ASM
        mov    [SHA3_S+32+12], esi
# End ASM                                                       #599.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #599.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #599.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #599.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #599.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #599.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #599.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #599.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #599.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #599.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #599.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #599.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #599.0
# Begin ASM
        mov    ecx, [SHA3_S+32+8]
# End ASM                                                       #599.0
# Begin ASM
        mov    eax, [SHA3_S+32+12]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #599.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #599.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #599.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #599.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #599.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #599.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #599.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #599.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #599.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #599.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #599.0
# Begin ASM
        mov    [SHA3_S+32],    edi
# End ASM                                                       #599.0
# Begin ASM
        mov    [SHA3_S+32+4],  esp
# End ASM                                                       #599.0
# Begin ASM
        mov    [SHA3_S+32+8],  ebp
# End ASM                                                       #599.0
# Begin ASM
        mov    [SHA3_S+32+12], esi
# End ASM                                                       #599.0
# Begin ASM
        mov    ecx, [SHA3_S+48]
# End ASM                                                       #599.0
# Begin ASM
        mov    eax, [SHA3_S+48+4]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #599.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #599.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #599.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #599.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #599.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #599.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #599.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #599.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #599.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #599.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #599.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #599.0
# Begin ASM
        mov    ecx, [SHA3_S+48+8]
# End ASM                                                       #599.0
# Begin ASM
        mov    eax, [SHA3_S+48+12]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #599.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #599.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #599.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #599.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #599.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #599.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #599.0
# Begin ASM
        xor    esp, [SHA3_CNT+4]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #599.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #599.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #599.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #599.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #599.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #599.0
# Begin ASM
        mov    [SHA3_S+48+8],  ebp
# End ASM                                                       #599.0
# Begin ASM
        mov    [SHA3_S+48+12], esi
# End ASM                                                       #599.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #599.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #599.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #599.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #599.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #599.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #599.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #599.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #599.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #599.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #599.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #599.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #599.0
# Begin ASM
        mov    ecx, [SHA3_S+48+8]
# End ASM                                                       #599.0
# Begin ASM
        mov    eax, [SHA3_S+48+12]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #599.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #599.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #599.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #599.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #599.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #599.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #599.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #599.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #599.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #599.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #599.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #599.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #599.0
# Begin ASM
        mov    [SHA3_S+48],    edi
# End ASM                                                       #599.0
# Begin ASM
        mov    [SHA3_S+48+4],  esp
# End ASM                                                       #599.0
# Begin ASM
        mov    [SHA3_S+48+8],  ebp
# End ASM                                                       #599.0
# Begin ASM
        mov    [SHA3_S+48+12], esi
# End ASM                                                       #599.0
# Begin ASM
        mov    ecx, [SHA3_S+64]
# End ASM                                                       #600.0
# Begin ASM
        mov    eax, [SHA3_S+64+4]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #600.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #600.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #600.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #600.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #600.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #600.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #600.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #600.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #600.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #600.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #600.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #600.0
# Begin ASM
        mov    ecx, [SHA3_S+64+8]
# End ASM                                                       #600.0
# Begin ASM
        mov    eax, [SHA3_S+64+12]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #600.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #600.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #600.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #600.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #600.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #600.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #600.0
# Begin ASM
        xor    esp, [SHA3_CNT+4]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #600.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #600.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #600.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #600.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #600.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #600.0
# Begin ASM
        mov    [SHA3_S+64+8],  ebp
# End ASM                                                       #600.0
# Begin ASM
        mov    [SHA3_S+64+12], esi
# End ASM                                                       #600.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #600.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #600.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #600.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #600.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #600.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #600.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #600.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #600.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #600.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #600.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #600.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #600.0
# Begin ASM
        mov    ecx, [SHA3_S+64+8]
# End ASM                                                       #600.0
# Begin ASM
        mov    eax, [SHA3_S+64+12]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #600.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #600.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #600.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #600.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #600.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #600.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #600.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #600.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #600.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #600.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #600.0
# Begin ASM
        mov    [SHA3_S+64],    edi
# End ASM                                                       #600.0
# Begin ASM
        mov    [SHA3_S+64+4],  esp
# End ASM                                                       #600.0
# Begin ASM
        mov    [SHA3_S+64+8],  ebp
# End ASM                                                       #600.0
# Begin ASM
        mov    [SHA3_S+64+12], esi
# End ASM                                                       #600.0
# Begin ASM
        mov    ecx, [SHA3_S+80]
# End ASM                                                       #600.0
# Begin ASM
        mov    eax, [SHA3_S+80+4]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #600.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #600.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #600.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #600.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #600.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #600.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #600.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #600.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #600.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #600.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #600.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #600.0
# Begin ASM
        mov    ecx, [SHA3_S+80+8]
# End ASM                                                       #600.0
# Begin ASM
        mov    eax, [SHA3_S+80+12]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #600.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #600.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #600.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #600.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #600.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #600.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #600.0
# Begin ASM
        xor    esp, [SHA3_CNT+4]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #600.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #600.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #600.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #600.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #600.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #600.0
# Begin ASM
        mov    [SHA3_S+80+8],  ebp
# End ASM                                                       #600.0
# Begin ASM
        mov    [SHA3_S+80+12], esi
# End ASM                                                       #600.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #600.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #600.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #600.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #600.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #600.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #600.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #600.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #600.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #600.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #600.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #600.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #600.0
# Begin ASM
        mov    ecx, [SHA3_S+80+8]
# End ASM                                                       #600.0
# Begin ASM
        mov    eax, [SHA3_S+80+12]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #600.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #600.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #600.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #600.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #600.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #600.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #600.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #600.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #600.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #600.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #600.0
# Begin ASM
        mov    [SHA3_S+80],    edi
# End ASM                                                       #600.0
# Begin ASM
        mov    [SHA3_S+80+4],  esp
# End ASM                                                       #600.0
# Begin ASM
        mov    [SHA3_S+80+8],  ebp
# End ASM                                                       #600.0
# Begin ASM
        mov    [SHA3_S+80+12], esi
# End ASM                                                       #600.0
# Begin ASM
        mov    ecx, [SHA3_S+96]
# End ASM                                                       #600.0
# Begin ASM
        mov    eax, [SHA3_S+96+4]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #600.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #600.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #600.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #600.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #600.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #600.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #600.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #600.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #600.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #600.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #600.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #600.0
# Begin ASM
        mov    ecx, [SHA3_S+96+8]
# End ASM                                                       #600.0
# Begin ASM
        mov    eax, [SHA3_S+96+12]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #600.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #600.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #600.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #600.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #600.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #600.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #600.0
# Begin ASM
        xor    esp, [SHA3_CNT+4]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #600.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #600.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #600.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #600.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #600.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #600.0
# Begin ASM
        mov    [SHA3_S+96+8],  ebp
# End ASM                                                       #600.0
# Begin ASM
        mov    [SHA3_S+96+12], esi
# End ASM                                                       #600.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #600.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #600.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #600.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #600.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #600.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #600.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #600.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #600.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #600.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #600.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #600.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #600.0
# Begin ASM
        mov    ecx, [SHA3_S+96+8]
# End ASM                                                       #600.0
# Begin ASM
        mov    eax, [SHA3_S+96+12]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #600.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #600.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #600.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #600.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #600.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #600.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #600.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #600.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #600.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #600.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #600.0
# Begin ASM
        mov    [SHA3_S+96],    edi
# End ASM                                                       #600.0
# Begin ASM
        mov    [SHA3_S+96+4],  esp
# End ASM                                                       #600.0
# Begin ASM
        mov    [SHA3_S+96+8],  ebp
# End ASM                                                       #600.0
# Begin ASM
        mov    [SHA3_S+96+12], esi
# End ASM                                                       #600.0
# Begin ASM
        mov    ecx, [SHA3_S+112]
# End ASM                                                       #600.0
# Begin ASM
        mov    eax, [SHA3_S+112+4]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #600.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #600.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #600.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #600.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #600.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #600.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #600.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #600.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #600.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #600.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #600.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #600.0
# Begin ASM
        mov    ecx, [SHA3_S+112+8]
# End ASM                                                       #600.0
# Begin ASM
        mov    eax, [SHA3_S+112+12]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #600.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #600.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #600.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #600.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #600.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #600.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #600.0
# Begin ASM
        xor    esp, [SHA3_CNT+4]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #600.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #600.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #600.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #600.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #600.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #600.0
# Begin ASM
        mov    [SHA3_S+112+8],  ebp
# End ASM                                                       #600.0
# Begin ASM
        mov    [SHA3_S+112+12], esi
# End ASM                                                       #600.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #600.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #600.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #600.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #600.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #600.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #600.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #600.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #600.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #600.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #600.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #600.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #600.0
# Begin ASM
        mov    ecx, [SHA3_S+112+8]
# End ASM                                                       #600.0
# Begin ASM
        mov    eax, [SHA3_S+112+12]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #600.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #600.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #600.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #600.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #600.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #600.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #600.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #600.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #600.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #600.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #600.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #600.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #600.0
# Begin ASM
        mov    [SHA3_S+112],    edi
# End ASM                                                       #600.0
# Begin ASM
        mov    [SHA3_S+112+4],  esp
# End ASM                                                       #600.0
# Begin ASM
        mov    [SHA3_S+112+8],  ebp
# End ASM                                                       #600.0
# Begin ASM
        mov    [SHA3_S+112+12], esi
# End ASM                                                       #600.0
# Begin ASM
        mov    ecx, [SHA3_S+128]
# End ASM                                                       #601.0
# Begin ASM
        mov    eax, [SHA3_S+128+4]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #601.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #601.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #601.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #601.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #601.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #601.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #601.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #601.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #601.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #601.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #601.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #601.0
# Begin ASM
        mov    ecx, [SHA3_S+128+8]
# End ASM                                                       #601.0
# Begin ASM
        mov    eax, [SHA3_S+128+12]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #601.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #601.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #601.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #601.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #601.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #601.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #601.0
# Begin ASM
        xor    esp, [SHA3_CNT+4]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #601.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #601.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #601.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #601.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #601.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #601.0
# Begin ASM
        mov    [SHA3_S+128+8],  ebp
# End ASM                                                       #601.0
# Begin ASM
        mov    [SHA3_S+128+12], esi
# End ASM                                                       #601.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #601.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #601.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #601.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #601.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #601.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #601.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #601.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #601.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #601.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #601.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #601.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #601.0
# Begin ASM
        mov    ecx, [SHA3_S+128+8]
# End ASM                                                       #601.0
# Begin ASM
        mov    eax, [SHA3_S+128+12]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #601.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #601.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #601.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #601.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #601.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #601.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #601.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #601.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #601.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #601.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #601.0
# Begin ASM
        mov    [SHA3_S+128],    edi
# End ASM                                                       #601.0
# Begin ASM
        mov    [SHA3_S+128+4],  esp
# End ASM                                                       #601.0
# Begin ASM
        mov    [SHA3_S+128+8],  ebp
# End ASM                                                       #601.0
# Begin ASM
        mov    [SHA3_S+128+12], esi
# End ASM                                                       #601.0
# Begin ASM
        mov    ecx, [SHA3_S+144]
# End ASM                                                       #601.0
# Begin ASM
        mov    eax, [SHA3_S+144+4]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #601.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #601.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #601.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #601.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #601.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #601.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #601.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #601.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #601.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #601.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #601.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #601.0
# Begin ASM
        mov    ecx, [SHA3_S+144+8]
# End ASM                                                       #601.0
# Begin ASM
        mov    eax, [SHA3_S+144+12]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #601.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #601.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #601.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #601.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #601.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #601.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #601.0
# Begin ASM
        xor    esp, [SHA3_CNT+4]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #601.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #601.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #601.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #601.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #601.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #601.0
# Begin ASM
        mov    [SHA3_S+144+8],  ebp
# End ASM                                                       #601.0
# Begin ASM
        mov    [SHA3_S+144+12], esi
# End ASM                                                       #601.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #601.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #601.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #601.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #601.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #601.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #601.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #601.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #601.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #601.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #601.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #601.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #601.0
# Begin ASM
        mov    ecx, [SHA3_S+144+8]
# End ASM                                                       #601.0
# Begin ASM
        mov    eax, [SHA3_S+144+12]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #601.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #601.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #601.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #601.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #601.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #601.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #601.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #601.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #601.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #601.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #601.0
# Begin ASM
        mov    [SHA3_S+144],    edi
# End ASM                                                       #601.0
# Begin ASM
        mov    [SHA3_S+144+4],  esp
# End ASM                                                       #601.0
# Begin ASM
        mov    [SHA3_S+144+8],  ebp
# End ASM                                                       #601.0
# Begin ASM
        mov    [SHA3_S+144+12], esi
# End ASM                                                       #601.0
# Begin ASM
        mov    ecx, [SHA3_S+160]
# End ASM                                                       #601.0
# Begin ASM
        mov    eax, [SHA3_S+160+4]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #601.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #601.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #601.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #601.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #601.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #601.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #601.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #601.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #601.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #601.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #601.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #601.0
# Begin ASM
        mov    ecx, [SHA3_S+160+8]
# End ASM                                                       #601.0
# Begin ASM
        mov    eax, [SHA3_S+160+12]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #601.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #601.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #601.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #601.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #601.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #601.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #601.0
# Begin ASM
        xor    esp, [SHA3_CNT+4]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #601.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #601.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #601.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #601.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #601.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #601.0
# Begin ASM
        mov    [SHA3_S+160+8],  ebp
# End ASM                                                       #601.0
# Begin ASM
        mov    [SHA3_S+160+12], esi
# End ASM                                                       #601.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #601.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #601.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #601.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #601.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #601.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #601.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #601.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #601.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #601.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #601.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #601.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #601.0
# Begin ASM
        mov    ecx, [SHA3_S+160+8]
# End ASM                                                       #601.0
# Begin ASM
        mov    eax, [SHA3_S+160+12]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #601.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #601.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #601.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #601.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #601.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #601.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #601.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #601.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #601.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #601.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #601.0
# Begin ASM
        mov    [SHA3_S+160],    edi
# End ASM                                                       #601.0
# Begin ASM
        mov    [SHA3_S+160+4],  esp
# End ASM                                                       #601.0
# Begin ASM
        mov    [SHA3_S+160+8],  ebp
# End ASM                                                       #601.0
# Begin ASM
        mov    [SHA3_S+160+12], esi
# End ASM                                                       #601.0
# Begin ASM
        mov    ecx, [SHA3_S+176]
# End ASM                                                       #601.0
# Begin ASM
        mov    eax, [SHA3_S+176+4]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #601.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #601.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #601.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #601.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #601.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #601.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #601.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #601.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #601.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #601.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #601.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #601.0
# Begin ASM
        mov    ecx, [SHA3_S+176+8]
# End ASM                                                       #601.0
# Begin ASM
        mov    eax, [SHA3_S+176+12]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #601.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #601.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #601.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #601.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #601.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #601.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #601.0
# Begin ASM
        xor    esp, [SHA3_CNT+4]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #601.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #601.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #601.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #601.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #601.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #601.0
# Begin ASM
        mov    [SHA3_S+176+8],  ebp
# End ASM                                                       #601.0
# Begin ASM
        mov    [SHA3_S+176+12], esi
# End ASM                                                       #601.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #601.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #601.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #601.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #601.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #601.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #601.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #601.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #601.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #601.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #601.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #601.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #601.0
# Begin ASM
        mov    ecx, [SHA3_S+176+8]
# End ASM                                                       #601.0
# Begin ASM
        mov    eax, [SHA3_S+176+12]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #601.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #601.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #601.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #601.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #601.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #601.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #601.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #601.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #601.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #601.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #601.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #601.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #601.0
# Begin ASM
        mov    [SHA3_S+176],    edi
# End ASM                                                       #601.0
# Begin ASM
        mov    [SHA3_S+176+4],  esp
# End ASM                                                       #601.0
# Begin ASM
        mov    [SHA3_S+176+8],  ebp
# End ASM                                                       #601.0
# Begin ASM
        mov    [SHA3_S+176+12], esi
# End ASM                                                       #601.0
# Begin ASM
        mov    ecx, [SHA3_S+192]
# End ASM                                                       #602.0
# Begin ASM
        mov    eax, [SHA3_S+192+4]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #602.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #602.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #602.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #602.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #602.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #602.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #602.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #602.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #602.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #602.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #602.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #602.0
# Begin ASM
        mov    ecx, [SHA3_S+192+8]
# End ASM                                                       #602.0
# Begin ASM
        mov    eax, [SHA3_S+192+12]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #602.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #602.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #602.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #602.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #602.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #602.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #602.0
# Begin ASM
        xor    esp, [SHA3_CNT+4]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #602.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #602.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #602.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #602.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #602.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #602.0
# Begin ASM
        mov    [SHA3_S+192+8],  ebp
# End ASM                                                       #602.0
# Begin ASM
        mov    [SHA3_S+192+12], esi
# End ASM                                                       #602.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #602.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #602.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #602.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #602.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #602.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #602.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #602.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #602.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #602.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #602.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #602.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #602.0
# Begin ASM
        mov    ecx, [SHA3_S+192+8]
# End ASM                                                       #602.0
# Begin ASM
        mov    eax, [SHA3_S+192+12]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #602.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #602.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #602.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #602.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #602.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #602.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #602.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #602.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #602.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #602.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #602.0
# Begin ASM
        mov    [SHA3_S+192],    edi
# End ASM                                                       #602.0
# Begin ASM
        mov    [SHA3_S+192+4],  esp
# End ASM                                                       #602.0
# Begin ASM
        mov    [SHA3_S+192+8],  ebp
# End ASM                                                       #602.0
# Begin ASM
        mov    [SHA3_S+192+12], esi
# End ASM                                                       #602.0
# Begin ASM
        mov    ecx, [SHA3_S+208]
# End ASM                                                       #602.0
# Begin ASM
        mov    eax, [SHA3_S+208+4]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #602.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #602.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #602.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #602.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #602.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #602.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #602.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #602.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #602.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #602.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #602.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #602.0
# Begin ASM
        mov    ecx, [SHA3_S+208+8]
# End ASM                                                       #602.0
# Begin ASM
        mov    eax, [SHA3_S+208+12]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #602.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #602.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #602.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #602.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #602.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #602.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #602.0
# Begin ASM
        xor    esp, [SHA3_CNT+4]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #602.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #602.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #602.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #602.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #602.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #602.0
# Begin ASM
        mov    [SHA3_S+208+8],  ebp
# End ASM                                                       #602.0
# Begin ASM
        mov    [SHA3_S+208+12], esi
# End ASM                                                       #602.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #602.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #602.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #602.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #602.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #602.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #602.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #602.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #602.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #602.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #602.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #602.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #602.0
# Begin ASM
        mov    ecx, [SHA3_S+208+8]
# End ASM                                                       #602.0
# Begin ASM
        mov    eax, [SHA3_S+208+12]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #602.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #602.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #602.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #602.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #602.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #602.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #602.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #602.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #602.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #602.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #602.0
# Begin ASM
        mov    [SHA3_S+208],    edi
# End ASM                                                       #602.0
# Begin ASM
        mov    [SHA3_S+208+4],  esp
# End ASM                                                       #602.0
# Begin ASM
        mov    [SHA3_S+208+8],  ebp
# End ASM                                                       #602.0
# Begin ASM
        mov    [SHA3_S+208+12], esi
# End ASM                                                       #602.0
# Begin ASM
        mov    ecx, [SHA3_S+224]
# End ASM                                                       #602.0
# Begin ASM
        mov    eax, [SHA3_S+224+4]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #602.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #602.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #602.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #602.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #602.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #602.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #602.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #602.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #602.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #602.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #602.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #602.0
# Begin ASM
        mov    ecx, [SHA3_S+224+8]
# End ASM                                                       #602.0
# Begin ASM
        mov    eax, [SHA3_S+224+12]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #602.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #602.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #602.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #602.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #602.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #602.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #602.0
# Begin ASM
        xor    esp, [SHA3_CNT+4]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #602.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #602.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #602.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #602.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #602.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #602.0
# Begin ASM
        mov    [SHA3_S+224+8],  ebp
# End ASM                                                       #602.0
# Begin ASM
        mov    [SHA3_S+224+12], esi
# End ASM                                                       #602.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #602.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #602.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #602.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #602.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #602.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #602.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #602.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #602.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #602.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #602.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #602.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #602.0
# Begin ASM
        mov    ecx, [SHA3_S+224+8]
# End ASM                                                       #602.0
# Begin ASM
        mov    eax, [SHA3_S+224+12]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #602.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #602.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #602.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #602.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #602.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #602.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #602.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #602.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #602.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #602.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #602.0
# Begin ASM
        mov    [SHA3_S+224],    edi
# End ASM                                                       #602.0
# Begin ASM
        mov    [SHA3_S+224+4],  esp
# End ASM                                                       #602.0
# Begin ASM
        mov    [SHA3_S+224+8],  ebp
# End ASM                                                       #602.0
# Begin ASM
        mov    [SHA3_S+224+12], esi
# End ASM                                                       #602.0
# Begin ASM
        mov    ecx, [SHA3_S+240]
# End ASM                                                       #602.0
# Begin ASM
        mov    eax, [SHA3_S+240+4]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #602.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #602.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #602.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #602.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #602.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #602.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #602.0
# Begin ASM
        xor    edi, [SHA3_CNT]  
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #602.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #602.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #602.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #602.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #602.0
# Begin ASM
        mov    ecx, [SHA3_S+240+8]
# End ASM                                                       #602.0
# Begin ASM
        mov    eax, [SHA3_S+240+12]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #602.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #602.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #602.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #602.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #602.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #602.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #602.0
# Begin ASM
        xor    esp, [SHA3_CNT+4]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #602.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #602.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #602.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #602.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #602.0
# Begin ASM
        addd   [SHA3_CNT],   1
# End ASM                                                       #602.0
# Begin ASM
        mov    [SHA3_S+240+8],  ebp
# End ASM                                                       #602.0
# Begin ASM
        mov    [SHA3_S+240+12], esi
# End ASM                                                       #602.0
# Begin ASM
        mov    ecx, edi
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #602.0
# Begin ASM
        mov    eax, esp
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #602.0
# Begin ASM
        mov    edi, [Te+8*edx]
# End ASM                                                       #602.0
# Begin ASM
        mov    esp, [Te+8*ebx]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #602.0
# Begin ASM
        mov    esi, [Te+8*edx+3]
# End ASM                                                       #602.0
# Begin ASM
        xor    edi, [Te+8*ebx+3]
# End ASM                                                       #602.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #602.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #602.0
# Begin ASM
        mov    ebp, [Te+8*edx+2]
# End ASM                                                       #602.0
# Begin ASM
        xor    esi, [Te+8*ebx+2]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #602.0
# Begin ASM
        xor    esp, [Te+8*edx+1]
# End ASM                                                       #602.0
# Begin ASM
        xor    ebp, [Te+8*ebx+1]
# End ASM                                                       #602.0
# Begin ASM
        mov    ecx, [SHA3_S+240+8]
# End ASM                                                       #602.0
# Begin ASM
        mov    eax, [SHA3_S+240+12]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #602.0
# Begin ASM
        xor    ebp, [Te+8*edx]
# End ASM                                                       #602.0
# Begin ASM
        xor    esi, [Te+8*ebx]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #602.0
# Begin ASM
        xor    esp, [Te+8*edx+3]
# End ASM                                                       #602.0
# Begin ASM
        xor    ebp, [Te+8*ebx+3]
# End ASM                                                       #602.0
# Begin ASM
        ror    ecx, 16
# End ASM                                                       #602.0
# Begin ASM
        ror    eax, 16
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, cl
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, al
# End ASM                                                       #602.0
# Begin ASM
        xor    edi, [Te+8*edx+2]
# End ASM                                                       #602.0
# Begin ASM
        xor    esp, [Te+8*ebx+2]
# End ASM                                                       #602.0
# Begin ASM
        mov    dl, ch
# End ASM                                                       #602.0
# Begin ASM
        mov    bl, ah
# End ASM                                                       #602.0
# Begin ASM
        xor    esi, [Te+8*edx+1]
# End ASM                                                       #602.0
# Begin ASM
        xor    edi, [Te+8*ebx+1]
# End ASM                                                       #602.0
# Begin ASM
        mov    [SHA3_S+240],    edi
# End ASM                                                       #602.0
# Begin ASM
        mov    [SHA3_S+240+4],  esp
# End ASM                                                       #602.0
# Begin ASM
        mov    [SHA3_S+240+8],  ebp
# End ASM                                                       #602.0
# Begin ASM
        mov    [SHA3_S+240+12], esi
# End ASM                                                       #602.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*0]
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm1, [SHA3_S+16*5]
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm2, [SHA3_S+16*10]
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm3, [SHA3_S+16*15]
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm4, xmm0
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm4, xmm1
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm5, xmm2
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm5, xmm3
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm6, xmm0
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm6, xmm3
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm7, xmm4
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm7, xmm5
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm0, xmm4
# End ASM                                                       #603.0
# Begin ASM
        psllw    xmm0, 1
# End ASM                                                       #603.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #603.0
# Begin ASM
        psrlw    xmm4, 7
# End ASM                                                       #603.0
# Begin ASM
        pand     xmm4, [MEM_CST+16]
# End ASM                                                       #603.0
# Begin ASM
        pmullw   xmm4, [MEM_CST+32]
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm4, xmm0
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm0, xmm5
# End ASM                                                       #603.0
# Begin ASM
        psllw    xmm0, 1
# End ASM                                                       #603.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #603.0
# Begin ASM
        psrlw    xmm5, 7
# End ASM                                                       #603.0
# Begin ASM
        pand     xmm5, [MEM_CST+16]
# End ASM                                                       #603.0
# Begin ASM
        pmullw   xmm5, [MEM_CST+32]
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm5, xmm0
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm0, xmm6
# End ASM                                                       #603.0
# Begin ASM
        psllq    xmm0, 1
# End ASM                                                       #603.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #603.0
# Begin ASM
        psrlq    xmm6, 7
# End ASM                                                       #603.0
# Begin ASM
        pand     xmm6, [MEM_CST+16]
# End ASM                                                       #603.0
# Begin ASM
        pmullw   xmm6, [MEM_CST+32]
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm6, xmm0
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm0,  [SHA3_S]
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm0,  xmm7
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm0,  xmm4
# End ASM                                                       #603.0
# Begin ASM
        movaps   [SHA3_S],   xmm0
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16]
# End ASM                                                       #603.0
# Begin ASM
        movaps   [SHA3_S+16*5], xmm0
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm1,     xmm4
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm1,     xmm5
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm1,     xmm6
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm1,     xmm7
# End ASM                                                       #603.0
# Begin ASM
        movaps   [SHA3_S+16], xmm1
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*2]
# End ASM                                                       #603.0
# Begin ASM
        movaps   [SHA3_S+16*10], xmm0
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm2,      xmm7
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm2,      xmm5
# End ASM                                                       #603.0
# Begin ASM
        movaps   [SHA3_S+16*2],  xmm2
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*3]
# End ASM                                                       #603.0
# Begin ASM
        movaps   [SHA3_S+16*15], xmm0
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm3,  xmm7
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm3,  xmm6
# End ASM                                                       #603.0
# Begin ASM
        movaps   [SHA3_S+16*3], xmm3
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*4]
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm1, [SHA3_S+16*9]
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm2, [SHA3_S+16*14]
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm3, [SHA3_S+16*15]
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm4, xmm0
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm4, xmm1
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm5, xmm2
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm5, xmm3
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm6, xmm0
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm6, xmm3
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm7, xmm4
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm7, xmm5
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm0, xmm4
# End ASM                                                       #603.0
# Begin ASM
        psllw    xmm0, 1
# End ASM                                                       #603.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #603.0
# Begin ASM
        psrlw    xmm4, 7
# End ASM                                                       #603.0
# Begin ASM
        pand     xmm4, [MEM_CST+16]
# End ASM                                                       #603.0
# Begin ASM
        pmullw   xmm4, [MEM_CST+32]
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm4, xmm0
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm0, xmm5
# End ASM                                                       #603.0
# Begin ASM
        psllw    xmm0, 1
# End ASM                                                       #603.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #603.0
# Begin ASM
        psrlw    xmm5, 7
# End ASM                                                       #603.0
# Begin ASM
        pand     xmm5, [MEM_CST+16]
# End ASM                                                       #603.0
# Begin ASM
        pmullw   xmm5, [MEM_CST+32]
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm5, xmm0
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm0, xmm6
# End ASM                                                       #603.0
# Begin ASM
        psllq    xmm0, 1
# End ASM                                                       #603.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #603.0
# Begin ASM
        psrlq    xmm6, 7
# End ASM                                                       #603.0
# Begin ASM
        pand     xmm6, [MEM_CST+16]
# End ASM                                                       #603.0
# Begin ASM
        pmullw   xmm6, [MEM_CST+32]
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm6, xmm0
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*4]
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm0,  xmm7
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm0,  xmm4
# End ASM                                                       #603.0
# Begin ASM
        movaps   [SHA3_S+16*4], xmm0
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*5]
# End ASM                                                       #603.0
# Begin ASM
        movaps   [SHA3_S+16*9], xmm0
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm1,  xmm4
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm1,  xmm5
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm1,  xmm6
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm1,  xmm7
# End ASM                                                       #603.0
# Begin ASM
        movaps   [SHA3_S+16*5], xmm1
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*6]
# End ASM                                                       #603.0
# Begin ASM
        movaps   [SHA3_S+16*14], xmm0
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm2,  xmm7
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm2,  xmm5
# End ASM                                                       #603.0
# Begin ASM
        movaps   [SHA3_S+16*6], xmm2
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*7]
# End ASM                                                       #603.0
# Begin ASM
        movaps   [SHA3_S+16*15], xmm0
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm3,  xmm7
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm3,  xmm6
# End ASM                                                       #603.0
# Begin ASM
        movaps   [SHA3_S+16*7], xmm3
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*8]
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm1, [SHA3_S+16*13]
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm2, [SHA3_S+16*10]
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm3, [SHA3_S+16*15]
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm4, xmm0
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm4, xmm1
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm5, xmm2
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm5, xmm3
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm6, xmm0
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm6, xmm3
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm7, xmm4
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm7, xmm5
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm0, xmm4
# End ASM                                                       #603.0
# Begin ASM
        psllw    xmm0, 1
# End ASM                                                       #603.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #603.0
# Begin ASM
        psrlw    xmm4, 7
# End ASM                                                       #603.0
# Begin ASM
        pand     xmm4, [MEM_CST+16]
# End ASM                                                       #603.0
# Begin ASM
        pmullw   xmm4, [MEM_CST+32]
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm4, xmm0
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm0, xmm5
# End ASM                                                       #603.0
# Begin ASM
        psllw    xmm0, 1
# End ASM                                                       #603.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #603.0
# Begin ASM
        psrlw    xmm5, 7
# End ASM                                                       #603.0
# Begin ASM
        pand     xmm5, [MEM_CST+16]
# End ASM                                                       #603.0
# Begin ASM
        pmullw   xmm5, [MEM_CST+32]
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm5, xmm0
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm0, xmm6
# End ASM                                                       #603.0
# Begin ASM
        psllq    xmm0, 1
# End ASM                                                       #603.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #603.0
# Begin ASM
        psrlq    xmm6, 7
# End ASM                                                       #603.0
# Begin ASM
        pand     xmm6, [MEM_CST+16]
# End ASM                                                       #603.0
# Begin ASM
        pmullw   xmm6, [MEM_CST+32]
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm6, xmm0
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*8]
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm0,  xmm7
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm0,  xmm4
# End ASM                                                       #603.0
# Begin ASM
        movaps   [SHA3_S+16*8], xmm0
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*9]
# End ASM                                                       #603.0
# Begin ASM
        movaps   [SHA3_S+16*13], xmm0
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm1,  xmm4
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm1,  xmm5
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm1,  xmm6
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm1,  xmm7
# End ASM                                                       #603.0
# Begin ASM
        movaps   [SHA3_S+16*9], xmm1
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm2,  xmm7
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm2,  xmm5
# End ASM                                                       #603.0
# Begin ASM
        movaps   [SHA3_S+16*10], xmm2
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*11]
# End ASM                                                       #603.0
# Begin ASM
        movaps   [SHA3_S+16*15], xmm0
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm3,      xmm7
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm3,      xmm6
# End ASM                                                       #603.0
# Begin ASM
        movaps   [SHA3_S+16*11], xmm3
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*12]
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm1, [SHA3_S+16*13]
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm2, [SHA3_S+16*14]
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm3, [SHA3_S+16*15]
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm4, xmm0
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm4, xmm1
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm5, xmm2
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm5, xmm3
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm6, xmm0
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm6, xmm3
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm7, xmm4
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm7, xmm5
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm0, xmm4
# End ASM                                                       #603.0
# Begin ASM
        psllw    xmm0, 1
# End ASM                                                       #603.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #603.0
# Begin ASM
        psrlw    xmm4, 7
# End ASM                                                       #603.0
# Begin ASM
        pand     xmm4, [MEM_CST+16]
# End ASM                                                       #603.0
# Begin ASM
        pmullw   xmm4, [MEM_CST+32]
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm4, xmm0
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm0, xmm5
# End ASM                                                       #603.0
# Begin ASM
        psllw    xmm0, 1
# End ASM                                                       #603.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #603.0
# Begin ASM
        psrlw    xmm5, 7
# End ASM                                                       #603.0
# Begin ASM
        pand     xmm5, [MEM_CST+16]
# End ASM                                                       #603.0
# Begin ASM
        pmullw   xmm5, [MEM_CST+32]
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm5, xmm0
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm0, xmm6
# End ASM                                                       #603.0
# Begin ASM
        psllq    xmm0, 1
# End ASM                                                       #603.0
# Begin ASM
        pand     xmm0, [MEM_CST]
# End ASM                                                       #603.0
# Begin ASM
        psrlq    xmm6, 7
# End ASM                                                       #603.0
# Begin ASM
        pand     xmm6, [MEM_CST+16]
# End ASM                                                       #603.0
# Begin ASM
        pmullw   xmm6, [MEM_CST+32]
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm6, xmm0
# End ASM                                                       #603.0
# Begin ASM
        movaps   xmm0, [SHA3_S+16*12]
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm0,  xmm7
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm0,  xmm4
# End ASM                                                       #603.0
# Begin ASM
        movaps   [SHA3_S+16*12], xmm0
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm1,  xmm4
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm1,  xmm5
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm1,  xmm6
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm1,  xmm7
# End ASM                                                       #603.0
# Begin ASM
        movaps   [SHA3_S+16*13], xmm1
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm2,  xmm7
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm2,  xmm5
# End ASM                                                       #603.0
# Begin ASM
        movaps   [SHA3_S+16*14], xmm2
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm3,  xmm7
# End ASM                                                       #603.0
# Begin ASM
        pxor     xmm3,  xmm6
# End ASM                                                       #603.0
# Begin ASM
        movaps   [SHA3_S+16*15], xmm3
# End ASM                                                       #603.0
# Begin ASM
        subd [SHA3_R], 1
# End ASM                                                       #604.0
# Begin ASM
        jne LABEL_BIG_ROUND_NO2
# End ASM                                                       #605.0
# Begin ASM
        END:
# End ASM                                                       #607.0
# Begin ASM
        movaps  xmm0, [OLDCV]
# End ASM                                                       #609.0
# Begin ASM
        movaps  xmm1, [OLDCV+16]
# End ASM                                                       #609.0
# Begin ASM
        movaps  xmm2, [OLDCV+2*16]
# End ASM                                                       #609.0
# Begin ASM
        movaps  xmm3, [OLDCV+3*16]
# End ASM                                                       #609.0
# Begin ASM
        pxor    xmm0, [SHA3_S]
# End ASM                                                       #609.0
# Begin ASM
        pxor    xmm1, [SHA3_S+1*16]
# End ASM                                                       #609.0
# Begin ASM
        pxor    xmm2, [SHA3_S+2*16]
# End ASM                                                       #609.0
# Begin ASM
        pxor    xmm3, [SHA3_S+3*16]
# End ASM                                                       #609.0
# Begin ASM
        pxor    xmm0, [SHA3_S+4*16]
# End ASM                                                       #609.0
# Begin ASM
        pxor    xmm1, [SHA3_S+5*16]
# End ASM                                                       #609.0
# Begin ASM
        pxor    xmm2, [SHA3_S+6*16]
# End ASM                                                       #609.0
# Begin ASM
        pxor    xmm3, [SHA3_S+7*16]
# End ASM                                                       #609.0
# Begin ASM
        pxor    xmm0, [SHA3_S+8*16]
# End ASM                                                       #609.0
# Begin ASM
        pxor    xmm1, [SHA3_S+9*16]
# End ASM                                                       #609.0
# Begin ASM
        pxor    xmm2, [SHA3_S+10*16]
# End ASM                                                       #609.0
# Begin ASM
        pxor    xmm3, [SHA3_S+11*16]
# End ASM                                                       #609.0
# Begin ASM
        pxor    xmm0, [SHA3_S+12*16]
# End ASM                                                       #609.0
# Begin ASM
        pxor    xmm1, [SHA3_S+13*16]
# End ASM                                                       #609.0
# Begin ASM
        pxor    xmm2, [SHA3_S+14*16]
# End ASM                                                       #609.0
# Begin ASM
        pxor    xmm3, [SHA3_S+15*16]
# End ASM                                                       #609.0
# Begin ASM
        movaps  [SHA3_S]     , xmm0
# End ASM                                                       #609.0
# Begin ASM
        movaps  [SHA3_S+1*16], xmm1
# End ASM                                                       #609.0
# Begin ASM
        movaps  [SHA3_S+2*16], xmm2
# End ASM                                                       #609.0
# Begin ASM
        movaps  [SHA3_S+3*16], xmm3
# End ASM                                                       #609.0
# Begin ASM
        mov    esp, [SHA3_ESP]
# End ASM                                                       #615.0
        popa                                                    #616.0
# Begin ASM
        .att_syntax noprefix
# End ASM                                                       #617.0
# End ASM
                                # LOE ebx ebp esi edi
..B1.5:                         # Preds ..B1.4
        ret                                                     #618.3
        .align    2,0x90
                                # LOE
# mark_end;
	.type	Compress,@function
	.size	Compress,.-Compress
	.data
# -- End  Compress
	.text
# -- Begin  Init
# mark_begin;
       .align    2,0x90
	.globl Init
Init:
# parameter 1: %eax
# parameter 2: %edx
..B2.1:                         # Preds ..B2.0
        movl      4(%esp), %eax                                 #622.1
        movl      8(%esp), %edx                                 #622.1
	.globl   Init.
Init.:                                                          #
        pushl     %edi                                          #622.1
        pushl     %esi                                          #622.1
        pushl     %ebx                                          #622.1
        movl      %edx, %esi                                    #622.1
        movl      276+SHA3_S, %ecx                              #629.7
        testl     %ecx, %ecx                                    #629.31
        je        ..B2.6        # Prob 19%                      #629.31
                                # LOE eax ecx ebp esi
..B2.2:                         # Preds ..B2.1
        cmpl      %ecx, %eax                                    #629.50
        je        ..B2.6        # Prob 2%                       #629.50
                                # LOE eax ebp esi
..B2.3:                         # Preds ..B2.2
        movl      276+SHA3_S, %edi                              #630.34
        xorl      %edx, %edx                                    #632.2
                                # LOE eax edx ebp esi edi
..B2.4:                         # Preds ..B2.3 ..B2.4
        movl      SHA3_S(,%edx,8), %ecx                         #632.2
        movl      4+SHA3_S(,%edx,8), %ebx                       #632.2
        movl      %ecx, (%edi,%edx,8)                           #632.2
        movl      %ebx, 4(%edi,%edx,8)                          #632.2
        incl      %edx                                          #632.2
        cmpl      $35, %edx                                     #632.2
        jb        ..B2.4        # Prob 97%                      #632.2
                                # LOE eax edx ebp esi edi
..B2.6:                         # Preds ..B2.4 ..B2.1 ..B2.2
        movl      $1, 48+MEM_CST                                #653.19
        movl      %eax, 276+SHA3_S                              #638.3
        movl      $-16843010, %ecx                              #641.19
        movl      %ecx, MEM_CST                                 #641.19
        movl      %ecx, 4+MEM_CST                               #642.19
        movl      %ecx, 8+MEM_CST                               #643.19
        movl      %ecx, 12+MEM_CST                              #644.19
        movl      $16843009, %ebx                               #645.19
        xorl      %ecx, %ecx                                    #654.19
        movl      %ebx, 16+MEM_CST                              #645.19
        movl      %ebx, 20+MEM_CST                              #646.19
        movl      %ebx, 24+MEM_CST                              #647.19
        movl      %ebx, 28+MEM_CST                              #648.19
        movl      $1769499, %edi                                #649.19
        cmpl      $160, %esi                                    #660.21
        movl      %edi, 32+MEM_CST                              #649.19
        movl      %edi, 36+MEM_CST                              #650.19
        movl      %edi, 40+MEM_CST                              #651.19
        movl      %edi, 44+MEM_CST                              #652.19
        movl      %ecx, 52+MEM_CST                              #654.19
        movl      %ecx, 56+MEM_CST                              #655.19
        movl      %ecx, 60+MEM_CST                              #656.19
        jl        ..B2.20       # Prob 50%                      #660.21
                                # LOE ebp esi
..B2.7:                         # Preds ..B2.6
        cmpl      $512, %esi                                    #660.44
        jg        ..B2.20       # Prob 28%                      #660.44
                                # LOE ebp esi
..B2.8:                         # Preds ..B2.7
        movl      %esi, 268+SHA3_S                              #661.5
        cmpl      $256, %esi                                    #667.19
        jle       ..B2.10       # Prob 50%                      #667.19
                                # LOE ebp esi
..B2.9:                         # Preds ..B2.8
        movl      $8, 272+SHA3_S                                #668.5
        jmp       ..B2.11       # Prob 100%                     #668.5
                                # LOE ebp esi
..B2.10:                        # Preds ..B2.8
        movl      $4, 272+SHA3_S                                #668.5
                                # LOE ebp esi
..B2.11:                        # Preds ..B2.9 ..B2.10
        xorl      %ebx, %ebx                                    #
        movl      %esi, %eax                                    #675.26
        cltd                                                    #675.26
                                # LOE edx ebx ebp esi
..B2.12:                        # Preds ..B2.12 ..B2.11
        lea       (%ebx,%ebx), %edi                             #675.20
        movl      %esi, SHA3_S(,%edi,8)                         #675.5
        xorl      %ecx, %ecx                                    #676.5
        incl      %ebx                                          #674.32
        movl      %edx, 4+SHA3_S(,%edi,8)                       #675.5
        movl      %ecx, 8+SHA3_S(,%edi,8)                       #676.5
        movl      %ecx, 12+SHA3_S(,%edi,8)                      #676.5
        movl      272+SHA3_S, %ecx                              #674.14
        cmpl      %ecx, %ebx                                    #674.14
        jl        ..B2.12       # Prob 96%                      #674.14
                                # LOE edx ecx ebx ebp esi
..B2.13:                        # Preds ..B2.12
        cmpl      $16, %ecx                                     #680.29
        jge       ..B2.19       # Prob 10%                      #680.29
                                # LOE ecx ebp
..B2.15:                        # Preds ..B2.13 ..B2.17
        xorl      %ebx, %ebx                                    #681.5
        movl      %ecx, %edx                                    #681.20
        shll      $4, %edx                                      #681.20
                                # LOE edx ecx ebx ebp
..B2.16:                        # Preds ..B2.16 ..B2.15
        xorl      %eax, %eax                                    #681.5
        movl      %eax, SHA3_S(%edx,%ebx,8)                     #681.5
        movl      %eax, 4+SHA3_S(%edx,%ebx,8)                   #681.5
        incl      %ebx                                          #681.5
        cmpl      $2, %ebx                                      #681.5
        jl        ..B2.16       # Prob 50%                      #681.5
                                # LOE edx ecx ebx ebp
..B2.17:                        # Preds ..B2.16
        incl      %ecx                                          #680.33
        cmpl      $16, %ecx                                     #680.29
        jl        ..B2.15       # Prob 96%                      #680.29
                                # LOE ecx ebp
..B2.19:                        # Preds ..B2.17 ..B2.13
        xorl      %edx, %edx                                    #686.3
        movl      %edx, 256+SHA3_S                              #686.3
        xorl      %eax, %eax                                    #691.10
        movl      %edx, 260+SHA3_S                              #686.3
        movl      %edx, 264+SHA3_S                              #689.3
..L1:                                                           #
        popl      %ebx                                          #691.10
        popl      %esi                                          #691.10
        popl      %edi                                          #691.10
        ret                                                     #691.10
                                # LOE
..B2.20:                        # Preds ..B2.6 ..B2.7
        pushl     $2                                            #664.12
        popl      %eax                                          #664.12
        jmp       ..L1          # Prob 100%                     #664.12
                                # LOE
# mark_end;
	.type	Init,@function
	.size	Init,.-Init
	.data
# -- End  Init
	.text
# -- Begin  Update
# mark_begin;
       .align    2,0x90
	.globl Update
Update:
# parameter 1: %eax
# parameter 2: %edx
# parameter 3: 56 + %esp
..B3.1:                         # Preds ..B3.0
        movl      4(%esp), %eax                                 #697.1
        movl      8(%esp), %edx                                 #697.1
	.globl   Update.
Update.:                                                        #
        pushl     %edi                                          #697.1
        pushl     %esi                                          #697.1
        pushl     %ebp                                          #697.1
        pushl     %ebx                                          #697.1
        subl      $28, %esp                                     #697.1
        movl      %edx, %ebp                                    #697.1
        cmpl      276+SHA3_S, %eax                              #707.15
        je        ..B3.7        # Prob 2%                       #707.15
                                # LOE eax ebp
..B3.2:                         # Preds ..B3.1
        movl      276+SHA3_S, %ebx                              #709.39
        xorl      %esi, %esi                                    #711.2
                                # LOE eax ebx ebp esi
..B3.3:                         # Preds ..B3.2 ..B3.3
        movl      SHA3_S(,%esi,8), %edx                         #711.2
        movl      4+SHA3_S(,%esi,8), %ecx                       #711.2
        movl      %edx, (%ebx,%esi,8)                           #711.2
        movl      %ecx, 4(%ebx,%esi,8)                          #711.2
        incl      %esi                                          #711.2
        cmpl      $35, %esi                                     #711.2
        jb        ..B3.3        # Prob 97%                      #711.2
                                # LOE eax ebx ebp esi
..B3.4:                         # Preds ..B3.3
        xorl      %ebx, %ebx                                    #714.2
                                # LOE eax ebx ebp
..B3.5:                         # Preds ..B3.4 ..B3.5
        movl      (%eax,%ebx,8), %edx                           #714.2
        movl      4(%eax,%ebx,8), %ecx                          #714.2
        movl      %edx, SHA3_S(,%ebx,8)                         #714.2
        movl      %ecx, 4+SHA3_S(,%ebx,8)                       #714.2
        incl      %ebx                                          #714.2
        cmpl      $35, %ebx                                     #714.2
        jb        ..B3.5        # Prob 97%                      #714.2
                                # LOE eax ebx ebp
..B3.6:                         # Preds ..B3.5
        movl      %eax, 276+SHA3_S                              #715.2
                                # LOE ebp
..B3.7:                         # Preds ..B3.1 ..B3.6
        movl      60(%esp), %edx                                #
        movl      272+SHA3_S, %ebx                              #726.19
        movl      56(%esp), %ecx                                #728.33
        shll      $4, %ebx                                      #726.39
        movl      %edx, %esi                                    #728.33
        shll      $29, %esi                                     #728.33
        movl      %ebx, 8(%esp)                                 #726.39
        lea       SHA3_S(%ebx), %eax                            #727.35
        movl      264+SHA3_S, %ebx                              #729.19
        shrl      $3, %edx                                      #728.33
        shrl      $3, %ecx                                      #728.33
        movl      %eax, 12(%esp)                                #727.35
        orl       %ecx, %esi                                    #728.33
        movl      %edx, 4(%esp)                                 #728.33
        movl      %esi, (%esp)                                  #728.33
        sarl      $3, %ebx                                      #729.44
        subl      $0, %edx                                      #731.21
        jl        ..B3.31       # Prob 3%                       #731.21
                                # LOE edx ebx ebp
..B3.48:                        # Preds ..B3.7
        orl       (%esp), %edx                                  #731.21
        je        ..B3.31       # Prob 3%                       #731.21
                                # LOE ebx ebp
..B3.8:                         # Preds ..B3.48
        movl      8(%esp), %eax                                 #732.14
        negl      %eax                                          #732.14
        addl      $256, %eax                                    #732.14
        movl      %eax, 8(%esp)                                 #732.14
        jmp       ..B3.9        # Prob 100%                     #732.14
                                # LOE ebx ebp
..B3.20:                        # Preds ..B3.49
        xorl      %ebx, %ebx                                    #
                                # LOE ebx ebp
..B3.9:                         # Preds ..B3.20 ..B3.8
        movl      8(%esp), %eax                                 #732.14
        movl      (%esp), %ecx                                  #733.21
        movl      4(%esp), %esi                                 #733.21
        subl      %ebx, %eax                                    #732.14
        cltd                                                    #733.21
        movl      %eax, 16(%esp)                                #732.14
        movl      %edx, 24(%esp)                                #733.21
        subl      %eax, %ecx                                    #733.21
        sbbl      %edx, %esi                                    #733.21
        jl        ..B3.22       # Prob 50%                      #733.21
                                # LOE eax ebx ebp al ah
..B3.10:                        # Preds ..B3.9
        movl      %eax, %edx                                    #735.7
        sarl      $2, %edx                                      #735.7
        shrl      $29, %edx                                     #735.7
        addl      %eax, %edx                                    #735.7
        movl      %edx, %ecx                                    #735.7
        sarl      $3, %ecx                                      #735.7
        movl      %ecx, 20(%esp)                                #735.7
        testl     %ecx, %ecx                                    #735.7
        jbe       ..B3.14       # Prob 16%                      #735.7
                                # LOE edx ebx ebp
..B3.11:                        # Preds ..B3.10
        movl      12(%esp), %ecx                                #735.7
        xorl      %eax, %eax                                    #
        lea       (%ecx,%ebx), %edi                             #735.7
                                # LOE eax edx ebx ebp edi
..B3.12:                        # Preds ..B3.12 ..B3.11
        movl      (%ebp,%eax,8), %ecx                           #735.7
        movl      4(%ebp,%eax,8), %esi                          #735.7
        movl      %ecx, (%edi,%eax,8)                           #735.7
        movl      %esi, 4(%edi,%eax,8)                          #735.7
        incl      %eax                                          #735.7
        cmpl      20(%esp), %eax                                #735.7
        jb        ..B3.12       # Prob 82%                      #735.7
                                # LOE eax edx ebx ebp edi
..B3.14:                        # Preds ..B3.12 ..B3.10
        movl      16(%esp), %ecx                                #735.7
        andl      $-8, %edx                                     #735.7
        andl      $-2147483641, %ecx                            #735.7
        jge       ..B3.46       # Prob 50%                      #735.7
                                # LOE edx ecx ebx ebp
..B3.47:                        # Preds ..B3.14
        subl      $1, %ecx                                      #735.7
        orl       $-8, %ecx                                     #735.7
        incl      %ecx                                          #735.7
                                # LOE edx ecx ebx ebp
..B3.46:                        # Preds ..B3.14 ..B3.47
        addl      %edx, %ecx                                    #735.7
        cmpl      %ecx, %edx                                    #735.7
        jae       ..B3.18       # Prob 10%                      #735.7
                                # LOE edx ecx ebx ebp
..B3.15:                        # Preds ..B3.46
        addl      12(%esp), %ebx                                #735.7
                                # LOE edx ecx ebx ebp
..B3.16:                        # Preds ..B3.16 ..B3.15
        movzbl    (%edx,%ebp), %eax                             #735.7
        movb      %al, (%edx,%ebx)                              #735.7
        incl      %edx                                          #735.7
        cmpl      %ecx, %edx                                    #735.7
        jb        ..B3.16       # Prob 82%                      #735.7
                                # LOE edx ecx ebx ebp
..B3.18:                        # Preds ..B3.16 ..B3.46
        movl      264+SHA3_S, %eax                              #736.7
        movl      16(%esp), %edx                                #736.7
        lea       (%eax,%edx,8), %ecx                           #736.7
        movl      %ecx, 264+SHA3_S                              #736.7
        call      Compress                                      #737.7
                                # LOE ebp
..B3.19:                        # Preds ..B3.18
        movl      16(%esp), %eax                                #739.7
        movl      4(%esp), %edx                                 #740.7
        subl      %eax, (%esp)                                  #740.7
        sbbl      24(%esp), %edx                                #740.7
        addl      %eax, %ebp                                    #739.7
        movl      %edx, 4(%esp)                                 #740.7
        subl      $0, %edx                                      #731.21
        jl        ..B3.21       # Prob 18%                      #731.21
                                # LOE edx ebp
..B3.49:                        # Preds ..B3.19
        orl       (%esp), %edx                                  #731.21
        jne       ..B3.20       # Prob 82%                      #731.21
                                # LOE ebp
..B3.21:                        # Preds ..B3.19 ..B3.49
        xorl      %ebx, %ebx                                    #
        jmp       ..B3.31       # Prob 100%                     #
                                # LOE ebx ebp
..B3.22:                        # Preds ..B3.9
        movl      (%esp), %ecx                                  #744.7
        movl      4(%esp), %eax                                 #744.7
        movl      %eax, 8(%esp)                                 #744.7
        testl     %eax, %eax                                    #744.7
        jge       ..B3.42       # Prob 50%                      #744.7
                                # LOE ecx ebx ebp cl ch
..B3.43:                        # Preds ..B3.22
        addl      $7, %ecx                                      #744.7
        adcl      $0, 8(%esp)                                   #744.7
                                # LOE ecx ebx ebp
..B3.42:                        # Preds ..B3.22 ..B3.43
        movl      8(%esp), %eax                                 #744.7
        shrdl     $3, %eax, %ecx                                #744.7
        sarl      $3, %eax                                      #744.7
        movl      %eax, 8(%esp)                                 #744.7
        subl      $0, %eax                                      #744.7
        jl        ..B3.26       # Prob 10%                      #744.7
                                # LOE eax ecx ebx ebp
..B3.50:                        # Preds ..B3.42
        orl       %ecx, %eax                                    #744.7
        je        ..B3.26       # Prob 10%                      #744.7
                                # LOE ecx ebx ebp
..B3.23:                        # Preds ..B3.50
        movl      12(%esp), %edx                                #744.7
        xorl      %eax, %eax                                    #
        lea       (%edx,%ebx), %esi                             #744.7
        movl      %esi, 16(%esp)                                #744.7
                                # LOE eax ecx ebx ebp
..B3.24:                        # Preds ..B3.51 ..B3.23
        movl      16(%esp), %edi                                #744.7
        movl      (%ebp,%eax,8), %edx                           #744.7
        movl      4(%ebp,%eax,8), %esi                          #744.7
        movl      %edx, (%edi,%eax,8)                           #744.7
        movl      8(%esp), %edx                                 #744.7
        movl      %esi, 4(%edi,%eax,8)                          #744.7
        incl      %eax                                          #744.7
        movl      %ecx, %esi                                    #744.7
        subl      %eax, %esi                                    #744.7
        sbbl      $0, %edx                                      #744.7
        jl        ..B3.26       # Prob 18%                      #744.7
                                # LOE eax edx ecx ebx ebp esi
..B3.51:                        # Preds ..B3.24
        orl       %edx, %esi                                    #744.7
        jne       ..B3.24       # Prob 82%                      #744.7
                                # LOE eax ecx ebx ebp
..B3.26:                        # Preds ..B3.51 ..B3.24 ..B3.42 ..B3.50
        movl      8(%esp), %eax                                 #744.7
        movl      (%esp), %edi                                  #744.7
        movl      %ecx, %edx                                    #744.7
        shrl      $29, %edx                                     #744.7
        shll      $3, %ecx                                      #744.7
        shll      $3, %eax                                      #744.7
        orl       %eax, %edx                                    #744.7
        movl      4(%esp), %eax                                 #744.7
        testl     %eax, %eax                                    #744.7
        jge       ..B3.44       # Prob 50%                      #744.7
                                # LOE eax edx ecx ebx ebp edi al ah
..B3.45:                        # Preds ..B3.26
        addl      $7, %edi                                      #744.7
        adcl      $0, %eax                                      #744.7
                                # LOE eax edx ecx ebx ebp edi
..B3.44:                        # Preds ..B3.26 ..B3.45
        shrdl     $3, %eax, %edi                                #744.7
        movl      (%esp), %esi                                  #744.7
        sarl      $3, %eax                                      #744.7
        shldl     $3, %edi, %eax                                #744.7
        shll      $3, %edi                                      #744.7
        subl      %edi, %esi                                    #744.7
        movl      4(%esp), %edi                                 #744.7
        sbbl      %eax, %edi                                    #744.7
        addl      %ecx, %esi                                    #744.7
        adcl      %edi, %edx                                    #744.7
        movl      %ecx, %eax                                    #744.7
        xorl      %edi, %edi                                    #744.7
        subl      %esi, %eax                                    #744.7
        sbbl      %edx, %edi                                    #744.7
        jge       ..B3.30       # Prob 10%                      #744.7
                                # LOE edx ecx ebx ebp esi
..B3.27:                        # Preds ..B3.44
        movl      12(%esp), %eax                                #744.7
        lea       (%eax,%ebx), %edi                             #744.7
                                # LOE edx ecx ebx ebp esi edi
..B3.28:                        # Preds ..B3.28 ..B3.27
        movzbl    (%ecx,%ebp), %eax                             #744.7
        movb      %al, (%ecx,%edi)                              #744.7
        incl      %ecx                                          #744.7
        movl      %ecx, %eax                                    #744.7
        subl      %esi, %eax                                    #744.7
        movl      $0, %eax                                      #744.7
        sbbl      %edx, %eax                                    #744.7
        jl        ..B3.28       # Prob 82%                      #744.7
                                # LOE edx ecx ebx ebp esi edi
..B3.30:                        # Preds ..B3.28 ..B3.44
        movl      (%esp), %eax                                  #745.7
        addl      %eax, %ebx                                    #745.7
        addl      %eax, %ebp                                    #746.7
                                # LOE ebx ebp
..B3.31:                        # Preds ..B3.7 ..B3.30 ..B3.21 ..B3.48
        movl      56(%esp), %eax                                #752.19
        lea       (,%ebx,8), %ecx                               #751.44
        andl      $7, %eax                                      #752.19
        movl      %eax, (%esp)                                  #752.19
        xorl      %edx, %edx                                    #752.19
        orl       %eax, %edx                                    #752.19
        jne       ..B3.33       # Prob 50%                      #752.19
                                # LOE eax ecx ebx ebp al ah
..B3.32:                        # Preds ..B3.31
        movl      %ecx, 264+SHA3_S                              #736.7
        jmp       ..B3.39       # Prob 100%                     #736.7
                                # LOE
..B3.33:                        # Preds ..B3.31
        movl      %eax, %edx                                    #756.5
        lea       (%edx,%ebx,8), %eax                           #756.5
        movl      %eax, 264+SHA3_S                              #756.5
        testl     %edx, %edx                                    #757.16
        jle       ..B3.37       # Prob 10%                      #757.16
                                # LOE ebx ebp
..B3.34:                        # Preds ..B3.33
        xorl      %eax, %eax                                    #
        xorl      %edx, %edx                                    #
        xorl      %esi, %esi                                    #
                                # LOE eax edx ebx ebp esi
..B3.35:                        # Preds ..B3.35 ..B3.34
        lea       7(%esi), %ecx                                 #757.26
        pushl     $1                                            #757.43
        popl      %edi                                          #757.43
        shll      %cl, %edi                                     #757.43
        decl      %esi                                          #757.21
        incl      %edx                                          #757.21
        orl       %edi, %eax                                    #757.26
        movzbl    %al, %eax                                     #757.26
        cmpl      (%esp), %edx                                  #757.16
        jl        ..B3.35       # Prob 82%                      #757.16
        jmp       ..B3.38       # Prob 100%                     #757.16
                                # LOE eax edx ebx ebp esi
..B3.37:                        # Preds ..B3.33
        xorl      %eax, %eax                                    #
                                # LOE eax ebx ebp
..B3.38:                        # Preds ..B3.35 ..B3.37
        movl      12(%esp), %ecx                                #758.5
        movzbl    (%ebp), %edx                                  #758.34
        andl      %edx, %eax                                    #758.34
        movb      %al, (%ebx,%ecx)                              #758.5
                                # LOE
..B3.39:                        # Preds ..B3.38 ..B3.32
        xorl      %eax, %eax                                    #764.10
        addl      $28, %esp                                     #764.10
        popl      %ebx                                          #764.10
        popl      %ebp                                          #764.10
        popl      %esi                                          #764.10
        popl      %edi                                          #764.10
        ret                                                     #764.10
        .align    2,0x90
                                # LOE
# mark_end;
	.type	Update,@function
	.size	Update,.-Update
	.data
# -- End  Update
	.text
# -- Begin  Final
# mark_begin;
       .align    2,0x90
	.globl Final
Final:
# parameter 1: %eax
# parameter 2: %edx
..B4.1:                         # Preds ..B4.0
        movl      4(%esp), %eax                                 #769.1
        movl      8(%esp), %edx                                 #769.1
	.globl   Final.
Final.:                                                         #
        pushl     %edi                                          #769.1
        pushl     %esi                                          #769.1
        pushl     %ebp                                          #769.1
        pushl     %ebx                                          #769.1
        subl      $12, %esp                                     #769.1
        movl      %edx, 8(%esp)                                 #769.1
        movl      %eax, %ebx                                    #769.1
        cmpl      276+SHA3_S, %ebx                              #779.15
        je        ..B4.5        # Prob 33%                      #779.15
                                # LOE ebx
..B4.2:                         # Preds ..B4.1
        pushl     $280                                          #782.27
        pushl     $SHA3_S                                       #782.27
        pushl     276+SHA3_S                                    #782.27
        call      memcpy                                        #782.2
                                # LOE ebx
..B4.3:                         # Preds ..B4.2
        pushl     $280                                          #785.27
        pushl     %ebx                                          #785.27
        pushl     $SHA3_S                                       #785.27
        call      memcpy                                        #785.2
                                # LOE ebx
..B4.42:                        # Preds ..B4.3
        addl      $24, %esp                                     #785.2
                                # LOE ebx
..B4.4:                         # Preds ..B4.42
        movl      %ebx, 276+SHA3_S                              #787.2
                                # LOE
..B4.5:                         # Preds ..B4.1 ..B4.4
        movl      272+SHA3_S, %edx                              #796.26
        movl      264+SHA3_S, %ebx                              #797.20
        movl      %edx, %ebp                                    #796.26
        shll      $7, %ebp                                      #796.26
        negl      %ebp                                          #796.26
        lea       2048(%ebp), %edi                              #796.26
        shll      $4, %edx                                      #802.35
        movl      %edi, %eax                                    #806.7
        subl      %ebx, %eax                                    #806.7
        cmpl      $145, %eax                                    #806.36
        jge       ..B4.13       # Prob 50%                      #806.36
                                # LOE edx ebx ebp edi
..B4.6:                         # Preds ..B4.5
        movl      %ebx, %ecx                                    #807.26
        sarl      $2, %ecx                                      #807.26
        shrl      $29, %ecx                                     #807.26
        addl      %ebx, %ecx                                    #807.26
        sarl      $3, %ecx                                      #807.26
        movzbl    SHA3_S(%edx,%ecx), %eax                       #807.5
        movl      %ecx, (%esp)                                  #807.26
        movl      %ebx, %ecx                                    #807.54
        andl      $-2147483641, %ecx                            #807.54
        jge       ..B4.36       # Prob 50%                      #807.54
                                # LOE eax edx ecx ebx ebp edi al ah
..B4.37:                        # Preds ..B4.6
        subl      $1, %ecx                                      #807.54
        orl       $-8, %ecx                                     #807.54
        incl      %ecx                                          #807.54
                                # LOE eax edx ecx ebx ebp edi al ah
..B4.36:                        # Preds ..B4.6 ..B4.37
        negl      %ecx                                          #807.54
        addl      $7, %ecx                                      #807.54
        pushl     $1                                            #807.54
        popl      %esi                                          #807.54
        shll      %cl, %esi                                     #807.54
        movl      (%esp), %ecx                                  #807.5
        incl      %ebx                                          #808.5
        orl       %esi, %eax                                    #807.5
        movl      %ebx, %esi                                    #
        negl      %esi                                          #
        testl     %ebx, %ebx                                    #809.23
        movb      %al, SHA3_S(%edx,%ecx)                        #807.5
        jle       ..B4.14       # Prob 16%                      #809.23
                                # LOE edx ebx ebp esi edi
..B4.7:                         # Preds ..B4.36
        cmpl      %edi, %ebx                                    #810.26
        je        ..B4.11       # Prob 10%                      #810.26
                                # LOE edx ebx ebp esi
..B4.9:                         # Preds ..B4.7 ..B4.38
        movl      %ebx, %ecx                                    #811.30
        sarl      $2, %ecx                                      #811.30
        shrl      $29, %ecx                                     #811.30
        addl      %ebx, %ecx                                    #811.30
        sarl      $3, %ecx                                      #811.30
        movzbl    SHA3_S(%edx,%ecx), %eax                       #811.9
        movl      %ecx, (%esp)                                  #811.30
        movl      %ebx, %ecx                                    #811.66
        andl      $-2147483641, %ecx                            #811.66
        jge       ..B4.38       # Prob 50%                      #811.66
                                # LOE eax edx ecx ebx ebp esi al ah
..B4.39:                        # Preds ..B4.9
        subl      $1, %ecx                                      #811.66
        orl       $-8, %ecx                                     #811.66
        incl      %ecx                                          #811.66
                                # LOE eax edx ecx ebx ebp esi al ah
..B4.38:                        # Preds ..B4.9 ..B4.39
        negl      %ecx                                          #811.66
        addl      $7, %ecx                                      #811.66
        pushl     $1                                            #811.66
        popl      %edi                                          #811.66
        shll      %cl, %edi                                     #811.66
        movl      (%esp), %ecx                                  #811.9
        decl      %esi                                          #812.9
        notl      %edi                                          #811.66
        andl      %edi, %eax                                    #811.9
        incl      %ebx                                          #812.9
        movb      %al, SHA3_S(%edx,%ecx)                        #811.9
        lea       2048(%esi,%ebp), %eax                         #810.7
        testl     %eax, %eax                                    #810.26
        jne       ..B4.9        # Prob 82%                      #810.26
                                # LOE edx ebx ebp esi
..B4.11:                        # Preds ..B4.38 ..B4.7
        call      Compress                                      #814.7
                                # LOE ebp
..B4.12:                        # Preds ..B4.11
        xorl      %ebx, %ebx                                    #815.7
        jmp       ..B4.14       # Prob 100%                     #815.7
                                # LOE ebx ebp
..B4.13:                        # Preds ..B4.5
        movl      %ebx, %esi                                    #818.26
        sarl      $2, %esi                                      #818.26
        shrl      $29, %esi                                     #818.26
        addl      %ebx, %esi                                    #818.26
        sarl      $3, %esi                                      #818.26
        movl      %ebx, %ecx                                    #818.54
        movzbl    SHA3_S(%edx,%esi), %eax                       #818.5
        andl      $-2147483641, %ecx                            #818.54
        jge       ..B4.40       # Prob 50%                      #818.54
                                # LOE eax edx ecx ebx ebp esi al ah
..B4.41:                        # Preds ..B4.13
        subl      $1, %ecx                                      #818.54
        orl       $-8, %ecx                                     #818.54
        incl      %ecx                                          #818.54
                                # LOE eax edx ecx ebx ebp esi al ah
..B4.40:                        # Preds ..B4.13 ..B4.41
        negl      %ecx                                          #818.54
        addl      $7, %ecx                                      #818.54
        pushl     $1                                            #818.54
        popl      %edi                                          #818.54
        shll      %cl, %edi                                     #818.54
        incl      %ebx                                          #819.5
        orl       %edi, %eax                                    #818.5
        movb      %al, SHA3_S(%edx,%esi)                        #818.5
                                # LOE ebx ebp
..B4.14:                        # Preds ..B4.12 ..B4.36 ..B4.40
        movl      272+SHA3_S, %edi                              #826.15
        movl      264+SHA3_S, %eax                              #827.26
        cltd                                                    #827.26
        movl      256+SHA3_S, %ecx                              #827.9
        addl      264+SHA3_S, %ecx                              #827.26
        movl      %edx, (%esp)                                  #827.26
        movl      %ecx, 4(%esp)                                 #827.26
        movl      %edx, %ecx                                    #827.26
        adcl      260+SHA3_S, %ecx                              #827.26
        movl      %ecx, (%esp)                                  #827.26
        shll      $4, %edi                                      #826.35
        addl      $1904, %ebp                                   #828.39
        cmpl      %ebp, %ebx                                    #828.39
        lea       SHA3_S(%edi), %esi                            #826.3
        jae       ..B4.18       # Prob 10%                      #828.39
                                # LOE ebx ebp esi edi
..B4.16:                        # Preds ..B4.14 ..B4.16
        movl      %ebx, %edx                                    #829.15
        shrl      $3, %edx                                      #829.15
        movl      %ebx, %ecx                                    #829.41
        andl      $7, %ecx                                      #829.41
        xorl      $7, %ecx                                      #829.41
        pushl     $1                                            #829.41
        popl      %eax                                          #829.41
        shll      %cl, %eax                                     #829.41
        incl      %ebx                                          #828.45
        notl      %eax                                          #829.41
        andb      %al, (%esi,%edx)                              #829.5
        cmpl      %ebp, %ebx                                    #828.39
        jb        ..B4.16       # Prob 82%                      #828.39
                                # LOE ebx ebp esi
..B4.17:                        # Preds ..B4.16
        movl      272+SHA3_S, %edi                              #830.22
        shll      $4, %edi                                      #830.22
                                # LOE esi edi
..B4.18:                        # Preds ..B4.17 ..B4.14
        movzbl    268+SHA3_S, %eax                              #831.25
        movl      4(%esp), %ecx                                 #833.3
        subl      %edi, %esi                                    #830.39
        movb      %al, 238(%esi)                                #831.3
        xorl      %ebx, %ebx                                    #834.3
        movzbl    269+SHA3_S, %edx                              #832.25
        movb      %dl, 239(%esi)                                #832.3
        movb      %cl, 240(%esi)                                #833.3
                                # LOE ebx esi
..B4.19:                        # Preds ..B4.30 ..B4.18
        movzbl    _2__cnst_pck.0(%ebx), %ecx                    #834.32
        cmpl      $31, %ecx                                     #834.32
        ja        ..B4.31       # Prob 50%                      #834.32
                                # LOE ecx ebx esi
..B4.32:                        # Preds ..B4.19
        movl      4(%esp), %edx                                 #834.32
        movl      (%esp), %eax                                  #834.32
        shrdl     %cl, %eax, %edx                               #834.32
        jmp       ..B4.30       # Prob 100%                     #834.32
                                # LOE edx ebx esi
..B4.31:                        # Preds ..B4.19
        movl      (%esp), %edx                                  #834.32
        shrl      %cl, %edx                                     #834.32
                                # LOE edx ebx esi
..B4.30:                        # Preds ..B4.32 ..B4.31
        movb      %dl, 241(%ebx,%esi)                           #834.3
        incl      %ebx                                          #834.3
        cmpl      $6, %ebx                                      #834.3
        jl        ..B4.19       # Prob 50%                      #834.3
                                # LOE ebx esi
..B4.20:                        # Preds ..B4.30
        movl      (%esp), %eax                                  #840.31
        shrl      $24, %eax                                     #840.31
        movb      %al, 247(%esi)                                #840.3
        xorl      %eax, %eax                                    #841.3
                                # LOE eax esi
..B4.21:                        # Preds ..B4.21 ..B4.20
        movb      $0, 248(%eax,%esi)                            #841.3
        incl      %eax                                          #841.3
        cmpl      $8, %eax                                      #841.3
        jl        ..B4.21       # Prob 50%                      #841.3
                                # LOE eax esi
..B4.22:                        # Preds ..B4.21
        call      Compress                                      #849.3
                                # LOE
..B4.23:                        # Preds ..B4.22
        movl      268+SHA3_S, %eax                              #853.15
        sarl      $3, %eax                                      #853.36
        testl     %eax, %eax                                    #853.36
        jbe       ..B4.27       # Prob 10%                      #853.36
                                # LOE
..B4.24:                        # Preds ..B4.23
        xorl      %eax, %eax                                    #
                                # LOE eax
..B4.25:                        # Preds ..B4.33 ..B4.24
        movl      %eax, %ecx                                    #854.35
        andl      $-8, %ecx                                     #854.35
        movl      SHA3_S(%ecx), %edx                            #854.20
        movl      4+SHA3_S(%ecx), %ebx                          #854.20
        movl      %eax, %ecx                                    #854.47
        andl      $7, %ecx                                      #854.47
        shll      $3, %ecx                                      #854.47
        cmpl      $31, %ecx                                     #854.47
        ja        ..B4.34       # Prob 50%                      #854.47
                                # LOE eax edx ecx ebx
..B4.35:                        # Preds ..B4.25
        shrdl     %cl, %ebx, %edx                               #854.47
        jmp       ..B4.33       # Prob 100%                     #854.47
                                # LOE eax edx
..B4.34:                        # Preds ..B4.25
        movl      %ebx, %edx                                    #854.47
        shrl      %cl, %edx                                     #854.47
                                # LOE eax edx
..B4.33:                        # Preds ..B4.35 ..B4.34
        movl      8(%esp), %ecx                                 #854.5
        movb      %dl, (%eax,%ecx)                              #854.5
        movl      268+SHA3_S, %edx                              #853.15
        incl      %eax                                          #853.40
        sarl      $3, %edx                                      #853.36
        cmpl      %edx, %eax                                    #853.36
        jb        ..B4.25       # Prob 82%                      #853.36
                                # LOE eax
..B4.27:                        # Preds ..B4.33 ..B4.23
        movl      $0, 276+SHA3_S                                #857.3
        xorl      %eax, %eax                                    #859.10
        addl      $12, %esp                                     #859.10
        popl      %ebx                                          #859.10
        popl      %ebp                                          #859.10
        popl      %esi                                          #859.10
        popl      %edi                                          #859.10
        ret                                                     #859.10
        .align    2,0x90
                                # LOE
# mark_end;
	.type	Final,@function
	.size	Final,.-Final
	.data
# -- End  Final
	.text
# -- Begin  Hash
# mark_begin;
       .align    2,0x90
	.globl Hash
Hash:
# parameter 1: %eax
# parameter 2: %edx
# parameter 3: 16 + %ebp
# parameter 4: %ecx
..B5.1:                         # Preds ..B5.0
        movl      4(%esp), %eax                                 #865.1
        movl      8(%esp), %edx                                 #865.1
        movl      20(%esp), %ecx                                #865.1
	.globl   Hash.
Hash.:                                                          #
        pushl     %ebp                                          #865.1
        movl      %esp, %ebp                                    #865.1
        andl      $-16, %esp                                    #865.1
        pushl     %edi                                          #865.1
        pushl     %esi                                          #865.1
        subl      $296, %esp                                    #865.1
        movl      %ecx, %edi                                    #865.1
        movl      %edx, %esi                                    #865.1
        movl      %eax, %edx                                    #865.1
        lea       16(%esp), %eax                                #868.7
        call      Init.                                         #868.7
                                # LOE eax ebx esi edi
..B5.2:                         # Preds ..B5.1
        testl     %eax, %eax                                    #869.11
        je        ..B5.4        # Prob 43%                      #869.11
                                # LOE eax ebx esi edi
..B5.3:                         # Preds ..B5.2
        addl      $296, %esp                                    #869.27
        popl      %esi                                          #869.27
        popl      %edi                                          #869.27
        movl      %ebp, %esp                                    #869.27
        popl      %ebp                                          #869.27
        ret                                                     #869.27
                                # LOE
..B5.4:                         # Preds ..B5.2
        movl      20(%ebp), %eax                                #
        movl      16(%ebp), %ecx                                #
        movl      %ecx, 8(%esp)                                 #865.1
        movl      %esi, %edx                                    #870.7
        movl      %eax, 12(%esp)                                #865.1
        lea       16(%esp), %eax                                #870.7
        call      Update.                                       #870.7
                                # LOE ebx edi
..B5.5:                         # Preds ..B5.4
        lea       16(%esp), %eax                                #872.10
        movl      %edi, %edx                                    #872.10
        call      Final.                                        #872.10
                                # LOE ebx
..B5.6:                         # Preds ..B5.5
        xorl      %eax, %eax                                    #872.10
        jmp       ..B5.3        # Prob 0%                       #872.10
                                # LOE
# mark_end;
	.type	Hash,@function
	.size	Hash,.-Hash
	.data
# -- End  Hash
	.text
# -- Begin  crypto_hash_echo256_core2_core2
# mark_begin;
       .align    2,0x90
	.globl crypto_hash_echo256_core2_core2
crypto_hash_echo256_core2_core2:
# parameter 1: 24 + %esp
# parameter 2: 28 + %esp
# parameter 3: 32 + %esp
..B6.1:                         # Preds ..B6.0
        subl      $20, %esp                                     #876.1
        movl      32(%esp), %eax                                #875.5
        movl      36(%esp), %edx                                #875.5
        movl      %eax, %ecx                                    #877.40
        shrl      $29, %ecx                                     #877.40
        shll      $3, %eax                                      #877.40
        movl      %eax, 8(%esp)                                 #877.40
        shll      $3, %edx                                      #877.40
        orl       %edx, %ecx                                    #877.40
        movl      28(%esp), %edx                                #877.7
        movl      %ecx, 12(%esp)                                #877.40
        movl      24(%esp), %ecx                                #877.7
        movl      $256, %eax                                    #877.7
        call      Hash.                                         #877.7
                                # LOE eax ebx ebp esi edi
..B6.2:                         # Preds ..B6.1
        testl     %eax, %eax                                    #877.50
        jne       ..B6.4        # Prob 50%                      #877.50
                                # LOE ebx ebp esi edi
..B6.3:                         # Preds ..B6.2
        xorl      %eax, %eax                                    #877.66
        addl      $20, %esp                                     #877.66
        ret                                                     #877.66
                                # LOE
..B6.4:                         # Preds ..B6.2
        pushl     $-1                                           #878.10
        popl      %eax                                          #878.10
        addl      $20, %esp                                     #878.10
        ret                                                     #878.10
        .align    2,0x90
                                # LOE
# mark_end;
	.type	crypto_hash_echo256_core2_core2,@function
	.size	crypto_hash_echo256_core2_core2,.-crypto_hash_echo256_core2_core2
	.data
# -- End  crypto_hash_echo256_core2_core2
	.data
	.align 32
	.align 32
	.globl Te
Te:
	.long	0xa56363c6,0xa56363c6
	.long	0x847c7cf8,0x847c7cf8
	.long	0x997777ee,0x997777ee
	.long	0x8d7b7bf6,0x8d7b7bf6
	.long	0x0df2f2ff,0x0df2f2ff
	.long	0xbd6b6bd6,0xbd6b6bd6
	.long	0xb16f6fde,0xb16f6fde
	.long	0x54c5c591,0x54c5c591
	.long	0x50303060,0x50303060
	.long	0x03010102,0x03010102
	.long	0xa96767ce,0xa96767ce
	.long	0x7d2b2b56,0x7d2b2b56
	.long	0x19fefee7,0x19fefee7
	.long	0x62d7d7b5,0x62d7d7b5
	.long	0xe6abab4d,0xe6abab4d
	.long	0x9a7676ec,0x9a7676ec
	.long	0x45caca8f,0x45caca8f
	.long	0x9d82821f,0x9d82821f
	.long	0x40c9c989,0x40c9c989
	.long	0x877d7dfa,0x877d7dfa
	.long	0x15fafaef,0x15fafaef
	.long	0xeb5959b2,0xeb5959b2
	.long	0xc947478e,0xc947478e
	.long	0x0bf0f0fb,0x0bf0f0fb
	.long	0xecadad41,0xecadad41
	.long	0x67d4d4b3,0x67d4d4b3
	.long	0xfda2a25f,0xfda2a25f
	.long	0xeaafaf45,0xeaafaf45
	.long	0xbf9c9c23,0xbf9c9c23
	.long	0xf7a4a453,0xf7a4a453
	.long	0x967272e4,0x967272e4
	.long	0x5bc0c09b,0x5bc0c09b
	.long	0xc2b7b775,0xc2b7b775
	.long	0x1cfdfde1,0x1cfdfde1
	.long	0xae93933d,0xae93933d
	.long	0x6a26264c,0x6a26264c
	.long	0x5a36366c,0x5a36366c
	.long	0x413f3f7e,0x413f3f7e
	.long	0x02f7f7f5,0x02f7f7f5
	.long	0x4fcccc83,0x4fcccc83
	.long	0x5c343468,0x5c343468
	.long	0xf4a5a551,0xf4a5a551
	.long	0x34e5e5d1,0x34e5e5d1
	.long	0x08f1f1f9,0x08f1f1f9
	.long	0x937171e2,0x937171e2
	.long	0x73d8d8ab,0x73d8d8ab
	.long	0x53313162,0x53313162
	.long	0x3f15152a,0x3f15152a
	.long	0x0c040408,0x0c040408
	.long	0x52c7c795,0x52c7c795
	.long	0x65232346,0x65232346
	.long	0x5ec3c39d,0x5ec3c39d
	.long	0x28181830,0x28181830
	.long	0xa1969637,0xa1969637
	.long	0x0f05050a,0x0f05050a
	.long	0xb59a9a2f,0xb59a9a2f
	.long	0x0907070e,0x0907070e
	.long	0x36121224,0x36121224
	.long	0x9b80801b,0x9b80801b
	.long	0x3de2e2df,0x3de2e2df
	.long	0x26ebebcd,0x26ebebcd
	.long	0x6927274e,0x6927274e
	.long	0xcdb2b27f,0xcdb2b27f
	.long	0x9f7575ea,0x9f7575ea
	.long	0x1b090912,0x1b090912
	.long	0x9e83831d,0x9e83831d
	.long	0x742c2c58,0x742c2c58
	.long	0x2e1a1a34,0x2e1a1a34
	.long	0x2d1b1b36,0x2d1b1b36
	.long	0xb26e6edc,0xb26e6edc
	.long	0xee5a5ab4,0xee5a5ab4
	.long	0xfba0a05b,0xfba0a05b
	.long	0xf65252a4,0xf65252a4
	.long	0x4d3b3b76,0x4d3b3b76
	.long	0x61d6d6b7,0x61d6d6b7
	.long	0xceb3b37d,0xceb3b37d
	.long	0x7b292952,0x7b292952
	.long	0x3ee3e3dd,0x3ee3e3dd
	.long	0x712f2f5e,0x712f2f5e
	.long	0x97848413,0x97848413
	.long	0xf55353a6,0xf55353a6
	.long	0x68d1d1b9,0x68d1d1b9
	.long	0x00000000,0x00000000
	.long	0x2cededc1,0x2cededc1
	.long	0x60202040,0x60202040
	.long	0x1ffcfce3,0x1ffcfce3
	.long	0xc8b1b179,0xc8b1b179
	.long	0xed5b5bb6,0xed5b5bb6
	.long	0xbe6a6ad4,0xbe6a6ad4
	.long	0x46cbcb8d,0x46cbcb8d
	.long	0xd9bebe67,0xd9bebe67
	.long	0x4b393972,0x4b393972
	.long	0xde4a4a94,0xde4a4a94
	.long	0xd44c4c98,0xd44c4c98
	.long	0xe85858b0,0xe85858b0
	.long	0x4acfcf85,0x4acfcf85
	.long	0x6bd0d0bb,0x6bd0d0bb
	.long	0x2aefefc5,0x2aefefc5
	.long	0xe5aaaa4f,0xe5aaaa4f
	.long	0x16fbfbed,0x16fbfbed
	.long	0xc5434386,0xc5434386
	.long	0xd74d4d9a,0xd74d4d9a
	.long	0x55333366,0x55333366
	.long	0x94858511,0x94858511
	.long	0xcf45458a,0xcf45458a
	.long	0x10f9f9e9,0x10f9f9e9
	.long	0x06020204,0x06020204
	.long	0x817f7ffe,0x817f7ffe
	.long	0xf05050a0,0xf05050a0
	.long	0x443c3c78,0x443c3c78
	.long	0xba9f9f25,0xba9f9f25
	.long	0xe3a8a84b,0xe3a8a84b
	.long	0xf35151a2,0xf35151a2
	.long	0xfea3a35d,0xfea3a35d
	.long	0xc0404080,0xc0404080
	.long	0x8a8f8f05,0x8a8f8f05
	.long	0xad92923f,0xad92923f
	.long	0xbc9d9d21,0xbc9d9d21
	.long	0x48383870,0x48383870
	.long	0x04f5f5f1,0x04f5f5f1
	.long	0xdfbcbc63,0xdfbcbc63
	.long	0xc1b6b677,0xc1b6b677
	.long	0x75dadaaf,0x75dadaaf
	.long	0x63212142,0x63212142
	.long	0x30101020,0x30101020
	.long	0x1affffe5,0x1affffe5
	.long	0x0ef3f3fd,0x0ef3f3fd
	.long	0x6dd2d2bf,0x6dd2d2bf
	.long	0x4ccdcd81,0x4ccdcd81
	.long	0x140c0c18,0x140c0c18
	.long	0x35131326,0x35131326
	.long	0x2fececc3,0x2fececc3
	.long	0xe15f5fbe,0xe15f5fbe
	.long	0xa2979735,0xa2979735
	.long	0xcc444488,0xcc444488
	.long	0x3917172e,0x3917172e
	.long	0x57c4c493,0x57c4c493
	.long	0xf2a7a755,0xf2a7a755
	.long	0x827e7efc,0x827e7efc
	.long	0x473d3d7a,0x473d3d7a
	.long	0xac6464c8,0xac6464c8
	.long	0xe75d5dba,0xe75d5dba
	.long	0x2b191932,0x2b191932
	.long	0x957373e6,0x957373e6
	.long	0xa06060c0,0xa06060c0
	.long	0x98818119,0x98818119
	.long	0xd14f4f9e,0xd14f4f9e
	.long	0x7fdcdca3,0x7fdcdca3
	.long	0x66222244,0x66222244
	.long	0x7e2a2a54,0x7e2a2a54
	.long	0xab90903b,0xab90903b
	.long	0x8388880b,0x8388880b
	.long	0xca46468c,0xca46468c
	.long	0x29eeeec7,0x29eeeec7
	.long	0xd3b8b86b,0xd3b8b86b
	.long	0x3c141428,0x3c141428
	.long	0x79dedea7,0x79dedea7
	.long	0xe25e5ebc,0xe25e5ebc
	.long	0x1d0b0b16,0x1d0b0b16
	.long	0x76dbdbad,0x76dbdbad
	.long	0x3be0e0db,0x3be0e0db
	.long	0x56323264,0x56323264
	.long	0x4e3a3a74,0x4e3a3a74
	.long	0x1e0a0a14,0x1e0a0a14
	.long	0xdb494992,0xdb494992
	.long	0x0a06060c,0x0a06060c
	.long	0x6c242448,0x6c242448
	.long	0xe45c5cb8,0xe45c5cb8
	.long	0x5dc2c29f,0x5dc2c29f
	.long	0x6ed3d3bd,0x6ed3d3bd
	.long	0xefacac43,0xefacac43
	.long	0xa66262c4,0xa66262c4
	.long	0xa8919139,0xa8919139
	.long	0xa4959531,0xa4959531
	.long	0x37e4e4d3,0x37e4e4d3
	.long	0x8b7979f2,0x8b7979f2
	.long	0x32e7e7d5,0x32e7e7d5
	.long	0x43c8c88b,0x43c8c88b
	.long	0x5937376e,0x5937376e
	.long	0xb76d6dda,0xb76d6dda
	.long	0x8c8d8d01,0x8c8d8d01
	.long	0x64d5d5b1,0x64d5d5b1
	.long	0xd24e4e9c,0xd24e4e9c
	.long	0xe0a9a949,0xe0a9a949
	.long	0xb46c6cd8,0xb46c6cd8
	.long	0xfa5656ac,0xfa5656ac
	.long	0x07f4f4f3,0x07f4f4f3
	.long	0x25eaeacf,0x25eaeacf
	.long	0xaf6565ca,0xaf6565ca
	.long	0x8e7a7af4,0x8e7a7af4
	.long	0xe9aeae47,0xe9aeae47
	.long	0x18080810,0x18080810
	.long	0xd5baba6f,0xd5baba6f
	.long	0x887878f0,0x887878f0
	.long	0x6f25254a,0x6f25254a
	.long	0x722e2e5c,0x722e2e5c
	.long	0x241c1c38,0x241c1c38
	.long	0xf1a6a657,0xf1a6a657
	.long	0xc7b4b473,0xc7b4b473
	.long	0x51c6c697,0x51c6c697
	.long	0x23e8e8cb,0x23e8e8cb
	.long	0x7cdddda1,0x7cdddda1
	.long	0x9c7474e8,0x9c7474e8
	.long	0x211f1f3e,0x211f1f3e
	.long	0xdd4b4b96,0xdd4b4b96
	.long	0xdcbdbd61,0xdcbdbd61
	.long	0x868b8b0d,0x868b8b0d
	.long	0x858a8a0f,0x858a8a0f
	.long	0x907070e0,0x907070e0
	.long	0x423e3e7c,0x423e3e7c
	.long	0xc4b5b571,0xc4b5b571
	.long	0xaa6666cc,0xaa6666cc
	.long	0xd8484890,0xd8484890
	.long	0x05030306,0x05030306
	.long	0x01f6f6f7,0x01f6f6f7
	.long	0x120e0e1c,0x120e0e1c
	.long	0xa36161c2,0xa36161c2
	.long	0x5f35356a,0x5f35356a
	.long	0xf95757ae,0xf95757ae
	.long	0xd0b9b969,0xd0b9b969
	.long	0x91868617,0x91868617
	.long	0x58c1c199,0x58c1c199
	.long	0x271d1d3a,0x271d1d3a
	.long	0xb99e9e27,0xb99e9e27
	.long	0x38e1e1d9,0x38e1e1d9
	.long	0x13f8f8eb,0x13f8f8eb
	.long	0xb398982b,0xb398982b
	.long	0x33111122,0x33111122
	.long	0xbb6969d2,0xbb6969d2
	.long	0x70d9d9a9,0x70d9d9a9
	.long	0x898e8e07,0x898e8e07
	.long	0xa7949433,0xa7949433
	.long	0xb69b9b2d,0xb69b9b2d
	.long	0x221e1e3c,0x221e1e3c
	.long	0x92878715,0x92878715
	.long	0x20e9e9c9,0x20e9e9c9
	.long	0x49cece87,0x49cece87
	.long	0xff5555aa,0xff5555aa
	.long	0x78282850,0x78282850
	.long	0x7adfdfa5,0x7adfdfa5
	.long	0x8f8c8c03,0x8f8c8c03
	.long	0xf8a1a159,0xf8a1a159
	.long	0x80898909,0x80898909
	.long	0x170d0d1a,0x170d0d1a
	.long	0xdabfbf65,0xdabfbf65
	.long	0x31e6e6d7,0x31e6e6d7
	.long	0xc6424284,0xc6424284
	.long	0xb86868d0,0xb86868d0
	.long	0xc3414182,0xc3414182
	.long	0xb0999929,0xb0999929
	.long	0x772d2d5a,0x772d2d5a
	.long	0x110f0f1e,0x110f0f1e
	.long	0xcbb0b07b,0xcbb0b07b
	.long	0xfc5454a8,0xfc5454a8
	.long	0xd6bbbb6d,0xd6bbbb6d
	.long	0x3a16162c,0x3a16162c
	.type	Te,@object
	.size	Te,2048
	.section .rodata, "a"
	.align 16
	.align 16
_2__cnst_pck.0:
	.byte	8
	.byte	16
	.byte	24
	.byte	32
	.byte	40
	.byte	48
	.type	_2__cnst_pck.0,@object
	.size	_2__cnst_pck.0,6
	.data
	.comm OLDCV,128,32
	.comm MEM_CST,64,32
	.comm SHA3_CNT,8,8
	.comm SHA3_ESP,4,4
	.comm SHA3_R,4,4
	.comm SHA3_S,280,32
	.section .note.GNU-stack, ""
# End
