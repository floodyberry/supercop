#------------------------------------------------------------------------------------ #
# Implementation of the double pipe ECHO hash function in its 512-bit outputs variant.#
# Optimized for AMD Athlon, 64-bit mode                                               #
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
# 495 "echo64.c" 1
	.intel_syntax noprefix
# 0 "" 2
# 496 "echo64.c" 1
	push r8
# 0 "" 2
# 496 "echo64.c" 1
	push r9
# 0 "" 2
# 496 "echo64.c" 1
	push r10
# 0 "" 2
# 496 "echo64.c" 1
	push r11
# 0 "" 2
# 496 "echo64.c" 1
	push r12
# 0 "" 2
# 496 "echo64.c" 1
	push r13
# 0 "" 2
# 496 "echo64.c" 1
	push r14
# 0 "" 2
# 496 "echo64.c" 1
	push r15
# 0 "" 2
# 496 "echo64.c" 1
	push rbp
# 0 "" 2
# 496 "echo64.c" 1
	push rsi
# 0 "" 2
# 496 "echo64.c" 1
	push rdx
# 0 "" 2
# 496 "echo64.c" 1
	push rcx
# 0 "" 2
# 496 "echo64.c" 1
	push rbx
# 0 "" 2
# 496 "echo64.c" 1
	push rax
# 0 "" 2
# 498 "echo64.c" 1
	mov    eax, [rdi+16*16*2+8]
# 0 "" 2
# 499 "echo64.c" 1
	add   [rdi+16*16*2], rax
# 0 "" 2
# 500 "echo64.c" 1
	mov    r15, 0
# 0 "" 2
# 501 "echo64.c" 1
	cmp    rax, 0
# 0 "" 2
# 502 "echo64.c" 1
	jz     NEXT
# 0 "" 2
# 503 "echo64.c" 1
	xor    r15, [rdi+16*16*2]
# 0 "" 2
# 504 "echo64.c" 1
	NEXT:
# 0 "" 2
# 505 "echo64.c" 1
	mov    r8,  [MEM_CST]
# 0 "" 2
# 511 "echo64.c" 1
	mov r14, 10
# 0 "" 2
# 512 "echo64.c" 1
	mov  rax,  [rdi+16*0]
# 0 "" 2
# 512 "echo64.c" 1
	mov  r10,  [rdi+16*0+8]
# 0 "" 2
# 512 "echo64.c" 1
	xor  rax,  [rdi+16*8]
# 0 "" 2
# 512 "echo64.c" 1
	xor  r10,  [rdi+16*8+8]
# 0 "" 2
# 512 "echo64.c" 1
	mov  [OLDCV+16*0],   rax
# 0 "" 2
# 512 "echo64.c" 1
	mov  [OLDCV+16*0+8], r10
# 0 "" 2
# 512 "echo64.c" 1
	mov  rbx,  [rdi+16*4]
# 0 "" 2
# 512 "echo64.c" 1
	mov  r11,  [rdi+16*4+8]
# 0 "" 2
# 512 "echo64.c" 1
	xor  rbx,  [rdi+16*12]
# 0 "" 2
# 512 "echo64.c" 1
	xor  r11,  [rdi+16*12+8]
# 0 "" 2
# 512 "echo64.c" 1
	mov  [OLDCV+16*4],   rbx
# 0 "" 2
# 512 "echo64.c" 1
	mov  [OLDCV+16*4+8], r11
# 0 "" 2
# 512 "echo64.c" 1
	mov  rax,  [rdi+16*1]
# 0 "" 2
# 512 "echo64.c" 1
	mov  r10,  [rdi+16*1+8]
# 0 "" 2
# 512 "echo64.c" 1
	xor  rax,  [rdi+16*9]
# 0 "" 2
# 512 "echo64.c" 1
	xor  r10,  [rdi+16*9+8]
# 0 "" 2
# 512 "echo64.c" 1
	mov  [OLDCV+16*1],   rax
# 0 "" 2
# 512 "echo64.c" 1
	mov  [OLDCV+16*1+8], r10
# 0 "" 2
# 512 "echo64.c" 1
	mov  rbx,  [rdi+16*5]
# 0 "" 2
# 512 "echo64.c" 1
	mov  r11,  [rdi+16*5+8]
# 0 "" 2
# 512 "echo64.c" 1
	xor  rbx,  [rdi+16*13]
# 0 "" 2
# 512 "echo64.c" 1
	xor  r11,  [rdi+16*13+8]
# 0 "" 2
# 512 "echo64.c" 1
	mov  [OLDCV+16*5],   rbx
# 0 "" 2
# 512 "echo64.c" 1
	mov  [OLDCV+16*5+8], r11
# 0 "" 2
# 512 "echo64.c" 1
	mov  rax,  [rdi+16*2]
# 0 "" 2
# 512 "echo64.c" 1
	mov  r10,  [rdi+16*2+8]
# 0 "" 2
# 512 "echo64.c" 1
	xor  rax,  [rdi+16*10]
# 0 "" 2
# 512 "echo64.c" 1
	xor  r10,  [rdi+16*10+8]
# 0 "" 2
# 512 "echo64.c" 1
	mov  [OLDCV+16*2],   rax
# 0 "" 2
# 512 "echo64.c" 1
	mov  [OLDCV+16*2+8], r10
# 0 "" 2
# 512 "echo64.c" 1
	mov  rbx,  [rdi+16*6]
# 0 "" 2
# 512 "echo64.c" 1
	mov  r11,  [rdi+16*6+8]
# 0 "" 2
# 512 "echo64.c" 1
	xor  rbx,  [rdi+16*14]
# 0 "" 2
# 512 "echo64.c" 1
	xor  r11,  [rdi+16*14+8]
# 0 "" 2
# 512 "echo64.c" 1
	mov  [OLDCV+16*6],   rbx
# 0 "" 2
# 512 "echo64.c" 1
	mov  [OLDCV+16*6+8], r11
# 0 "" 2
# 512 "echo64.c" 1
	mov  rax,  [rdi+16*3]
# 0 "" 2
# 512 "echo64.c" 1
	mov  r10,  [rdi+16*3+8]
# 0 "" 2
# 512 "echo64.c" 1
	xor  rax,  [rdi+16*11]
# 0 "" 2
# 512 "echo64.c" 1
	xor  r10,  [rdi+16*11+8]
# 0 "" 2
# 512 "echo64.c" 1
	mov  [OLDCV+16*3],   rax
# 0 "" 2
# 512 "echo64.c" 1
	mov  [OLDCV+16*3+8], r10
# 0 "" 2
# 512 "echo64.c" 1
	mov  rbx,  [rdi+16*7]
# 0 "" 2
# 512 "echo64.c" 1
	mov  r11,  [rdi+16*7+8]
# 0 "" 2
# 512 "echo64.c" 1
	xor  rbx,  [rdi+16*15]
# 0 "" 2
# 512 "echo64.c" 1
	xor  r11,  [rdi+16*15+8]
# 0 "" 2
# 512 "echo64.c" 1
	mov  [OLDCV+16*7],   rbx
# 0 "" 2
# 512 "echo64.c" 1
	mov  [OLDCV+16*7+8], r11
# 0 "" 2
# 515 "echo64.c" 1
	mov    dword ptr [rdi+16*16*2+8], 0
# 0 "" 2
# 517 "echo64.c" 1
	LABEL_BIG_ROUND:
# 0 "" 2
# 518 "echo64.c" 1
	mov  rax, [rdi]
# 0 "" 2
# 518 "echo64.c" 1
	mov  rbx, [rdi+8]
# 0 "" 2
# 519 "echo64.c" 1
	movzbl  ebp, ah
# 0 "" 2
# 519 "echo64.c" 1
	movzbl  esi, al
# 0 "" 2
# 519 "echo64.c" 1
	ror     rax,  0x10
# 0 "" 2
# 519 "echo64.c" 1
	mov     rdx,  [TB+8*rbp+1*256*8]
# 0 "" 2
# 519 "echo64.c" 1
	mov     rcx,  [TC+8*rsi]
# 0 "" 2
# 519 "echo64.c" 1
	movzbl ebp, bl
# 0 "" 2
# 519 "echo64.c" 1
	movzbl esi, bh
# 0 "" 2
# 519 "echo64.c" 1
	ror    rbx,  0x10
# 0 "" 2
# 519 "echo64.c" 1
	xor    rdx, [TC+8*rbp]
# 0 "" 2
# 519 "echo64.c" 1
	xor    rcx, [TB+8*rsi+1*256*8]
# 0 "" 2
# 519 "echo64.c" 1
	movzbl ebp, al
# 0 "" 2
# 519 "echo64.c" 1
	movzbl esi, ah
# 0 "" 2
# 519 "echo64.c" 1
	ror    rax, 16
# 0 "" 2
# 519 "echo64.c" 1
	xor    rdx, [TC+8*rbp+2*256*8]
# 0 "" 2
# 519 "echo64.c" 1
	xor    rcx, [TB+8*rsi+3*256*8]
# 0 "" 2
# 519 "echo64.c" 1
	movzbl ebp, bh
# 0 "" 2
# 519 "echo64.c" 1
	movzbl esi, bl
# 0 "" 2
# 519 "echo64.c" 1
	ror    rbx, 16
# 0 "" 2
# 519 "echo64.c" 1
	xor    rdx, [TB+8*rbp+3*256*8]
# 0 "" 2
# 519 "echo64.c" 1
	xor    rcx, [TC+8*rsi+2*256*8]
# 0 "" 2
# 519 "echo64.c" 1
	movzbl ebp, ah
# 0 "" 2
# 519 "echo64.c" 1
	movzbl esi, al
# 0 "" 2
# 519 "echo64.c" 1
	ror    rax, 16
# 0 "" 2
# 519 "echo64.c" 1
	xor    rcx, [TC+8*rbp+1*256*8]
# 0 "" 2
# 519 "echo64.c" 1
	xor    rcx, [TB+8*rsi]
# 0 "" 2
# 519 "echo64.c" 1
	movzbl ebp, bl
# 0 "" 2
# 519 "echo64.c" 1
	movzbl esi, bh
# 0 "" 2
# 519 "echo64.c" 1
	ror    rbx, 16
# 0 "" 2
# 519 "echo64.c" 1
	xor    rdx, [TB+8*rbp]
# 0 "" 2
# 519 "echo64.c" 1
	xor    rdx, [TC+8*rsi+1*256*8]
# 0 "" 2
# 519 "echo64.c" 1
	movzbl  ebp, al
# 0 "" 2
# 519 "echo64.c" 1
	movzbl  esi, ah
# 0 "" 2
# 519 "echo64.c" 1
	xor     rcx,  r15
# 0 "" 2
# 519 "echo64.c" 1
	xor     rdx, [TB+8*rbp+2*256*8]
# 0 "" 2
# 519 "echo64.c" 1
	xor     rdx, [TC+8*rsi+3*256*8]
# 0 "" 2
# 519 "echo64.c" 1
	movzbl  ebp, bl
# 0 "" 2
# 519 "echo64.c" 1
	movzbl  esi, bh
# 0 "" 2
# 519 "echo64.c" 1
	add     r15,  1
# 0 "" 2
# 519 "echo64.c" 1
	xor     rcx, [TB+8*rbp+2*256*8]
# 0 "" 2
# 519 "echo64.c" 1
	xor     rcx, [TC+8*rsi+3*256*8]
# 0 "" 2
# 519 "echo64.c" 1
	movzbl  ebp, dl
# 0 "" 2
# 519 "echo64.c" 1
	movzbl  esi, dh
# 0 "" 2
# 519 "echo64.c" 1
	ror     rdx, 16
# 0 "" 2
# 519 "echo64.c" 1
	mov    rbx,  [TC+8*rbp]
# 0 "" 2
# 519 "echo64.c" 1
	mov    rax,  [TB+8*rsi+1*256*8]
# 0 "" 2
# 519 "echo64.c" 1
	movzbl ebp, ch
# 0 "" 2
# 519 "echo64.c" 1
	movzbl esi, cl
# 0 "" 2
# 519 "echo64.c" 1
	ror    rcx, 16
# 0 "" 2
# 519 "echo64.c" 1
	xor    rbx, [TB+8*rbp+1*256*8]
# 0 "" 2
# 519 "echo64.c" 1
	xor    rax,  [TC+8*rsi]
# 0 "" 2
# 519 "echo64.c" 1
	movzbl  ebp, cl
# 0 "" 2
# 519 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 519 "echo64.c" 1
	ror     rcx, 16
# 0 "" 2
# 519 "echo64.c" 1
	xor    rbx,  [TC+8*rbp+2*256*8]
# 0 "" 2
# 519 "echo64.c" 1
	xor    rax,  [TB+8*rsi+3*256*8]
# 0 "" 2
# 519 "echo64.c" 1
	movzbl  ebp, dh
# 0 "" 2
# 519 "echo64.c" 1
	movzbl  esi, dl
# 0 "" 2
# 519 "echo64.c" 1
	ror     rdx, 16
# 0 "" 2
# 519 "echo64.c" 1
	xor    rbx, [TB+8*rbp+3*256*8]
# 0 "" 2
# 519 "echo64.c" 1
	xor    rax,  [TC+8*rsi+2*256*8]
# 0 "" 2
# 519 "echo64.c" 1
	movzbl  ebp, cl
# 0 "" 2
# 519 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 519 "echo64.c" 1
	ror    rcx, 16
# 0 "" 2
# 519 "echo64.c" 1
	xor    rax,  [TB+8*rbp]
# 0 "" 2
# 519 "echo64.c" 1
	xor    rax,   [TC+8*rsi+1*256*8]
# 0 "" 2
# 519 "echo64.c" 1
	movzbl ebp, dl
# 0 "" 2
# 519 "echo64.c" 1
	movzbl esi, dh
# 0 "" 2
# 519 "echo64.c" 1
	ror    rdx, 16
# 0 "" 2
# 519 "echo64.c" 1
	xor    rbx,  [TB+8*rbp]
# 0 "" 2
# 519 "echo64.c" 1
	xor    rbx,  [TC+8*rsi+1*256*8]
# 0 "" 2
# 519 "echo64.c" 1
	movzbl  ebp, dl
# 0 "" 2
# 519 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 519 "echo64.c" 1
	xor    rax,  [TB+8*rbp+2*256*8]
# 0 "" 2
# 519 "echo64.c" 1
	xor    rbx,  [TC+8*rsi+3*256*8]
# 0 "" 2
# 519 "echo64.c" 1
	movzbl  ebp, dh
# 0 "" 2
# 519 "echo64.c" 1
	movzbl  esi, cl
# 0 "" 2
# 519 "echo64.c" 1
	xor    rax,  [TC+8*rbp+3*256*8]
# 0 "" 2
# 519 "echo64.c" 1
	xor    rbx,  [TB+8*rsi+2*256*8]
# 0 "" 2
# 519 "echo64.c" 1
	mov   [rdi+16*16+16*0],   rax
# 0 "" 2
# 519 "echo64.c" 1
	mov   [rdi+16*16+16*0+8], rbx
# 0 "" 2
# 519 "echo64.c" 1
	mov    rax, [rdi+16*1]
# 0 "" 2
# 519 "echo64.c" 1
	mov    rbx, [rdi+16*1+8]
# 0 "" 2
# 520 "echo64.c" 1
	movzbl  ebp, ah
# 0 "" 2
# 520 "echo64.c" 1
	movzbl  esi, al
# 0 "" 2
# 520 "echo64.c" 1
	ror     rax,  0x10
# 0 "" 2
# 520 "echo64.c" 1
	mov     rdx,  [TB+8*rbp+1*256*8]
# 0 "" 2
# 520 "echo64.c" 1
	mov     rcx,  [TC+8*rsi]
# 0 "" 2
# 520 "echo64.c" 1
	movzbl ebp, bl
# 0 "" 2
# 520 "echo64.c" 1
	movzbl esi, bh
# 0 "" 2
# 520 "echo64.c" 1
	ror    rbx,  0x10
# 0 "" 2
# 520 "echo64.c" 1
	xor    rdx, [TC+8*rbp]
# 0 "" 2
# 520 "echo64.c" 1
	xor    rcx, [TB+8*rsi+1*256*8]
# 0 "" 2
# 520 "echo64.c" 1
	movzbl ebp, al
# 0 "" 2
# 520 "echo64.c" 1
	movzbl esi, ah
# 0 "" 2
# 520 "echo64.c" 1
	ror    rax, 16
# 0 "" 2
# 520 "echo64.c" 1
	xor    rdx, [TC+8*rbp+2*256*8]
# 0 "" 2
# 520 "echo64.c" 1
	xor    rcx, [TB+8*rsi+3*256*8]
# 0 "" 2
# 520 "echo64.c" 1
	movzbl ebp, bh
# 0 "" 2
# 520 "echo64.c" 1
	movzbl esi, bl
# 0 "" 2
# 520 "echo64.c" 1
	ror    rbx, 16
# 0 "" 2
# 520 "echo64.c" 1
	xor    rdx, [TB+8*rbp+3*256*8]
# 0 "" 2
# 520 "echo64.c" 1
	xor    rcx, [TC+8*rsi+2*256*8]
# 0 "" 2
# 520 "echo64.c" 1
	movzbl ebp, ah
# 0 "" 2
# 520 "echo64.c" 1
	movzbl esi, al
# 0 "" 2
# 520 "echo64.c" 1
	ror    rax, 16
# 0 "" 2
# 520 "echo64.c" 1
	xor    rcx, [TC+8*rbp+1*256*8]
# 0 "" 2
# 520 "echo64.c" 1
	xor    rcx, [TB+8*rsi]
# 0 "" 2
# 520 "echo64.c" 1
	movzbl ebp, bl
# 0 "" 2
# 520 "echo64.c" 1
	movzbl esi, bh
# 0 "" 2
# 520 "echo64.c" 1
	ror    rbx, 16
# 0 "" 2
# 520 "echo64.c" 1
	xor    rdx, [TB+8*rbp]
# 0 "" 2
# 520 "echo64.c" 1
	xor    rdx, [TC+8*rsi+1*256*8]
# 0 "" 2
# 520 "echo64.c" 1
	movzbl  ebp, al
# 0 "" 2
# 520 "echo64.c" 1
	movzbl  esi, ah
# 0 "" 2
# 520 "echo64.c" 1
	xor     rcx,  r15
# 0 "" 2
# 520 "echo64.c" 1
	xor     rdx, [TB+8*rbp+2*256*8]
# 0 "" 2
# 520 "echo64.c" 1
	xor     rdx, [TC+8*rsi+3*256*8]
# 0 "" 2
# 520 "echo64.c" 1
	movzbl  ebp, bl
# 0 "" 2
# 520 "echo64.c" 1
	movzbl  esi, bh
# 0 "" 2
# 520 "echo64.c" 1
	add     r15,  1
# 0 "" 2
# 520 "echo64.c" 1
	xor     rcx, [TB+8*rbp+2*256*8]
# 0 "" 2
# 520 "echo64.c" 1
	xor     rcx, [TC+8*rsi+3*256*8]
# 0 "" 2
# 520 "echo64.c" 1
	movzbl  ebp, dl
# 0 "" 2
# 520 "echo64.c" 1
	movzbl  esi, dh
# 0 "" 2
# 520 "echo64.c" 1
	ror     rdx, 16
# 0 "" 2
# 520 "echo64.c" 1
	mov    rbx,  [TC+8*rbp]
# 0 "" 2
# 520 "echo64.c" 1
	mov    rax,  [TB+8*rsi+1*256*8]
# 0 "" 2
# 520 "echo64.c" 1
	movzbl ebp, ch
# 0 "" 2
# 520 "echo64.c" 1
	movzbl esi, cl
# 0 "" 2
# 520 "echo64.c" 1
	ror    rcx, 16
# 0 "" 2
# 520 "echo64.c" 1
	xor    rbx, [TB+8*rbp+1*256*8]
# 0 "" 2
# 520 "echo64.c" 1
	xor    rax,  [TC+8*rsi]
# 0 "" 2
# 520 "echo64.c" 1
	movzbl  ebp, cl
# 0 "" 2
# 520 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 520 "echo64.c" 1
	ror     rcx, 16
# 0 "" 2
# 520 "echo64.c" 1
	xor    rbx,  [TC+8*rbp+2*256*8]
# 0 "" 2
# 520 "echo64.c" 1
	xor    rax,  [TB+8*rsi+3*256*8]
# 0 "" 2
# 520 "echo64.c" 1
	movzbl  ebp, dh
# 0 "" 2
# 520 "echo64.c" 1
	movzbl  esi, dl
# 0 "" 2
# 520 "echo64.c" 1
	ror     rdx, 16
# 0 "" 2
# 520 "echo64.c" 1
	xor    rbx, [TB+8*rbp+3*256*8]
# 0 "" 2
# 520 "echo64.c" 1
	xor    rax,  [TC+8*rsi+2*256*8]
# 0 "" 2
# 520 "echo64.c" 1
	movzbl  ebp, cl
# 0 "" 2
# 520 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 520 "echo64.c" 1
	ror    rcx, 16
# 0 "" 2
# 520 "echo64.c" 1
	xor    rax,  [TB+8*rbp]
# 0 "" 2
# 520 "echo64.c" 1
	xor    rax,   [TC+8*rsi+1*256*8]
# 0 "" 2
# 520 "echo64.c" 1
	movzbl ebp, dl
# 0 "" 2
# 520 "echo64.c" 1
	movzbl esi, dh
# 0 "" 2
# 520 "echo64.c" 1
	ror    rdx, 16
# 0 "" 2
# 520 "echo64.c" 1
	xor    rbx,  [TB+8*rbp]
# 0 "" 2
# 520 "echo64.c" 1
	xor    rbx,  [TC+8*rsi+1*256*8]
# 0 "" 2
# 520 "echo64.c" 1
	movzbl  ebp, dl
# 0 "" 2
# 520 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 520 "echo64.c" 1
	xor    rax,  [TB+8*rbp+2*256*8]
# 0 "" 2
# 520 "echo64.c" 1
	xor    rbx,  [TC+8*rsi+3*256*8]
# 0 "" 2
# 520 "echo64.c" 1
	movzbl  ebp, dh
# 0 "" 2
# 520 "echo64.c" 1
	movzbl  esi, cl
# 0 "" 2
# 520 "echo64.c" 1
	xor    rax,  [TC+8*rbp+3*256*8]
# 0 "" 2
# 520 "echo64.c" 1
	xor    rbx,  [TB+8*rsi+2*256*8]
# 0 "" 2
# 520 "echo64.c" 1
	mov   [rdi+16*16+16*1],   rax
# 0 "" 2
# 520 "echo64.c" 1
	mov   [rdi+16*16+16*1+8], rbx
# 0 "" 2
# 520 "echo64.c" 1
	mov    rax, [rdi+16*2]
# 0 "" 2
# 520 "echo64.c" 1
	mov    rbx, [rdi+16*2+8]
# 0 "" 2
# 521 "echo64.c" 1
	movzbl  ebp, ah
# 0 "" 2
# 521 "echo64.c" 1
	movzbl  esi, al
# 0 "" 2
# 521 "echo64.c" 1
	ror     rax,  0x10
# 0 "" 2
# 521 "echo64.c" 1
	mov     rdx,  [TB+8*rbp+1*256*8]
# 0 "" 2
# 521 "echo64.c" 1
	mov     rcx,  [TC+8*rsi]
# 0 "" 2
# 521 "echo64.c" 1
	movzbl ebp, bl
# 0 "" 2
# 521 "echo64.c" 1
	movzbl esi, bh
# 0 "" 2
# 521 "echo64.c" 1
	ror    rbx,  0x10
# 0 "" 2
# 521 "echo64.c" 1
	xor    rdx, [TC+8*rbp]
# 0 "" 2
# 521 "echo64.c" 1
	xor    rcx, [TB+8*rsi+1*256*8]
# 0 "" 2
# 521 "echo64.c" 1
	movzbl ebp, al
# 0 "" 2
# 521 "echo64.c" 1
	movzbl esi, ah
# 0 "" 2
# 521 "echo64.c" 1
	ror    rax, 16
# 0 "" 2
# 521 "echo64.c" 1
	xor    rdx, [TC+8*rbp+2*256*8]
# 0 "" 2
# 521 "echo64.c" 1
	xor    rcx, [TB+8*rsi+3*256*8]
# 0 "" 2
# 521 "echo64.c" 1
	movzbl ebp, bh
# 0 "" 2
# 521 "echo64.c" 1
	movzbl esi, bl
# 0 "" 2
# 521 "echo64.c" 1
	ror    rbx, 16
# 0 "" 2
# 521 "echo64.c" 1
	xor    rdx, [TB+8*rbp+3*256*8]
# 0 "" 2
# 521 "echo64.c" 1
	xor    rcx, [TC+8*rsi+2*256*8]
# 0 "" 2
# 521 "echo64.c" 1
	movzbl ebp, ah
# 0 "" 2
# 521 "echo64.c" 1
	movzbl esi, al
# 0 "" 2
# 521 "echo64.c" 1
	ror    rax, 16
# 0 "" 2
# 521 "echo64.c" 1
	xor    rcx, [TC+8*rbp+1*256*8]
# 0 "" 2
# 521 "echo64.c" 1
	xor    rcx, [TB+8*rsi]
# 0 "" 2
# 521 "echo64.c" 1
	movzbl ebp, bl
# 0 "" 2
# 521 "echo64.c" 1
	movzbl esi, bh
# 0 "" 2
# 521 "echo64.c" 1
	ror    rbx, 16
# 0 "" 2
# 521 "echo64.c" 1
	xor    rdx, [TB+8*rbp]
# 0 "" 2
# 521 "echo64.c" 1
	xor    rdx, [TC+8*rsi+1*256*8]
# 0 "" 2
# 521 "echo64.c" 1
	movzbl  ebp, al
# 0 "" 2
# 521 "echo64.c" 1
	movzbl  esi, ah
# 0 "" 2
# 521 "echo64.c" 1
	xor     rcx,  r15
# 0 "" 2
# 521 "echo64.c" 1
	xor     rdx, [TB+8*rbp+2*256*8]
# 0 "" 2
# 521 "echo64.c" 1
	xor     rdx, [TC+8*rsi+3*256*8]
# 0 "" 2
# 521 "echo64.c" 1
	movzbl  ebp, bl
# 0 "" 2
# 521 "echo64.c" 1
	movzbl  esi, bh
# 0 "" 2
# 521 "echo64.c" 1
	add     r15,  1
# 0 "" 2
# 521 "echo64.c" 1
	xor     rcx, [TB+8*rbp+2*256*8]
# 0 "" 2
# 521 "echo64.c" 1
	xor     rcx, [TC+8*rsi+3*256*8]
# 0 "" 2
# 521 "echo64.c" 1
	movzbl  ebp, dl
# 0 "" 2
# 521 "echo64.c" 1
	movzbl  esi, dh
# 0 "" 2
# 521 "echo64.c" 1
	ror     rdx, 16
# 0 "" 2
# 521 "echo64.c" 1
	mov    rbx,  [TC+8*rbp]
# 0 "" 2
# 521 "echo64.c" 1
	mov    rax,  [TB+8*rsi+1*256*8]
# 0 "" 2
# 521 "echo64.c" 1
	movzbl ebp, ch
# 0 "" 2
# 521 "echo64.c" 1
	movzbl esi, cl
# 0 "" 2
# 521 "echo64.c" 1
	ror    rcx, 16
# 0 "" 2
# 521 "echo64.c" 1
	xor    rbx, [TB+8*rbp+1*256*8]
# 0 "" 2
# 521 "echo64.c" 1
	xor    rax,  [TC+8*rsi]
# 0 "" 2
# 521 "echo64.c" 1
	movzbl  ebp, cl
# 0 "" 2
# 521 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 521 "echo64.c" 1
	ror     rcx, 16
# 0 "" 2
# 521 "echo64.c" 1
	xor    rbx,  [TC+8*rbp+2*256*8]
# 0 "" 2
# 521 "echo64.c" 1
	xor    rax,  [TB+8*rsi+3*256*8]
# 0 "" 2
# 521 "echo64.c" 1
	movzbl  ebp, dh
# 0 "" 2
# 521 "echo64.c" 1
	movzbl  esi, dl
# 0 "" 2
# 521 "echo64.c" 1
	ror     rdx, 16
# 0 "" 2
# 521 "echo64.c" 1
	xor    rbx, [TB+8*rbp+3*256*8]
# 0 "" 2
# 521 "echo64.c" 1
	xor    rax,  [TC+8*rsi+2*256*8]
# 0 "" 2
# 521 "echo64.c" 1
	movzbl  ebp, cl
# 0 "" 2
# 521 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 521 "echo64.c" 1
	ror    rcx, 16
# 0 "" 2
# 521 "echo64.c" 1
	xor    rax,  [TB+8*rbp]
# 0 "" 2
# 521 "echo64.c" 1
	xor    rax,   [TC+8*rsi+1*256*8]
# 0 "" 2
# 521 "echo64.c" 1
	movzbl ebp, dl
# 0 "" 2
# 521 "echo64.c" 1
	movzbl esi, dh
# 0 "" 2
# 521 "echo64.c" 1
	ror    rdx, 16
# 0 "" 2
# 521 "echo64.c" 1
	xor    rbx,  [TB+8*rbp]
# 0 "" 2
# 521 "echo64.c" 1
	xor    rbx,  [TC+8*rsi+1*256*8]
# 0 "" 2
# 521 "echo64.c" 1
	movzbl  ebp, dl
