inline void P512ASM (u64 *x) {
asm (
	"\n	xorq	%%r8, %%r8"

	"\n	movq	0(%0), %%rax"  // input column 0
	"\n	movq	8(%0), %%rcx"  // input column 1
	"\n	movq	16(%0), %%rbx" // input column 2
	"\n	movq	24(%0), %%rdx" // input column 3
	"\n	movq	32(%0), %%r9"  // input column 4
	"\n	movq	40(%0), %%r11" // input column 5
	"\n	movq	48(%0), %%r10" // input column 6
	"\n	movq	56(%0), %%r12" // input column 7

	"\n	1:"

	/* xor round constant to columns 1 and 3 */
	"\n	xorq    $0x10, %%rcx"
	"\n	xorq    $0x30, %%rdx"
	"\n	xorq    %%r8, %%rcx"
	"\n	xorq    %%r8, %%rdx"

	/* compute the effect of input columns 1 and 3 */
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

	"\n	movq	%%r11, %%rcx"
	"\n	movq	%%r12, %%rdx"

	/* xor round constant to columns 0 and 2 */
	"\n	xorq    $0x20, %%rbx"
	"\n	xorq    %%r8, %%rax"
	"\n	xorq    %%r8, %%rbx"

	/* compute the effect of input columns 0 and 2 */
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
	"\n	pxor	T7(,%%rdi,8), %%mm1"
	"\n	pxor	T7(,%%rsi,8), %%mm3"


	"\n	xorq    $0x50, %%rcx"
	"\n	xorq    $0x70, %%rdx"
	"\n	xorq    %%r8, %%rcx"
	"\n	xorq    %%r8, %%rdx"

	"\n	movq	%%r9, %%rax"
	"\n	movq	%%r10, %%rbx"


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

	"\n	xorq    $0x40, %%rax"
	"\n	xorq    $0x60, %%rbx"
	"\n	xorq    %%r8, %%rax"
	"\n	xorq    %%r8, %%rbx"


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

	"\n	incq %%r8"

	"\n	cmp	$10, %%r8"
	"\n	je	2f"
	"\n	movq	%%mm0, %%rax"
	"\n	movq	%%mm2, %%rbx"
	"\n	movq	%%mm1, %%rcx"
	"\n	movq	%%mm3, %%rdx"
	"\n	movq	%%mm4, %%r9"
	"\n	movq	%%mm6, %%r10"
	"\n	movq	%%mm5, %%r11"
	"\n	movq	%%mm7, %%r12"
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
: /*no output, only memory is modified */
: "r"(x)
	: "%rax", "%rbx", "%rcx", "%rdx", "%rdi", "%rsi", "%r8", "%r9", "%r10", "%r11", "%r12", "memory" , "%mm0" , "%mm1" , "%mm2" , "%mm3" , "%mm4" , "%mm5" , "%mm6" , "%mm7" );
}//P512ASM()



