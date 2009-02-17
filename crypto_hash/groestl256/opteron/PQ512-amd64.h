inline void P512ASM (u64 *x) {
asm (
	"\n	xorq	%%r8, %%r8"
	"\n	movq 8(%0), %%rcx"
	"\n	movq 24(%0), %%rdx"
	"\n	1:"
	"\n	movq 0(%0), %%rax"
	"\n	movq 16(%0), %%rbx"
	"\n	# processing input words x[1] and x[3] "
	"\n	movzbl	%%cl, %%edi"
	"\n	movzbl	%%dl, %%esi"
	"\n	movq	T0(,%%rdi,8), %%mm1"
	"\n	movq	T0(,%%rsi,8), %%mm3"
	"\n	movzbl	%%ch, %%edi"
	"\n	movzbl	%%dh, %%esi"
	"\n	shrq	$16, %%rcx"
	"\n	shrq	$16, %%rdx"
	"\n	movq	T1(,%%rdi,8), %%mm0"
	"\n	movq	T1(,%%rsi,8), %%mm2"



	"\n	movzbl	%%cl, %%edi"
	"\n	movzbl	%%dl, %%esi"
	"\n	movq	T2(,%%rdi,8), %%mm7"
	"\n	pxor	T2(,%%rsi,8), %%mm1"
	"\n	movzbl	%%ch, %%edi"
	"\n	movzbl	%%dh, %%esi"
	"\n	shrq	$16, %%rcx"
	"\n	shrq	$16, %%rdx"
	"\n	movq	T3(,%%rdi,8), %%mm6"
	"\n	pxor	T3(,%%rsi,8), %%mm0"



	"\n	movzbl	%%cl, %%edi"
	"\n	movzbl	%%dl, %%esi"
	"\n	movq	T4(,%%rdi,8), %%mm5"
	"\n	pxor	T4(,%%rsi,8), %%mm7"
	"\n	movzbl	%%ch, %%edi"
	"\n	movzbl	%%dh, %%esi"
	"\n	shrq	$16, %%rcx"
	"\n	shrq	$16, %%rdx"
	"\n	movq	T5(,%%rdi,8), %%mm4"
	"\n	pxor	T5(,%%rsi,8), %%mm6"



	"\n	movzbl	%%cl, %%edi"
	"\n	movzbl	%%dl, %%esi"
	"\n	pxor	T6(,%%rdi,8), %%mm3"
	"\n	pxor	T6(,%%rsi,8), %%mm5"
	"\n	movzbl	%%ch, %%edi"
	"\n	movzbl	%%dh, %%esi"
	"\n	pxor	T7(,%%rdi,8), %%mm2"
	"\n	pxor	T7(,%%rsi,8), %%mm4"



	"\n	movq 40(%0), %%rcx"
	"\n	movq 56(%0), %%rdx"
	"\n	# processing input words x[0] and x[2] "
	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%bl, %%esi"
	"\n	xorq	%%r8, %%rdi		#xor the round constant"
	"\n	incq %%r8"
	"\n	pxor	T0(,%%rdi,8), %%mm0"
	"\n	pxor	T0(,%%rsi,8), %%mm2"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%bh, %%esi"
	"\n	shrq	$16, %%rax"
	"\n	shrq	$16, %%rbx"
	"\n	pxor	T1(,%%rdi,8), %%mm7"
	"\n	pxor	T1(,%%rsi,8), %%mm1"



	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%bl, %%esi"
	"\n	pxor	T2(,%%rdi,8), %%mm6"
	"\n	pxor	T2(,%%rsi,8), %%mm0"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%bh, %%esi"
	"\n	shrq	$16, %%rax"
	"\n	shrq	$16, %%rbx"
	"\n	pxor	T3(,%%rdi,8), %%mm5"
	"\n	pxor	T3(,%%rsi,8), %%mm7"



	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%bl, %%esi"
	"\n	pxor	T4(,%%rdi,8), %%mm4"
	"\n	pxor	T4(,%%rsi,8), %%mm6"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%bh, %%esi"
	"\n	shrq	$16, %%rax"
	"\n	shrq	$16, %%rbx"
	"\n	pxor	T5(,%%rdi,8), %%mm3"
	"\n	pxor	T5(,%%rsi,8), %%mm5"



	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%bl, %%esi"
	"\n	pxor	T6(,%%rdi,8), %%mm2"
	"\n	pxor	T6(,%%rsi,8), %%mm4"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%bh, %%esi"
	"\n	pxor	T7(,%%rdi,8), %%mm1"
	"\n	pxor	T7(,%%rsi,8), %%mm3"



	"\n	movq 32(%0), %%rax"
	"\n	movq 48(%0), %%rbx"
	"\n	# processing input words x[5] and x[7] "
	"\n	movzbl	%%cl, %%edi"
	"\n	movzbl	%%dl, %%esi"
	"\n	pxor	T0(,%%rdi,8), %%mm5"
	"\n	pxor	T0(,%%rsi,8), %%mm7"
	"\n	movzbl	%%ch, %%edi"
	"\n	movzbl	%%dh, %%esi"
	"\n	shrq	$16, %%rcx"
	"\n	shrq	$16, %%rdx"
	"\n	pxor	T1(,%%rdi,8), %%mm4"
	"\n	pxor	T1(,%%rsi,8), %%mm6"



	"\n	movzbl	%%cl, %%edi"
	"\n	movzbl	%%dl, %%esi"
	"\n	pxor	T2(,%%rdi,8), %%mm3"
	"\n	pxor	T2(,%%rsi,8), %%mm5"
	"\n	movzbl	%%ch, %%edi"
	"\n	movzbl	%%dh, %%esi"
	"\n	shrq	$16, %%rcx"
	"\n	shrq	$16, %%rdx"
	"\n	pxor	T3(,%%rdi,8), %%mm2"
	"\n	pxor	T3(,%%rsi,8), %%mm4"



	"\n	movzbl	%%cl, %%edi"
	"\n	movzbl	%%dl, %%esi"
	"\n	pxor	T4(,%%rdi,8), %%mm1"
	"\n	pxor	T4(,%%rsi,8), %%mm3"
	"\n	movzbl	%%ch, %%edi"
	"\n	movzbl	%%dh, %%esi"
	"\n	shrq	$16, %%rcx"
	"\n	shrq	$16, %%rdx"
	"\n	pxor	T5(,%%rdi,8), %%mm0"
	"\n	pxor	T5(,%%rsi,8), %%mm2"



	"\n	movzbl	%%cl, %%edi"
	"\n	movzbl	%%dl, %%esi"
	"\n	pxor	T6(,%%rdi,8), %%mm7"
	"\n	pxor	T6(,%%rsi,8), %%mm1"
	"\n	movzbl	%%ch, %%edi"
	"\n	movzbl	%%dh, %%esi"
	"\n	pxor	T7(,%%rdi,8), %%mm6"
	"\n	pxor	T7(,%%rsi,8), %%mm0"



	"\n	# processing input words x[4] and x[6] "
	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%bl, %%esi"
	"\n	pxor	T0(,%%rdi,8), %%mm4"
	"\n	pxor	T0(,%%rsi,8), %%mm6"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%bh, %%esi"
	"\n	shrq	$16, %%rax"
	"\n	shrq	$16, %%rbx"
	"\n	pxor	T1(,%%rdi,8), %%mm3"
	"\n	pxor	T1(,%%rsi,8), %%mm5"



	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%bl, %%esi"
	"\n	pxor	T2(,%%rdi,8), %%mm2"
	"\n	pxor	T2(,%%rsi,8), %%mm4"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%bh, %%esi"
	"\n	shrq	$16, %%rax"
	"\n	shrq	$16, %%rbx"
	"\n	pxor	T3(,%%rdi,8), %%mm1"
	"\n	pxor	T3(,%%rsi,8), %%mm3"



	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%bl, %%esi"
	"\n	pxor	T4(,%%rdi,8), %%mm0"
	"\n	pxor	T4(,%%rsi,8), %%mm2"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%bh, %%esi"
	"\n	shrq	$16, %%rax"
	"\n	shrq	$16, %%rbx"
	"\n	pxor	T5(,%%rdi,8), %%mm7"
	"\n	pxor	T5(,%%rsi,8), %%mm1"



	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%bl, %%esi"
	"\n	pxor	T6(,%%rdi,8), %%mm6"
	"\n	pxor	T6(,%%rsi,8), %%mm0"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%bh, %%esi"
	"\n	pxor	T7(,%%rdi,8), %%mm5"
	"\n	pxor	T7(,%%rsi,8), %%mm7"



	"\n	cmp	$10, %%r8"
	"\n	je	2f"
	"\n	movq	%%mm1, %%rcx"
	"\n	movq	%%mm3, %%rdx"
	"\n	movq	%%mm0, 0(%0)"
	"\n	movq	%%mm2, 16(%0)"
	"\n	movq	%%mm4, 32(%0)"
	"\n	movq	%%mm5, 40(%0)"
	"\n	movq	%%mm6, 48(%0)"
	"\n	movq	%%mm7, 56(%0)"
	"\n	jmp	1b"
	"\n	2:"
	"\n	movq	%%mm0, 0(%0)"
	"\n	movq	%%mm1, 8(%0)"
	"\n	movq	%%mm2, 16(%0)"
	"\n	movq	%%mm3, 24(%0)"
	"\n	movq	%%mm4, 32(%0)"
	"\n	movq	%%mm5, 40(%0)"
	"\n	movq	%%mm6, 48(%0)"
	"\n	movq	%%mm7, 56(%0)"
: /*no output, only memory is modifed */
: "r"(x)
: "%rax", "%rbx", "%rcx", "%rdx", "%rdi", "%rsi", "%r8", "memory" , "%mm0" , "%mm1" , "%mm2" , "%mm3" , "%mm4" , "%mm5" , "%mm6" , "%mm7" );
}//P512ASM()