# 0 "" 2
# 521 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 521 "echo64.c" 1
	xor    rax,  [TB+8*rbp+2*256*8]
# 0 "" 2
# 521 "echo64.c" 1
	xor    rbx,  [TC+8*rsi+3*256*8]
# 0 "" 2
# 521 "echo64.c" 1
	movzbl  ebp, dh
# 0 "" 2
# 521 "echo64.c" 1
	movzbl  esi, cl
# 0 "" 2
# 521 "echo64.c" 1
	xor    rax,  [TC+8*rbp+3*256*8]
# 0 "" 2
# 521 "echo64.c" 1
	xor    rbx,  [TB+8*rsi+2*256*8]
# 0 "" 2
# 521 "echo64.c" 1
	mov   [rdi+16*16+16*2],   rax
# 0 "" 2
# 521 "echo64.c" 1
	mov   [rdi+16*16+16*2+8], rbx
# 0 "" 2
# 521 "echo64.c" 1
	mov    rax, [rdi+16*3]
# 0 "" 2
# 521 "echo64.c" 1
	mov    rbx, [rdi+16*3+8]
# 0 "" 2
# 522 "echo64.c" 1
	movzbl  ebp, ah
# 0 "" 2
# 522 "echo64.c" 1
	movzbl  esi, al
# 0 "" 2
# 522 "echo64.c" 1
	ror     rax,  0x10
# 0 "" 2
# 522 "echo64.c" 1
	mov     rdx,  [TB+8*rbp+1*256*8]
# 0 "" 2
# 522 "echo64.c" 1
	mov     rcx,  [TC+8*rsi]
# 0 "" 2
# 522 "echo64.c" 1
	movzbl ebp, bl
# 0 "" 2
# 522 "echo64.c" 1
	movzbl esi, bh
# 0 "" 2
# 522 "echo64.c" 1
	ror    rbx,  0x10
# 0 "" 2
# 522 "echo64.c" 1
	xor    rdx, [TC+8*rbp]
# 0 "" 2
# 522 "echo64.c" 1
	xor    rcx, [TB+8*rsi+1*256*8]
# 0 "" 2
# 522 "echo64.c" 1
	movzbl ebp, al
# 0 "" 2
# 522 "echo64.c" 1
	movzbl esi, ah
# 0 "" 2
# 522 "echo64.c" 1
	ror    rax, 16
# 0 "" 2
# 522 "echo64.c" 1
	xor    rdx, [TC+8*rbp+2*256*8]
# 0 "" 2
# 522 "echo64.c" 1
	xor    rcx, [TB+8*rsi+3*256*8]
# 0 "" 2
# 522 "echo64.c" 1
	movzbl ebp, bh
# 0 "" 2
# 522 "echo64.c" 1
	movzbl esi, bl
# 0 "" 2
# 522 "echo64.c" 1
	ror    rbx, 16
# 0 "" 2
# 522 "echo64.c" 1
	xor    rdx, [TB+8*rbp+3*256*8]
# 0 "" 2
# 522 "echo64.c" 1
	xor    rcx, [TC+8*rsi+2*256*8]
# 0 "" 2
# 522 "echo64.c" 1
	movzbl ebp, ah
# 0 "" 2
# 522 "echo64.c" 1
	movzbl esi, al
# 0 "" 2
# 522 "echo64.c" 1
	ror    rax, 16
# 0 "" 2
# 522 "echo64.c" 1
	xor    rcx, [TC+8*rbp+1*256*8]
# 0 "" 2
# 522 "echo64.c" 1
	xor    rcx, [TB+8*rsi]
# 0 "" 2
# 522 "echo64.c" 1
	movzbl ebp, bl
# 0 "" 2
# 522 "echo64.c" 1
	movzbl esi, bh
# 0 "" 2
# 522 "echo64.c" 1
	ror    rbx, 16
# 0 "" 2
# 522 "echo64.c" 1
	xor    rdx, [TB+8*rbp]
# 0 "" 2
# 522 "echo64.c" 1
	xor    rdx, [TC+8*rsi+1*256*8]
# 0 "" 2
# 522 "echo64.c" 1
	movzbl  ebp, al
# 0 "" 2
# 522 "echo64.c" 1
	movzbl  esi, ah
# 0 "" 2
# 522 "echo64.c" 1
	xor     rcx,  r15
# 0 "" 2
# 522 "echo64.c" 1
	xor     rdx, [TB+8*rbp+2*256*8]
# 0 "" 2
# 522 "echo64.c" 1
	xor     rdx, [TC+8*rsi+3*256*8]
# 0 "" 2
# 522 "echo64.c" 1
	movzbl  ebp, bl
# 0 "" 2
# 522 "echo64.c" 1
	movzbl  esi, bh
# 0 "" 2
# 522 "echo64.c" 1
	add     r15,  1
# 0 "" 2
# 522 "echo64.c" 1
	xor     rcx, [TB+8*rbp+2*256*8]
# 0 "" 2
# 522 "echo64.c" 1
	xor     rcx, [TC+8*rsi+3*256*8]
# 0 "" 2
# 522 "echo64.c" 1
	movzbl  ebp, dl
# 0 "" 2
# 522 "echo64.c" 1
	movzbl  esi, dh
# 0 "" 2
# 522 "echo64.c" 1
	ror     rdx, 16
# 0 "" 2
# 522 "echo64.c" 1
	mov    rbx,  [TC+8*rbp]
# 0 "" 2
# 522 "echo64.c" 1
	mov    rax,  [TB+8*rsi+1*256*8]
# 0 "" 2
# 522 "echo64.c" 1
	movzbl ebp, ch
# 0 "" 2
# 522 "echo64.c" 1
	movzbl esi, cl
# 0 "" 2
# 522 "echo64.c" 1
	ror    rcx, 16
# 0 "" 2
# 522 "echo64.c" 1
	xor    rbx, [TB+8*rbp+1*256*8]
# 0 "" 2
# 522 "echo64.c" 1
	xor    rax,  [TC+8*rsi]
# 0 "" 2
# 522 "echo64.c" 1
	movzbl  ebp, cl
# 0 "" 2
# 522 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 522 "echo64.c" 1
	ror     rcx, 16
# 0 "" 2
# 522 "echo64.c" 1
	xor    rbx,  [TC+8*rbp+2*256*8]
# 0 "" 2
# 522 "echo64.c" 1
	xor    rax,  [TB+8*rsi+3*256*8]
# 0 "" 2
# 522 "echo64.c" 1
	movzbl  ebp, dh
# 0 "" 2
# 522 "echo64.c" 1
	movzbl  esi, dl
# 0 "" 2
# 522 "echo64.c" 1
	ror     rdx, 16
# 0 "" 2
# 522 "echo64.c" 1
	xor    rbx, [TB+8*rbp+3*256*8]
# 0 "" 2
# 522 "echo64.c" 1
	xor    rax,  [TC+8*rsi+2*256*8]
# 0 "" 2
# 522 "echo64.c" 1
	movzbl  ebp, cl
# 0 "" 2
# 522 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 522 "echo64.c" 1
	ror    rcx, 16
# 0 "" 2
# 522 "echo64.c" 1
	xor    rax,  [TB+8*rbp]
# 0 "" 2
# 522 "echo64.c" 1
	xor    rax,   [TC+8*rsi+1*256*8]
# 0 "" 2
# 522 "echo64.c" 1
	movzbl ebp, dl
# 0 "" 2
# 522 "echo64.c" 1
	movzbl esi, dh
# 0 "" 2
# 522 "echo64.c" 1
	ror    rdx, 16
# 0 "" 2
# 522 "echo64.c" 1
	xor    rbx,  [TB+8*rbp]
# 0 "" 2
# 522 "echo64.c" 1
	xor    rbx,  [TC+8*rsi+1*256*8]
# 0 "" 2
# 522 "echo64.c" 1
	movzbl  ebp, dl
# 0 "" 2
# 522 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 522 "echo64.c" 1
	xor    rax,  [TB+8*rbp+2*256*8]
# 0 "" 2
# 522 "echo64.c" 1
	xor    rbx,  [TC+8*rsi+3*256*8]
# 0 "" 2
# 522 "echo64.c" 1
	movzbl  ebp, dh
# 0 "" 2
# 522 "echo64.c" 1
	movzbl  esi, cl
# 0 "" 2
# 522 "echo64.c" 1
	xor    rax,  [TC+8*rbp+3*256*8]
# 0 "" 2
# 522 "echo64.c" 1
	xor    rbx,  [TB+8*rsi+2*256*8]
# 0 "" 2
# 522 "echo64.c" 1
	mov   [rdi+16*16+16*3],   rax
# 0 "" 2
# 522 "echo64.c" 1
	mov   [rdi+16*16+16*3+8], rbx
# 0 "" 2
# 522 "echo64.c" 1
	mov    rax, [rdi+16*4]
# 0 "" 2
# 522 "echo64.c" 1
	mov    rbx, [rdi+16*4+8]
# 0 "" 2
# 523 "echo64.c" 1
	movzbl  ebp, ah
# 0 "" 2
# 523 "echo64.c" 1
	movzbl  esi, al
# 0 "" 2
# 523 "echo64.c" 1
	ror     rax,  0x10
# 0 "" 2
# 523 "echo64.c" 1
	mov     rdx,  [TB+8*rbp+1*256*8]
# 0 "" 2
# 523 "echo64.c" 1
	mov     rcx,  [TC+8*rsi]
# 0 "" 2
# 523 "echo64.c" 1
	movzbl ebp, bl
# 0 "" 2
# 523 "echo64.c" 1
	movzbl esi, bh
# 0 "" 2
# 523 "echo64.c" 1
	ror    rbx,  0x10
# 0 "" 2
# 523 "echo64.c" 1
	xor    rdx, [TC+8*rbp]
# 0 "" 2
# 523 "echo64.c" 1
	xor    rcx, [TB+8*rsi+1*256*8]
# 0 "" 2
# 523 "echo64.c" 1
	movzbl ebp, al
# 0 "" 2
# 523 "echo64.c" 1
	movzbl esi, ah
# 0 "" 2
# 523 "echo64.c" 1
	ror    rax, 16
# 0 "" 2
# 523 "echo64.c" 1
	xor    rdx, [TC+8*rbp+2*256*8]
# 0 "" 2
# 523 "echo64.c" 1
	xor    rcx, [TB+8*rsi+3*256*8]
# 0 "" 2
# 523 "echo64.c" 1
	movzbl ebp, bh
# 0 "" 2
# 523 "echo64.c" 1
	movzbl esi, bl
# 0 "" 2
# 523 "echo64.c" 1
	ror    rbx, 16
# 0 "" 2
# 523 "echo64.c" 1
	xor    rdx, [TB+8*rbp+3*256*8]
# 0 "" 2
# 523 "echo64.c" 1
	xor    rcx, [TC+8*rsi+2*256*8]
# 0 "" 2
# 523 "echo64.c" 1
	movzbl ebp, ah
# 0 "" 2
# 523 "echo64.c" 1
	movzbl esi, al
# 0 "" 2
# 523 "echo64.c" 1
	ror    rax, 16
# 0 "" 2
# 523 "echo64.c" 1
	xor    rcx, [TC+8*rbp+1*256*8]
# 0 "" 2
# 523 "echo64.c" 1
	xor    rcx, [TB+8*rsi]
# 0 "" 2
# 523 "echo64.c" 1
	movzbl ebp, bl
# 0 "" 2
# 523 "echo64.c" 1
	movzbl esi, bh
# 0 "" 2
# 523 "echo64.c" 1
	ror    rbx, 16
# 0 "" 2
# 523 "echo64.c" 1
	xor    rdx, [TB+8*rbp]
# 0 "" 2
# 523 "echo64.c" 1
	xor    rdx, [TC+8*rsi+1*256*8]
# 0 "" 2
# 523 "echo64.c" 1
	movzbl  ebp, al
# 0 "" 2
# 523 "echo64.c" 1
	movzbl  esi, ah
# 0 "" 2
# 523 "echo64.c" 1
	xor     rcx,  r15
# 0 "" 2
# 523 "echo64.c" 1
	xor     rdx, [TB+8*rbp+2*256*8]
# 0 "" 2
# 523 "echo64.c" 1
	xor     rdx, [TC+8*rsi+3*256*8]
# 0 "" 2
# 523 "echo64.c" 1
	movzbl  ebp, bl
# 0 "" 2
# 523 "echo64.c" 1
	movzbl  esi, bh
# 0 "" 2
# 523 "echo64.c" 1
	add     r15,  1
# 0 "" 2
# 523 "echo64.c" 1
	xor     rcx, [TB+8*rbp+2*256*8]
# 0 "" 2
# 523 "echo64.c" 1
	xor     rcx, [TC+8*rsi+3*256*8]
# 0 "" 2
# 523 "echo64.c" 1
	movzbl  ebp, dl
# 0 "" 2
# 523 "echo64.c" 1
	movzbl  esi, dh
# 0 "" 2
# 523 "echo64.c" 1
	ror     rdx, 16
# 0 "" 2
# 523 "echo64.c" 1
	mov    rbx,  [TC+8*rbp]
# 0 "" 2
# 523 "echo64.c" 1
	mov    rax,  [TB+8*rsi+1*256*8]
# 0 "" 2
# 523 "echo64.c" 1
	movzbl ebp, ch
# 0 "" 2
# 523 "echo64.c" 1
	movzbl esi, cl
# 0 "" 2
# 523 "echo64.c" 1
	ror    rcx, 16
# 0 "" 2
# 523 "echo64.c" 1
	xor    rbx, [TB+8*rbp+1*256*8]
# 0 "" 2
# 523 "echo64.c" 1
	xor    rax,  [TC+8*rsi]
# 0 "" 2
# 523 "echo64.c" 1
	movzbl  ebp, cl
# 0 "" 2
# 523 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 523 "echo64.c" 1
	ror     rcx, 16
# 0 "" 2
# 523 "echo64.c" 1
	xor    rbx,  [TC+8*rbp+2*256*8]
# 0 "" 2
# 523 "echo64.c" 1
	xor    rax,  [TB+8*rsi+3*256*8]
# 0 "" 2
# 523 "echo64.c" 1
	movzbl  ebp, dh
# 0 "" 2
# 523 "echo64.c" 1
	movzbl  esi, dl
# 0 "" 2
# 523 "echo64.c" 1
	ror     rdx, 16
# 0 "" 2
# 523 "echo64.c" 1
	xor    rbx, [TB+8*rbp+3*256*8]
# 0 "" 2
# 523 "echo64.c" 1
	xor    rax,  [TC+8*rsi+2*256*8]
# 0 "" 2
# 523 "echo64.c" 1
	movzbl  ebp, cl
# 0 "" 2
# 523 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 523 "echo64.c" 1
	ror    rcx, 16
# 0 "" 2
# 523 "echo64.c" 1
	xor    rax,  [TB+8*rbp]
# 0 "" 2
# 523 "echo64.c" 1
	xor    rax,   [TC+8*rsi+1*256*8]
# 0 "" 2
# 523 "echo64.c" 1
	movzbl ebp, dl
# 0 "" 2
# 523 "echo64.c" 1
	movzbl esi, dh
# 0 "" 2
# 523 "echo64.c" 1
	ror    rdx, 16
# 0 "" 2
# 523 "echo64.c" 1
	xor    rbx,  [TB+8*rbp]
# 0 "" 2
# 523 "echo64.c" 1
	xor    rbx,  [TC+8*rsi+1*256*8]
# 0 "" 2
# 523 "echo64.c" 1
	movzbl  ebp, dl
# 0 "" 2
# 523 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 523 "echo64.c" 1
	xor    rax,  [TB+8*rbp+2*256*8]
# 0 "" 2
# 523 "echo64.c" 1
	xor    rbx,  [TC+8*rsi+3*256*8]
# 0 "" 2
# 523 "echo64.c" 1
	movzbl  ebp, dh
# 0 "" 2
# 523 "echo64.c" 1
	movzbl  esi, cl
# 0 "" 2
# 523 "echo64.c" 1
	xor    rax,  [TC+8*rbp+3*256*8]
# 0 "" 2
# 523 "echo64.c" 1
	xor    rbx,  [TB+8*rsi+2*256*8]
# 0 "" 2
# 523 "echo64.c" 1
	mov   [rdi+16*16+16*4],   rax
# 0 "" 2
# 523 "echo64.c" 1
	mov   [rdi+16*16+16*4+8], rbx
# 0 "" 2
# 523 "echo64.c" 1
	mov    rax, [rdi+16*5]
# 0 "" 2
# 523 "echo64.c" 1
	mov    rbx, [rdi+16*5+8]
# 0 "" 2
# 524 "echo64.c" 1
	movzbl  ebp, ah
# 0 "" 2
# 524 "echo64.c" 1
	movzbl  esi, al
# 0 "" 2
# 524 "echo64.c" 1
	ror     rax,  0x10
# 0 "" 2
# 524 "echo64.c" 1
	mov     rdx,  [TB+8*rbp+1*256*8]
# 0 "" 2
# 524 "echo64.c" 1
	mov     rcx,  [TC+8*rsi]
# 0 "" 2
# 524 "echo64.c" 1
	movzbl ebp, bl
# 0 "" 2
# 524 "echo64.c" 1
	movzbl esi, bh
# 0 "" 2
# 524 "echo64.c" 1
	ror    rbx,  0x10
# 0 "" 2
# 524 "echo64.c" 1
	xor    rdx, [TC+8*rbp]
# 0 "" 2
# 524 "echo64.c" 1
	xor    rcx, [TB+8*rsi+1*256*8]
# 0 "" 2
# 524 "echo64.c" 1
	movzbl ebp, al
# 0 "" 2
# 524 "echo64.c" 1
	movzbl esi, ah
# 0 "" 2
# 524 "echo64.c" 1
	ror    rax, 16
# 0 "" 2
# 524 "echo64.c" 1
	xor    rdx, [TC+8*rbp+2*256*8]
# 0 "" 2
# 524 "echo64.c" 1
	xor    rcx, [TB+8*rsi+3*256*8]
# 0 "" 2
# 524 "echo64.c" 1
	movzbl ebp, bh
# 0 "" 2
# 524 "echo64.c" 1
	movzbl esi, bl
# 0 "" 2
# 524 "echo64.c" 1
	ror    rbx, 16
# 0 "" 2
# 524 "echo64.c" 1
	xor    rdx, [TB+8*rbp+3*256*8]
# 0 "" 2
# 524 "echo64.c" 1
	xor    rcx, [TC+8*rsi+2*256*8]
# 0 "" 2
# 524 "echo64.c" 1
	movzbl ebp, ah
# 0 "" 2
# 524 "echo64.c" 1
	movzbl esi, al
# 0 "" 2
# 524 "echo64.c" 1
	ror    rax, 16
# 0 "" 2
# 524 "echo64.c" 1
	xor    rcx, [TC+8*rbp+1*256*8]
# 0 "" 2
# 524 "echo64.c" 1
	xor    rcx, [TB+8*rsi]
# 0 "" 2
# 524 "echo64.c" 1
	movzbl ebp, bl
# 0 "" 2
# 524 "echo64.c" 1
	movzbl esi, bh
# 0 "" 2
# 524 "echo64.c" 1
	ror    rbx, 16
# 0 "" 2
# 524 "echo64.c" 1
	xor    rdx, [TB+8*rbp]
# 0 "" 2
# 524 "echo64.c" 1
	xor    rdx, [TC+8*rsi+1*256*8]
# 0 "" 2
# 524 "echo64.c" 1
	movzbl  ebp, al
# 0 "" 2
# 524 "echo64.c" 1
	movzbl  esi, ah
# 0 "" 2
# 524 "echo64.c" 1
	xor     rcx,  r15
# 0 "" 2
# 524 "echo64.c" 1
	xor     rdx, [TB+8*rbp+2*256*8]
# 0 "" 2
# 524 "echo64.c" 1
	xor     rdx, [TC+8*rsi+3*256*8]
# 0 "" 2
# 524 "echo64.c" 1
	movzbl  ebp, bl
# 0 "" 2
# 524 "echo64.c" 1
	movzbl  esi, bh
# 0 "" 2
# 524 "echo64.c" 1
	add     r15,  1
# 0 "" 2
# 524 "echo64.c" 1
	xor     rcx, [TB+8*rbp+2*256*8]
# 0 "" 2
# 524 "echo64.c" 1
	xor     rcx, [TC+8*rsi+3*256*8]
# 0 "" 2
# 524 "echo64.c" 1
	movzbl  ebp, dl
# 0 "" 2
# 524 "echo64.c" 1
	movzbl  esi, dh
# 0 "" 2
# 524 "echo64.c" 1
	ror     rdx, 16
# 0 "" 2
# 524 "echo64.c" 1
	mov    rbx,  [TC+8*rbp]
# 0 "" 2
# 524 "echo64.c" 1
	mov    rax,  [TB+8*rsi+1*256*8]
# 0 "" 2
# 524 "echo64.c" 1
	movzbl ebp, ch
# 0 "" 2
# 524 "echo64.c" 1
	movzbl esi, cl
# 0 "" 2
# 524 "echo64.c" 1
	ror    rcx, 16
# 0 "" 2
# 524 "echo64.c" 1
	xor    rbx, [TB+8*rbp+1*256*8]
# 0 "" 2
# 524 "echo64.c" 1
	xor    rax,  [TC+8*rsi]
# 0 "" 2
# 524 "echo64.c" 1
	movzbl  ebp, cl
# 0 "" 2
# 524 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 524 "echo64.c" 1
	ror     rcx, 16
# 0 "" 2
# 524 "echo64.c" 1
	xor    rbx,  [TC+8*rbp+2*256*8]
# 0 "" 2
# 524 "echo64.c" 1
	xor    rax,  [TB+8*rsi+3*256*8]
# 0 "" 2
# 524 "echo64.c" 1
	movzbl  ebp, dh
# 0 "" 2
# 524 "echo64.c" 1
	movzbl  esi, dl
# 0 "" 2
# 524 "echo64.c" 1
	ror     rdx, 16
# 0 "" 2
# 524 "echo64.c" 1
	xor    rbx, [TB+8*rbp+3*256*8]
# 0 "" 2
# 524 "echo64.c" 1
	xor    rax,  [TC+8*rsi+2*256*8]
# 0 "" 2
# 524 "echo64.c" 1
	movzbl  ebp, cl
# 0 "" 2
# 524 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 524 "echo64.c" 1
	ror    rcx, 16
# 0 "" 2
# 524 "echo64.c" 1
	xor    rax,  [TB+8*rbp]
# 0 "" 2
# 524 "echo64.c" 1
	xor    rax,   [TC+8*rsi+1*256*8]
# 0 "" 2
# 524 "echo64.c" 1
	movzbl ebp, dl
# 0 "" 2
# 524 "echo64.c" 1
	movzbl esi, dh
# 0 "" 2
# 524 "echo64.c" 1
	ror    rdx, 16
# 0 "" 2
# 524 "echo64.c" 1
	xor    rbx,  [TB+8*rbp]
# 0 "" 2
# 524 "echo64.c" 1
	xor    rbx,  [TC+8*rsi+1*256*8]
# 0 "" 2
# 524 "echo64.c" 1
	movzbl  ebp, dl
# 0 "" 2
# 524 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 524 "echo64.c" 1
	xor    rax,  [TB+8*rbp+2*256*8]
# 0 "" 2
# 524 "echo64.c" 1
	xor    rbx,  [TC+8*rsi+3*256*8]
# 0 "" 2
# 524 "echo64.c" 1
	movzbl  ebp, dh
# 0 "" 2
# 524 "echo64.c" 1
	movzbl  esi, cl
# 0 "" 2
# 524 "echo64.c" 1
	xor    rax,  [TC+8*rbp+3*256*8]
# 0 "" 2
# 524 "echo64.c" 1
	xor    rbx,  [TB+8*rsi+2*256*8]
# 0 "" 2
# 524 "echo64.c" 1
	mov   [rdi+16*16+16*5],   rax
# 0 "" 2
# 524 "echo64.c" 1
	mov   [rdi+16*16+16*5+8], rbx
# 0 "" 2
# 524 "echo64.c" 1
	mov    rax, [rdi+16*6]
# 0 "" 2
# 524 "echo64.c" 1
	mov    rbx, [rdi+16*6+8]
# 0 "" 2
# 525 "echo64.c" 1
	movzbl  ebp, ah
# 0 "" 2
# 525 "echo64.c" 1
	movzbl  esi, al
# 0 "" 2
# 525 "echo64.c" 1
	ror     rax,  0x10
# 0 "" 2
# 525 "echo64.c" 1
	mov     rdx,  [TB+8*rbp+1*256*8]
# 0 "" 2
# 525 "echo64.c" 1
	mov     rcx,  [TC+8*rsi]
# 0 "" 2
# 525 "echo64.c" 1
	movzbl ebp, bl
# 0 "" 2
# 525 "echo64.c" 1
	movzbl esi, bh
# 0 "" 2
# 525 "echo64.c" 1
	ror    rbx,  0x10
# 0 "" 2
# 525 "echo64.c" 1
	xor    rdx, [TC+8*rbp]
# 0 "" 2
# 525 "echo64.c" 1
	xor    rcx, [TB+8*rsi+1*256*8]
# 0 "" 2
# 525 "echo64.c" 1
	movzbl ebp, al
# 0 "" 2
# 525 "echo64.c" 1
	movzbl esi, ah
# 0 "" 2
# 525 "echo64.c" 1
	ror    rax, 16
# 0 "" 2
# 525 "echo64.c" 1
	xor    rdx, [TC+8*rbp+2*256*8]
# 0 "" 2
# 525 "echo64.c" 1
	xor    rcx, [TB+8*rsi+3*256*8]
# 0 "" 2
# 525 "echo64.c" 1
	movzbl ebp, bh
# 0 "" 2
# 525 "echo64.c" 1
	movzbl esi, bl
# 0 "" 2
# 525 "echo64.c" 1
	ror    rbx, 16
# 0 "" 2
# 525 "echo64.c" 1
	xor    rdx, [TB+8*rbp+3*256*8]
# 0 "" 2
# 525 "echo64.c" 1
	xor    rcx, [TC+8*rsi+2*256*8]
# 0 "" 2
# 525 "echo64.c" 1
	movzbl ebp, ah
# 0 "" 2
# 525 "echo64.c" 1
	movzbl esi, al
# 0 "" 2
# 525 "echo64.c" 1
	ror    rax, 16
# 0 "" 2
# 525 "echo64.c" 1
	xor    rcx, [TC+8*rbp+1*256*8]
# 0 "" 2
# 525 "echo64.c" 1
	xor    rcx, [TB+8*rsi]
# 0 "" 2
# 525 "echo64.c" 1
	movzbl ebp, bl
# 0 "" 2
# 525 "echo64.c" 1
	movzbl esi, bh
# 0 "" 2
# 525 "echo64.c" 1
	ror    rbx, 16
# 0 "" 2
# 525 "echo64.c" 1
	xor    rdx, [TB+8*rbp]
# 0 "" 2
# 525 "echo64.c" 1
	xor    rdx, [TC+8*rsi+1*256*8]
# 0 "" 2
# 525 "echo64.c" 1
	movzbl  ebp, al
# 0 "" 2
# 525 "echo64.c" 1
	movzbl  esi, ah
# 0 "" 2
# 525 "echo64.c" 1
	xor     rcx,  r15
# 0 "" 2
# 525 "echo64.c" 1
	xor     rdx, [TB+8*rbp+2*256*8]
# 0 "" 2
# 525 "echo64.c" 1
	xor     rdx, [TC+8*rsi+3*256*8]
# 0 "" 2
# 525 "echo64.c" 1
	movzbl  ebp, bl
# 0 "" 2
# 525 "echo64.c" 1
	movzbl  esi, bh
# 0 "" 2
# 525 "echo64.c" 1
	add     r15,  1
# 0 "" 2
# 525 "echo64.c" 1
	xor     rcx, [TB+8*rbp+2*256*8]
# 0 "" 2
# 525 "echo64.c" 1
	xor     rcx, [TC+8*rsi+3*256*8]
# 0 "" 2
# 525 "echo64.c" 1
	movzbl  ebp, dl
# 0 "" 2
# 525 "echo64.c" 1
	movzbl  esi, dh
# 0 "" 2
# 525 "echo64.c" 1
	ror     rdx, 16
# 0 "" 2
# 525 "echo64.c" 1
	mov    rbx,  [TC+8*rbp]
# 0 "" 2
# 525 "echo64.c" 1
	mov    rax,  [TB+8*rsi+1*256*8]
# 0 "" 2
# 525 "echo64.c" 1
	movzbl ebp, ch
# 0 "" 2
# 525 "echo64.c" 1
	movzbl esi, cl
# 0 "" 2
# 525 "echo64.c" 1
	ror    rcx, 16
# 0 "" 2
# 525 "echo64.c" 1
	xor    rbx, [TB+8*rbp+1*256*8]
# 0 "" 2
# 525 "echo64.c" 1
	xor    rax,  [TC+8*rsi]
# 0 "" 2
# 525 "echo64.c" 1
	movzbl  ebp, cl
# 0 "" 2
# 525 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 525 "echo64.c" 1
	ror     rcx, 16
# 0 "" 2
# 525 "echo64.c" 1
	xor    rbx,  [TC+8*rbp+2*256*8]
# 0 "" 2
# 525 "echo64.c" 1
	xor    rax,  [TB+8*rsi+3*256*8]
# 0 "" 2
# 525 "echo64.c" 1
	movzbl  ebp, dh