inline void Q512ASM (u64 *x) {
asm (
	"\n	xorq	%%r8, %%r8"
	"\n	movq 0(%0), %%rax     # input column 0"
	"\n	movq 8(%0), %%rcx     # input column 1"
	"\n	movq 16(%0), %%rbx    # input column 2"
	"\n	movq 24(%0), %%rdx    # input column 3"

	"\n	movq	32(%0), %%r9  # input column 4"
	"\n	movq	40(%0), %%r11 # input column 5"
	"\n	movq	48(%0), %%r10 # input column 6"
	"\n	movq	56(%0), %%r12 # input column 7"
	"\n	1:"

	"\n	movq    $0xefffffffffffffff, %%r14"
	"\n	movq    $0xcfffffffffffffff, %%r15"
	"\n	xorq    %%r14, %%rcx"
	"\n	xorq    %%r15, %%rdx"
	"\n	movq    $0xffffffffffffffff, %%r14"
	"\n	movq    $0xdfffffffffffffff, %%r15"


	"\n	# processing input words x[1] and x[3] "
	"\n	movzbl	%%cl, %%edi"
	"\n	movzbl	%%dl, %%esi"
	"\n	movq	T0(,%%rdi,8), %%mm0    # byte 0"
	"\n	movq	T0(,%%rsi,8), %%mm2    # byte 0"
	"\n	movzbl	%%ch, %%edi"
	"\n	movzbl	%%dh, %%esi"
	"\n	shrq	$16, %%rcx"
	"\n	shrq	$16, %%rdx"
	"\n	movq	T1(,%%rdi,8), %%mm6    # byte 1"
	"\n	pxor	T1(,%%rsi,8), %%mm0    # byte 1"


	"\n	movzbl	%%cl, %%edi"
	"\n	movzbl	%%dl, %%esi"
	"\n	movq	T2(,%%rdi,8), %%mm4    # byte 2"
	"\n	pxor	T2(,%%rsi,8), %%mm6    # byte 2"
	"\n	movzbl	%%ch, %%edi"
	"\n	movzbl	%%dh, %%esi"
	"\n	shrq	$16, %%rcx"
	"\n	shrq	$16, %%rdx"
	"\n	pxor	T3(,%%rdi,8), %%mm2    # byte 3"
	"\n	pxor	T3(,%%rsi,8), %%mm4    # byte 3"


	"\n	movzbl	%%cl, %%edi"
	"\n	movzbl	%%dl, %%esi"
	"\n	movq	T4(,%%rdi,8), %%mm1    # byte 4"
	"\n	movq	T4(,%%rsi,8), %%mm3    # byte 4"
	"\n	movzbl	%%ch, %%edi"
	"\n	movzbl	%%dh, %%esi"
	"\n	shrq	$16, %%rcx"
	"\n	shrq	$16, %%rdx"
	"\n	movq	T5(,%%rdi,8), %%mm7    # byte 5"
	"\n	pxor	T5(,%%rsi,8), %%mm1    # byte 5"


	"\n	movzbl	%%cl, %%edi"
	"\n	movzbl	%%dl, %%esi"
	"\n	movq	T6(,%%rdi,8), %%mm5    # byte 6"
	"\n	pxor	T6(,%%rsi,8), %%mm7    # byte 6"
	"\n	movzbl	%%ch, %%edi"
	"\n	movzbl	%%dh, %%esi"
	"\n	xorq	%%r8, %%rdi"
	"\n	xorq	%%r8, %%rsi"
	"\n	pxor	T7(,%%rdi,8), %%mm3    # byte 7"
	"\n	pxor	T7(,%%rsi,8), %%mm5    # byte 7"


	"\n	xorq    %%r14, %%rax"
	"\n	xorq    %%r15, %%rbx"
	"\n	movq    $0xafffffffffffffff, %%r14"
	"\n	movq    $0x8fffffffffffffff, %%r15"


	"\n	movq	%%r11, %%rcx"
	"\n	movq	%%r12, %%rdx"


	"\n	# processing input words x[0] and x[2] "
	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%bl, %%esi"
	"\n	pxor	T0(,%%rdi,8), %%mm7"
	"\n	pxor	T0(,%%rsi,8), %%mm1"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%bh, %%esi"
	"\n	shrq	$16, %%rax"
	"\n	shrq	$16, %%rbx"
	"\n	pxor	T1(,%%rdi,8), %%mm5"
	"\n	pxor	T1(,%%rsi,8), %%mm7"


	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%bl, %%esi"
	"\n	pxor	T2(,%%rdi,8), %%mm3"
	"\n	pxor	T2(,%%rsi,8), %%mm5"
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
	"\n	pxor	T5(,%%rdi,8), %%mm6"
	"\n	pxor	T5(,%%rsi,8), %%mm0"


	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%bl, %%esi"
	"\n	pxor	T6(,%%rdi,8), %%mm4"
	"\n	pxor	T6(,%%rsi,8), %%mm6"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%bh, %%esi"
	"\n	xorq	%%r8, %%rdi"
	"\n	xorq	%%r8, %%rsi"
	"\n	pxor	T7(,%%rdi,8), %%mm2"
	"\n	pxor	T7(,%%rsi,8), %%mm4"

	"\n	xorq    %%r14, %%rcx"
	"\n	xorq    %%r15, %%rdx"
	"\n	movq    $0xbfffffffffffffff, %%r14"
	"\n	movq    $0x9fffffffffffffff, %%r15"


	"\n	movq	%%r9, %%rax"
	"\n	movq	%%r10, %%rbx"


	"\n	# processing input words x[5] and x[7] "
	"\n	movzbl	%%cl, %%edi"
	"\n	movzbl	%%dl, %%esi"
	"\n	pxor	T0(,%%rdi,8), %%mm4"
	"\n	pxor	T0(,%%rsi,8), %%mm6"
	"\n	movzbl	%%ch, %%edi"
	"\n	movzbl	%%dh, %%esi"
	"\n	shrq	$16, %%rcx"
	"\n	shrq	$16, %%rdx"
	"\n	pxor	T1(,%%rdi,8), %%mm2"
	"\n	pxor	T1(,%%rsi,8), %%mm4"


	"\n	movzbl	%%cl, %%edi"
	"\n	movzbl	%%dl, %%esi"
	"\n	pxor	T2(,%%rdi,8), %%mm0"
	"\n	pxor	T2(,%%rsi,8), %%mm2"
	"\n	movzbl	%%ch, %%edi"
	"\n	movzbl	%%dh, %%esi"
	"\n	shrq	$16, %%rcx"
	"\n	shrq	$16, %%rdx"
	"\n	pxor	T3(,%%rdi,8), %%mm6"
	"\n	pxor	T3(,%%rsi,8), %%mm0"


	"\n	movzbl	%%cl, %%edi"
	"\n	movzbl	%%dl, %%esi"
	"\n	pxor	T4(,%%rdi,8), %%mm5"
	"\n	pxor	T4(,%%rsi,8), %%mm7"
	"\n	movzbl	%%ch, %%edi"
	"\n	movzbl	%%dh, %%esi"
	"\n	shrq	$16, %%rcx"
	"\n	shrq	$16, %%rdx"
	"\n	pxor	T5(,%%rdi,8), %%mm3"
	"\n	pxor	T5(,%%rsi,8), %%mm5"


	"\n	movzbl	%%cl, %%edi"
	"\n	movzbl	%%dl, %%esi"
	"\n	pxor	T6(,%%rdi,8), %%mm1"
	"\n	pxor	T6(,%%rsi,8), %%mm3"
	"\n	movzbl	%%ch, %%edi"
	"\n	movzbl	%%dh, %%esi"
	"\n	xorq	%%r8, %%rdi"
	"\n	xorq	%%r8, %%rsi"
	"\n	pxor	T7(,%%rdi,8), %%mm7"
	"\n	pxor	T7(,%%rsi,8), %%mm1"

	"\n	xorq    %%r14, %%rax"
	"\n	xorq    %%r15, %%rbx"



	"\n	# processing input words x[4] and x[6] "
	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%bl, %%esi"
	"\n	pxor	T0(,%%rdi,8), %%mm3"
	"\n	pxor	T0(,%%rsi,8), %%mm5"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%bh, %%esi"
	"\n	shrq	$16, %%rax"
	"\n	shrq	$16, %%rbx"
	"\n	pxor	T1(,%%rdi,8), %%mm1"
	"\n	pxor	T1(,%%rsi,8), %%mm3"


	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%bl, %%esi"
	"\n	pxor	T2(,%%rdi,8), %%mm7"
	"\n	pxor	T2(,%%rsi,8), %%mm1"
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
	"\n	pxor	T5(,%%rdi,8), %%mm2"
	"\n	pxor	T5(,%%rsi,8), %%mm4"


	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%bl, %%esi"
	"\n	pxor	T6(,%%rdi,8), %%mm0"
	"\n	pxor	T6(,%%rsi,8), %%mm2"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%bh, %%esi"
	"\n	xorq	%%r8, %%rdi"
	"\n	xorq	%%r8, %%rsi"
	"\n	pxor	T7(,%%rdi,8), %%mm6"
	"\n	pxor	T7(,%%rsi,8), %%mm0"

	"\n	incq	%%r8"


	"\n	cmp	$10, %%r8"
	"\n	je	2f"
	"\n	movq	%%mm0, %%rax"
	"\n	movq	%%mm2, %%rbx"
	"\n	movq	%%mm1, %%rcx"
	"\n	movq	%%mm3, %%rdx"
	"\n	movq	%%mm4, %%r9"
	"\n	movq	%%mm6, %%r10"
	"\n	movq	%%mm5, %%r11"
	"\n	movq	%%mm7, %%r12"
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
: /*no output, only memory is modified */
: "r"(x)
	: "%rax", "%rbx", "%rcx", "%rdx", "%rdi", "%rsi", "%r8", "%r9", "%r10", "%r11", "%r12", "%r14", "%r15", "memory" , "%mm0" , "%mm1" , "%mm2" , "%mm3" , "%mm4" , "%mm5" , "%mm6" , "%mm7" );
}//Q512ASM()