inline void Q512ASM (u64 *x) {
asm (
	"\n	xorq	%%r8, %%r8"
	"\n	movq 8(%0), %%rcx"
	"\n	movq 24(%0), %%rdx"
	"\n	1:"
	"\n	movq 0(%0), %%rax"
	"\n	movq 16(%0), %%rbx"
	"\n	# processing input words x[1] and x[3] "
	"\n	movzbl	%%cl, %%edi"
	"\n	movzbl	%%dl, %%esi"
	"\n	movq	T0(,%%rdi,8), %%mm1"
	"\n	movq	T0(,%%rsi,8), %%mm3"
	"\n	movzbl	%%ch, %%edi"
	"\n	movzbl	%%dh, %%esi"
	"\n	shrq	$16, %%rcx"
	"\n	shrq	$16, %%rdx"
	"\n	movq	T1(,%%rdi,8), %%mm0"
	"\n	movq	T1(,%%rsi,8), %%mm2"



	"\n	movzbl	%%cl, %%edi"
	"\n	movzbl	%%dl, %%esi"
	"\n	movq	T2(,%%rdi,8), %%mm7"
	"\n	pxor	T2(,%%rsi,8), %%mm1"
	"\n	movzbl	%%ch, %%edi"
	"\n	movzbl	%%dh, %%esi"
	"\n	shrq	$16, %%rcx"
	"\n	shrq	$16, %%rdx"
	"\n	movq	T3(,%%rdi,8), %%mm6"
	"\n	pxor	T3(,%%rsi,8), %%mm0"



	"\n	movzbl	%%cl, %%edi"
	"\n	movzbl	%%dl, %%esi"
	"\n	movq	T4(,%%rdi,8), %%mm5"
	"\n	pxor	T4(,%%rsi,8), %%mm7"
	"\n	movzbl	%%ch, %%edi"
	"\n	movzbl	%%dh, %%esi"
	"\n	shrq	$16, %%rcx"
	"\n	shrq	$16, %%rdx"
	"\n	movq	T5(,%%rdi,8), %%mm4"
	"\n	pxor	T5(,%%rsi,8), %%mm6"



	"\n	movzbl	%%cl, %%edi"
	"\n	movzbl	%%dl, %%esi"
	"\n	pxor	T6(,%%rdi,8), %%mm3"
	"\n	pxor	T6(,%%rsi,8), %%mm5"
	"\n	movzbl	%%ch, %%edi"
	"\n	movzbl	%%dh, %%esi"
	"\n	pxor	T7(,%%rdi,8), %%mm2"
	"\n	pxor	T7(,%%rsi,8), %%mm4"



	"\n	movq 40(%0), %%rcx"
	"\n	movq 56(%0), %%rdx"
	"\n	# processing input words x[0] and x[2] "
	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%bl, %%esi"
	"\n	pxor	T0(,%%rdi,8), %%mm0"
	"\n	pxor	T0(,%%rsi,8), %%mm2"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%bh, %%esi"
	"\n	shrq	$16, %%rax"
	"\n	shrq	$16, %%rbx"
	"\n	pxor	T1(,%%rdi,8), %%mm7"
	"\n	pxor	T1(,%%rsi,8), %%mm1"



	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%bl, %%esi"
	"\n	pxor	T2(,%%rdi,8), %%mm6"
	"\n	pxor	T2(,%%rsi,8), %%mm0"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%bh, %%esi"
	"\n	shrq	$16, %%rax"
	"\n	shrq	$16, %%rbx"
	"\n	pxor	T3(,%%rdi,8), %%mm5"
	"\n	pxor	T3(,%%rsi,8), %%mm7"



	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%bl, %%esi"
	"\n	pxor	T4(,%%rdi,8), %%mm4"
	"\n	pxor	T4(,%%rsi,8), %%mm6"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%bh, %%esi"
	"\n	shrq	$16, %%rax"
	"\n	shrq	$16, %%rbx"
	"\n	pxor	T5(,%%rdi,8), %%mm3"
	"\n	pxor	T5(,%%rsi,8), %%mm5"



	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%bl, %%esi"
	"\n	pxor	T6(,%%rdi,8), %%mm2"
	"\n	pxor	T6(,%%rsi,8), %%mm4"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%bh, %%esi"
	"\n	xorq	%%r8, %%rdi	#xor the round constant"
	"\n	xorl	$0xff, %%edi"
	"\n	incq %%r8"
	"\n	pxor	T7(,%%rdi,8), %%mm1"
	"\n	pxor	T7(,%%rsi,8), %%mm3"



	"\n	movq 32(%0), %%rax"
	"\n	movq 48(%0), %%rbx"
	"\n	# processing input words x[5] and x[7] "
	"\n	movzbl	%%cl, %%edi"
	"\n	movzbl	%%dl, %%esi"
	"\n	pxor	T0(,%%rdi,8), %%mm5"
	"\n	pxor	T0(,%%rsi,8), %%mm7"
	"\n	movzbl	%%ch, %%edi"
	"\n	movzbl	%%dh, %%esi"
	"\n	shrq	$16, %%rcx"
	"\n	shrq	$16, %%rdx"
	"\n	pxor	T1(,%%rdi,8), %%mm4"
	"\n	pxor	T1(,%%rsi,8), %%mm6"



	"\n	movzbl	%%cl, %%edi"
	"\n	movzbl	%%dl, %%esi"
	"\n	pxor	T2(,%%rdi,8), %%mm3"
	"\n	pxor	T2(,%%rsi,8), %%mm5"
	"\n	movzbl	%%ch, %%edi"
	"\n	movzbl	%%dh, %%esi"
	"\n	shrq	$16, %%rcx"
	"\n	shrq	$16, %%rdx"
	"\n	pxor	T3(,%%rdi,8), %%mm2"
	"\n	pxor	T3(,%%rsi,8), %%mm4"



	"\n	movzbl	%%cl, %%edi"
	"\n	movzbl	%%dl, %%esi"
	"\n	pxor	T4(,%%rdi,8), %%mm1"
	"\n	pxor	T4(,%%rsi,8), %%mm3"
	"\n	movzbl	%%ch, %%edi"
	"\n	movzbl	%%dh, %%esi"
	"\n	shrq	$16, %%rcx"
	"\n	shrq	$16, %%rdx"
	"\n	pxor	T5(,%%rdi,8), %%mm0"
	"\n	pxor	T5(,%%rsi,8), %%mm2"



	"\n	movzbl	%%cl, %%edi"
	"\n	movzbl	%%dl, %%esi"
	"\n	pxor	T6(,%%rdi,8), %%mm7"
	"\n	pxor	T6(,%%rsi,8), %%mm1"
	"\n	movzbl	%%ch, %%edi"
	"\n	movzbl	%%dh, %%esi"
	"\n	pxor	T7(,%%rdi,8), %%mm6"
	"\n	pxor	T7(,%%rsi,8), %%mm0"



	"\n	# processing input words x[4] and x[6] "
	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%bl, %%esi"
	"\n	pxor	T0(,%%rdi,8), %%mm4"
	"\n	pxor	T0(,%%rsi,8), %%mm6"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%bh, %%esi"
	"\n	shrq	$16, %%rax"
	"\n	shrq	$16, %%rbx"
	"\n	pxor	T1(,%%rdi,8), %%mm3"
	"\n	pxor	T1(,%%rsi,8), %%mm5"



	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%bl, %%esi"
	"\n	pxor	T2(,%%rdi,8), %%mm2"
	"\n	pxor	T2(,%%rsi,8), %%mm4"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%bh, %%esi"
	"\n	shrq	$16, %%rax"
	"\n	shrq	$16, %%rbx"
	"\n	pxor	T3(,%%rdi,8), %%mm1"
	"\n	pxor	T3(,%%rsi,8), %%mm3"



	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%bl, %%esi"
	"\n	pxor	T4(,%%rdi,8), %%mm0"
	"\n	pxor	T4(,%%rsi,8), %%mm2"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%bh, %%esi"
	"\n	shrq	$16, %%rax"
	"\n	shrq	$16, %%rbx"
	"\n	pxor	T5(,%%rdi,8), %%mm7"
	"\n	pxor	T5(,%%rsi,8), %%mm1"



	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%bl, %%esi"
	"\n	pxor	T6(,%%rdi,8), %%mm6"
	"\n	pxor	T6(,%%rsi,8), %%mm0"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%bh, %%esi"
	"\n	pxor	T7(,%%rdi,8), %%mm5"
	"\n	pxor	T7(,%%rsi,8), %%mm7"



	"\n	cmp	$10, %%r8"
	"\n	je	2f"
	"\n	movq	%%mm1, %%rcx"
	"\n	movq	%%mm3, %%rdx"
	"\n	movq	%%mm0, 0(%0)"
	"\n	movq	%%mm2, 16(%0)"
	"\n	movq	%%mm4, 32(%0)"
	"\n	movq	%%mm5, 40(%0)"
	"\n	movq	%%mm6, 48(%0)"
	"\n	movq	%%mm7, 56(%0)"
	"\n	jmp	1b"
	"\n	2:"
	"\n	movq	%%mm0, 0(%0)"
	"\n	movq	%%mm1, 8(%0)"
	"\n	movq	%%mm2, 16(%0)"
	"\n	movq	%%mm3, 24(%0)"
	"\n	movq	%%mm4, 32(%0)"
	"\n	movq	%%mm5, 40(%0)"
	"\n	movq	%%mm6, 48(%0)"
	"\n	movq	%%mm7, 56(%0)"
: /*no output, only memory is modifed */
: "r"(x)
: "%rax", "%rbx", "%rcx", "%rdx", "%rdi", "%rsi", "%r8", "memory" , "%mm0" , "%mm1" , "%mm2" , "%mm3" , "%mm4" , "%mm5" , "%mm6" , "%mm7" );
}//Q512ASM()