# 0 "" 2
# 525 "echo64.c" 1
	movzbl  esi, dl
# 0 "" 2
# 525 "echo64.c" 1
	ror     rdx, 16
# 0 "" 2
# 525 "echo64.c" 1
	xor    rbx, [TB+8*rbp+3*256*8]
# 0 "" 2
# 525 "echo64.c" 1
	xor    rax,  [TC+8*rsi+2*256*8]
# 0 "" 2
# 525 "echo64.c" 1
	movzbl  ebp, cl
# 0 "" 2
# 525 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 525 "echo64.c" 1
	ror    rcx, 16
# 0 "" 2
# 525 "echo64.c" 1
	xor    rax,  [TB+8*rbp]
# 0 "" 2
# 525 "echo64.c" 1
	xor    rax,   [TC+8*rsi+1*256*8]
# 0 "" 2
# 525 "echo64.c" 1
	movzbl ebp, dl
# 0 "" 2
# 525 "echo64.c" 1
	movzbl esi, dh
# 0 "" 2
# 525 "echo64.c" 1
	ror    rdx, 16
# 0 "" 2
# 525 "echo64.c" 1
	xor    rbx,  [TB+8*rbp]
# 0 "" 2
# 525 "echo64.c" 1
	xor    rbx,  [TC+8*rsi+1*256*8]
# 0 "" 2
# 525 "echo64.c" 1
	movzbl  ebp, dl
# 0 "" 2
# 525 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 525 "echo64.c" 1
	xor    rax,  [TB+8*rbp+2*256*8]
# 0 "" 2
# 525 "echo64.c" 1
	xor    rbx,  [TC+8*rsi+3*256*8]
# 0 "" 2
# 525 "echo64.c" 1
	movzbl  ebp, dh
# 0 "" 2
# 525 "echo64.c" 1
	movzbl  esi, cl
# 0 "" 2
# 525 "echo64.c" 1
	xor    rax,  [TC+8*rbp+3*256*8]
# 0 "" 2
# 525 "echo64.c" 1
	xor    rbx,  [TB+8*rsi+2*256*8]
# 0 "" 2
# 525 "echo64.c" 1
	mov   [rdi+16*16+16*6],   rax
# 0 "" 2
# 525 "echo64.c" 1
	mov   [rdi+16*16+16*6+8], rbx
# 0 "" 2
# 525 "echo64.c" 1
	mov    rax, [rdi+16*7]
# 0 "" 2
# 525 "echo64.c" 1
	mov    rbx, [rdi+16*7+8]
# 0 "" 2
# 526 "echo64.c" 1
	movzbl  ebp, ah
# 0 "" 2
# 526 "echo64.c" 1
	movzbl  esi, al
# 0 "" 2
# 526 "echo64.c" 1
	ror     rax,  0x10
# 0 "" 2
# 526 "echo64.c" 1
	mov     rdx,  [TB+8*rbp+1*256*8]
# 0 "" 2
# 526 "echo64.c" 1
	mov     rcx,  [TC+8*rsi]
# 0 "" 2
# 526 "echo64.c" 1
	movzbl ebp, bl
# 0 "" 2
# 526 "echo64.c" 1
	movzbl esi, bh
# 0 "" 2
# 526 "echo64.c" 1
	ror    rbx,  0x10
# 0 "" 2
# 526 "echo64.c" 1
	xor    rdx, [TC+8*rbp]
# 0 "" 2
# 526 "echo64.c" 1
	xor    rcx, [TB+8*rsi+1*256*8]
# 0 "" 2
# 526 "echo64.c" 1
	movzbl ebp, al
# 0 "" 2
# 526 "echo64.c" 1
	movzbl esi, ah
# 0 "" 2
# 526 "echo64.c" 1
	ror    rax, 16
# 0 "" 2
# 526 "echo64.c" 1
	xor    rdx, [TC+8*rbp+2*256*8]
# 0 "" 2
# 526 "echo64.c" 1
	xor    rcx, [TB+8*rsi+3*256*8]
# 0 "" 2
# 526 "echo64.c" 1
	movzbl ebp, bh
# 0 "" 2
# 526 "echo64.c" 1
	movzbl esi, bl
# 0 "" 2
# 526 "echo64.c" 1
	ror    rbx, 16
# 0 "" 2
# 526 "echo64.c" 1
	xor    rdx, [TB+8*rbp+3*256*8]
# 0 "" 2
# 526 "echo64.c" 1
	xor    rcx, [TC+8*rsi+2*256*8]
# 0 "" 2
# 526 "echo64.c" 1
	movzbl ebp, ah
# 0 "" 2
# 526 "echo64.c" 1
	movzbl esi, al
# 0 "" 2
# 526 "echo64.c" 1
	ror    rax, 16
# 0 "" 2
# 526 "echo64.c" 1
	xor    rcx, [TC+8*rbp+1*256*8]
# 0 "" 2
# 526 "echo64.c" 1
	xor    rcx, [TB+8*rsi]
# 0 "" 2
# 526 "echo64.c" 1
	movzbl ebp, bl
# 0 "" 2
# 526 "echo64.c" 1
	movzbl esi, bh
# 0 "" 2
# 526 "echo64.c" 1
	ror    rbx, 16
# 0 "" 2
# 526 "echo64.c" 1
	xor    rdx, [TB+8*rbp]
# 0 "" 2
# 526 "echo64.c" 1
	xor    rdx, [TC+8*rsi+1*256*8]
# 0 "" 2
# 526 "echo64.c" 1
	movzbl  ebp, al
# 0 "" 2
# 526 "echo64.c" 1
	movzbl  esi, ah
# 0 "" 2
# 526 "echo64.c" 1
	xor     rcx,  r15
# 0 "" 2
# 526 "echo64.c" 1
	xor     rdx, [TB+8*rbp+2*256*8]
# 0 "" 2
# 526 "echo64.c" 1
	xor     rdx, [TC+8*rsi+3*256*8]
# 0 "" 2
# 526 "echo64.c" 1
	movzbl  ebp, bl
# 0 "" 2
# 526 "echo64.c" 1
	movzbl  esi, bh
# 0 "" 2
# 526 "echo64.c" 1
	add     r15,  1
# 0 "" 2
# 526 "echo64.c" 1
	xor     rcx, [TB+8*rbp+2*256*8]
# 0 "" 2
# 526 "echo64.c" 1
	xor     rcx, [TC+8*rsi+3*256*8]
# 0 "" 2
# 526 "echo64.c" 1
	movzbl  ebp, dl
# 0 "" 2
# 526 "echo64.c" 1
	movzbl  esi, dh
# 0 "" 2
# 526 "echo64.c" 1
	ror     rdx, 16
# 0 "" 2
# 526 "echo64.c" 1
	mov    rbx,  [TC+8*rbp]
# 0 "" 2
# 526 "echo64.c" 1
	mov    rax,  [TB+8*rsi+1*256*8]
# 0 "" 2
# 526 "echo64.c" 1
	movzbl ebp, ch
# 0 "" 2
# 526 "echo64.c" 1
	movzbl esi, cl
# 0 "" 2
# 526 "echo64.c" 1
	ror    rcx, 16
# 0 "" 2
# 526 "echo64.c" 1
	xor    rbx, [TB+8*rbp+1*256*8]
# 0 "" 2
# 526 "echo64.c" 1
	xor    rax,  [TC+8*rsi]
# 0 "" 2
# 526 "echo64.c" 1
	movzbl  ebp, cl
# 0 "" 2
# 526 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 526 "echo64.c" 1
	ror     rcx, 16
# 0 "" 2
# 526 "echo64.c" 1
	xor    rbx,  [TC+8*rbp+2*256*8]
# 0 "" 2
# 526 "echo64.c" 1
	xor    rax,  [TB+8*rsi+3*256*8]
# 0 "" 2
# 526 "echo64.c" 1
	movzbl  ebp, dh
# 0 "" 2
# 526 "echo64.c" 1
	movzbl  esi, dl
# 0 "" 2
# 526 "echo64.c" 1
	ror     rdx, 16
# 0 "" 2
# 526 "echo64.c" 1
	xor    rbx, [TB+8*rbp+3*256*8]
# 0 "" 2
# 526 "echo64.c" 1
	xor    rax,  [TC+8*rsi+2*256*8]
# 0 "" 2
# 526 "echo64.c" 1
	movzbl  ebp, cl
# 0 "" 2
# 526 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 526 "echo64.c" 1
	ror    rcx, 16
# 0 "" 2
# 526 "echo64.c" 1
	xor    rax,  [TB+8*rbp]
# 0 "" 2
# 526 "echo64.c" 1
	xor    rax,   [TC+8*rsi+1*256*8]
# 0 "" 2
# 526 "echo64.c" 1
	movzbl ebp, dl
# 0 "" 2
# 526 "echo64.c" 1
	movzbl esi, dh
# 0 "" 2
# 526 "echo64.c" 1
	ror    rdx, 16
# 0 "" 2
# 526 "echo64.c" 1
	xor    rbx,  [TB+8*rbp]
# 0 "" 2
# 526 "echo64.c" 1
	xor    rbx,  [TC+8*rsi+1*256*8]
# 0 "" 2
# 526 "echo64.c" 1
	movzbl  ebp, dl
# 0 "" 2
# 526 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 526 "echo64.c" 1
	xor    rax,  [TB+8*rbp+2*256*8]
# 0 "" 2
# 526 "echo64.c" 1
	xor    rbx,  [TC+8*rsi+3*256*8]
# 0 "" 2
# 526 "echo64.c" 1
	movzbl  ebp, dh
# 0 "" 2
# 526 "echo64.c" 1
	movzbl  esi, cl
# 0 "" 2
# 526 "echo64.c" 1
	xor    rax,  [TC+8*rbp+3*256*8]
# 0 "" 2
# 526 "echo64.c" 1
	xor    rbx,  [TB+8*rsi+2*256*8]
# 0 "" 2
# 526 "echo64.c" 1
	mov   [rdi+16*16+16*7],   rax
# 0 "" 2
# 526 "echo64.c" 1
	mov   [rdi+16*16+16*7+8], rbx
# 0 "" 2
# 526 "echo64.c" 1
	mov    rax, [rdi+16*8]
# 0 "" 2
# 526 "echo64.c" 1
	mov    rbx, [rdi+16*8+8]
# 0 "" 2
# 527 "echo64.c" 1
	movzbl  ebp, ah
# 0 "" 2
# 527 "echo64.c" 1
	movzbl  esi, al
# 0 "" 2
# 527 "echo64.c" 1
	ror     rax,  0x10
# 0 "" 2
# 527 "echo64.c" 1
	mov     rdx,  [TB+8*rbp+1*256*8]
# 0 "" 2
# 527 "echo64.c" 1
	mov     rcx,  [TC+8*rsi]
# 0 "" 2
# 527 "echo64.c" 1
	movzbl ebp, bl
# 0 "" 2
# 527 "echo64.c" 1
	movzbl esi, bh
# 0 "" 2
# 527 "echo64.c" 1
	ror    rbx,  0x10
# 0 "" 2
# 527 "echo64.c" 1
	xor    rdx, [TC+8*rbp]
# 0 "" 2
# 527 "echo64.c" 1
	xor    rcx, [TB+8*rsi+1*256*8]
# 0 "" 2
# 527 "echo64.c" 1
	movzbl ebp, al
# 0 "" 2
# 527 "echo64.c" 1
	movzbl esi, ah
# 0 "" 2
# 527 "echo64.c" 1
	ror    rax, 16
# 0 "" 2
# 527 "echo64.c" 1
	xor    rdx, [TC+8*rbp+2*256*8]
# 0 "" 2
# 527 "echo64.c" 1
	xor    rcx, [TB+8*rsi+3*256*8]
# 0 "" 2
# 527 "echo64.c" 1
	movzbl ebp, bh
# 0 "" 2
# 527 "echo64.c" 1
	movzbl esi, bl
# 0 "" 2
# 527 "echo64.c" 1
	ror    rbx, 16
# 0 "" 2
# 527 "echo64.c" 1
	xor    rdx, [TB+8*rbp+3*256*8]
# 0 "" 2
# 527 "echo64.c" 1
	xor    rcx, [TC+8*rsi+2*256*8]
# 0 "" 2
# 527 "echo64.c" 1
	movzbl ebp, ah
# 0 "" 2
# 527 "echo64.c" 1
	movzbl esi, al
# 0 "" 2
# 527 "echo64.c" 1
	ror    rax, 16
# 0 "" 2
# 527 "echo64.c" 1
	xor    rcx, [TC+8*rbp+1*256*8]
# 0 "" 2
# 527 "echo64.c" 1
	xor    rcx, [TB+8*rsi]
# 0 "" 2
# 527 "echo64.c" 1
	movzbl ebp, bl
# 0 "" 2
# 527 "echo64.c" 1
	movzbl esi, bh
# 0 "" 2
# 527 "echo64.c" 1
	ror    rbx, 16
# 0 "" 2
# 527 "echo64.c" 1
	xor    rdx, [TB+8*rbp]
# 0 "" 2
# 527 "echo64.c" 1
	xor    rdx, [TC+8*rsi+1*256*8]
# 0 "" 2
# 527 "echo64.c" 1
	movzbl  ebp, al
# 0 "" 2
# 527 "echo64.c" 1
	movzbl  esi, ah
# 0 "" 2
# 527 "echo64.c" 1
	xor     rcx,  r15
# 0 "" 2
# 527 "echo64.c" 1
	xor     rdx, [TB+8*rbp+2*256*8]
# 0 "" 2
# 527 "echo64.c" 1
	xor     rdx, [TC+8*rsi+3*256*8]
# 0 "" 2
# 527 "echo64.c" 1
	movzbl  ebp, bl
# 0 "" 2
# 527 "echo64.c" 1
	movzbl  esi, bh
# 0 "" 2
# 527 "echo64.c" 1
	add     r15,  1
# 0 "" 2
# 527 "echo64.c" 1
	xor     rcx, [TB+8*rbp+2*256*8]
# 0 "" 2
# 527 "echo64.c" 1
	xor     rcx, [TC+8*rsi+3*256*8]
# 0 "" 2
# 527 "echo64.c" 1
	movzbl  ebp, dl
# 0 "" 2
# 527 "echo64.c" 1
	movzbl  esi, dh
# 0 "" 2
# 527 "echo64.c" 1
	ror     rdx, 16
# 0 "" 2
# 527 "echo64.c" 1
	mov    rbx,  [TC+8*rbp]
# 0 "" 2
# 527 "echo64.c" 1
	mov    rax,  [TB+8*rsi+1*256*8]
# 0 "" 2
# 527 "echo64.c" 1
	movzbl ebp, ch
# 0 "" 2
# 527 "echo64.c" 1
	movzbl esi, cl
# 0 "" 2
# 527 "echo64.c" 1
	ror    rcx, 16
# 0 "" 2
# 527 "echo64.c" 1
	xor    rbx, [TB+8*rbp+1*256*8]
# 0 "" 2
# 527 "echo64.c" 1
	xor    rax,  [TC+8*rsi]
# 0 "" 2
# 527 "echo64.c" 1
	movzbl  ebp, cl
# 0 "" 2
# 527 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 527 "echo64.c" 1
	ror     rcx, 16
# 0 "" 2
# 527 "echo64.c" 1
	xor    rbx,  [TC+8*rbp+2*256*8]
# 0 "" 2
# 527 "echo64.c" 1
	xor    rax,  [TB+8*rsi+3*256*8]
# 0 "" 2
# 527 "echo64.c" 1
	movzbl  ebp, dh
# 0 "" 2
# 527 "echo64.c" 1
	movzbl  esi, dl
# 0 "" 2
# 527 "echo64.c" 1
	ror     rdx, 16
# 0 "" 2
# 527 "echo64.c" 1
	xor    rbx, [TB+8*rbp+3*256*8]
# 0 "" 2
# 527 "echo64.c" 1
	xor    rax,  [TC+8*rsi+2*256*8]
# 0 "" 2
# 527 "echo64.c" 1
	movzbl  ebp, cl
# 0 "" 2
# 527 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 527 "echo64.c" 1
	ror    rcx, 16
# 0 "" 2
# 527 "echo64.c" 1
	xor    rax,  [TB+8*rbp]
# 0 "" 2
# 527 "echo64.c" 1
	xor    rax,   [TC+8*rsi+1*256*8]
# 0 "" 2
# 527 "echo64.c" 1
	movzbl ebp, dl
# 0 "" 2
# 527 "echo64.c" 1
	movzbl esi, dh
# 0 "" 2
# 527 "echo64.c" 1
	ror    rdx, 16
# 0 "" 2
# 527 "echo64.c" 1
	xor    rbx,  [TB+8*rbp]
# 0 "" 2
# 527 "echo64.c" 1
	xor    rbx,  [TC+8*rsi+1*256*8]
# 0 "" 2
# 527 "echo64.c" 1
	movzbl  ebp, dl
# 0 "" 2
# 527 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 527 "echo64.c" 1
	xor    rax,  [TB+8*rbp+2*256*8]
# 0 "" 2
# 527 "echo64.c" 1
	xor    rbx,  [TC+8*rsi+3*256*8]
# 0 "" 2
# 527 "echo64.c" 1
	movzbl  ebp, dh
# 0 "" 2
# 527 "echo64.c" 1
	movzbl  esi, cl
# 0 "" 2
# 527 "echo64.c" 1
	xor    rax,  [TC+8*rbp+3*256*8]
# 0 "" 2
# 527 "echo64.c" 1
	xor    rbx,  [TB+8*rsi+2*256*8]
# 0 "" 2
# 527 "echo64.c" 1
	mov   [rdi+16*16+16*8],   rax
# 0 "" 2
# 527 "echo64.c" 1
	mov   [rdi+16*16+16*8+8], rbx
# 0 "" 2
# 527 "echo64.c" 1
	mov    rax, [rdi+16*9]
# 0 "" 2
# 527 "echo64.c" 1
	mov    rbx, [rdi+16*9+8]
# 0 "" 2
# 528 "echo64.c" 1
	movzbl  ebp, ah
# 0 "" 2
# 528 "echo64.c" 1
	movzbl  esi, al
# 0 "" 2
# 528 "echo64.c" 1
	ror     rax,  0x10
# 0 "" 2
# 528 "echo64.c" 1
	mov     rdx,  [TB+8*rbp+1*256*8]
# 0 "" 2
# 528 "echo64.c" 1
	mov     rcx,  [TC+8*rsi]
# 0 "" 2
# 528 "echo64.c" 1
	movzbl ebp, bl
# 0 "" 2
# 528 "echo64.c" 1
	movzbl esi, bh
# 0 "" 2
# 528 "echo64.c" 1
	ror    rbx,  0x10
# 0 "" 2
# 528 "echo64.c" 1
	xor    rdx, [TC+8*rbp]
# 0 "" 2
# 528 "echo64.c" 1
	xor    rcx, [TB+8*rsi+1*256*8]
# 0 "" 2
# 528 "echo64.c" 1
	movzbl ebp, al
# 0 "" 2
# 528 "echo64.c" 1
	movzbl esi, ah
# 0 "" 2
# 528 "echo64.c" 1
	ror    rax, 16
# 0 "" 2
# 528 "echo64.c" 1
	xor    rdx, [TC+8*rbp+2*256*8]
# 0 "" 2
# 528 "echo64.c" 1
	xor    rcx, [TB+8*rsi+3*256*8]
# 0 "" 2
# 528 "echo64.c" 1
	movzbl ebp, bh
# 0 "" 2
# 528 "echo64.c" 1
	movzbl esi, bl
# 0 "" 2
# 528 "echo64.c" 1
	ror    rbx, 16
# 0 "" 2
# 528 "echo64.c" 1
	xor    rdx, [TB+8*rbp+3*256*8]
# 0 "" 2
# 528 "echo64.c" 1
	xor    rcx, [TC+8*rsi+2*256*8]
# 0 "" 2
# 528 "echo64.c" 1
	movzbl ebp, ah
# 0 "" 2
# 528 "echo64.c" 1
	movzbl esi, al
# 0 "" 2
# 528 "echo64.c" 1
	ror    rax, 16
# 0 "" 2
# 528 "echo64.c" 1
	xor    rcx, [TC+8*rbp+1*256*8]
# 0 "" 2
# 528 "echo64.c" 1
	xor    rcx, [TB+8*rsi]
# 0 "" 2
# 528 "echo64.c" 1
	movzbl ebp, bl
# 0 "" 2
# 528 "echo64.c" 1
	movzbl esi, bh
# 0 "" 2
# 528 "echo64.c" 1
	ror    rbx, 16
# 0 "" 2
# 528 "echo64.c" 1
	xor    rdx, [TB+8*rbp]
# 0 "" 2
# 528 "echo64.c" 1
	xor    rdx, [TC+8*rsi+1*256*8]
# 0 "" 2
# 528 "echo64.c" 1
	movzbl  ebp, al
# 0 "" 2
# 528 "echo64.c" 1
	movzbl  esi, ah
# 0 "" 2
# 528 "echo64.c" 1
	xor     rcx,  r15
# 0 "" 2
# 528 "echo64.c" 1
	xor     rdx, [TB+8*rbp+2*256*8]
# 0 "" 2
# 528 "echo64.c" 1
	xor     rdx, [TC+8*rsi+3*256*8]
# 0 "" 2
# 528 "echo64.c" 1
	movzbl  ebp, bl
# 0 "" 2
# 528 "echo64.c" 1
	movzbl  esi, bh
# 0 "" 2
# 528 "echo64.c" 1
	add     r15,  1
# 0 "" 2
# 528 "echo64.c" 1
	xor     rcx, [TB+8*rbp+2*256*8]
# 0 "" 2
# 528 "echo64.c" 1
	xor     rcx, [TC+8*rsi+3*256*8]
# 0 "" 2
# 528 "echo64.c" 1
	movzbl  ebp, dl
# 0 "" 2
# 528 "echo64.c" 1
	movzbl  esi, dh
# 0 "" 2
# 528 "echo64.c" 1
	ror     rdx, 16
# 0 "" 2
# 528 "echo64.c" 1
	mov    rbx,  [TC+8*rbp]
# 0 "" 2
# 528 "echo64.c" 1
	mov    rax,  [TB+8*rsi+1*256*8]
# 0 "" 2
# 528 "echo64.c" 1
	movzbl ebp, ch
# 0 "" 2
# 528 "echo64.c" 1
	movzbl esi, cl
# 0 "" 2
# 528 "echo64.c" 1
	ror    rcx, 16
# 0 "" 2
# 528 "echo64.c" 1
	xor    rbx, [TB+8*rbp+1*256*8]
# 0 "" 2
# 528 "echo64.c" 1
	xor    rax,  [TC+8*rsi]
# 0 "" 2
# 528 "echo64.c" 1
	movzbl  ebp, cl
# 0 "" 2
# 528 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 528 "echo64.c" 1
	ror     rcx, 16
# 0 "" 2
# 528 "echo64.c" 1
	xor    rbx,  [TC+8*rbp+2*256*8]
# 0 "" 2
# 528 "echo64.c" 1
	xor    rax,  [TB+8*rsi+3*256*8]
# 0 "" 2
# 528 "echo64.c" 1
	movzbl  ebp, dh
# 0 "" 2
# 528 "echo64.c" 1
	movzbl  esi, dl
# 0 "" 2
# 528 "echo64.c" 1
	ror     rdx, 16
# 0 "" 2
# 528 "echo64.c" 1
	xor    rbx, [TB+8*rbp+3*256*8]
# 0 "" 2
# 528 "echo64.c" 1
	xor    rax,  [TC+8*rsi+2*256*8]
# 0 "" 2
# 528 "echo64.c" 1
	movzbl  ebp, cl
# 0 "" 2
# 528 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 528 "echo64.c" 1
	ror    rcx, 16
# 0 "" 2
# 528 "echo64.c" 1
	xor    rax,  [TB+8*rbp]
# 0 "" 2
# 528 "echo64.c" 1
	xor    rax,   [TC+8*rsi+1*256*8]
# 0 "" 2
# 528 "echo64.c" 1
	movzbl ebp, dl
# 0 "" 2
# 528 "echo64.c" 1
	movzbl esi, dh
# 0 "" 2
# 528 "echo64.c" 1
	ror    rdx, 16
# 0 "" 2
# 528 "echo64.c" 1
	xor    rbx,  [TB+8*rbp]
# 0 "" 2
# 528 "echo64.c" 1
	xor    rbx,  [TC+8*rsi+1*256*8]
# 0 "" 2
# 528 "echo64.c" 1
	movzbl  ebp, dl
# 0 "" 2
# 528 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 528 "echo64.c" 1
	xor    rax,  [TB+8*rbp+2*256*8]
# 0 "" 2
# 528 "echo64.c" 1
	xor    rbx,  [TC+8*rsi+3*256*8]
# 0 "" 2
# 528 "echo64.c" 1
	movzbl  ebp, dh
# 0 "" 2
# 528 "echo64.c" 1
	movzbl  esi, cl
# 0 "" 2
# 528 "echo64.c" 1
	xor    rax,  [TC+8*rbp+3*256*8]
# 0 "" 2
# 528 "echo64.c" 1
	xor    rbx,  [TB+8*rsi+2*256*8]
# 0 "" 2
# 528 "echo64.c" 1
	mov   [rdi+16*16+16*9],   rax
# 0 "" 2
# 528 "echo64.c" 1
	mov   [rdi+16*16+16*9+8], rbx
# 0 "" 2
# 528 "echo64.c" 1
	mov    rax, [rdi+16*10]
# 0 "" 2
# 528 "echo64.c" 1
	mov    rbx, [rdi+16*10+8]
# 0 "" 2
# 529 "echo64.c" 1
	movzbl  ebp, ah
# 0 "" 2
# 529 "echo64.c" 1
	movzbl  esi, al
# 0 "" 2
# 529 "echo64.c" 1
	ror     rax,  0x10
# 0 "" 2
# 529 "echo64.c" 1
	mov     rdx,  [TB+8*rbp+1*256*8]
# 0 "" 2
# 529 "echo64.c" 1
	mov     rcx,  [TC+8*rsi]
# 0 "" 2
# 529 "echo64.c" 1
	movzbl ebp, bl
# 0 "" 2
# 529 "echo64.c" 1
	movzbl esi, bh
# 0 "" 2
# 529 "echo64.c" 1
	ror    rbx,  0x10
# 0 "" 2
# 529 "echo64.c" 1
	xor    rdx, [TC+8*rbp]
# 0 "" 2
# 529 "echo64.c" 1
	xor    rcx, [TB+8*rsi+1*256*8]
# 0 "" 2
# 529 "echo64.c" 1
	movzbl ebp, al
# 0 "" 2
# 529 "echo64.c" 1
	movzbl esi, ah
# 0 "" 2
# 529 "echo64.c" 1
	ror    rax, 16
# 0 "" 2
# 529 "echo64.c" 1
	xor    rdx, [TC+8*rbp+2*256*8]
# 0 "" 2
# 529 "echo64.c" 1
	xor    rcx, [TB+8*rsi+3*256*8]
# 0 "" 2
# 529 "echo64.c" 1
	movzbl ebp, bh
# 0 "" 2
# 529 "echo64.c" 1
	movzbl esi, bl
# 0 "" 2
# 529 "echo64.c" 1
	ror    rbx, 16
# 0 "" 2
# 529 "echo64.c" 1
	xor    rdx, [TB+8*rbp+3*256*8]
# 0 "" 2
# 529 "echo64.c" 1
	xor    rcx, [TC+8*rsi+2*256*8]
# 0 "" 2
# 529 "echo64.c" 1
	movzbl ebp, ah
# 0 "" 2
# 529 "echo64.c" 1
	movzbl esi, al
# 0 "" 2
# 529 "echo64.c" 1
	ror    rax, 16
# 0 "" 2
# 529 "echo64.c" 1
	xor    rcx, [TC+8*rbp+1*256*8]
# 0 "" 2
# 529 "echo64.c" 1
	xor    rcx, [TB+8*rsi]
# 0 "" 2
# 529 "echo64.c" 1
	movzbl ebp, bl
# 0 "" 2
# 529 "echo64.c" 1
	movzbl esi, bh
# 0 "" 2
# 529 "echo64.c" 1
	ror    rbx, 16
# 0 "" 2
# 529 "echo64.c" 1
	xor    rdx, [TB+8*rbp]
# 0 "" 2
# 529 "echo64.c" 1
	xor    rdx, [TC+8*rsi+1*256*8]
# 0 "" 2
# 529 "echo64.c" 1
	movzbl  ebp, al
# 0 "" 2
# 529 "echo64.c" 1
	movzbl  esi, ah
# 0 "" 2
# 529 "echo64.c" 1
	xor     rcx,  r15
# 0 "" 2
# 529 "echo64.c" 1
	xor     rdx, [TB+8*rbp+2*256*8]
# 0 "" 2
# 529 "echo64.c" 1
	xor     rdx, [TC+8*rsi+3*256*8]
# 0 "" 2
# 529 "echo64.c" 1
	movzbl  ebp, bl
# 0 "" 2
# 529 "echo64.c" 1
	movzbl  esi, bh
# 0 "" 2
# 529 "echo64.c" 1
	add     r15,  1
# 0 "" 2
# 529 "echo64.c" 1
	xor     rcx, [TB+8*rbp+2*256*8]
# 0 "" 2
# 529 "echo64.c" 1
	xor     rcx, [TC+8*rsi+3*256*8]
# 0 "" 2
# 529 "echo64.c" 1
	movzbl  ebp, dl
# 0 "" 2
# 529 "echo64.c" 1
	movzbl  esi, dh
# 0 "" 2
# 529 "echo64.c" 1
	ror     rdx, 16
# 0 "" 2
# 529 "echo64.c" 1
	mov    rbx,  [TC+8*rbp]
# 0 "" 2
# 529 "echo64.c" 1
	mov    rax,  [TB+8*rsi+1*256*8]
# 0 "" 2
# 529 "echo64.c" 1
	movzbl ebp, ch
# 0 "" 2
# 529 "echo64.c" 1
	movzbl esi, cl
# 0 "" 2
# 529 "echo64.c" 1
	ror    rcx, 16
# 0 "" 2
# 529 "echo64.c" 1
	xor    rbx, [TB+8*rbp+1*256*8]
# 0 "" 2
# 529 "echo64.c" 1
	xor    rax,  [TC+8*rsi]
# 0 "" 2
# 529 "echo64.c" 1
	movzbl  ebp, cl
# 0 "" 2
# 529 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 529 "echo64.c" 1
	ror     rcx, 16
# 0 "" 2
# 529 "echo64.c" 1
	xor    rbx,  [TC+8*rbp+2*256*8]
# 0 "" 2
# 529 "echo64.c" 1
	xor    rax,  [TB+8*rsi+3*256*8]
# 0 "" 2
# 529 "echo64.c" 1
	movzbl  ebp, dh
# 0 "" 2
# 529 "echo64.c" 1
	movzbl  esi, dl
# 0 "" 2
# 529 "echo64.c" 1
	ror     rdx, 16
# 0 "" 2
# 529 "echo64.c" 1
	xor    rbx, [TB+8*rbp+3*256*8]
# 0 "" 2
# 529 "echo64.c" 1
	xor    rax,  [TC+8*rsi+2*256*8]
# 0 "" 2
# 529 "echo64.c" 1
	movzbl  ebp, cl
# 0 "" 2
# 529 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 529 "echo64.c" 1
	ror    rcx, 16
# 0 "" 2
# 529 "echo64.c" 1
	xor    rax,  [TB+8*rbp]
# 0 "" 2
# 529 "echo64.c" 1
	xor    rax,   [TC+8*rsi+1*256*8]
# 0 "" 2
# 529 "echo64.c" 1
	movzbl ebp, dl
# 0 "" 2
# 529 "echo64.c" 1
	movzbl esi, dh
# 0 "" 2
# 529 "echo64.c" 1
	ror    rdx, 16
# 0 "" 2
# 529 "echo64.c" 1
	xor    rbx,  [TB+8*rbp]
# 0 "" 2
# 529 "echo64.c" 1
	xor    rbx,  [TC+8*rsi+1*256*8]
# 0 "" 2
# 529 "echo64.c" 1
	movzbl  ebp, dl
# 0 "" 2
# 529 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 529 "echo64.c" 1
	xor    rax,  [TB+8*rbp+2*256*8]
# 0 "" 2
# 529 "echo64.c" 1
	xor    rbx,  [TC+8*rsi+3*256*8]
# 0 "" 2
# 529 "echo64.c" 1
	movzbl  ebp, dh
# 0 "" 2
# 529 "echo64.c" 1
	movzbl  esi, cl
# 0 "" 2
# 529 "echo64.c" 1
	xor    rax,  [TC+8*rbp+3*256*8]
# 0 "" 2
# 529 "echo64.c" 1
	xor    rbx,  [TB+8*rsi+2*256*8]
# 0 "" 2
# 529 "echo64.c" 1
	mov   [rdi+16*16+16*10],   rax
# 0 "" 2
# 529 "echo64.c" 1
	mov   [rdi+16*16+16*10+8], rbx
# 0 "" 2
# 529 "echo64.c" 1
	mov    rax, [rdi+16*11]
# 0 "" 2
# 529 "echo64.c" 1
	mov    rbx, [rdi+16*11+8]
# 0 "" 2
# 530 "echo64.c" 1
	movzbl  ebp, ah
# 0 "" 2
# 530 "echo64.c" 1
	movzbl  esi, al
# 0 "" 2
# 530 "echo64.c" 1
	ror     rax,  0x10
# 0 "" 2
# 530 "echo64.c" 1
	mov     rdx,  [TB+8*rbp+1*256*8]
# 0 "" 2
# 530 "echo64.c" 1
	mov     rcx,  [TC+8*rsi]
# 0 "" 2
# 530 "echo64.c" 1
	movzbl ebp, bl
# 0 "" 2
# 530 "echo64.c" 1
	movzbl esi, bh
# 0 "" 2
# 530 "echo64.c" 1
	ror    rbx,  0x10
# 0 "" 2
# 530 "echo64.c" 1
	xor    rdx, [TC+8*rbp]
# 0 "" 2
# 530 "echo64.c" 1
	xor    rcx, [TB+8*rsi+1*256*8]
# 0 "" 2
# 530 "echo64.c" 1
	movzbl ebp, al
# 0 "" 2
# 530 "echo64.c" 1
	movzbl esi, ah
# 0 "" 2
# 530 "echo64.c" 1
	ror    rax, 16
# 0 "" 2
# 530 "echo64.c" 1
	xor    rdx, [TC+8*rbp+2*256*8]
# 0 "" 2
# 530 "echo64.c" 1
	xor    rcx, [TB+8*rsi+3*256*8]
# 0 "" 2
# 530 "echo64.c" 1
	movzbl ebp, bh
# 0 "" 2
# 530 "echo64.c" 1
	movzbl esi, bl
# 0 "" 2
# 530 "echo64.c" 1
	ror    rbx, 16
# 0 "" 2
# 530 "echo64.c" 1
	xor    rdx, [TB+8*rbp+3*256*8]
# 0 "" 2
# 530 "echo64.c" 1
	xor    rcx, [TC+8*rsi+2*256*8]
# 0 "" 2
# 530 "echo64.c" 1
	movzbl ebp, ah
# 0 "" 2
# 530 "echo64.c" 1
	movzbl esi, al
# 0 "" 2
# 530 "echo64.c" 1
	ror    rax, 16
# 0 "" 2
# 530 "echo64.c" 1
	xor    rcx, [TC+8*rbp+1*256*8]
# 0 "" 2
# 530 "echo64.c" 1
	xor    rcx, [TB+8*rsi]
# 0 "" 2
# 530 "echo64.c" 1
	movzbl ebp, bl
# 0 "" 2
# 530 "echo64.c" 1
	movzbl esi, bh
# 0 "" 2
# 530 "echo64.c" 1
	ror    rbx, 16
# 0 "" 2
# 530 "echo64.c" 1
	xor    rdx, [TB+8*rbp]
# 0 "" 2
# 530 "echo64.c" 1
	xor    rdx, [TC+8*rsi+1*256*8]
# 0 "" 2
# 530 "echo64.c" 1
	movzbl  ebp, al
# 0 "" 2
# 530 "echo64.c" 1
	movzbl  esi, ah
# 0 "" 2
# 530 "echo64.c" 1
	xor     rcx,  r15
# 0 "" 2
# 530 "echo64.c" 1
	xor     rdx, [TB+8*rbp+2*256*8]
# 0 "" 2
# 530 "echo64.c" 1
	xor     rdx, [TC+8*rsi+3*256*8]
# 0 "" 2
# 530 "echo64.c" 1
	movzbl  ebp, bl
# 0 "" 2
# 530 "echo64.c" 1
	movzbl  esi, bh
# 0 "" 2
# 530 "echo64.c" 1
	add     r15,  1
# 0 "" 2
# 530 "echo64.c" 1
	xor     rcx, [TB+8*rbp+2*256*8]
# 0 "" 2
# 530 "echo64.c" 1
	xor     rcx, [TC+8*rsi+3*256*8]
# 0 "" 2
# 530 "echo64.c" 1
	movzbl  ebp, dl
# 0 "" 2
# 530 "echo64.c" 1
	movzbl  esi, dh
# 0 "" 2
# 530 "echo64.c" 1
	ror     rdx, 16
# 0 "" 2
# 530 "echo64.c" 1
	mov    rbx,  [TC+8*rbp]
# 0 "" 2
# 530 "echo64.c" 1
	mov    rax,  [TB+8*rsi+1*256*8]
# 0 "" 2
# 530 "echo64.c" 1
	movzbl ebp, ch
# 0 "" 2
# 530 "echo64.c" 1
	movzbl esi, cl
# 0 "" 2
# 530 "echo64.c" 1
	ror    rcx, 16
# 0 "" 2
# 530 "echo64.c" 1
	xor    rbx, [TB+8*rbp+1*256*8]
# 0 "" 2
# 530 "echo64.c" 1
	xor    rax,  [TC+8*rsi]
# 0 "" 2
# 530 "echo64.c" 1
	movzbl  ebp, cl
# 0 "" 2
# 530 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 530 "echo64.c" 1
	ror     rcx, 16
# 0 "" 2
# 530 "echo64.c" 1
	xor    rbx,  [TC+8*rbp+2*256*8]
# 0 "" 2
# 530 "echo64.c" 1
	xor    rax,  [TB+8*rsi+3*256*8]
# 0 "" 2
# 530 "echo64.c" 1
	movzbl  ebp, dh
# 0 "" 2
# 530 "echo64.c" 1
	movzbl  esi, dl
# 0 "" 2
# 530 "echo64.c" 1
	ror     rdx, 16
# 0 "" 2
# 530 "echo64.c" 1
	xor    rbx, [TB+8*rbp+3*256*8]
# 0 "" 2
# 530 "echo64.c" 1
	xor    rax,  [TC+8*rsi+2*256*8]
# 0 "" 2
# 530 "echo64.c" 1
	movzbl  ebp, cl
# 0 "" 2
# 530 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 530 "echo64.c" 1
	ror    rcx, 16
# 0 "" 2
# 530 "echo64.c" 1
	xor    rax,  [TB+8*rbp]
# 0 "" 2
# 530 "echo64.c" 1
	xor    rax,   [TC+8*rsi+1*256*8]
# 0 "" 2
# 530 "echo64.c" 1
	movzbl ebp, dl
# 0 "" 2
# 530 "echo64.c" 1
	movzbl esi, dh
# 0 "" 2
# 530 "echo64.c" 1
	ror    rdx, 16
# 0 "" 2
# 530 "echo64.c" 1
	xor    rbx,  [TB+8*rbp]
# 0 "" 2
# 530 "echo64.c" 1
	xor    rbx,  [TC+8*rsi+1*256*8]
# 0 "" 2
# 530 "echo64.c" 1
	movzbl  ebp, dl
# 0 "" 2
# 530 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 530 "echo64.c" 1
	xor    rax,  [TB+8*rbp+2*256*8]
# 0 "" 2
# 530 "echo64.c" 1
	xor    rbx,  [TC+8*rsi+3*256*8]
# 0 "" 2
# 530 "echo64.c" 1
	movzbl  ebp, dh
# 0 "" 2
# 530 "echo64.c" 1
	movzbl  esi, cl
# 0 "" 2
# 530 "echo64.c" 1
	xor    rax,  [TC+8*rbp+3*256*8]
# 0 "" 2
# 530 "echo64.c" 1
	xor    rbx,  [TB+8*rsi+2*256*8]
# 0 "" 2
# 530 "echo64.c" 1
	mov   [rdi+16*16+16*11],   rax
# 0 "" 2
# 530 "echo64.c" 1
	mov   [rdi+16*16+16*11+8], rbx
# 0 "" 2
# 530 "echo64.c" 1
	mov    rax, [rdi+16*12]
# 0 "" 2
# 530 "echo64.c" 1
	mov    rbx, [rdi+16*12+8]
# 0 "" 2
# 531 "echo64.c" 1
	movzbl  ebp, ah
# 0 "" 2
# 531 "echo64.c" 1
	movzbl  esi, al
# 0 "" 2
# 531 "echo64.c" 1
	ror     rax,  0x10
# 0 "" 2
# 531 "echo64.c" 1
	mov     rdx,  [TB+8*rbp+1*256*8]
# 0 "" 2
# 531 "echo64.c" 1
	mov     rcx,  [TC+8*rsi]
# 0 "" 2
# 531 "echo64.c" 1
	movzbl ebp, bl
# 0 "" 2
# 531 "echo64.c" 1
	movzbl esi, bh
# 0 "" 2
# 531 "echo64.c" 1
	ror    rbx,  0x10
# 0 "" 2
# 531 "echo64.c" 1
	xor    rdx, [TC+8*rbp]
# 0 "" 2
# 531 "echo64.c" 1
	xor    rcx, [TB+8*rsi+1*256*8]
# 0 "" 2
# 531 "echo64.c" 1
	movzbl ebp, al
# 0 "" 2
# 531 "echo64.c" 1
	movzbl esi, ah
# 0 "" 2
# 531 "echo64.c" 1
	ror    rax, 16
# 0 "" 2
# 531 "echo64.c" 1
	xor    rdx, [TC+8*rbp+2*256*8]
# 0 "" 2
# 531 "echo64.c" 1
	xor    rcx, [TB+8*rsi+3*256*8]
# 0 "" 2
# 531 "echo64.c" 1
	movzbl ebp, bh
# 0 "" 2
# 531 "echo64.c" 1
	movzbl esi, bl
# 0 "" 2
# 531 "echo64.c" 1
	ror    rbx, 16
# 0 "" 2
# 531 "echo64.c" 1
	xor    rdx, [TB+8*rbp+3*256*8]
# 0 "" 2
# 531 "echo64.c" 1
	xor    rcx, [TC+8*rsi+2*256*8]
# 0 "" 2
# 531 "echo64.c" 1
	movzbl ebp, ah
# 0 "" 2
# 531 "echo64.c" 1
	movzbl esi, al
# 0 "" 2
# 531 "echo64.c" 1
	ror    rax, 16
# 0 "" 2
# 531 "echo64.c" 1
	xor    rcx, [TC+8*rbp+1*256*8]
# 0 "" 2
# 531 "echo64.c" 1
	xor    rcx, [TB+8*rsi]
# 0 "" 2
# 531 "echo64.c" 1
	movzbl ebp, bl
# 0 "" 2
# 531 "echo64.c" 1
	movzbl esi, bh
# 0 "" 2
# 531 "echo64.c" 1
	ror    rbx, 16
# 0 "" 2
# 531 "echo64.c" 1
	xor    rdx, [TB+8*rbp]
# 0 "" 2
# 531 "echo64.c" 1
	xor    rdx, [TC+8*rsi+1*256*8]
# 0 "" 2
# 531 "echo64.c" 1
	movzbl  ebp, al
# 0 "" 2
# 531 "echo64.c" 1
	movzbl  esi, ah
# 0 "" 2
# 531 "echo64.c" 1
	xor     rcx,  r15
# 0 "" 2
# 531 "echo64.c" 1
	xor     rdx, [TB+8*rbp+2*256*8]
# 0 "" 2
# 531 "echo64.c" 1
	xor     rdx, [TC+8*rsi+3*256*8]
# 0 "" 2
# 531 "echo64.c" 1
	movzbl  ebp, bl
# 0 "" 2
# 531 "echo64.c" 1
	movzbl  esi, bh
# 0 "" 2
# 531 "echo64.c" 1
	add     r15,  1
# 0 "" 2
# 531 "echo64.c" 1
	xor     rcx, [TB+8*rbp+2*256*8]
# 0 "" 2
# 531 "echo64.c" 1
	xor     rcx, [TC+8*rsi+3*256*8]
# 0 "" 2
# 531 "echo64.c" 1
	movzbl  ebp, dl
# 0 "" 2
# 531 "echo64.c" 1
	movzbl  esi, dh
# 0 "" 2
# 531 "echo64.c" 1
	ror     rdx, 16
# 0 "" 2
# 531 "echo64.c" 1
	mov    rbx,  [TC+8*rbp]
# 0 "" 2
# 531 "echo64.c" 1
	mov    rax,  [TB+8*rsi+1*256*8]
# 0 "" 2
# 531 "echo64.c" 1
	movzbl ebp, ch
# 0 "" 2
# 531 "echo64.c" 1
	movzbl esi, cl
# 0 "" 2
# 531 "echo64.c" 1
	ror    rcx, 16
# 0 "" 2
# 531 "echo64.c" 1
	xor    rbx, [TB+8*rbp+1*256*8]
# 0 "" 2
# 531 "echo64.c" 1
	xor    rax,  [TC+8*rsi]
# 0 "" 2
# 531 "echo64.c" 1
	movzbl  ebp, cl
# 0 "" 2
# 531 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 531 "echo64.c" 1
	ror     rcx, 16
# 0 "" 2
# 531 "echo64.c" 1
	xor    rbx,  [TC+8*rbp+2*256*8]
# 0 "" 2
# 531 "echo64.c" 1
	xor    rax,  [TB+8*rsi+3*256*8]
# 0 "" 2
# 531 "echo64.c" 1
	movzbl  ebp, dh
# 0 "" 2
# 531 "echo64.c" 1
	movzbl  esi, dl
# 0 "" 2
# 531 "echo64.c" 1
	ror     rdx, 16
# 0 "" 2
# 531 "echo64.c" 1
	xor    rbx, [TB+8*rbp+3*256*8]
# 0 "" 2
# 531 "echo64.c" 1
	xor    rax,  [TC+8*rsi+2*256*8]
# 0 "" 2
# 531 "echo64.c" 1
	movzbl  ebp, cl
# 0 "" 2
# 531 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 531 "echo64.c" 1
	ror    rcx, 16
# 0 "" 2
# 531 "echo64.c" 1
	xor    rax,  [TB+8*rbp]
# 0 "" 2
# 531 "echo64.c" 1
	xor    rax,   [TC+8*rsi+1*256*8]
# 0 "" 2
# 531 "echo64.c" 1
	movzbl ebp, dl
# 0 "" 2
# 531 "echo64.c" 1
	movzbl esi, dh
# 0 "" 2
# 531 "echo64.c" 1
	ror    rdx, 16
# 0 "" 2
# 531 "echo64.c" 1
	xor    rbx,  [TB+8*rbp]
# 0 "" 2
# 531 "echo64.c" 1
	xor    rbx,  [TC+8*rsi+1*256*8]
# 0 "" 2
# 531 "echo64.c" 1
	movzbl  ebp, dl
# 0 "" 2
# 531 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 531 "echo64.c" 1
	xor    rax,  [TB+8*rbp+2*256*8]
# 0 "" 2
# 531 "echo64.c" 1
	xor    rbx,  [TC+8*rsi+3*256*8]
# 0 "" 2
# 531 "echo64.c" 1
	movzbl  ebp, dh
# 0 "" 2
# 531 "echo64.c" 1
	movzbl  esi, cl
# 0 "" 2
# 531 "echo64.c" 1
	xor    rax,  [TC+8*rbp+3*256*8]
# 0 "" 2
# 531 "echo64.c" 1
	xor    rbx,  [TB+8*rsi+2*256*8]
# 0 "" 2
# 531 "echo64.c" 1
	mov   [rdi+16*16+16*12],   rax
# 0 "" 2
# 531 "echo64.c" 1
	mov   [rdi+16*16+16*12+8], rbx
# 0 "" 2
# 531 "echo64.c" 1
	mov    rax, [rdi+16*13]
# 0 "" 2
# 531 "echo64.c" 1
	mov    rbx, [rdi+16*13+8]
# 0 "" 2
# 532 "echo64.c" 1
	movzbl  ebp, ah
# 0 "" 2
# 532 "echo64.c" 1
	movzbl  esi, al
# 0 "" 2
# 532 "echo64.c" 1
	ror     rax,  0x10
# 0 "" 2
# 532 "echo64.c" 1
	mov     rdx,  [TB+8*rbp+1*256*8]
# 0 "" 2
# 532 "echo64.c" 1
	mov     rcx,  [TC+8*rsi]
# 0 "" 2
# 532 "echo64.c" 1
	movzbl ebp, bl
# 0 "" 2
# 532 "echo64.c" 1
	movzbl esi, bh
# 0 "" 2
# 532 "echo64.c" 1
	ror    rbx,  0x10
# 0 "" 2
# 532 "echo64.c" 1
	xor    rdx, [TC+8*rbp]
# 0 "" 2
# 532 "echo64.c" 1
	xor    rcx, [TB+8*rsi+1*256*8]
# 0 "" 2
# 532 "echo64.c" 1
	movzbl ebp, al
# 0 "" 2
# 532 "echo64.c" 1
	movzbl esi, ah
# 0 "" 2
# 532 "echo64.c" 1
	ror    rax, 16
# 0 "" 2
# 532 "echo64.c" 1
	xor    rdx, [TC+8*rbp+2*256*8]
# 0 "" 2
# 532 "echo64.c" 1
	xor    rcx, [TB+8*rsi+3*256*8]
# 0 "" 2
# 532 "echo64.c" 1
	movzbl ebp, bh
# 0 "" 2
# 532 "echo64.c" 1
	movzbl esi, bl
# 0 "" 2
# 532 "echo64.c" 1
	ror    rbx, 16
# 0 "" 2
# 532 "echo64.c" 1
	xor    rdx, [TB+8*rbp+3*256*8]
# 0 "" 2
# 532 "echo64.c" 1
	xor    rcx, [TC+8*rsi+2*256*8]
# 0 "" 2
# 532 "echo64.c" 1
	movzbl ebp, ah
# 0 "" 2
# 532 "echo64.c" 1
	movzbl esi, al
# 0 "" 2
# 532 "echo64.c" 1
	ror    rax, 16
# 0 "" 2
# 532 "echo64.c" 1
	xor    rcx, [TC+8*rbp+1*256*8]
# 0 "" 2
# 532 "echo64.c" 1
	xor    rcx, [TB+8*rsi]
# 0 "" 2
# 532 "echo64.c" 1
	movzbl ebp, bl
# 0 "" 2
# 532 "echo64.c" 1
	movzbl esi, bh
# 0 "" 2
# 532 "echo64.c" 1
	ror    rbx, 16
# 0 "" 2
# 532 "echo64.c" 1
	xor    rdx, [TB+8*rbp]
# 0 "" 2
# 532 "echo64.c" 1
	xor    rdx, [TC+8*rsi+1*256*8]
# 0 "" 2
# 532 "echo64.c" 1
	movzbl  ebp, al
# 0 "" 2
# 532 "echo64.c" 1
	movzbl  esi, ah
# 0 "" 2
# 532 "echo64.c" 1
	xor     rcx,  r15
# 0 "" 2
# 532 "echo64.c" 1
	xor     rdx, [TB+8*rbp+2*256*8]
# 0 "" 2
# 532 "echo64.c" 1
	xor     rdx, [TC+8*rsi+3*256*8]
# 0 "" 2
# 532 "echo64.c" 1
	movzbl  ebp, bl
# 0 "" 2
# 532 "echo64.c" 1
	movzbl  esi, bh
# 0 "" 2
# 532 "echo64.c" 1
	add     r15,  1
# 0 "" 2
# 532 "echo64.c" 1
	xor     rcx, [TB+8*rbp+2*256*8]
# 0 "" 2
# 532 "echo64.c" 1
	xor     rcx, [TC+8*rsi+3*256*8]
# 0 "" 2
# 532 "echo64.c" 1
	movzbl  ebp, dl
# 0 "" 2
# 532 "echo64.c" 1
	movzbl  esi, dh
# 0 "" 2
# 532 "echo64.c" 1
	ror     rdx, 16
# 0 "" 2
# 532 "echo64.c" 1
	mov    rbx,  [TC+8*rbp]
# 0 "" 2
# 532 "echo64.c" 1
	mov    rax,  [TB+8*rsi+1*256*8]
# 0 "" 2
# 532 "echo64.c" 1
	movzbl ebp, ch
# 0 "" 2
# 532 "echo64.c" 1
	movzbl esi, cl
# 0 "" 2
# 532 "echo64.c" 1
	ror    rcx, 16
# 0 "" 2
# 532 "echo64.c" 1
	xor    rbx, [TB+8*rbp+1*256*8]
# 0 "" 2
# 532 "echo64.c" 1
	xor    rax,  [TC+8*rsi]
# 0 "" 2
# 532 "echo64.c" 1
	movzbl  ebp, cl
# 0 "" 2
# 532 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 532 "echo64.c" 1
	ror     rcx, 16
# 0 "" 2
# 532 "echo64.c" 1
	xor    rbx,  [TC+8*rbp+2*256*8]
# 0 "" 2
# 532 "echo64.c" 1
	xor    rax,  [TB+8*rsi+3*256*8]
# 0 "" 2
# 532 "echo64.c" 1
	movzbl  ebp, dh
# 0 "" 2
# 532 "echo64.c" 1
	movzbl  esi, dl
# 0 "" 2
# 532 "echo64.c" 1
	ror     rdx, 16
# 0 "" 2
# 532 "echo64.c" 1
	xor    rbx, [TB+8*rbp+3*256*8]
# 0 "" 2
# 532 "echo64.c" 1
	xor    rax,  [TC+8*rsi+2*256*8]
# 0 "" 2
# 532 "echo64.c" 1
	movzbl  ebp, cl
# 0 "" 2
# 532 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 532 "echo64.c" 1
	ror    rcx, 16
# 0 "" 2
# 532 "echo64.c" 1
	xor    rax,  [TB+8*rbp]
# 0 "" 2
# 532 "echo64.c" 1
	xor    rax,   [TC+8*rsi+1*256*8]
# 0 "" 2
# 532 "echo64.c" 1
	movzbl ebp, dl
# 0 "" 2
# 532 "echo64.c" 1
	movzbl esi, dh
# 0 "" 2
# 532 "echo64.c" 1
	ror    rdx, 16
# 0 "" 2
# 532 "echo64.c" 1
	xor    rbx,  [TB+8*rbp]
# 0 "" 2
# 532 "echo64.c" 1
	xor    rbx,  [TC+8*rsi+1*256*8]
# 0 "" 2
# 532 "echo64.c" 1
	movzbl  ebp, dl
# 0 "" 2
# 532 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 532 "echo64.c" 1
	xor    rax,  [TB+8*rbp+2*256*8]
# 0 "" 2
# 532 "echo64.c" 1
	xor    rbx,  [TC+8*rsi+3*256*8]
# 0 "" 2
# 532 "echo64.c" 1
	movzbl  ebp, dh
# 0 "" 2
# 532 "echo64.c" 1
	movzbl  esi, cl
# 0 "" 2
# 532 "echo64.c" 1
	xor    rax,  [TC+8*rbp+3*256*8]
# 0 "" 2
# 532 "echo64.c" 1
	xor    rbx,  [TB+8*rsi+2*256*8]
# 0 "" 2
# 532 "echo64.c" 1
	mov   [rdi+16*16+16*13],   rax
# 0 "" 2
# 532 "echo64.c" 1
	mov   [rdi+16*16+16*13+8], rbx
# 0 "" 2
# 532 "echo64.c" 1
	mov    rax, [rdi+16*14]
# 0 "" 2
# 532 "echo64.c" 1
	mov    rbx, [rdi+16*14+8]
# 0 "" 2
# 533 "echo64.c" 1
	movzbl  ebp, ah
# 0 "" 2
# 533 "echo64.c" 1
	movzbl  esi, al
# 0 "" 2
# 533 "echo64.c" 1
	ror     rax,  0x10
# 0 "" 2
# 533 "echo64.c" 1
	mov     rdx,  [TB+8*rbp+1*256*8]
# 0 "" 2
# 533 "echo64.c" 1
	mov     rcx,  [TC+8*rsi]
# 0 "" 2
# 533 "echo64.c" 1
	movzbl ebp, bl
# 0 "" 2
# 533 "echo64.c" 1
	movzbl esi, bh
# 0 "" 2
# 533 "echo64.c" 1
	ror    rbx,  0x10
# 0 "" 2
# 533 "echo64.c" 1
	xor    rdx, [TC+8*rbp]
# 0 "" 2
# 533 "echo64.c" 1
	xor    rcx, [TB+8*rsi+1*256*8]
# 0 "" 2
# 533 "echo64.c" 1
	movzbl ebp, al
# 0 "" 2
# 533 "echo64.c" 1
	movzbl esi, ah
# 0 "" 2
# 533 "echo64.c" 1
	ror    rax, 16
# 0 "" 2
# 533 "echo64.c" 1
	xor    rdx, [TC+8*rbp+2*256*8]
# 0 "" 2
# 533 "echo64.c" 1
	xor    rcx, [TB+8*rsi+3*256*8]
# 0 "" 2
# 533 "echo64.c" 1
	movzbl ebp, bh
# 0 "" 2
# 533 "echo64.c" 1
	movzbl esi, bl
# 0 "" 2
# 533 "echo64.c" 1
	ror    rbx, 16
# 0 "" 2
# 533 "echo64.c" 1
	xor    rdx, [TB+8*rbp+3*256*8]
# 0 "" 2
# 533 "echo64.c" 1
	xor    rcx, [TC+8*rsi+2*256*8]
# 0 "" 2
# 533 "echo64.c" 1
	movzbl ebp, ah
# 0 "" 2
# 533 "echo64.c" 1
	movzbl esi, al
# 0 "" 2
# 533 "echo64.c" 1
	ror    rax, 16
# 0 "" 2
# 533 "echo64.c" 1
	xor    rcx, [TC+8*rbp+1*256*8]
# 0 "" 2
# 533 "echo64.c" 1
	xor    rcx, [TB+8*rsi]
# 0 "" 2
# 533 "echo64.c" 1
	movzbl ebp, bl
# 0 "" 2
# 533 "echo64.c" 1
	movzbl esi, bh
# 0 "" 2
# 533 "echo64.c" 1
	ror    rbx, 16
# 0 "" 2
# 533 "echo64.c" 1
	xor    rdx, [TB+8*rbp]
# 0 "" 2
# 533 "echo64.c" 1
	xor    rdx, [TC+8*rsi+1*256*8]
# 0 "" 2
# 533 "echo64.c" 1
	movzbl  ebp, al
# 0 "" 2
# 533 "echo64.c" 1
	movzbl  esi, ah
# 0 "" 2
# 533 "echo64.c" 1
	xor     rcx,  r15
# 0 "" 2
# 533 "echo64.c" 1
	xor     rdx, [TB+8*rbp+2*256*8]
# 0 "" 2
# 533 "echo64.c" 1
	xor     rdx, [TC+8*rsi+3*256*8]
# 0 "" 2
# 533 "echo64.c" 1
	movzbl  ebp, bl
# 0 "" 2
# 533 "echo64.c" 1
	movzbl  esi, bh
# 0 "" 2
# 533 "echo64.c" 1
	add     r15,  1
# 0 "" 2
# 533 "echo64.c" 1
	xor     rcx, [TB+8*rbp+2*256*8]
# 0 "" 2
# 533 "echo64.c" 1
	xor     rcx, [TC+8*rsi+3*256*8]
# 0 "" 2
# 533 "echo64.c" 1
	movzbl  ebp, dl
# 0 "" 2
# 533 "echo64.c" 1
	movzbl  esi, dh
# 0 "" 2
# 533 "echo64.c" 1
	ror     rdx, 16
# 0 "" 2
# 533 "echo64.c" 1
	mov    rbx,  [TC+8*rbp]
# 0 "" 2
# 533 "echo64.c" 1
	mov    rax,  [TB+8*rsi+1*256*8]
# 0 "" 2
# 533 "echo64.c" 1
	movzbl ebp, ch
# 0 "" 2
# 533 "echo64.c" 1
	movzbl esi, cl
# 0 "" 2
# 533 "echo64.c" 1
	ror    rcx, 16
# 0 "" 2
# 533 "echo64.c" 1
	xor    rbx, [TB+8*rbp+1*256*8]
# 0 "" 2
# 533 "echo64.c" 1
	xor    rax,  [TC+8*rsi]
# 0 "" 2
# 533 "echo64.c" 1
	movzbl  ebp, cl
# 0 "" 2
# 533 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 533 "echo64.c" 1
	ror     rcx, 16
# 0 "" 2
# 533 "echo64.c" 1
	xor    rbx,  [TC+8*rbp+2*256*8]
# 0 "" 2
# 533 "echo64.c" 1
	xor    rax,  [TB+8*rsi+3*256*8]
# 0 "" 2
# 533 "echo64.c" 1
	movzbl  ebp, dh
# 0 "" 2
# 533 "echo64.c" 1
	movzbl  esi, dl
# 0 "" 2
# 533 "echo64.c" 1
	ror     rdx, 16
# 0 "" 2
# 533 "echo64.c" 1
	xor    rbx, [TB+8*rbp+3*256*8]
# 0 "" 2
# 533 "echo64.c" 1
	xor    rax,  [TC+8*rsi+2*256*8]
# 0 "" 2
# 533 "echo64.c" 1
	movzbl  ebp, cl
# 0 "" 2
# 533 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 533 "echo64.c" 1
	ror    rcx, 16
# 0 "" 2
# 533 "echo64.c" 1
	xor    rax,  [TB+8*rbp]
# 0 "" 2
# 533 "echo64.c" 1
	xor    rax,   [TC+8*rsi+1*256*8]
# 0 "" 2
# 533 "echo64.c" 1
	movzbl ebp, dl
# 0 "" 2
# 533 "echo64.c" 1
	movzbl esi, dh
# 0 "" 2
# 533 "echo64.c" 1
	ror    rdx, 16
# 0 "" 2
# 533 "echo64.c" 1
	xor    rbx,  [TB+8*rbp]
# 0 "" 2
# 533 "echo64.c" 1
	xor    rbx,  [TC+8*rsi+1*256*8]
# 0 "" 2
# 533 "echo64.c" 1
	movzbl  ebp, dl
# 0 "" 2
# 533 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 533 "echo64.c" 1
	xor    rax,  [TB+8*rbp+2*256*8]
# 0 "" 2
# 533 "echo64.c" 1
	xor    rbx,  [TC+8*rsi+3*256*8]
# 0 "" 2
# 533 "echo64.c" 1
	movzbl  ebp, dh
# 0 "" 2
# 533 "echo64.c" 1
	movzbl  esi, cl
# 0 "" 2
# 533 "echo64.c" 1
	xor    rax,  [TC+8*rbp+3*256*8]
# 0 "" 2
# 533 "echo64.c" 1
	xor    rbx,  [TB+8*rsi+2*256*8]
# 0 "" 2
# 533 "echo64.c" 1
	mov   [rdi+16*16+16*14],   rax
# 0 "" 2
# 533 "echo64.c" 1
	mov   [rdi+16*16+16*14+8], rbx
# 0 "" 2
# 533 "echo64.c" 1
	mov    rax, [rdi+16*15]
# 0 "" 2
# 533 "echo64.c" 1
	mov    rbx, [rdi+16*15+8]
# 0 "" 2
# 534 "echo64.c" 1
	movzbl  ebp, ah
# 0 "" 2
# 534 "echo64.c" 1
	movzbl  esi, al
# 0 "" 2
# 534 "echo64.c" 1
	ror     rax,  0x10
# 0 "" 2
# 534 "echo64.c" 1
	mov     rdx,  [TB+8*rbp+1*256*8]
# 0 "" 2
# 534 "echo64.c" 1
	mov     rcx,  [TC+8*rsi]
# 0 "" 2
# 534 "echo64.c" 1
	movzbl ebp, bl
# 0 "" 2
# 534 "echo64.c" 1
	movzbl esi, bh
# 0 "" 2
# 534 "echo64.c" 1
	ror    rbx,  0x10
# 0 "" 2
# 534 "echo64.c" 1
	xor    rdx, [TC+8*rbp]
# 0 "" 2
# 534 "echo64.c" 1
	xor    rcx, [TB+8*rsi+1*256*8]
# 0 "" 2
# 534 "echo64.c" 1
	movzbl ebp, al
# 0 "" 2
# 534 "echo64.c" 1
	movzbl esi, ah
# 0 "" 2
# 534 "echo64.c" 1
	ror    rax, 16
# 0 "" 2
# 534 "echo64.c" 1
	xor    rdx, [TC+8*rbp+2*256*8]
# 0 "" 2
# 534 "echo64.c" 1
	xor    rcx, [TB+8*rsi+3*256*8]
# 0 "" 2
# 534 "echo64.c" 1
	movzbl ebp, bh
# 0 "" 2
# 534 "echo64.c" 1
	movzbl esi, bl
# 0 "" 2
# 534 "echo64.c" 1
	ror    rbx, 16
# 0 "" 2
# 534 "echo64.c" 1
	xor    rdx, [TB+8*rbp+3*256*8]
# 0 "" 2
# 534 "echo64.c" 1
	xor    rcx, [TC+8*rsi+2*256*8]
# 0 "" 2
# 534 "echo64.c" 1
	movzbl ebp, ah
# 0 "" 2
# 534 "echo64.c" 1
	movzbl esi, al
# 0 "" 2
# 534 "echo64.c" 1
	ror    rax, 16
# 0 "" 2
# 534 "echo64.c" 1
	xor    rcx, [TC+8*rbp+1*256*8]
# 0 "" 2
# 534 "echo64.c" 1
	xor    rcx, [TB+8*rsi]
# 0 "" 2
# 534 "echo64.c" 1
	movzbl ebp, bl
# 0 "" 2
# 534 "echo64.c" 1
	movzbl esi, bh
# 0 "" 2
# 534 "echo64.c" 1
	ror    rbx, 16
# 0 "" 2
# 534 "echo64.c" 1
	xor    rdx, [TB+8*rbp]
# 0 "" 2
# 534 "echo64.c" 1
	xor    rdx, [TC+8*rsi+1*256*8]
# 0 "" 2
# 534 "echo64.c" 1
	movzbl  ebp, al
# 0 "" 2
# 534 "echo64.c" 1
	movzbl  esi, ah
# 0 "" 2
# 534 "echo64.c" 1
	xor     rcx,  r15
# 0 "" 2
# 534 "echo64.c" 1
	xor     rdx, [TB+8*rbp+2*256*8]
# 0 "" 2
# 534 "echo64.c" 1
	xor     rdx, [TC+8*rsi+3*256*8]
# 0 "" 2
# 534 "echo64.c" 1
	movzbl  ebp, bl
# 0 "" 2
# 534 "echo64.c" 1
	movzbl  esi, bh
# 0 "" 2
# 534 "echo64.c" 1
	add     r15,  1
# 0 "" 2
# 534 "echo64.c" 1
	xor     rcx, [TB+8*rbp+2*256*8]
# 0 "" 2
# 534 "echo64.c" 1
	xor     rcx, [TC+8*rsi+3*256*8]
# 0 "" 2
# 534 "echo64.c" 1
	movzbl  ebp, dl
# 0 "" 2
# 534 "echo64.c" 1
	movzbl  esi, dh
# 0 "" 2
# 534 "echo64.c" 1
	ror     rdx, 16
# 0 "" 2
# 534 "echo64.c" 1
	mov    rbx,  [TC+8*rbp]
# 0 "" 2
# 534 "echo64.c" 1
	mov    rax,  [TB+8*rsi+1*256*8]
# 0 "" 2
# 534 "echo64.c" 1
	movzbl ebp, ch
# 0 "" 2
# 534 "echo64.c" 1
	movzbl esi, cl
# 0 "" 2
# 534 "echo64.c" 1
	ror    rcx, 16
# 0 "" 2
# 534 "echo64.c" 1
	xor    rbx, [TB+8*rbp+1*256*8]
# 0 "" 2
# 534 "echo64.c" 1
	xor    rax,  [TC+8*rsi]
# 0 "" 2
# 534 "echo64.c" 1
	movzbl  ebp, cl
# 0 "" 2
# 534 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 534 "echo64.c" 1
	ror     rcx, 16
# 0 "" 2
# 534 "echo64.c" 1
	xor    rbx,  [TC+8*rbp+2*256*8]
# 0 "" 2
# 534 "echo64.c" 1
	xor    rax,  [TB+8*rsi+3*256*8]
# 0 "" 2
# 534 "echo64.c" 1
	movzbl  ebp, dh
# 0 "" 2
# 534 "echo64.c" 1
	movzbl  esi, dl
# 0 "" 2
# 534 "echo64.c" 1
	ror     rdx, 16
# 0 "" 2
# 534 "echo64.c" 1
	xor    rbx, [TB+8*rbp+3*256*8]
# 0 "" 2
# 534 "echo64.c" 1
	xor    rax,  [TC+8*rsi+2*256*8]
# 0 "" 2
# 534 "echo64.c" 1
	movzbl  ebp, cl
# 0 "" 2
# 534 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 534 "echo64.c" 1
	ror    rcx, 16
# 0 "" 2
# 534 "echo64.c" 1
	xor    rax,  [TB+8*rbp]
# 0 "" 2
# 534 "echo64.c" 1
	xor    rax,   [TC+8*rsi+1*256*8]
# 0 "" 2
# 534 "echo64.c" 1
	movzbl ebp, dl
# 0 "" 2
# 534 "echo64.c" 1
	movzbl esi, dh
# 0 "" 2
# 534 "echo64.c" 1
	ror    rdx, 16
# 0 "" 2
# 534 "echo64.c" 1
	xor    rbx,  [TB+8*rbp]
# 0 "" 2
# 534 "echo64.c" 1
	xor    rbx,  [TC+8*rsi+1*256*8]
# 0 "" 2
# 534 "echo64.c" 1
	movzbl  ebp, dl
# 0 "" 2
# 534 "echo64.c" 1
	movzbl  esi, ch
# 0 "" 2
# 534 "echo64.c" 1
	xor    rax,  [TB+8*rbp+2*256*8]
# 0 "" 2
# 534 "echo64.c" 1
	xor    rbx,  [TC+8*rsi+3*256*8]
# 0 "" 2
# 534 "echo64.c" 1
	movzbl  ebp, dh
# 0 "" 2
# 534 "echo64.c" 1
	movzbl  esi, cl
# 0 "" 2
# 534 "echo64.c" 1
	xor     rax,  [TC+8*rbp+3*256*8]
# 0 "" 2
# 534 "echo64.c" 1
	xor     rbx,  [TB+8*rsi+2*256*8]
# 0 "" 2
# 534 "echo64.c" 1
	mov    [rdi+16*16+16*15],   rax
# 0 "" 2
# 534 "echo64.c" 1
	mov    [rdi+16*16+16*15+8], rbx
# 0 "" 2
# 535 "echo64.c" 1
	mov  rax,  [rdi+16*16+16*0]
# 0 "" 2
# 535 "echo64.c" 1
	mov  rbx,  [rdi+16*16+16*5]
# 0 "" 2
# 535 "echo64.c" 1
	mov  rbp,  rax
# 0 "" 2
# 535 "echo64.c" 1
	mov  rcx,  [rdi+16*16+16*10]
# 0 "" 2
# 535 "echo64.c" 1
	mov  rdx,  [rdi+16*16+16*15]
# 0 "" 2
# 535 "echo64.c" 1
	mov  r13,  rcx
# 0 "" 2
# 535 "echo64.c" 1
	mov  r9,   rdx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  rbx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  rdx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  rbp
# 0 "" 2
# 535 "echo64.c" 1
	mov    rbx,  rax
# 0 "" 2
# 535 "echo64.c" 1
	xor    rbx,  rcx
# 0 "" 2
# 535 "echo64.c" 1
	mov    r10,  rax
# 0 "" 2
# 535 "echo64.c" 1
	mov    r11,  rcx
# 0 "" 2
# 535 "echo64.c" 1
	mov    r12,  rdx
# 0 "" 2
# 535 "echo64.c" 1
	and    r10,  r8
# 0 "" 2
# 535 "echo64.c" 1
	and    r11,  r8
# 0 "" 2
# 535 "echo64.c" 1
	and    r12,  r8
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  r10
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  r11
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  r12
# 0 "" 2
# 535 "echo64.c" 1
	shr    r10,  7
# 0 "" 2
# 535 "echo64.c" 1
	imul   r10, 27
# 0 "" 2
# 535 "echo64.c" 1
	shr    r11,  7
# 0 "" 2
# 535 "echo64.c" 1
	shr    r12,  7
# 0 "" 2
# 535 "echo64.c" 1
	shl    rax,  1
# 0 "" 2
# 535 "echo64.c" 1
	shl    rcx,  1
# 0 "" 2
# 535 "echo64.c" 1
	shl    rdx,  1
# 0 "" 2
# 535 "echo64.c" 1
	imul   r11, 27
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  rbp
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  r13
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  r9
# 0 "" 2
# 535 "echo64.c" 1
	imul   r12, 27
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  rbx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  rbx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  rbx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  r10
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  r11
# 0 "" 2
# 535 "echo64.c" 1
	xor    rbx,  rax
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  r12
# 0 "" 2
# 535 "echo64.c" 1
	xor    rbx,  rcx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rbx,  rdx
# 0 "" 2
# 535 "echo64.c" 1
	mov   [rdi+16*(0 )],  rax
# 0 "" 2
# 535 "echo64.c" 1
	mov   [rdi+16*(0+2)],  rcx
# 0 "" 2
# 535 "echo64.c" 1
	mov   [rdi+16*(0+3)],  rdx
# 0 "" 2
# 535 "echo64.c" 1
	mov   [rdi+16*(0+1)],  rbx
# 0 "" 2
# 535 "echo64.c" 1
	mov  rax,  [rdi+16*16+16*0+8]
# 0 "" 2
# 535 "echo64.c" 1
	mov  rbx,  [rdi+16*16+16*5+8]
# 0 "" 2
# 535 "echo64.c" 1
	mov  rbp,  rax
# 0 "" 2
# 535 "echo64.c" 1
	mov  rcx,  [rdi+16*16+16*10+8]
# 0 "" 2
# 535 "echo64.c" 1
	mov  rdx,  [rdi+16*16+16*15+8]
# 0 "" 2
# 535 "echo64.c" 1
	mov  r13,  rcx
# 0 "" 2
# 535 "echo64.c" 1
	mov  r9,   rdx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  rbx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  rdx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  rbp
# 0 "" 2
# 535 "echo64.c" 1
	mov    rbx,  rax
# 0 "" 2
# 535 "echo64.c" 1
	xor    rbx,  rcx
# 0 "" 2
# 535 "echo64.c" 1
	mov    r10,  rax
# 0 "" 2
# 535 "echo64.c" 1
	mov    r11,  rcx
# 0 "" 2
# 535 "echo64.c" 1
	mov    r12,  rdx
# 0 "" 2
# 535 "echo64.c" 1
	and    r10,  r8
# 0 "" 2
# 535 "echo64.c" 1
	and    r11,  r8
# 0 "" 2
# 535 "echo64.c" 1
	and    r12,  r8
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  r10
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  r11
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  r12
# 0 "" 2
# 535 "echo64.c" 1
	shr    r10,  7
# 0 "" 2
# 535 "echo64.c" 1
	imul   r10, 27
# 0 "" 2
# 535 "echo64.c" 1
	shr    r11,  7
# 0 "" 2
# 535 "echo64.c" 1
	shr    r12,  7
# 0 "" 2
# 535 "echo64.c" 1
	shl    rax,  1
# 0 "" 2
# 535 "echo64.c" 1
	shl    rcx,  1
# 0 "" 2
# 535 "echo64.c" 1
	shl    rdx,  1
# 0 "" 2
# 535 "echo64.c" 1
	imul   r11, 27
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  rbp
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  r13
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  r9
# 0 "" 2
# 535 "echo64.c" 1
	imul   r12, 27
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  rbx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  rbx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  rbx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  r10
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  r11
# 0 "" 2
# 535 "echo64.c" 1
	xor    rbx,  rax
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  r12
# 0 "" 2
# 535 "echo64.c" 1
	xor    rbx,  rcx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rbx,  rdx
# 0 "" 2
# 535 "echo64.c" 1
	mov   [rdi+16*(0 )+8],  rax
# 0 "" 2
# 535 "echo64.c" 1
	mov   [rdi+16*(0+2)+8],  rcx
# 0 "" 2
# 535 "echo64.c" 1
	mov   [rdi+16*(0+3)+8],  rdx
# 0 "" 2
# 535 "echo64.c" 1
	mov   [rdi+16*(0+1)+8],  rbx
# 0 "" 2
# 535 "echo64.c" 1
	mov  rax,  [rdi+16*16+16*4]
# 0 "" 2
# 535 "echo64.c" 1
	mov  rbx,  [rdi+16*16+16*9]
# 0 "" 2
# 535 "echo64.c" 1
	mov  rbp,  rax
# 0 "" 2
# 535 "echo64.c" 1
	mov  rcx,  [rdi+16*16+16*14]
# 0 "" 2
# 535 "echo64.c" 1
	mov  rdx,  [rdi+16*16+16*3]
# 0 "" 2
# 535 "echo64.c" 1
	mov  r13,  rcx
# 0 "" 2
# 535 "echo64.c" 1
	mov  r9,   rdx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  rbx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  rdx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  rbp
# 0 "" 2
# 535 "echo64.c" 1
	mov    rbx,  rax
# 0 "" 2
# 535 "echo64.c" 1
	xor    rbx,  rcx
# 0 "" 2
# 535 "echo64.c" 1
	mov    r10,  rax
# 0 "" 2
# 535 "echo64.c" 1
	mov    r11,  rcx
# 0 "" 2
# 535 "echo64.c" 1
	mov    r12,  rdx
# 0 "" 2
# 535 "echo64.c" 1
	and    r10,  r8
# 0 "" 2
# 535 "echo64.c" 1
	and    r11,  r8
# 0 "" 2
# 535 "echo64.c" 1
	and    r12,  r8
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  r10
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  r11
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  r12
# 0 "" 2
# 535 "echo64.c" 1
	shr    r10,  7
# 0 "" 2
# 535 "echo64.c" 1
	imul   r10, 27
# 0 "" 2
# 535 "echo64.c" 1
	shr    r11,  7
# 0 "" 2
# 535 "echo64.c" 1
	shr    r12,  7
# 0 "" 2
# 535 "echo64.c" 1
	shl    rax,  1
# 0 "" 2
# 535 "echo64.c" 1
	shl    rcx,  1
# 0 "" 2
# 535 "echo64.c" 1
	shl    rdx,  1
# 0 "" 2
# 535 "echo64.c" 1
	imul   r11, 27
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  rbp
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  r13
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  r9
# 0 "" 2
# 535 "echo64.c" 1
	imul   r12, 27
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  rbx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  rbx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  rbx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  r10
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  r11
# 0 "" 2
# 535 "echo64.c" 1
	xor    rbx,  rax
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  r12
# 0 "" 2
# 535 "echo64.c" 1
	xor    rbx,  rcx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rbx,  rdx
# 0 "" 2
# 535 "echo64.c" 1
	mov   [rdi+16*(4 )],  rax
# 0 "" 2
# 535 "echo64.c" 1
	mov   [rdi+16*(4+2)],  rcx
# 0 "" 2
# 535 "echo64.c" 1
	mov   [rdi+16*(4+3)],  rdx
# 0 "" 2
# 535 "echo64.c" 1
	mov   [rdi+16*(4+1)],  rbx
# 0 "" 2
# 535 "echo64.c" 1
	mov  rax,  [rdi+16*16+16*4+8]
# 0 "" 2
# 535 "echo64.c" 1
	mov  rbx,  [rdi+16*16+16*9+8]
# 0 "" 2
# 535 "echo64.c" 1
	mov  rbp,  rax
# 0 "" 2
# 535 "echo64.c" 1
	mov  rcx,  [rdi+16*16+16*14+8]
# 0 "" 2
# 535 "echo64.c" 1
	mov  rdx,  [rdi+16*16+16*3+8]
# 0 "" 2
# 535 "echo64.c" 1
	mov  r13,  rcx
# 0 "" 2
# 535 "echo64.c" 1
	mov  r9,   rdx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  rbx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  rdx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  rbp
# 0 "" 2
# 535 "echo64.c" 1
	mov    rbx,  rax
# 0 "" 2
# 535 "echo64.c" 1
	xor    rbx,  rcx
# 0 "" 2
# 535 "echo64.c" 1
	mov    r10,  rax
# 0 "" 2
# 535 "echo64.c" 1
	mov    r11,  rcx
# 0 "" 2
# 535 "echo64.c" 1
	mov    r12,  rdx
# 0 "" 2
# 535 "echo64.c" 1
	and    r10,  r8
# 0 "" 2
# 535 "echo64.c" 1
	and    r11,  r8
# 0 "" 2
# 535 "echo64.c" 1
	and    r12,  r8
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  r10
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  r11
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  r12
# 0 "" 2
# 535 "echo64.c" 1
	shr    r10,  7
# 0 "" 2
# 535 "echo64.c" 1
	imul   r10, 27
# 0 "" 2
# 535 "echo64.c" 1
	shr    r11,  7
# 0 "" 2
# 535 "echo64.c" 1
	shr    r12,  7
# 0 "" 2
# 535 "echo64.c" 1
	shl    rax,  1
# 0 "" 2
# 535 "echo64.c" 1
	shl    rcx,  1
# 0 "" 2
# 535 "echo64.c" 1
	shl    rdx,  1
# 0 "" 2
# 535 "echo64.c" 1
	imul   r11, 27
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  rbp
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  r13
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  r9
# 0 "" 2
# 535 "echo64.c" 1
	imul   r12, 27
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  rbx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  rbx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  rbx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  r10
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  r11
# 0 "" 2
# 535 "echo64.c" 1
	xor    rbx,  rax
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  r12
# 0 "" 2
# 535 "echo64.c" 1
	xor    rbx,  rcx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rbx,  rdx
# 0 "" 2
# 535 "echo64.c" 1
	mov   [rdi+16*(4 )+8],  rax
# 0 "" 2
# 535 "echo64.c" 1
	mov   [rdi+16*(4+2)+8],  rcx
# 0 "" 2
# 535 "echo64.c" 1
	mov   [rdi+16*(4+3)+8],  rdx
# 0 "" 2
# 535 "echo64.c" 1
	mov   [rdi+16*(4+1)+8],  rbx
# 0 "" 2
# 535 "echo64.c" 1
	mov  rax,  [rdi+16*16+16*8]
# 0 "" 2
# 535 "echo64.c" 1
	mov  rbx,  [rdi+16*16+16*13]
# 0 "" 2
# 535 "echo64.c" 1
	mov  rbp,  rax
# 0 "" 2
# 535 "echo64.c" 1
	mov  rcx,  [rdi+16*16+16*2]
# 0 "" 2
# 535 "echo64.c" 1
	mov  rdx,  [rdi+16*16+16*7]
# 0 "" 2
# 535 "echo64.c" 1
	mov  r13,  rcx
# 0 "" 2
# 535 "echo64.c" 1
	mov  r9,   rdx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  rbx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  rdx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  rbp
# 0 "" 2
# 535 "echo64.c" 1
	mov    rbx,  rax
# 0 "" 2
# 535 "echo64.c" 1
	xor    rbx,  rcx
# 0 "" 2
# 535 "echo64.c" 1
	mov    r10,  rax
# 0 "" 2
# 535 "echo64.c" 1
	mov    r11,  rcx
# 0 "" 2
# 535 "echo64.c" 1
	mov    r12,  rdx
# 0 "" 2
# 535 "echo64.c" 1
	and    r10,  r8
# 0 "" 2
# 535 "echo64.c" 1
	and    r11,  r8
# 0 "" 2
# 535 "echo64.c" 1
	and    r12,  r8
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  r10
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  r11
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  r12
# 0 "" 2
# 535 "echo64.c" 1
	shr    r10,  7
# 0 "" 2
# 535 "echo64.c" 1
	imul   r10, 27
# 0 "" 2
# 535 "echo64.c" 1
	shr    r11,  7
# 0 "" 2
# 535 "echo64.c" 1
	shr    r12,  7
# 0 "" 2
# 535 "echo64.c" 1
	shl    rax,  1
# 0 "" 2
# 535 "echo64.c" 1
	shl    rcx,  1
# 0 "" 2
# 535 "echo64.c" 1
	shl    rdx,  1
# 0 "" 2
# 535 "echo64.c" 1
	imul   r11, 27
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  rbp
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  r13
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  r9
# 0 "" 2
# 535 "echo64.c" 1
	imul   r12, 27
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  rbx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  rbx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  rbx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  r10
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  r11
# 0 "" 2
# 535 "echo64.c" 1
	xor    rbx,  rax
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  r12
# 0 "" 2
# 535 "echo64.c" 1
	xor    rbx,  rcx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rbx,  rdx
# 0 "" 2
# 535 "echo64.c" 1
	mov   [rdi+16*(8 )],  rax
# 0 "" 2
# 535 "echo64.c" 1
	mov   [rdi+16*(8+2)],  rcx
# 0 "" 2
# 535 "echo64.c" 1
	mov   [rdi+16*(8+3)],  rdx
# 0 "" 2
# 535 "echo64.c" 1
	mov   [rdi+16*(8+1)],  rbx
# 0 "" 2
# 535 "echo64.c" 1
	mov  rax,  [rdi+16*16+16*8+8]
# 0 "" 2
# 535 "echo64.c" 1
	mov  rbx,  [rdi+16*16+16*13+8]
# 0 "" 2
# 535 "echo64.c" 1
	mov  rbp,  rax
# 0 "" 2
# 535 "echo64.c" 1
	mov  rcx,  [rdi+16*16+16*2+8]
# 0 "" 2
# 535 "echo64.c" 1
	mov  rdx,  [rdi+16*16+16*7+8]
# 0 "" 2
# 535 "echo64.c" 1
	mov  r13,  rcx
# 0 "" 2
# 535 "echo64.c" 1
	mov  r9,   rdx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  rbx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  rdx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  rbp
# 0 "" 2
# 535 "echo64.c" 1
	mov    rbx,  rax
# 0 "" 2
# 535 "echo64.c" 1
	xor    rbx,  rcx
# 0 "" 2
# 535 "echo64.c" 1
	mov    r10,  rax
# 0 "" 2
# 535 "echo64.c" 1
	mov    r11,  rcx
# 0 "" 2
# 535 "echo64.c" 1
	mov    r12,  rdx
# 0 "" 2
# 535 "echo64.c" 1
	and    r10,  r8
# 0 "" 2
# 535 "echo64.c" 1
	and    r11,  r8
# 0 "" 2
# 535 "echo64.c" 1
	and    r12,  r8
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  r10
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  r11
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  r12
# 0 "" 2
# 535 "echo64.c" 1
	shr    r10,  7
# 0 "" 2
# 535 "echo64.c" 1
	imul   r10, 27
# 0 "" 2
# 535 "echo64.c" 1
	shr    r11,  7
# 0 "" 2
# 535 "echo64.c" 1
	shr    r12,  7
# 0 "" 2
# 535 "echo64.c" 1
	shl    rax,  1
# 0 "" 2
# 535 "echo64.c" 1
	shl    rcx,  1
# 0 "" 2
# 535 "echo64.c" 1
	shl    rdx,  1
# 0 "" 2
# 535 "echo64.c" 1
	imul   r11, 27
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  rbp
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  r13
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  r9
# 0 "" 2
# 535 "echo64.c" 1
	imul   r12, 27
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  rbx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  rbx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  rbx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  r10
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  r11
# 0 "" 2
# 535 "echo64.c" 1
	xor    rbx,  rax
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  r12
# 0 "" 2
# 535 "echo64.c" 1
	xor    rbx,  rcx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rbx,  rdx
# 0 "" 2
# 535 "echo64.c" 1
	mov   [rdi+16*(8 )+8],  rax
# 0 "" 2
# 535 "echo64.c" 1
	mov   [rdi+16*(8+2)+8],  rcx
# 0 "" 2
# 535 "echo64.c" 1
	mov   [rdi+16*(8+3)+8],  rdx
# 0 "" 2
# 535 "echo64.c" 1
	mov   [rdi+16*(8+1)+8],  rbx
# 0 "" 2
# 535 "echo64.c" 1
	mov  rax,  [rdi+16*16+16*12]
# 0 "" 2
# 535 "echo64.c" 1
	mov  rbx,  [rdi+16*16+16*1]
# 0 "" 2
# 535 "echo64.c" 1
	mov  rbp,  rax
# 0 "" 2
# 535 "echo64.c" 1
	mov  rcx,  [rdi+16*16+16*6]
# 0 "" 2
# 535 "echo64.c" 1
	mov  rdx,  [rdi+16*16+16*11]
# 0 "" 2
# 535 "echo64.c" 1
	mov  r13,  rcx
# 0 "" 2
# 535 "echo64.c" 1
	mov  r9,   rdx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  rbx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  rdx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  rbp
# 0 "" 2
# 535 "echo64.c" 1
	mov    rbx,  rax
# 0 "" 2
# 535 "echo64.c" 1
	xor    rbx,  rcx
# 0 "" 2
# 535 "echo64.c" 1
	mov    r10,  rax
# 0 "" 2
# 535 "echo64.c" 1
	mov    r11,  rcx
# 0 "" 2
# 535 "echo64.c" 1
	mov    r12,  rdx
# 0 "" 2
# 535 "echo64.c" 1
	and    r10,  r8
# 0 "" 2
# 535 "echo64.c" 1
	and    r11,  r8
# 0 "" 2
# 535 "echo64.c" 1
	and    r12,  r8
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  r10
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  r11
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  r12
# 0 "" 2
# 535 "echo64.c" 1
	shr    r10,  7
# 0 "" 2
# 535 "echo64.c" 1
	imul   r10, 27
# 0 "" 2
# 535 "echo64.c" 1
	shr    r11,  7
# 0 "" 2
# 535 "echo64.c" 1
	shr    r12,  7
# 0 "" 2
# 535 "echo64.c" 1
	shl    rax,  1
# 0 "" 2
# 535 "echo64.c" 1
	shl    rcx,  1
# 0 "" 2
# 535 "echo64.c" 1
	shl    rdx,  1
# 0 "" 2
# 535 "echo64.c" 1
	imul   r11, 27
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  rbp
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  r13
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  r9
# 0 "" 2
# 535 "echo64.c" 1
	imul   r12, 27
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  rbx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  rbx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  rbx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  r10
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  r11
# 0 "" 2
# 535 "echo64.c" 1
	xor    rbx,  rax
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  r12
# 0 "" 2
# 535 "echo64.c" 1
	xor    rbx,  rcx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rbx,  rdx
# 0 "" 2
# 535 "echo64.c" 1
	mov   [rdi+16*(12 )],  rax
# 0 "" 2
# 535 "echo64.c" 1
	mov   [rdi+16*(12+2)],  rcx
# 0 "" 2
# 535 "echo64.c" 1
	mov   [rdi+16*(12+3)],  rdx
# 0 "" 2
# 535 "echo64.c" 1
	mov   [rdi+16*(12+1)],  rbx
# 0 "" 2
# 535 "echo64.c" 1
	mov  rax,  [rdi+16*16+16*12+8]
# 0 "" 2
# 535 "echo64.c" 1
	mov  rbx,  [rdi+16*16+16*1+8]
# 0 "" 2
# 535 "echo64.c" 1
	mov  rbp,  rax
# 0 "" 2
# 535 "echo64.c" 1
	mov  rcx,  [rdi+16*16+16*6+8]
# 0 "" 2
# 535 "echo64.c" 1
	mov  rdx,  [rdi+16*16+16*11+8]
# 0 "" 2
# 535 "echo64.c" 1
	mov  r13,  rcx
# 0 "" 2
# 535 "echo64.c" 1
	mov  r9,   rdx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  rbx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  rdx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  rbp
# 0 "" 2
# 535 "echo64.c" 1
	mov    rbx,  rax
# 0 "" 2
# 535 "echo64.c" 1
	xor    rbx,  rcx
# 0 "" 2
# 535 "echo64.c" 1
	mov    r10,  rax
# 0 "" 2
# 535 "echo64.c" 1
	mov    r11,  rcx
# 0 "" 2
# 535 "echo64.c" 1
	mov    r12,  rdx
# 0 "" 2
# 535 "echo64.c" 1
	and    r10,  r8
# 0 "" 2
# 535 "echo64.c" 1
	and    r11,  r8
# 0 "" 2
# 535 "echo64.c" 1
	and    r12,  r8
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  r10
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  r11
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  r12
# 0 "" 2
# 535 "echo64.c" 1
	shr    r10,  7
# 0 "" 2
# 535 "echo64.c" 1
	imul   r10, 27
# 0 "" 2
# 535 "echo64.c" 1
	shr    r11,  7
# 0 "" 2
# 535 "echo64.c" 1
	shr    r12,  7
# 0 "" 2
# 535 "echo64.c" 1
	shl    rax,  1
# 0 "" 2
# 535 "echo64.c" 1
	shl    rcx,  1
# 0 "" 2
# 535 "echo64.c" 1
	shl    rdx,  1
# 0 "" 2
# 535 "echo64.c" 1
	imul   r11, 27
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  rbp
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  r13
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  r9
# 0 "" 2
# 535 "echo64.c" 1
	imul   r12, 27
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  rbx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  rbx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  rbx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rax,  r10
# 0 "" 2
# 535 "echo64.c" 1
	xor    rcx,  r11
# 0 "" 2
# 535 "echo64.c" 1
	xor    rbx,  rax
# 0 "" 2
# 535 "echo64.c" 1
	xor    rdx,  r12
# 0 "" 2
# 535 "echo64.c" 1
	xor    rbx,  rcx
# 0 "" 2
# 535 "echo64.c" 1
	xor    rbx,  rdx
# 0 "" 2
# 535 "echo64.c" 1
	mov   [rdi+16*(12 )+8],  rax
# 0 "" 2
# 535 "echo64.c" 1
	mov   [rdi+16*(12+2)+8],  rcx
# 0 "" 2
# 535 "echo64.c" 1
	mov   [rdi+16*(12+3)+8],  rdx
# 0 "" 2
# 535 "echo64.c" 1
	mov   [rdi+16*(12+1)+8],  rbx
# 0 "" 2
# 536 "echo64.c" 1
	sub r14, 1
# 0 "" 2
# 537 "echo64.c" 1
	jne LABEL_BIG_ROUND
# 0 "" 2
# 543 "echo64.c" 1
	mov  rax,  [rdi+16*0]
# 0 "" 2
# 543 "echo64.c" 1
	mov  r10,  [rdi+16*0+8]
# 0 "" 2
# 543 "echo64.c" 1
	xor  rax,  [rdi+16*8]
# 0 "" 2
# 543 "echo64.c" 1
	xor  r10,  [rdi+16*8+8]
# 0 "" 2
# 543 "echo64.c" 1
	xor  rax,  [OLDCV+16*0]
# 0 "" 2
# 543 "echo64.c" 1
	xor  r10,  [OLDCV+16*0+8]
# 0 "" 2
# 543 "echo64.c" 1
	mov  [rdi+16*0],   rax
# 0 "" 2
# 543 "echo64.c" 1
	mov  [rdi+16*0+8], r10
# 0 "" 2
# 543 "echo64.c" 1
	mov  rbx,  [rdi+16*4]
# 0 "" 2
# 543 "echo64.c" 1
	mov  r11,  [rdi+16*4+8]
# 0 "" 2
# 543 "echo64.c" 1
	xor  rbx,  [rdi+16*12]
# 0 "" 2
# 543 "echo64.c" 1
	xor  r11,  [rdi+16*12+8]
# 0 "" 2
# 543 "echo64.c" 1
	xor  rbx,  [OLDCV+16*4]
# 0 "" 2
# 543 "echo64.c" 1
	xor  r11,  [OLDCV+16*4+8]
# 0 "" 2
# 543 "echo64.c" 1
	mov  [rdi+16*4],   rbx
# 0 "" 2
# 543 "echo64.c" 1
	mov  [rdi+16*4+8], r11
# 0 "" 2
# 543 "echo64.c" 1
	mov  rax,  [rdi+16*1]
# 0 "" 2
# 543 "echo64.c" 1
	mov  r10,  [rdi+16*1+8]
# 0 "" 2
# 543 "echo64.c" 1
	xor  rax,  [rdi+16*9]
# 0 "" 2
# 543 "echo64.c" 1
	xor  r10,  [rdi+16*9+8]
# 0 "" 2
# 543 "echo64.c" 1
	xor  rax,  [OLDCV+16*1]
# 0 "" 2
# 543 "echo64.c" 1
	xor  r10,  [OLDCV+16*1+8]
# 0 "" 2
# 543 "echo64.c" 1
	mov  [rdi+16*1],   rax
# 0 "" 2
# 543 "echo64.c" 1
	mov  [rdi+16*1+8], r10
# 0 "" 2
# 543 "echo64.c" 1
	mov  rbx,  [rdi+16*5]
# 0 "" 2
# 543 "echo64.c" 1
	mov  r11,  [rdi+16*5+8]
# 0 "" 2
# 543 "echo64.c" 1
	xor  rbx,  [rdi+16*13]
# 0 "" 2
# 543 "echo64.c" 1
	xor  r11,  [rdi+16*13+8]
# 0 "" 2
# 543 "echo64.c" 1
	xor  rbx,  [OLDCV+16*5]
# 0 "" 2
# 543 "echo64.c" 1
	xor  r11,  [OLDCV+16*5+8]
# 0 "" 2
# 543 "echo64.c" 1
	mov  [rdi+16*5],   rbx
# 0 "" 2
# 543 "echo64.c" 1
	mov  [rdi+16*5+8], r11
# 0 "" 2
# 543 "echo64.c" 1
	mov  rax,  [rdi+16*2]
# 0 "" 2
# 543 "echo64.c" 1
	mov  r10,  [rdi+16*2+8]
# 0 "" 2
# 543 "echo64.c" 1
	xor  rax,  [rdi+16*10]
# 0 "" 2
# 543 "echo64.c" 1
	xor  r10,  [rdi+16*10+8]
# 0 "" 2
# 543 "echo64.c" 1
	xor  rax,  [OLDCV+16*2]
# 0 "" 2
# 543 "echo64.c" 1
	xor  r10,  [OLDCV+16*2+8]
# 0 "" 2
# 543 "echo64.c" 1
	mov  [rdi+16*2],   rax
# 0 "" 2
# 543 "echo64.c" 1
	mov  [rdi+16*2+8], r10
# 0 "" 2
# 543 "echo64.c" 1
	mov  rbx,  [rdi+16*6]
# 0 "" 2
# 543 "echo64.c" 1
	mov  r11,  [rdi+16*6+8]
# 0 "" 2
# 543 "echo64.c" 1
	xor  rbx,  [rdi+16*14]
# 0 "" 2
# 543 "echo64.c" 1
	xor  r11,  [rdi+16*14+8]
# 0 "" 2
# 543 "echo64.c" 1
	xor  rbx,  [OLDCV+16*6]
# 0 "" 2
# 543 "echo64.c" 1
	xor  r11,  [OLDCV+16*6+8]
# 0 "" 2
# 543 "echo64.c" 1
	mov  [rdi+16*6],   rbx
# 0 "" 2
# 543 "echo64.c" 1
	mov  [rdi+16*6+8], r11
# 0 "" 2
# 543 "echo64.c" 1
	mov  rax,  [rdi+16*3]
# 0 "" 2
# 543 "echo64.c" 1
	mov  r10,  [rdi+16*3+8]
# 0 "" 2
# 543 "echo64.c" 1
	xor  rax,  [rdi+16*11]
# 0 "" 2
# 543 "echo64.c" 1
	xor  r10,  [rdi+16*11+8]
# 0 "" 2
# 543 "echo64.c" 1
	xor  rax,  [OLDCV+16*3]
# 0 "" 2
# 543 "echo64.c" 1
	xor  r10,  [OLDCV+16*3+8]
# 0 "" 2
# 543 "echo64.c" 1
	mov  [rdi+16*3],   rax
# 0 "" 2
# 543 "echo64.c" 1
	mov  [rdi+16*3+8], r10
# 0 "" 2
# 543 "echo64.c" 1
	mov  rbx,  [rdi+16*7]
# 0 "" 2
# 543 "echo64.c" 1
	mov  r11,  [rdi+16*7+8]
# 0 "" 2
# 543 "echo64.c" 1
	xor  rbx,  [rdi+16*15]
# 0 "" 2
# 543 "echo64.c" 1
	xor  r11,  [rdi+16*15+8]
# 0 "" 2
# 543 "echo64.c" 1
	xor  rbx,  [OLDCV+16*7]
# 0 "" 2
# 543 "echo64.c" 1
	xor  r11,  [OLDCV+16*7+8]
# 0 "" 2
# 543 "echo64.c" 1
	mov  [rdi+16*7],   rbx
# 0 "" 2
# 543 "echo64.c" 1
	mov  [rdi+16*7+8], r11
# 0 "" 2
# 545 "echo64.c" 1
	pop rax
# 0 "" 2
# 545 "echo64.c" 1
	pop rbx
# 0 "" 2
# 545 "echo64.c" 1
	pop rcx
# 0 "" 2
# 545 "echo64.c" 1
	pop rdx
# 0 "" 2
# 545 "echo64.c" 1
	pop rsi
# 0 "" 2
# 545 "echo64.c" 1
	pop rbp
# 0 "" 2
# 545 "echo64.c" 1
	pop r15
# 0 "" 2
# 545 "echo64.c" 1
	pop r14
# 0 "" 2
# 545 "echo64.c" 1
	pop r13
# 0 "" 2
# 545 "echo64.c" 1
	pop r12
# 0 "" 2
# 545 "echo64.c" 1
	pop r11
# 0 "" 2
# 545 "echo64.c" 1
	pop r10
# 0 "" 2
# 545 "echo64.c" 1
	pop r9
# 0 "" 2
# 545 "echo64.c" 1
	pop r8
# 0 "" 2
# 546 "echo64.c" 1
	.att_syntax noprefix
# 0 "" 2
#NO_APP
	ret
	.cfi_endproc
.LFE539:
	.size	Compress, .-Compress
	.p2align 4,,15
.globl Update
	.type	Update, @function
Update:
.LFB540:
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
	movq	%rdi, %rbp
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	pushq	%rbx
	.cfi_def_cfa_offset 56
	movq	%rsi, %rbx
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movl	520(%rdi), %eax
	movq	%rdx, (%rsp)
	movl	528(%rdi), %edx
	movq	(%rsp), %r13
	sarl	$3, %eax
	sall	$4, %edx
	shrq	$3, %r13
	movslq	%edx,%r12
	testq	%r13, %r13
	leaq	(%rdi,%r12), %r12
	jle	.L37
	movl	$256, %r15d
	subl	%edx, %r15d
	.p2align 4,,10
	.p2align 3
.L17:
	movl	%r15d, %r10d
	subl	%eax, %r10d
	movslq	%r10d,%r14
	cmpq	%r13, %r14
	jle	.L6
	movq	%r13, %rdi
	sarq	$3, %rdi
	testq	%rdi, %rdi
	jle	.L8
	movslq	%eax,%rsi
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	leaq	(%r12,%rsi), %r8
	.p2align 4,,10
	.p2align 3
.L18:
	movq	(%rbx,%rdx,8), %rsi
	addl	$1, %ecx
	movq	%rsi, (%r8,%rdx,8)
	mov	%ecx, %edx
	cmpq	%rdi, %rdx
	jl	.L18
.L8:
	movq	%r13, %rdx
	leal	0(,%rdi,8), %ecx
	andl	$7, %edx
	leaq	(%rdx,%rdi,8), %rdi
	mov	%ecx, %edx
	cmpq	%rdi, %rdx
	jge	.L19
	movslq	%eax,%r8
	.p2align 4,,10
	.p2align 3
.L20:
	leaq	(%r12,%rdx), %rsi
	movzbl	(%rbx,%rdx), %edx
	addl	$1, %ecx
	movb	%dl, (%rsi,%r8)
	mov	%ecx, %edx
	cmpq	%rdi, %rdx
	jl	.L20
.L19:
	addl	%r13d, %eax
	addq	%r13, %rbx
.L37:
	leal	0(,%rax,8), %edx
.L5:
	movq	(%rsp), %rcx
	movl	%edx, 520(%rbp)
	andl	$7, %ecx
	je	.L21
	addl	%ecx, %edx
	movl	%edx, 520(%rbp)
	xorl	%edx, %edx
	testl	%ecx, %ecx
	je	.L23
	movl	$7, %esi
	movl	$1, %edi
	movl	%eax, %r8d
	subl	%ecx, %esi
	movl	$7, %ecx
	.p2align 4,,10
	.p2align 3
.L24:
	movl	%edi, %ebp
	sall	%cl, %ebp
	subl	$1, %ecx
	movl	%ebp, %eax
	orl	%eax, %edx
	cmpl	%esi, %ecx
	jne	.L24
	andb	(%rbx), %dl
	movl	%r8d, %eax
.L23:
	cltq
	movb	%dl, (%r12,%rax)
.L21:
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
.L6:
	leal	7(%r10), %edi
	testl	%r10d, %r10d
	cmovns	%r10d, %edi
	sarl	$3, %edi
	testl	%edi, %edi
	je	.L9
	movslq	%eax,%r11
	cmpl	$21, %edi
	leaq	(%r12,%r11), %r8
	jbe	.L10
	testb	$15, %r8b
	jne	.L10
	leaq	16(%rbx), %rdx
	cmpq	%rdx, %r8
	jbe	.L39
.L26:
	movl	%edi, %r9d
	shrl	%r9d
	movl	%r9d, %edx
	addl	%edx, %edx
	je	.L27
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L13:
	movdqu	(%rbx,%rcx), %xmm0
	addl	$1, %esi
	movdqa	%xmm0, (%r8,%rcx)
	addq	$16, %rcx
	cmpl	%r9d, %esi
	jb	.L13
	cmpl	%edx, %edi
	je	.L9
	.p2align 4,,10
	.p2align 3
.L27:
	mov	%edx, %ecx
	addl	$1, %edx
	leaq	(%r12,%rcx,8), %rsi
	movq	(%rbx,%rcx,8), %rcx
	cmpl	%edx, %edi
	movq	%rcx, (%rsi,%r11)
	ja	.L27
.L9:
	movl	%r10d, %edx
	sall	$3, %edi
	sarl	$31, %edx
	shrl	$29, %edx
	leal	(%r10,%rdx), %ecx
	andl	$7, %ecx
	subl	%edx, %ecx
	leal	(%rdi,%rcx), %ecx
	cmpl	%ecx, %edi
	jae	.L15
	cltq
	leaq	(%r12,%rax), %rsi
	.p2align 4,,10
	.p2align 3
.L16:
	mov	%edi, %eax
	addl	$1, %edi
	movzbl	(%rbx,%rax), %edx
	cmpl	%ecx, %edi
	movb	%dl, (%rsi,%rax)
	jb	.L16
.L15:
	sall	$3, %r10d
	addl	%r10d, 520(%rbp)
	movq	%rbp, %rdi
	subq	%r14, %r13
	addq	%r14, %rbx
	call	Compress
	xorl	%eax, %eax
	testq	%r13, %r13
	jg	.L17
	xorl	%edx, %edx
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L39:
	leaq	16(%r8), %rdx
	cmpq	%rdx, %rbx
	ja	.L26
	.p2align 4,,10
	.p2align 3
.L10:
	leal	-1(%rdi), %ecx
	movq	%rbx, %rdx
	leaq	8(%rbx,%rcx,8), %rsi
	.p2align 4,,10
	.p2align 3
.L14:
	movq	(%rdx), %rcx
	addq	$8, %rdx
	movq	%rcx, (%r8)
	addq	$8, %r8
	cmpq	%rsi, %rdx
	jne	.L14
	jmp	.L9
	.cfi_endproc
.LFE540:
	.size	Update, .-Update
	.p2align 4,,15
.globl Init
	.type	Init, @function
Init:
.LFB543:
	.cfi_startproc
	movabsq	$7599940337074203, %rdx
	movabsq	$7599940337074203, %rax
	movabsq	$-9187201950435737472, %r10
	movq	%rdx, MEM_CST+32(%rip)
	leal	-160(%rsi), %edx
	movabsq	$-9187201950435737472, %r9
	movabsq	$-72340172838076674, %r8
	movabsq	$-72340172838076674, %rcx
	movq	%rax, MEM_CST+40(%rip)
	cmpl	$352, %edx
	movq	%r10, MEM_CST(%rip)
	movq	%r9, MEM_CST+8(%rip)
	movq	%r8, MEM_CST+16(%rip)
	movq	%rcx, MEM_CST+24(%rip)
	movl	$2, %eax
	movq	$0, MEM_CST+48(%rip)
	movq	$0, MEM_CST+56(%rip)
	ja	.L42
	xorl	%eax, %eax
	cmpl	$257, %esi
	movl	%esi, 524(%rdi)
	setge	%al
	movslq	%esi,%rsi
	movq	%rdi, %rdx
	leal	4(,%rax,4), %eax
	xorl	%ecx, %ecx
	movl	%eax, 528(%rdi)
	.p2align 4,,10
	.p2align 3
.L45:
	addl	$1, %ecx
	movq	%rsi, (%rdx)
	movq	$0, 8(%rdx)
	addq	$16, %rdx
	cmpl	%ecx, %eax
	jg	.L45
	cmpl	$15, %eax
	jg	.L46
	addl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L47:
	movslq	%eax,%rdx
	movq	$0, (%rdi,%rdx,8)
	leal	1(%rax), %edx
	addl	$2, %eax
	cmpl	$32, %eax
	movslq	%edx,%rdx
	movq	$0, (%rdi,%rdx,8)
	jne	.L47
.L46:
	movq	$0, 512(%rdi)
	movl	$0, 520(%rdi)
	xorl	%eax, %eax
.L42:
	rep
	ret
	.cfi_endproc
.LFE543:
	.size	Init, .-Init
	.p2align 4,,15
.globl Final
	.type	Final, @function
Final:
.LFB541:
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
	movl	528(%rdi), %esi
	movq	%rdi, %rbx
	.cfi_offset 3, -48
	movl	520(%rdi), %eax
	subl	%esi, %r12d
	sall	$4, %esi
	sall	$7, %r12d
	movslq	%esi,%rsi
	movl	%r12d, %edx
	leaq	(%rdi,%rsi), %rsi
	subl	%eax, %edx
	cmpl	$144, %edx
	jg	.L52
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
	jle	.L53
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
	movl	528(%rbx), %r14d
	movslq	520(%rbx),%r13
	addq	512(%rbx), %r13
	sall	$4, %r14d
	movslq	%r14d,%r14
	leaq	(%rbx,%r14), %r14
.L54:
	subl	$144, %r12d
	movq	%r14, %rdi
	leal	7(%r12), %eax
	testl	%r12d, %r12d
	cmovs	%eax, %r12d
	xorl	%esi, %esi
	sarl	$3, %r12d
	movslq	%r12d,%rdx
	call	memset
	jmp	.L56
	.p2align 4,,10
	.p2align 3
.L52:
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
.L53:
	movl	528(%rbx), %r14d
	movslq	520(%rbx),%r13
	addq	512(%rbx), %r13
	sall	$4, %r14d
	testl	%eax, %eax
	movslq	%r14d,%r14
	leaq	(%rbx,%r14), %r14
	je	.L54
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
.L56:
	movl	$16, %eax
	subl	528(%rbx), %eax
	movl	524(%rbx), %edx
	movq	%rbx, %rdi
	sall	$4, %eax
	cltq
	leaq	-18(%r14,%rax), %rax
	movb	%dl, (%rax)
	movl	524(%rbx), %edx
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
	movl	524(%rbx), %eax
	sarl	$3, %eax
	testl	%eax, %eax
	je	.L57
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L58:
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
	movl	524(%rbx), %edx
	sarl	$3, %edx
	cmpl	%eax, %edx
	ja	.L58
.L57:
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	xorl	%eax, %eax
	popq	%r14
	ret
	.cfi_endproc
.LFE541:
	.size	Final, .-Final
	.p2align 4,,15
	.type	T.43, @function
T.43:
.LFB545:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rdx, %rbp
	.cfi_offset 6, -16
	movabsq	$-72340172838076674, %rdx
	movabsq	$-9187201950435737472, %r8
	movabsq	$-72340172838076674, %rcx
	movabsq	$7599940337074203, %rax
	pushq	%rbx
	.cfi_def_cfa_offset 24
	movabsq	$7599940337074203, %r11
	movabsq	$-9187201950435737472, %rbx
	.cfi_offset 3, -24
	subq	$552, %rsp
	.cfi_def_cfa_offset 576
	movq	%rdx, MEM_CST+24(%rip)
	movq	%rsi, %rdx
	movdqa	.LC0(%rip), %xmm0
	movq	%rdi, %rsi
	movq	%rsp, %rdi
	movq	%r8, MEM_CST(%rip)
	movq	%rbx, MEM_CST+8(%rip)
	movdqa	%xmm0, (%rsp)
	movq	%rcx, MEM_CST+16(%rip)
	movq	%rax, MEM_CST+32(%rip)
	movdqa	%xmm0, 16(%rsp)
	movdqa	%xmm0, 32(%rsp)
	movdqa	%xmm0, 48(%rsp)
	movdqa	%xmm0, 64(%rsp)
	movdqa	%xmm0, 80(%rsp)
	movdqa	%xmm0, 96(%rsp)
	movdqa	%xmm0, 112(%rsp)
	pxor	%xmm0, %xmm0
	movq	%r11, MEM_CST+40(%rip)
	movq	$0, MEM_CST+48(%rip)
	movq	$0, MEM_CST+56(%rip)
	movl	$512, 524(%rsp)
	movl	$8, 528(%rsp)
	movq	$0, 512(%rsp)
	movdqa	%xmm0, 128(%rsp)
	movl	$0, 520(%rsp)
	movdqa	%xmm0, 144(%rsp)
	movdqa	%xmm0, 160(%rsp)
	movdqa	%xmm0, 176(%rsp)
	movdqa	%xmm0, 192(%rsp)
	movdqa	%xmm0, 208(%rsp)
	movdqa	%xmm0, 224(%rsp)
	movdqa	%xmm0, 240(%rsp)
	call	Update
	testl	%eax, %eax
	je	.L64
	addq	$552, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L64:
	movq	%rbp, %rsi
	movq	%rsp, %rdi
	call	Final
	addq	$552, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.cfi_endproc
.LFE545:
	.size	T.43, .-T.43
	.p2align 4,,15
.globl crypto_hash_echo512_athlon_athlon64
	.type	crypto_hash_echo512_athlon_athlon64, @function
crypto_hash_echo512_athlon_athlon64:
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
	.size	crypto_hash_echo512_athlon_athlon64, .-crypto_hash_echo512_athlon_athlon64
	.p2align 4,,15
.globl Hash
	.type	Hash, @function
Hash:
.LFB542:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rcx, %rbp
	.cfi_offset 6, -16
	movabsq	$-9187201950435737472, %rcx
	movabsq	$-72340172838076674, %rax
	movabsq	$-72340172838076674, %r11
	movabsq	$7599940337074203, %r10
	pushq	%rbx
	.cfi_def_cfa_offset 24
	movabsq	$7599940337074203, %r9
	movabsq	$-9187201950435737472, %rbx
	.cfi_offset 3, -24
	subq	$552, %rsp
	.cfi_def_cfa_offset 576
	movq	%rcx, MEM_CST+8(%rip)
	leal	-160(%rdi), %ecx
	movq	%rax, MEM_CST+16(%rip)
	movq	%rbx, MEM_CST(%rip)
	movl	$2, %eax
	cmpl	$352, %ecx
	movq	%r11, MEM_CST+24(%rip)
	movq	%r10, MEM_CST+32(%rip)
	movq	%r9, MEM_CST+40(%rip)
	movq	$0, MEM_CST+48(%rip)
	movq	$0, MEM_CST+56(%rip)
	ja	.L71
	xorl	%eax, %eax
	cmpl	$257, %edi
	movl	%edi, 524(%rsp)
	setge	%al
	movslq	%edi,%rdi
	movq	%rsp, %rcx
	leal	4(,%rax,4), %eax
	xorl	%r8d, %r8d
	movl	%eax, 528(%rsp)
	.p2align 4,,10
	.p2align 3
.L73:
	addl	$1, %r8d
	movq	%rdi, (%rcx)
	movq	$0, 8(%rcx)
	addq	$16, %rcx
	cmpl	%eax, %r8d
	jl	.L73
	cmpl	$15, %eax
	jg	.L75
	addl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L76:
	movslq	%eax,%rcx
	movq	$0, (%rsp,%rcx,8)
	leal	1(%rax), %ecx
	addl	$2, %eax
	cmpl	$32, %eax
	movslq	%ecx,%rcx
	movq	$0, (%rsp,%rcx,8)
	jne	.L76
.L75:
	movq	%rsp, %rdi
	movq	$0, 512(%rsp)
	movl	$0, 520(%rsp)
	call	Update
	testl	%eax, %eax
	je	.L80
.L71:
	addq	$552, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L80:
	movq	%rbp, %rsi
	movq	%rsp, %rdi
	call	Final
	addq	$552, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.cfi_endproc
.LFE542:
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
.globl TB
	.align 32
	.type	TB, @object
	.size	TB, 8192
TB:
	.quad	-6529265332702412800
	.quad	-8900101358997209088
	.quad	-7388304799592087552
	.quad	-8251865595734130688
	.quad	1005132843887624192
	.quad	-4797622411165958144
	.quad	-5661183207308001280
	.quad	6108505696158875648
	.quad	5778171510791340032
	.quad	216455365192056832
	.quad	-6239904624237608960
	.quad	9019350327106732032
	.quad	1873214763123605504
	.quad	7122398508098781184
	.quad	-1825176876767772672
	.quad	-7316529788632432640
	.quad	5029054649441714176
	.quad	-7096966993126883328
	.quad	4668484078993932288
	.quad	-8683645993805152256
	.quad	1583854123378278400
	.quad	-1488059580830187520
	.quad	-3943104273528651776
	.quad	860452489655222272
	.quad	-1392266215103135744
	.quad	7481838746233470976
	.quad	-170395306981064704
	.quad	-1535816237022445568
	.quad	-4639661841960665088
	.quad	-602175773771563008
	.quad	-7605890497097236480
	.quad	6611496024932352000
	.quad	-4415859196474425344
	.quad	2089104944979247104
	.quad	-5867183999331336192
	.quad	7648843124994736128
	.quad	6500442949640257536
	.quad	4701546346396516352
	.quad	213912138962436096
	.quad	5750195687258062848
	.quad	6643992971559567360
	.quad	-818065989986942976
	.quad	3811705345449918464
	.quad	644562273439842304
	.quad	-7822345862289293312
	.quad	8347660138282221568
	.quad	5994626875983396864
	.quad	4545562669033193472
	.quad	865821460768227328
	.quad	5964955674239565824
	.quad	7287707405570277376
	.quad	6828516539101085696
	.quad	2889085755395670016
	.quad	-6803085024129187840
	.quad	1082276825960284160
	.quad	-5360802879777013760
	.quad	650496427889262592
	.quad	3896196573457022976
	.quad	-7241647347359285248
	.quad	4459376028455796736
	.quad	2804594458669088768
	.quad	7577068114035081216
	.quad	-3624638491549237248
	.quad	-6956524401521065984
	.quad	1948098286728511488
	.quad	-7024626833190551552
	.quad	8371114563843653632
	.quad	3321996485779783680
	.quad	3250221474820128768
	.quad	-5589408196348346368
	.quad	-1271604215638130688
	.quad	-315075661213466624
	.quad	-697404127960891392
	.quad	5565107142538559488
	.quad	7050058348162449408
	.quad	-3552298331612905472
	.quad	8874669972874330112
	.quad	4531716188392128512
	.quad	8155789530964688896
	.quad	-7528747459917381632
	.quad	-769179138920546304
	.quad	7553048642576187392
	.quad	0
	.quad	3237505120333725696
	.quad	6926571686145818624
	.quad	2304995161194627072
	.quad	-3985209061997019136
	.quad	-1343379226597785600
	.quad	-4725847400206303232
	.quad	5101394809378045952
	.quad	-2756556572313255936
	.quad	5420426788306157568
	.quad	-2429047049497346048
	.quad	-3149057823720079360
	.quad	-1704514946022244352
	.quad	5390755449123373056
	.quad	7768938858791567360
	.quad	3093955098414415872
	.quad	-1897517036704104448
	.quad	1656194283314610176
	.quad	-4232464981993455616
	.quad	-2932602458528022528
	.quad	6139307230215798784
	.quad	-7744637676132761600
	.quad	-3511323875457630208
	.quad	1223283552930496512
	.quad	432910730384113664
	.quad	-9115426391876173824
	.quad	-1130314858345005056
	.quad	4916871379275481088
	.quad	-4999102080095354880
	.quad	-2042197390936506368
	.quad	-913859493152948224
	.quad	-98055147044732928
	.quad	-4593600701417914368
	.quad	-8462387923168264192
	.quad	-5939524159267667968
	.quad	-4855552058176045056
	.quad	5203971423114100736
	.quad	357462160881745920
	.quad	-2324776174242234368
	.quad	-4488199356410757120
	.quad	8492340492514623488
	.quad	7143027051337875456
	.quad	3463285843072909312
	.quad	1945554923059937280
	.quad	1077473003823955968
	.quad	7913619213023969280
	.quad	5534305471042682880
	.quad	1444542877697835008
	.quad	3824421562497368064
	.quad	3453395336549105664
	.quad	-2206940022739828736
	.quad	-6730744864192856064
	.quad	-3727779240649687040
	.quad	4113782270962171904
	.quad	6324395912374255616
	.quad	-961616011906252800
	.quad	-9043651380916518912
	.quad	5133326744467537920
	.quad	-6024579591358644224
	.quad	-1775159624668807168
	.quad	3105541120587726848
	.quad	-7677665508056891392
	.quad	-6890401052126871552
	.quad	-7457537563574665216
	.quad	-3364382856599044096
	.quad	9213481530330972160
	.quad	7359482416529932288
	.quad	9091125338066386944
	.quad	-6084204513500069888
	.quad	-8968769077082324992
	.quad	-3871329262568996864
	.quad	3021614938478084096
	.quad	-3190597566290984960
	.quad	4329107303841136640
	.quad	8781701132259950592
	.quad	-2135165011780173824
	.quad	2092778640960913408
	.quad	8564680652450955264
	.quad	4314695674223394816
	.quad	6211082241175453696
	.quad	5636882153498214400
	.quad	2164553651920568320
	.quad	-2645502414689402880
	.quad	722271438848917504
	.quad	7792393146914045952
	.quad	-1991614989860864000
	.quad	6756176379164753920
	.quad	7985959372960301056
	.quad	-1176375998887755776
	.quad	-6457490321742757888
	.quad	-6300094729715449856
	.quad	-6587194842273546240
	.quad	4027595561665298432
	.quad	-8396545949966532608
	.quad	3668155323530608640
	.quad	4884374295209312256
	.quad	6428667938680602624
	.quad	-5229402809236979712
	.quad	-8318837901248954368
	.quad	7265948530018091008
	.quad	-3292607845639389184
	.quad	-2258087607151886336
	.quad	-5445858174429036544
	.quad	-408043419496087552
	.quad	573352377097125888
	.quad	2732254298732756992
	.quad	-5808124226166587392
	.quad	-8180090584774475776
	.quad	-1608156396958777344
	.quad	1731642921536454656
	.quad	-3045917212058583040
	.quad	-8613001315158589440
	.quad	8008848512106102784
	.quad	8227564541924343808
	.quad	2601985711557050368
	.quad	-1033956171842584576
	.quad	-4056418958339735552
	.quad	5892615514303234048
	.quad	2587573944500355072
	.quad	8997591314115592192
	.quad	-7172979766713122816
	.quad	2386660678678085632
	.quad	-2500822060457000960
	.quad	-2540666390457614336
	.quad	-8751748562913591296
	.quad	-8824088722849923072
	.quad	-8038801227481350144
	.quad	4773321357356171264
	.quad	-4272309174555115520
	.quad	-6168129613277954048
	.quad	-2861957779881459712
	.quad	361135719424458752
	.quad	141571979026104320
	.quad	1300992855778525184
	.quad	-6673945686934814720
	.quad	6860448336751624192
	.quad	-479818430455742464
	.quad	-3406487782506364928
	.quad	-7960527857988403200
	.quad	6395605808716972032
	.quad	2818441076749107200
	.quad	-5071442240031686656
	.quad	4098805458008014848
	.quad	1439173769145876480
	.quad	-5505483234009415680
	.quad	3679741208264966144
	.quad	-4942302765398360064
	.quad	8131769922066841600
	.quad	-8534728083104595968
	.quad	-6371304626058166272
	.quad	-5288462719840681984
	.quad	2458435689637740544
	.quad	-7888187698052071424
	.quad	2371683728284975104
	.quad	5318415289187041280
	.quad	-48038032384720896
	.quad	8658214607682273280
	.quad	8854041292196282368
	.quad	-8102947685033574400
	.quad	-530965877428846592
	.quad	-9184659293297704960
	.quad	1660998242889891840
	.quad	-2684216412376924160
	.quad	3595815163594276864
	.quad	-4160689971033800704
	.quad	-5158758130590416896
	.quad	-4377145336225857536
	.quad	-5721373450224795648
	.quad	8587569929035710464
	.quad	1229217844818870272
	.quad	-3769318845781639168
	.quad	-264493397576777728
	.quad	-2973577052122251264
	.quad	4185557281921826816
	.quad	7161786244421124096
	.quad	8970317803634556928
	.quad	8608611553639399424
	.quad	8897976574251368448
	.quad	-940408940867354624
	.quad	7740516491803492352
	.quad	8029881512415461376
	.quad	-4195787687862468608
	.quad	3472381209416302592
	.quad	72341280922796032
	.quad	7451151333752569856
	.quad	3110675062500360192
	.quad	-72366449431150592
	.quad	-2893644803050831872
	.quad	-6076677621968535552
	.quad	8536270289896472576
	.quad	-3834094606237040640
	.quad	-9042630342636208128
	.quad	-3906440293796282368
	.quad	9042659084557352960
	.quad	-361713946576551936
	.quad	6438373864689893376
	.quad	5136230893978910720
	.quad	-1085091485533077504
	.quad	-5932012652308987904
	.quad	-3110664187643166720
	.quad	-6727709353106735104
	.quad	-5787330124823134208
	.quad	-7161810004180205568
	.quad	-6583044434986795008
	.quad	8246905200565026816
	.quad	-4557472007754612736
	.quad	-5208564967946584064
	.quad	-144712102630653952
	.quad	-7812833111024074752
	.quad	2748968640706510848
	.quad	3906428860593340416
	.quad	4557500165560205312
	.quad	-578724638155079680
	.quad	-3689429619397623808
	.quad	3761746333107486720
	.quad	-6510707577880313856
	.quad	-1880867248088809472
	.quad	-1012754628426596352
	.quad	8174563919642230784
	.quad	-2821316656138027008
	.quad	3544722490339098624
	.quad	1519166899378716672
	.quad	289365123691184128
	.quad	-4051105160376614912
	.quad	2531944815117991936
	.quad	-4340452588802539520
	.quad	1736190604708151296
	.quad	-7595822556884500480
	.quad	361706404613980160
	.quad	-7306474991019622400
	.quad	506388914919964672
	.quad	1302143056610328576
	.quad	-9187312887301931008
	.quad	-2097869023315230720
	.quad	-1446837292177031168
	.quad	2821309904449437696
	.quad	-5570249270658859008
	.quad	8463929043333414912
	.quad	651071528305164288
	.quad	-8970293468349857792
	.quad	3183016291883548672
	.quad	1880873166553743360
	.quad	1953214430296670208
	.quad	7957540248672534528
	.quad	6510715145612689408
	.quad	-6872391897772457984
	.quad	5931985035669274624
	.quad	4268135144948236288
	.quad	-2965981677337182208
	.quad	-5497912396372508672
	.quad	2965992517834637312
	.quad	-2025532149028880384
	.quad	3400040083112329216
	.quad	-8897965424516268032
	.quad	6004326299412201472
	.quad	-3327674793322348544
	.quad	0
	.quad	-1302172322517483520
	.quad	2314920989529473024
	.quad	-217048959737135104
	.quad	-5642594958218100736
	.quad	6583056409355616256
	.quad	7668175228060565504
	.quad	-3761757731950690304
	.quad	-4702206779222654976
	.quad	4123452600282513408
	.quad	5353254788286906368
	.quad	5497937281413021696
	.quad	6366032583767097344
	.quad	-3472410234805288960
	.quad	-3400011650428829696
	.quad	-1157489795031629824
	.quad	-6149014496254885888
	.quad	-289377072290201600
	.quad	4846865804647464960
	.quad	5570278562335817728
	.quad	3689405035004821504
	.quad	-8825628567409786880
	.quad	4991548383672926208
	.quad	-434059634135793664
	.quad	144682561845592064
	.quad	9187341594863337472
	.quad	5787302473823682560
	.quad	4340476374331424768
	.quad	-6944790619587870720
	.quad	-6293697040920608768
	.quad	5859643754746478592
	.quad	-6655372478820384768
	.quad	4629841979058946048
	.quad	-8102251114352607232
	.quad	-7885169985310425088
	.quad	-7089473147073724416
	.quad	4051111319359717376
	.quad	-723407165640933376
	.quad	-4846889289528639488
	.quad	-5280901842232934400
	.quad	-2676634111472304128
	.quad	2387262270452269056
	.quad	1157460494764736512
	.quad	-29575144800256
	.quad	-868072066581004288
	.quad	-3255329105763106816
	.quad	-3617092762291142656
	.quad	868095302354075648
	.quad	1374484320353255424
	.quad	-1374509179623964672
	.quad	6872421429967585280
	.quad	-7523485682598150144
	.quad	4919207102750130176
	.quad	1663849409684701184
	.quad	-4268124544968949760
	.quad	-6366025050394460160
	.quad	9115000331120410624
	.quad	4412817655254220800
	.quad	7234127542523789312
	.quad	6727738919661600768
	.quad	1808531885630947328
	.quad	8319246464307953664
	.quad	6944762418832605184
	.quad	-9114976030195449856
	.quad	5714961072641802240
	.quad	-2531969124632887296
	.quad	2459603551375065088
	.quad	3038333798757433344
	.quad	-8029852529976147968
	.quad	-8608618030450081792
	.quad	5063889630235983872
	.quad	-1229826669317980160
	.quad	-5136236821033779200
	.quad	1446825618455920640
	.quad	-2387286614326902784
	.quad	6800080166224658432
	.quad	795754072970887168
	.quad	-2604297237185953792
	.quad	-2242551567980953600
	.quad	3617063771261894656
	.quad	4195793881205309440
	.quad	723412809227960320
	.quad	5280913507364110336
	.quad	434047651177037824
	.quad	2604286113220657152
	.quad	6655397638738804736
	.quad	-4412789463088889856
	.quad	-3182992231476756480
	.quad	-6004349509415469056
	.quad	7089444980678197248
	.quad	-7957515672869666816
	.quad	-7668168210084003840
	.quad	-1953204105195290624
	.quad	8753294029585645568
	.quad	-1736184720602955776
	.quad	-3978777150902763520
	.quad	3978770124336267264
	.quad	7885199002109476864
	.quad	-8246933641838460928
	.quad	-3038327330536685568
	.quad	5642619808898875392
	.quad	-6221360183814127616
	.quad	7812857721186680832
	.quad	6221350125000720384
	.quad	-795744022747414528
	.quad	-1519174166463381504
	.quad	7306468823446585344
	.quad	8825635310508441600
	.quad	-5859666999109484544
	.quad	578730247382368256
	.quad	-4991554276368056320
	.quad	8680952748662849536
	.quad	2676627394143453184
	.quad	3327698819369402368
	.quad	2025555659679858688
	.quad	-6438361924680810496
	.quad	-5425584352538918912
	.quad	-4123442034662965248
	.quad	-1663856711129104384
	.quad	-2459632267526406144
	.quad	8391587762410618880
	.quad	2242579450908639232
	.quad	5425596052029833216
	.quad	-4774552432422158336
	.quad	-8391598611498008576
	.quad	-8463935485784358912
	.quad	8102222638719434752
	.quad	4485158901817278464
	.quad	-5353247495432437760
	.quad	7378810070009643008
	.quad	5208572226441314304
	.quad	217023825588518912
	.quad	-651061512441430016
	.quad	1012777829839929344
	.quad	7017103699755401216
	.quad	3834087614030282752
	.quad	6293691388743647232
	.quad	-5063899963927298048
	.quad	-8753282914210283520
	.quad	-4485135150648131584
	.quad	2097896940602654720
	.quad	-7017127493874221056
	.quad	-2170214710874472448
	.quad	-506396491242274816
	.quad	-7451157535685345280
	.quad	1229801775687532544
	.quad	7595833947137769472
	.quad	-2748979799031545856
	.quad	-8174587988638957568
	.quad	-7740505067190484992
	.quad	-7234138116733272064
	.quad	2170238187165712384
	.quad	-8680946039923933184
	.quad	-1591519854022623232
	.quad	-3544747109091639296
	.quad	6149008878437662720
	.quad	2893651236911841280
	.quad	-2314949740040552448
	.quad	-8319270498944942080
	.quad	-6800055040665976832
	.quad	-8536281173343600640
	.quad	940436583276871680
	.quad	-4629869904936304640
	.quad	-1808521594889306112
	.quad	4774524540904538112
	.quad	7523492666214973440
	.quad	4702183259981742080
	.quad	-7378820678578864128
	.quad	3255357572806344704
	.quad	1085119093582856192
	.quad	-5714931815324581888
	.quad	6076667597514866688
	.quad	-4919217402081705984
	.quad	1591508145941774336
	.quad	7189615699763920896
	.quad	9005093123038117888
	.quad	8642013471350718464
	.quad	8932482470356451328
	.quad	-937014864436527104
	.quad	7770606474333519872
	.quad	8061075473339252736
	.quad	-4210490971529412608
	.quad	3485874278673416192
	.quad	72623846821199872
	.quad	7480102290955698176
	.quad	3122821015265083392
	.quad	-79065889743306752
	.quad	-2903305709212925952
	.quad	-6102968297903357952
	.quad	8569394022576029696
	.quad	-3850782422492774400
	.quad	-9070357942829580288
	.quad	-3924534368244072448
	.quad	9077716969859317760
	.quad	-365048881307713536
	.quad	6463487182714699776
	.quad	5156279930165657600
	.quad	-1082258160032415744
	.quad	-5962224203888328704
	.quad	-3120035956606894080
	.quad	-6746394844551184384
	.quad	-5816985306338951168
	.quad	-7195697102872117248
	.quad	-6605663944675688448
	.quad	8278907431384252416
	.quad	-4567956516845387776
	.quad	-5227057701258788864
	.quad	-152809039401582592
	.quad	-7836915830171369472
	.quad	2759697383112572928
	.quad	3921608563507593216
	.quad	4575166010293747712
	.quad	-579553717167063040
	.quad	-3710033930431234048
	.quad	3776369665958215680
	.quad	-6534172594831097856
	.quad	-1886668610739372032
	.quad	-1010766810187825152
	.quad	8206283584563052544
	.quad	-2834044168949465088
	.quad	3558498125494616064
	.quad	1525100783245197312
	.quad	290495387284799488
	.quad	-4065252073980035072
	.quad	2541830240695484416
	.quad	-4351217473358397440
	.quad	1742937139336708096
	.quad	-7622446178684108800
	.quad	363119234105999360
	.quad	-7336445594933657600
	.quad	508353733608865792
	.quad	1307229242781597696
	.quad	-9215601238425468928
	.quad	-2098890860459458560
	.quad	-1455464313811632128
	.quad	2832316831887261696
	.quad	-5584518848528252928
	.quad	8496778971847852032
	.quad	653614621390798848
	.quad	-8998862194938478592
	.quad	3195431667946749952
	.quad	1888184832979107840
	.quad	1960804281753796608
	.quad	7988456024564563968
	.quad	6536111029535899648
	.quad	-6891638140147073024
	.quad	5955155439338389504
	.quad	4284697011288014848
	.quad	-2974801457104027648
	.quad	-5513023100637151232
	.quad	2977577719669194752
	.quad	-2027395112568356864
	.quad	3413290014270816256
	.quad	-8929627042954084352
	.quad	6027774888113078272
	.quad	-3334518802233688064
	.quad	0
	.quad	-1314720219796602880
	.quad	2323963098278395904
	.quad	-224300389246173184
	.quad	-5658270794279550976
	.quad	6608730478310588416
	.quad	7697987025558831104
	.quad	-3779286674601672704
	.quad	-4726569873835032576
	.quad	4139453715692126208
	.quad	5374164664768790528
	.quad	5519394766225145856
	.quad	6390863335893499904
	.quad	-3493303683037265920
	.quad	-3406010152078278656
	.quad	-1169481322247225344
	.quad	-6174464045794459648
	.quad	-293553133416611840
	.quad	4865793338973880320
	.quad	5592018613046345728
	.quad	3703741421090504704
	.quad	-8858135693109493760
	.quad	5011045430662791168
	.quad	-438800827059011584
	.quad	145247693642399744
	.quad	9222951469362184192
	.quad	5809907745695989760
	.quad	4357307663969681408
	.quad	-6978966855478149120
	.quad	-6319707341390348288
	.quad	5882531592517189632
	.quad	-6674899096660082688
	.quad	4647926196556791808
	.quad	-8140948404617347072
	.quad	-7908411578062471168
	.quad	-7124205753027526656
	.quad	4066829868870926336
	.quad	-724792614716440576
	.quad	-4871804373337899008
	.quad	-5298553449149890560
	.quad	-2688800873353576448
	.quad	2396586945099595776
	.quad	1161981549139197952
	.quad	-7570141852205056
	.quad	-865519116545425408
	.quad	-3260766856482390016
	.quad	-3638542580586643456
	.quad	871468569668354048
	.quad	1379848691556286464
	.quad	-1386211569641193472
	.quad	6899199477316321280
	.quad	-7550950430793007104
	.quad	4938421583841591296
	.quad	1670335282748063744
	.quad	-4281982321374003200
	.quad	-6388933697281720320
	.quad	9150332020587495424
	.quad	4429931510790881280
	.quad	7262243944631631872
	.quad	6753964977813454848
	.quad	1815560986157907968
	.quad	8351526880158941184
	.quad	6971748557346832384
	.quad	-9144109888580878336
	.quad	5737253112549212160
	.quad	-2548052381292036096
	.quad	2469210791920795648
	.quad	3050201566490394624
	.quad	-8053654873658359808
	.quad	-8643670439668744192
	.quad	5083660481390968832
	.quad	-1240977070138327040
	.quad	-5157796160995328000
	.quad	1452476936423997440
	.quad	-2402817881789169664
	.quad	6826580028541632512
	.quad	798857916986687488
	.quad	-2617305125462474752
	.quad	-2244134156055347200
	.quad	3631121972315815936
	.quad	4212077562513326080
	.quad	726238468211998720
	.quad	5301540817947590656
	.quad	435734284834177024
	.quad	2614458485563195392
	.quad	6681341130992254976
	.quad	-4422713221249499136
	.quad	-3189271108591288320
	.quad	-6033715553732919296
	.quad	7116996250989232128
	.quad	-7982163523813769216
	.quad	-7696189328342384640
	.quad	-1958159960583962624
	.quad	8787239174760562688
	.quad	-1741429713189994496
	.quad	-3996025718088663040
	.quad	3994228012282281984
	.quad	7915840973836386304
	.quad	-8286187302166724608
	.quad	-3048544606762303488
	.quad	5664633663774523392
	.quad	-6248215991545757696
	.quad	7843217127015186432
	.quad	6245642030530166784
	.quad	-796283964561031168
	.quad	-1526960061702733824
	.quad	7334867791452831744
	.quad	8859863021581762560
	.quad	-5888481054230052864
	.quad	580990774569598976
	.quad	-5012552865399439360
	.quad	8714615327939362816
	.quad	2687082332384395264
	.quad	3340670565496127488
	.quad	2033414934435463168
	.quad	-6460429445172822016
	.quad	-5443787948652756992
	.quad	-4136747821871136768
	.quad	-1672203357298622464
	.quad	-2476561031447445504
	.quad	8424155125026652160
	.quad	2251273280759529472
	.quad	5446784113543479296
	.quad	-4800313023493308416
	.quad	-8426931396181753856
	.quad	-8498427144072855552
	.quad	8133659737741852672
	.quad	4502546561519058944
	.quad	-5372296598808166400
	.quad	7407482842181009408
	.quad	5228916971126390784
	.quad	217867142417088512
	.quad	-651049465058164736
	.quad	1016707467217731584
	.quad	7044372404168032256
	.quad	3848993512779415552
	.quad	6318261479304855552
	.quad	-5086304811150737408
	.quad	-8784392543451217920
	.quad	-4496465167000797184
	.quad	2106038781256663040
	.quad	-7050462603369250816
	.quad	-2172642806210756608
	.quad	-510292176903602176
	.quad	-7481688890529546240
	.quad	1234605395960397824
	.quad	7625363178737631232
	.quad	-2762552819104874496
	.quad	-8212444152508448768
	.quad	-7767680678186975232
	.quad	-7264949847042555904
	.quad	2178653831984840704
	.quad	-8712896795560116224
	.quad	-1600712007454031872
	.quad	-3564799430928367616
	.quad	6173026979801989120
	.quad	2904953872847994880
	.quad	-2331322133898067968
	.quad	-8357678652011315200
	.quad	-6820146790302482432
	.quad	-8572179089824153600
	.quad	944092416489553920
	.quad	-4655074125943930880
	.quad	-1812925461081096192
	.quad	4793173890199191552
	.quad	7552739331916431360
	.quad	4720550043377991680
	.quad	-7410197540684955648
	.quad	3268055514767949824
	.quad	1089326915992420352
	.quad	-5729762144124141568
	.quad	6100403132980789248
	.quad	-4941057117508337664
	.quad	1597715833973374976
	.quad	-4132787806189649920
	.quad	-539169183359827968
	.quad	-1253839668261158912
	.quad	-680752200451883008
	.quad	-68131298144681984
	.quad	-2973102071688986624
	.quad	-2400014603879710720
	.quad	-7974531590267076608
	.quad	6940100008494497792
	.quad	144960716812582912
	.quad	-3555196738753003520
	.quad	6232184923034222592
	.quad	-1794122609655283712
	.quad	-5376497686709010432
	.quad	5613362736491659264
	.quad	-1397674485166899200
	.quad	-8122863383960616960
	.quad	2278120481376698368
	.quad	-8556617426878332928
	.quad	-394208466547245056
	.quad	-1218792172485083136
	.quad	-5554247476644413440
	.quad	-8157910879736692736
	.quad	-356926831863005184
	.quad	4750362665509978112
	.quad	-5519208811321098240
	.quad	6916863419379351552
	.quad	5038032299321458688
	.quad	2575949705708044288
	.quad	6050485648677142528
	.quad	-1975265552603545600
	.quad	-7251990844083798016
	.quad	8485546644526333952
	.quad	-2225624852759314432
	.quad	4444652141830733824
	.quad	5506255439064465408
	.quad	7807612509556310016
	.quad	9097622262080602112
	.quad	-791797944234803200
	.quad	-8984737555035455488
	.quad	7519942875744829440
	.quad	5905527139477749760
	.quad	-3371817449283387392
	.quad	-501885341062397952
	.quad	-2120226269416128512
	.quad	-6092287448677613568
	.quad	7085060725307080704
	.quad	3044175053064241152
	.quad	579842867250331648
	.quad	-7686861956455596032
	.quad	5072499188533559296
	.quad	-7107027919658024960
	.quad	3470050004247248896
	.quad	4008650714325712896
	.quad	724803584062914560
	.quad	3437823876782882816
	.quad	1011347317967552512
	.quad	2609292902626492416
	.quad	1989324947658375168
	.quad	-2360481169381785600
	.quad	-3663981852269477888
	.quad	5650090255970205696
	.quad	9209213290616455168
	.quad	-1540383402165796864
	.quad	1304646451313246208
	.quad	2134287872084148224
	.quad	6373767940126277632
	.quad	3759971437872414720
	.quad	3903806254778155008
	.quad	-2543849420785451008
	.quad	-5409286759831830528
	.quad	6628067885661028352
	.quad	-6559965295077752832
	.quad	8524534794271326208
	.quad	-5232665077416460288
	.quad	9065380681323905024
	.quad	5943389389315899392
	.quad	-2504313778674335744
	.quad	6805272390843498496
	.quad	1411742710674489344
	.quad	-6416130478172012544
	.quad	-5086585083536605184
	.quad	0
	.quad	-4526981923251159040
	.quad	4638742938002653184
	.quad	-2080666343559921664
	.quad	8775459247698739200
	.quad	-5265451942926090240
	.quad	-3116936888594726912
	.quad	-8266695993253167104
	.quad	7483221979105853440
	.quad	8235739260553003008
	.quad	-7719651029578416128
	.quad	-7434233195580620800
	.quad	-5699208193456996352
	.quad	-8842026430423367680
	.quad	-4941626574337212416
	.quad	-4239312289439678464
	.quad	5757195345784209408
	.quad	-1362624781777633280
	.quad	-8735501947173339136
	.quad	-7289272478768037888
	.quad	7373856259025403904
	.quad	1266784201475096576
	.quad	-8444454613641330688
	.quad	-1652546215402799104
	.quad	289921433625165824
	.quad	-107664732642607104
	.quad	-6849886728702918656
	.quad	8666117811363381248
	.quad	2718660830320132096
	.quad	5468399812065886208
	.quad	-6704926011890335744
	.quad	6773030810086801408
	.quad	-9169258197704245248
	.quad	399289361318805504
	.quad	4588484751123283968
	.quad	2430991196508651520
	.quad	8090778543740420096
	.quad	-1079467578046283776
	.quad	7196678245201215488
	.quad	8629379253818884096
	.quad	-5803491914959290368
	.quad	4783703654815236096
	.quad	2319371469001326592
	.quad	-1937955218947833856
	.quad	-211963907437232128
	.quad	-4652831040618889216
	.quad	-9129696064234848256
	.quad	1735025002123624448
	.quad	2753127719532232704
	.quad	-4382023414051766272
	.quad	-4692364475116814336
	.quad	3864818105033162752
	.quad	-8589415330453913600
	.quad	3330718786968879104
	.quad	-7829573081067683840
	.quad	6193196773289230336
	.quad	-251499549548347392
	.quad	8811078528175964160
	.quad	-3986701189470224384
	.quad	-4978908209021452288
	.quad	3615010721059831808
	.quad	-1831430735697805312
	.quad	-4566544056720556032
	.quad	1844366438458982400
	.quad	-7002728744863399936
	.quad	-6665366086034128896
	.quad	4928664371627819008
	.quad	6088350106128482304
	.quad	4299689217404960768
	.quad	829656874063233024
	.quad	-8301745696642433024
	.quad	-4095479680147128320
	.quad	7769756882557730816
	.quad	2899214336251658240
	.quad	-6378822352129490944
	.quad	-4836199292022554624
	.quad	1593441985031569408
	.quad	-5947324524251840512
	.quad	-2649276703100108800
	.quad	7230021442119663616
	.quad	8380699977365585920
	.quad	1449607168125829120
	.quad	-7864611746390999040
	.quad	867512501061812224
	.quad	5218585805252984832
	.quad	-5123868925834035200
	.quad	-6963195310365474816
	.quad	-4796663649911439360
	.quad	4895321174709370880
	.quad	-4276622623095390208
	.quad	4154730708205568000
	.quad	3577148471221682176
	.quad	-3226858940083994624
	.quad	-969547734170206208
	.quad	-3084147815471906816
	.quad	-8411658917678940160
	.quad	7951447326462050304
	.quad	-2686558337784348672
	.quad	111619727507324928
	.quad	-5664167320520491008
	.quad	-7146563561769140224
	.quad	5323441302866493440
	.quad	-2831519054596931584
	.quad	-5982374227641106432
	.quad	-934509068846891008
	.quad	-3520149242976927744
	.quad	-3841740472657641472
	.quad	-824587017357623296
	.quad	5181864908614008832
	.quad	1159685734500663296
	.quad	8058552416276054016
	.quad	-1114508450982789120
	.quad	5363546522065567744
	.quad	6661437573937758208
	.quad	4045389271870210048
	.quad	6337029382581780480
	.quad	8342835519914246144
	.quad	-7543029347163045888
	.quad	-3808944776695250944
	.quad	-6810324595233521664
	.quad	-1685344118978379776
	.quad	4476893722587430912
	.quad	-7575816212672675840
	.quad	7051719736001822720
	.quad	974619798489006080
	.quad	1118452407781556224
	.quad	-2265186986228711424
	.quad	8953787445174861824
	.quad	8197877010714853376
	.quad	-3699031555658743808
	.quad	-8009572463203581952
	.quad	433756250530906112
	.quad	-647965334942253056
	.quad	2022694635935105024
	.quad	-4421583339907973120
	.quad	7664903592557412352
	.quad	-5838539410735366144
	.quad	7624798373358338048
	.quad	1698286444579127296
	.quad	-7396949353283190784
	.quad	4190349988682792960
	.quad	2862493439612682240
	.quad	-2794235212299501568
	.quad	-1507587706203406336
	.quad	3149028343064559616
	.quad	2464332185813909504
	.quad	-3261897605407309824
	.quad	-6237245957877006336
	.quad	543121970611355648
	.quad	3722106980421074944
	.quad	3293991267490332672
	.quad	4333058905681690624
	.quad	1554453835286577152
	.quad	-3953903285894643712
	.quad	-8698193821130817536
	.quad	-6125083144640004096
	.quad	5798428672503316480
	.quad	-6522654961422041088
	.quad	256578236706717696
	.quad	6483109376461635584
	.quad	684698364863840256
	.quad	1879985718936207360
	.quad	7339389369813303296
	.quad	-2940315206179356672
	.quad	-8879336764079079424
	.quad	-3406858322219892736
	.quad	-9024297480891662336
	.quad	3004069833865166848
	.quad	6518728656938860544
	.quad	2166529452840845312
	.quad	8920417756898131968
	.quad	-6270043861452587008
	.quad	7914719806983503872
	.quad	3186883970063138816
.globl TC
	.align 32
	.type	TC, @object
	.size	TC, 8192
TC:
	.quad	2774754246
	.quad	2222750968
	.quad	2574743534
	.quad	2373680118
	.quad	234025727
	.quad	3177933782
	.quad	2976870366
	.quad	1422247313
	.quad	1345335392
	.quad	50397442
	.quad	2842126286
	.quad	2099981142
	.quad	436141799
	.quad	1658312629
	.quad	3870010189
	.quad	2591454956
	.quad	1170918031
	.quad	2642575903
	.quad	1086966153
	.quad	2273148410
	.quad	368769775
	.quad	3948501426
	.quad	3376891790
	.quad	200339707
	.quad	3970805057
	.quad	1742001331
	.quad	4255294047
	.quad	3937382213
	.quad	3214711843
	.quad	4154762323
	.quad	2524082916
	.quad	1539358875
	.quad	3266819957
	.quad	486407649
	.quad	2928907069
	.quad	1780885068
	.quad	1513502316
	.quad	1094664062
	.quad	49805301
	.quad	1338821763
	.quad	1546925160
	.quad	4104496465
	.quad	887481809
	.quad	150073849
	.quad	2473685474
	.quad	1943591083
	.quad	1395732834
	.quad	1058346282
	.quad	201589768
	.quad	1388824469
	.quad	1696801606
	.quad	1589887901
	.quad	672667696
	.quad	2711000631
	.quad	251987210
	.quad	3046808111
	.quad	151455502
	.quad	907153956
	.quad	2608889883
	.quad	1038279391
	.quad	652995533
	.quad	1764173646
	.quad	3451040383
	.quad	2675275242
	.quad	453576978
	.quad	2659418909
	.quad	1949051992
	.quad	773462580
	.quad	756751158
	.quad	2993581788
	.quad	3998898868
	.quad	4221608027
	.quad	4132590244
	.quad	1295727478
	.quad	1641469623
	.quad	3467883389
	.quad	2066295122
	.quad	1055122397
	.quad	1898917726
	.quad	2542044179
	.quad	4115878822
	.quad	1758581177
	.quad	0
	.quad	753790401
	.quad	1612718144
	.quad	536673507
	.quad	3367088505
	.quad	3982187446
	.quad	3194645204
	.quad	1187761037
	.quad	3653156455
	.quad	1262041458
	.quad	3729410708
	.quad	3561770136
	.quad	3898103984
	.quad	1255133061
	.quad	1808847035
	.quad	720367557
	.quad	3853167183
	.quad	385612781
	.quad	3309519750
	.quad	3612167578
	.quad	1429418854
	.quad	2491778321
	.quad	3477423498
	.quad	284817897
	.quad	100794884
	.quad	2172616702
	.quad	4031795360
	.quad	1144798328
	.quad	3131023141
	.quad	3819481163
	.quad	4082192802
	.quad	4272137053
	.quad	3225436288
	.quad	2324664069
	.quad	2912064063
	.quad	3164445985
	.quad	1211644016
	.quad	83228145
	.quad	3753688163
	.quad	3249976951
	.quad	1977277103
	.quad	1663115586
	.quad	806359072
	.quad	452984805
	.quad	250868733
	.quad	1842533055
	.quad	1288555905
	.quad	336333848
	.quad	890442534
	.quad	804056259
	.quad	3781124030
	.quad	2727843637
	.quad	3427026056
	.quad	957814574
	.quad	1472513171
	.quad	4071073621
	.quad	2189328124
	.quad	1195195770
	.quad	2892260552
	.quad	3881655738
	.quad	723065138
	.quad	2507371494
	.quad	2690670784
	.quad	2558624025
	.quad	3511635870
	.quad	2145180835
	.quad	1713513028
	.quad	2116692564
	.quad	2878378043
	.quad	2206763019
	.quad	3393603212
	.quad	703524551
	.quad	3552098411
	.quad	1007948840
	.quad	2044649127
	.quad	3797835452
	.quad	487262998
	.quad	1994120109
	.quad	1004593371
	.quad	1446130276
	.quad	1312438900
	.quad	503974420
	.quad	3679013266
	.quad	168166924
	.quad	1814307912
	.quad	3831258296
	.quad	1573044895
	.quad	1859376061
	.quad	4021070915
	.quad	2791465668
	.quad	2828112185
	.quad	2761266481
	.quad	937747667
	.quad	2339994098
	.quad	854058965
	.quad	1137232011
	.quad	1496790894
	.quad	3077402074
	.quad	2358086913
	.quad	1691735473
	.quad	3528347292
	.quad	3769215305
	.quad	3027004632
	.quad	4199962284
	.quad	133494003
	.quad	636152527
	.quad	2942657994
	.quad	2390391540
	.quad	3920539207
	.quad	403179536
	.quad	3585784431
	.quad	2289596656
	.quad	1864705354
	.quad	1915629148
	.quad	605822008
	.quad	4054230615
	.quad	3350508659
	.quad	1371981463
	.quad	602466507
	.quad	2094914977
	.quad	2624877800
	.quad	555687742
	.quad	3712699286
	.quad	3703422305
	.quad	2257292045
	.quad	2240449039
	.quad	2423288032
	.quad	1111375484
	.quad	3300242801
	.quad	2858837708
	.quad	3628615824
	.quad	84083462
	.quad	32962295
	.quad	302911004
	.quad	2741068226
	.quad	1597322602
	.quad	4183250862
	.quad	3501832553
	.quad	2441512471
	.quad	1489093017
	.quad	656219450
	.quad	3114180135
	.quad	954327513
	.quad	335083755
	.quad	3013122091
	.quad	856756514
	.quad	3144247762
	.quad	1893325225
	.quad	2307821063
	.quad	2811532339
	.quad	3063651117
	.quad	572399164
	.quad	2458355477
	.quad	552200649
	.quad	1238290055
	.quad	4283782570
	.quad	2015897680
	.quad	2061492133
	.quad	2408352771
	.quad	4171342169
	.quad	2156497161
	.quad	386731290
	.quad	3669999461
	.quad	837215959
	.quad	3326231172
	.quad	3093850320
	.quad	3275833730
	.quad	2962856233
	.quad	1999449434
	.quad	286199582
	.quad	3417354363
	.quad	4233385128
	.quad	3602627437
	.quad	974525996
	.quad	1667483301
	.quad	2088564868
	.quad	2004348569
	.quad	2071721613
	.quad	4076011277
	.quad	1802229437
	.quad	1869602481
	.quad	3318059348
	.quad	808476752
	.quad	16843267
	.quad	1734856361
	.quad	724260477
	.quad	4278118169
	.quad	3621238114
	.quad	2880130534
	.quad	1987505306
	.quad	3402272581
	.quad	2189565853
	.quad	3385428288
	.quad	2105408135
	.quad	4210749205
	.quad	1499050731
	.quad	1195871945
	.quad	4042324747
	.quad	2913812972
	.quad	3570709351
	.quad	2728550397
	.quad	2947499498
	.quad	2627478463
	.quad	2762232823
	.quad	1920132246
	.quad	3233848155
	.quad	3082253762
	.quad	4261273884
	.quad	2475900334
	.quad	640044138
	.quad	909536346
	.quad	1061125697
	.quad	4160222466
	.quad	3435955023
	.quad	875849820
	.quad	2779075060
	.quad	3857043764
	.quad	4059166984
	.quad	1903288979
	.quad	3638078323
	.quad	825320019
	.quad	353708607
	.quad	67373068
	.quad	3351745874
	.quad	589514341
	.quad	3284376926
	.quad	404238376
	.quad	2526427041
	.quad	84216335
	.quad	2593796021
	.quad	117902857
	.quad	303178806
	.quad	2155879323
	.quad	3806519101
	.quad	3958099238
	.quad	656887401
	.quad	2998042573
	.quad	1970662047
	.quad	151589403
	.quad	2206408094
	.quad	741103732
	.quad	437924910
	.quad	454768173
	.quad	1852759218
	.quad	1515893998
	.quad	2694863867
	.quad	1381147894
	.quad	993752653
	.quad	3604395873
	.quad	3014884814
	.quad	690573947
	.quad	3823361342
	.quad	791633521
	.quad	2223248279
	.quad	1397991157
	.quad	3520182632
	.quad	0
	.quad	3991781676
	.quad	538984544
	.quad	4244431647
	.quad	2981198280
	.quad	1532737261
	.quad	1785386174
	.quad	3419114822
	.quad	3200149465
	.quad	960066123
	.quad	1246401758
	.quad	1280088276
	.quad	1482207464
	.quad	3486483786
	.quad	3503340395
	.quad	4025468202
	.quad	2863288293
	.quad	4227591446
	.quad	1128498885
	.quad	1296931543
	.quad	859006549
	.quad	2240090516
	.quad	1162185423
	.quad	4193904912
	.quad	33686534
	.quad	2139094657
	.quad	1347461360
	.quad	1010595908
	.quad	2678007226
	.quad	2829601763
	.quad	1364304627
	.quad	2745392638
	.quad	1077969088
	.quad	2408514954
	.quad	2459058093
	.quad	2644320700
	.quad	943222856
	.quad	4126535940
	.quad	3166462943
	.quad	3065411521
	.quad	3671764853
	.quad	555827811
	.quad	269492272
	.quad	4294960410
	.quad	4092853518
	.quad	3537026925
	.quad	3452797260
	.quad	202119188
	.quad	320022069
	.quad	3974939439
	.quad	1600110305
	.quad	2543269282
	.quad	1145342156
	.quad	387395129
	.quad	3301217111
	.quad	2812761586
	.quad	2122251394
	.quad	1027439175
	.quad	1684326572
	.quad	1566423783
	.quad	421081643
	.quad	1936975509
	.quad	1616953504
	.quad	2172721560
	.quad	1330618065
	.quad	3705447295
	.quad	572671078
	.quad	707417214
	.quad	2425371563
	.quad	2290617219
	.quad	1179028682
	.quad	4008625961
	.quad	3099093971
	.quad	336865340
	.quad	3739133817
	.quad	1583267042
	.quad	185275933
	.quad	3688607094
	.quad	3772832571
	.quad	842163286
	.quad	976909390
	.quad	168432670
	.quad	1229558491
	.quad	101059594
	.quad	606357612
	.quad	1549580516
	.quad	3267534685
	.quad	3553869166
	.quad	2896970735
	.quad	1650640038
	.quad	2442213800
	.quad	2509582756
	.quad	3840201527
	.quad	2038035083
	.quad	3890730290
	.quad	3368586051
	.quad	926379609
	.quad	1835915959
	.quad	2374828428
	.quad	3587551588
	.quad	1313774802
	.quad	2846444000
	.quad	1819072692
	.quad	1448520954
	.quad	4109693703
	.quad	3941256997
	.quad	1701169839
	.quad	2054878350
	.quad	2930657257
	.quad	134746136
	.quad	3132780501
	.quad	2021191816
	.quad	623200879
	.quad	774790258
	.quad	471611428
	.quad	2795919345
	.quad	3031724999
	.quad	3334903633
	.quad	3907570467
	.quad	3722289532
	.quad	1953818780
	.quad	522141217
	.quad	1263245021
	.quad	3183305180
	.quad	2341145990
	.quad	2324303749
	.quad	1886445712
	.quad	1044282434
	.quad	3048567236
	.quad	1718013098
	.quad	1212715224
	.quad	50529797
	.quad	4143380225
	.quad	235805714
	.quad	1633796771
	.quad	892693087
	.quad	1465364217
	.quad	3115936208
	.quad	2256934801
	.quad	3250690392
	.quad	488454695
	.quad	2661164985
	.quad	3789674808
	.quad	4177062675
	.quad	2560109491
	.quad	286335539
	.quad	1768542907
	.quad	3654920560
	.quad	2391672713
	.quad	2492740519
	.quad	2610638262
	.quad	505297954
	.quad	2273777042
	.quad	3924412704
	.quad	3469641545
	.quad	1431677695
	.quad	673730680
	.quad	3755976058
	.quad	2357986191
	.quad	2711706104
	.quad	2307459456
	.quad	218962455
	.quad	3216991706
	.quad	3873888049
	.quad	1111655622
	.quad	1751699640
	.quad	1094812355
	.quad	2576951728
	.quad	757946999
	.quad	252648977
	.quad	2964356043
	.quad	1414834428
	.quad	3149622742
	.quad	370551866
	.quad	1673962851
	.quad	2096661628
	.quad	2012125559
	.quad	2079755643
	.quad	4076801522
	.quad	1809235307
	.quad	1876865391
	.quad	3314635973
	.quad	811618352
	.quad	16909057
	.quad	1741597031
	.quad	727088427
	.quad	4276558334
	.quad	3618988759
	.quad	2874009259
	.quad	1995217526
	.quad	3398387146
	.quad	2183110018
	.quad	3381215433
	.quad	2113570685
	.quad	4209972730
	.quad	1504897881
	.quad	1200539975
	.quad	4042984432
	.quad	2906778797
	.quad	3568527316
	.quad	2724199842
	.quad	2940594863
	.quad	2619588508
	.quad	2756966308
	.quad	1927583346
	.quad	3231407040
	.quad	3077948087
	.quad	4259388669
	.quad	2470293139
	.quad	642542118
	.quad	913070646
	.quad	1065238847
	.quad	4160029431
	.quad	3431157708
	.quad	879254580
	.quad	2773611685
	.quad	3855693029
	.quad	4059629809
	.quad	1910674289
	.quad	3635114968
	.quad	828527409
	.quad	355090197
	.quad	67636228
	.quad	3348452039
	.quad	591815971
	.quad	3281870531
	.quad	405809176
	.quad	2520228246
	.quad	84545285
	.quad	2586817946
	.quad	118360327
	.quad	304363026
	.quad	2149292928
	.quad	3806281186
	.quad	3956090603
	.quad	659450151
	.quad	2994720178
	.quad	1978310517
	.quad	152181513
	.quad	2199756419
	.quad	743994412
	.quad	439627290
	.quad	456535323
	.quad	1859957358
	.quad	1521806938
	.quad	2690382752
	.quad	1386542674
	.quad	997608763
	.quad	3602342358
	.quad	3011366579
	.quad	693271337
	.quad	3822927587
	.quad	794718511
	.quad	2215876484
	.quad	1403450707
	.quad	3518589137
	.quad	0
	.quad	3988860141
	.quad	541089824
	.quad	4242743292
	.quad	2977548465
	.quad	1538714971
	.quad	1792327274
	.quad	3415033547
	.quad	3194476990
	.quad	963791673
	.quad	1251270218
	.quad	1285084236
	.quad	1487988824
	.quad	3481619151
	.quad	3501943760
	.quad	4022676207
	.quad	2857362858
	.quad	4226619131
	.quad	1132905795
	.quad	1301993293
	.quad	862344499
	.quad	2232521861
	.quad	1166724933
	.quad	4192801017
	.quad	33818114
	.quad	2147385727
	.quad	1352724560
	.quad	1014514748
	.quad	2670049951
	.quad	2823545768
	.quad	1369633617
	.quad	2740846243
	.quad	1082179648
	.quad	2399505039
	.quad	2453646738
	.quad	2636233885
	.quad	946882616
	.quad	4126213365
	.quad	3160661948
	.quad	3061301686
	.quad	3668932058
	.quad	557998881
	.quad	270544912
	.quad	4293204735
	.quad	4093447923
	.quad	3535760850
	.quad	3447803085
	.quad	202904588
	.quad	321271059
	.quad	3972214764
	.quad	1606345055
	.quad	2536874647
	.quad	1149815876
	.quad	388905239
	.quad	3297990596
	.quad	2807427751
	.quad	2130477694
	.quad	1031423805
	.quad	1690872932
	.quad	1572530013
	.quad	422718233
	.quad	1944491379
	.quad	1623236704
	.quad	2165938305
	.quad	1335808335
	.quad	3701702620
	.quad	574907938
	.quad	710180394
	.quad	2419829648
	.quad	2282455944
	.quad	1183631942
	.quad	4006029806
	.quad	3094074296
	.quad	338181140
	.quad	3735517662
	.quad	1589437022
	.quad	185998603
	.quad	3685578459
	.quad	3772464096
	.quad	845436466
	.quad	980700730
	.quad	169090570
	.quad	1234361161
	.quad	101452294
	.quad	608726052
	.quad	1555620956
	.quad	3265224130
	.quad	3552407251
	.quad	2890133420
	.quad	1657054818
	.quad	2436475025
	.quad	2503058581
	.quad	3839047652
	.quad	2045938553
	.quad	3889509095
	.quad	3364570056
	.quad	929978679
	.quad	1843050349
	.quad	2365688973
	.quad	3585172693
	.quad	1318900302
	.quad	2840191145
	.quad	1826141292
	.quad	1454176854
	.quad	4109567988
	.quad	3939444202
	.quad	1707781989
	.quad	2062847610
	.quad	2923948462
	.quad	135272456
	.quad	3127891386
	.quad	2029029496
	.quad	625635109
	.quad	777810478
	.quad	473441308
	.quad	2790781350
	.quad	3027486644
	.quad	3331805638
	.quad	3905627112
	.quad	3718347997
	.quad	1961401460
	.quad	524165407
	.quad	1268178251
	.quad	3177307325
	.quad	2332919435
	.quad	2316273034
	.quad	1893765232
	.quad	1048330814
	.quad	3044132021
	.quad	1724688998
	.quad	1217452104
	.quad	50726147
	.quad	4143383030
	.quad	236720654
	.quad	1640145761
	.quad	896163637
	.quad	1471084887
	.quad	3110719673
	.quad	2249691526
	.quad	3248052417
	.quad	490350365
	.quad	2653403550
	.quad	3789109473
	.quad	4176155640
	.quad	2553000856
	.quad	287453969
	.quad	1775418217
	.quad	3651760345
	.quad	2382858638
	.quad	2486413204
	.quad	2603464347
	.quad	507257374
	.quad	2266337927
	.quad	3922272489
	.quad	3464972750
	.quad	1437269845
	.quad	676362280
	.quad	3752164063
	.quad	2349043596
	.quad	2707028129
	.quad	2299101321
	.quad	219813645
	.quad	3211123391
	.quad	3872862694
	.quad	1115997762
	.quad	1758509160
	.quad	1099088705
	.quad	2569646233
	.quad	760903469
	.quad	253628687
	.quad	2960903088
	.quad	1420360788
	.quad	3144537787
	.quad	371997206
	.quad	3332727651
	.quad	4169432188
	.quad	4003034999
	.quad	4136467323
	.quad	4279104242
	.quad	3602738027
	.quad	3736170351
	.quad	2438251973
	.quad	1615867952
	.quad	33751297
	.quad	3467208551
	.quad	1451043627
	.quad	3877240574
	.quad	3043153879
	.quad	1306962859
	.quad	3969545846
	.quad	2403715786
	.quad	530416258
	.quad	2302724553
	.quad	4203183485
	.quad	4011195130
	.quad	3001768281
	.quad	2395555655
	.quad	4211863792
	.quad	1106029997
	.quad	3009926356
	.quad	1610457762
	.quad	1173008303
	.quad	599760028
	.quad	1408738468
	.quad	3835064946
	.quad	2606481600
	.quad	1975695287
	.quad	3776773629
	.quad	1034851219
	.quad	1282024998
	.quad	1817851446
	.quad	2118205247
	.quad	4110612471
	.quad	2203045068
	.quad	1750873140
	.quad	1374987685
	.quad	3509904869
	.quad	4178113009
	.quad	3801313649
	.quad	2876496088
	.quad	1649619249
	.quad	708777237
	.quad	135005188
	.quad	2505230279
	.quad	1181033251
	.quad	2640233411
	.quad	807933976
	.quad	933336726
	.quad	168756485
	.quad	800430746
	.quad	235472647
	.quad	607523346
	.quad	463175808
	.quad	3745374946
	.quad	3441880043
	.quad	1315514151
	.quad	2144187058
	.quad	3936318837
	.quad	303761673
	.quad	496927619
	.quad	1484008492
	.quad	875436570
	.quad	908925723
	.quad	3702681198
	.quad	3035519578
	.quad	1543217312
	.quad	2767606354
	.quad	1984772923
	.quad	3076642518
	.quad	2110698419
	.quad	1383803177
	.quad	3711886307
	.quad	1584475951
	.quad	328696964
	.quad	2801095507
	.quad	3110654417
	.quad	0
	.quad	3240947181
	.quad	1080041504
	.quad	3810524412
	.quad	2043195825
	.quad	3069008731
	.quad	3569248874
	.quad	2370227147
	.quad	1742323390
	.quad	1917532473
	.quad	2497595978
	.quad	2564049996
	.quad	2968016984
	.quad	2236272591
	.quad	3144405200
	.quad	3307925487
	.quad	1340451498
	.quad	3977706491
	.quad	2261074755
	.quad	2597801293
	.quad	1716859699
	.quad	294946181
	.quad	2328839493
	.quad	3910203897
	.quad	67502594
	.quad	4269899647
	.quad	2700103760
	.quad	2017737788
	.quad	632987551
	.quad	1273211048
	.quad	2733855057
	.quad	1576969123
	.quad	2160083008
	.quad	92966799
	.quad	1068339858
	.quad	566009245
	.quad	1883781176
	.quad	4043634165
	.quad	1675607228
	.quad	2009183926
	.quad	2943736538
	.quad	1113792801
	.quad	540020752
	.quad	3843751935
	.quad	4245615603
	.quad	3211645650
	.quad	2169294285
	.quad	403966988
	.quad	641012499
	.quad	3274697964
	.quad	3202441055
	.quad	899848087
	.quad	2295088196
	.quad	775493399
	.quad	2472002756
	.quad	1441965991
	.quad	4236410494
	.quad	2051489085
	.quad	3366741092
	.quad	3135724893
	.quad	841685273
	.quad	3868554099
	.quad	3231735904
	.quad	429425025
	.quad	2664517455
	.quad	2743065820
	.quad	1147544098
	.quad	1417554474
	.quad	1001099408
	.quad	193169544
	.quad	2362066502
	.quad	3341414126
	.quad	1809037496
	.quad	675025940
	.quad	2809781982
	.quad	3168951902
	.quad	371002123
	.quad	2910247899
	.quad	3678134496
	.quad	1683370546
	.quad	1951283770
	.quad	337512970
	.quad	2463844681
	.quad	201983494
	.quad	1215046692
	.quad	3101973596
	.quad	2673722050
	.quad	3178157011
	.quad	1139780780
	.quad	3299238498
	.quad	967348625
	.quad	832869781
	.quad	3543655652
	.quad	4069226873
	.quad	3576883175
	.quad	2336475336
	.quad	1851340599
	.quad	3669454189
	.quad	25988493
	.quad	2976175573
	.quad	2631028302
	.quad	1239460265
	.quad	3635702892
	.quad	2902087254
	.quad	4077384948
	.quad	3475368682
	.quad	3400492389
	.quad	4102978170
	.quad	1206496942
	.quad	270010376
	.quad	1876277946
	.quad	4035475576
	.quad	1248797989
	.quad	1550986798
	.quad	941890588
	.quad	1475454630
	.quad	1942467764
	.quad	2538718918
	.quad	3408128232
	.quad	2709315037
	.quad	3902567540
	.quad	1042358047
	.quad	2531085131
	.quad	1641856445
	.quad	226921355
	.quad	260409994
	.quad	3767562352
	.quad	2084716094
	.quad	1908716981
	.quad	3433719398
	.quad	2430093384
	.quad	100991747
	.quad	4144101110
	.quad	470945294
	.quad	3265487201
	.quad	1784624437
	.quad	2935576407
	.quad	1775286713
	.quad	395413126
	.quad	2572730817
	.quad	975641885
	.quad	666476190
	.quad	3644383713
	.quad	3943954680
	.quad	733190296
	.quad	573772049
	.quad	3535497577
	.quad	2842745305
	.quad	126455438
	.quad	866620564
	.quad	766942107
	.quad	1008868894
	.quad	361924487
	.quad	3374377449
	.quad	2269761230
	.quad	2868860245
	.quad	1350051880
	.quad	2776293343
	.quad	59739276
	.quad	1509466529
	.quad	159418761
	.quad	437718285
	.quad	1708834751
	.quad	3610371814
	.quad	2227585602
	.quad	3501746280
	.quad	2193834305
	.quad	699439513
	.quad	1517759789
	.quad	504434447
	.quad	2076946608
	.quad	2835108948
	.quad	1842789307
	.quad	742004246
.globl Tm
	.type	Tm, @object
	.size	Tm, 8
Tm:
	.byte	1
	.byte	3
	.byte	7
	.byte	15
	.byte	31
	.byte	63
	.byte	127
	.byte	-1
	.comm	OLDCV,128,32
	.comm	MEM_CST,64,32
	.comm	SHA3_CNT,8,8
	.comm	SHA3_ESP,4,4
	.comm	SHA3_R,4,4
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.quad	512
	.quad	0
	.ident	"GCC: (Debian 4.4.3-7) 4.4.3"
	.section	.note.GNU-stack,"",@progbits
