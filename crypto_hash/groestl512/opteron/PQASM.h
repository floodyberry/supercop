inline void P1024ASM (u64 *x) {
  asm (
       "\n	movq	8(%0), %%rcx"
       "\n	movq	24(%0), %%rdx"
       "\n	movq	$0, 8(%0)"
       "\n	1:"

       "\n	movq	0(%0), %%rax"
       "\n	movq	16(%0), %%rbx"
       "\n	xorq	8(%0), %%rax		#xor round constant"

       "\n	# processing input words x[1]=rcx and x[3]=rdx "
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	movq	T0(,%%rdi,8), %%mm1"
       "\n	movq	T1(,%%rsi,8), %%mm0"
       "\n	shrq	$16, %%rcx"
       "\n	movzbl	%%dl, %%esi"
       "\n	movzbl	%%dh, %%edi"
       "\n	movq	T0(,%%rsi,8), %%mm3"
       "\n	movq	T1(,%%rdi,8), %%mm2"
       "\n	shrq	$16, %%rdx"



       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	movq	T2(,%%rdi,8), %%r15"
       "\n	movq	T3(,%%rsi,8), %%r14"
       "\n	shrq	$16, %%rcx"
       "\n	movzbl	%%dl, %%esi"
       "\n	movzbl	%%dh, %%edi"
       "\n	pxor	T2(,%%rsi,8), %%mm1"
       "\n	pxor	T3(,%%rdi,8), %%mm0"
       "\n	shrq	$16, %%rdx"



       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	movq	T4(,%%rdi,8), %%r13"
       "\n	movq	T5(,%%rsi,8), %%r12"
       "\n	shrq	$16, %%rcx"
       "\n	movzbl	%%dl, %%esi"
       "\n	movzbl	%%dh, %%edi"
       "\n	xorq	T4(,%%rsi,8), %%r15"
       "\n	xorq	T5(,%%rdi,8), %%r14"
       "\n	shrq	$16, %%rdx"



       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	movq	T6(,%%rdi,8), %%r11"
       "\n	movq	T7(,%%rsi,8), %%mm6"
       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r13"
       "\n	movq	T7(,%%rsi,8), %%r8"



       "\n	movq	40(%0), %%rcx"
       "\n	movq	56(%0), %%rdx"

       "\n	incq	8(%0)			#increment counter"

       "\n	# processing input words x[0]=rax and x[2]=rbx "
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm0"
       "\n	xorq	T1(,%%rsi,8), %%r15"
       "\n	shrq	$16, %%rax"
       "\n	movzbl	%%bl, %%esi"
       "\n	movzbl	%%bh, %%edi"
       "\n	pxor	T0(,%%rsi,8), %%mm2"
       "\n	pxor	T1(,%%rdi,8), %%mm1"
       "\n	shrq	$16, %%rbx"



       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r14"
       "\n	xorq	T3(,%%rsi,8), %%r13"
       "\n	shrq	$16, %%rax"
       "\n	movzbl	%%bl, %%esi"
       "\n	movzbl	%%bh, %%edi"
       "\n	pxor	T2(,%%rsi,8), %%mm0"
       "\n	xorq	T3(,%%rdi,8), %%r15"
       "\n	shrq	$16, %%rbx"



       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r12"
       "\n	xorq	T5(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rax"
       "\n	movzbl	%%bl, %%esi"
       "\n	movzbl	%%bh, %%edi"
       "\n	xorq	T4(,%%rsi,8), %%r14"
       "\n	xorq	T5(,%%rdi,8), %%r13"
       "\n	shrq	$16, %%rbx"



       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T6(,%%rdi,8), %%r10"
       "\n	movq	T7(,%%rsi,8), %%mm5"
       "\n	movzbl	%%bl, %%esi"
       "\n	movzbl	%%bh, %%edi"
       "\n	xorq	T6(,%%rsi,8), %%r12"
       "\n	movq	T7(,%%rdi,8), %%mm7"



       "\n	movq	32(%0), %%rax"
       "\n	movq	48(%0), %%rbx"

       "\n	# processing input words x[5]=rcx and x[7]=rdx "
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm5"
       "\n	movq	T1(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rcx"
       "\n	movzbl	%%dl, %%esi"
       "\n	movzbl	%%dh, %%edi"
       "\n	pxor	T0(,%%rsi,8), %%mm7"
       "\n	pxor	T1(,%%rdi,8), %%mm6"
       "\n	shrq	$16, %%rdx"



       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm3"
       "\n	pxor	T3(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rcx"
       "\n	movzbl	%%dl, %%esi"
       "\n	movzbl	%%dh, %%edi"
       "\n	pxor	T2(,%%rsi,8), %%mm5"
       "\n	pxor	T3(,%%rdi,8), %%mm4"
       "\n	shrq	$16, %%rdx"



       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm1"
       "\n	pxor	T5(,%%rsi,8), %%mm0"
       "\n	shrq	$16, %%rcx"
       "\n	movzbl	%%dl, %%esi"
       "\n	movzbl	%%dh, %%edi"
       "\n	pxor	T4(,%%rsi,8), %%mm3"
       "\n	pxor	T5(,%%rdi,8), %%mm2"
       "\n	shrq	$16, %%rdx"



       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r15"
       "\n	xorq	T7(,%%rsi,8), %%r10"
       "\n	movzbl	%%dl, %%esi"
       "\n	movzbl	%%dh, %%edi"
       "\n	pxor	T6(,%%rsi,8), %%mm1"
       "\n	xorq	T7(,%%rdi,8), %%r12"



       "\n	movq	72(%0), %%rcx"
       "\n	movq	88(%0), %%rdx"

       "\n	# processing input words x[4]=rax and x[6]=rbx "
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm4"
       "\n	pxor	T1(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rax"
       "\n	movzbl	%%bl, %%esi"
       "\n	movzbl	%%bh, %%edi"
       "\n	pxor	T0(,%%rsi,8), %%mm6"
       "\n	pxor	T1(,%%rdi,8), %%mm5"
       "\n	shrq	$16, %%rbx"



       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm2"
       "\n	pxor	T3(,%%rsi,8), %%mm1"
       "\n	shrq	$16, %%rax"
       "\n	movzbl	%%bl, %%esi"
       "\n	movzbl	%%bh, %%edi"
       "\n	pxor	T2(,%%rsi,8), %%mm4"
       "\n	pxor	T3(,%%rdi,8), %%mm3"
       "\n	shrq	$16, %%rbx"



       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm0"
       "\n	xorq	T5(,%%rsi,8), %%r15"
       "\n	shrq	$16, %%rax"
       "\n	movzbl	%%bl, %%esi"
       "\n	movzbl	%%bh, %%edi"
       "\n	pxor	T4(,%%rsi,8), %%mm2"
       "\n	pxor	T5(,%%rdi,8), %%mm1"
       "\n	shrq	$16, %%rbx"



       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r14"
       "\n	movq	T7(,%%rsi,8), %%r9"
       "\n	movzbl	%%bl, %%esi"
       "\n	movzbl	%%bh, %%edi"
       "\n	pxor	T6(,%%rsi,8), %%mm0"
       "\n	xorq	T7(,%%rdi,8), %%r11"


       "\n	movq	64(%0), %%rax"
       "\n	movq	80(%0), %%rbx"

       "\n	# processing input words x[9]=rcx and x[11]=rdx "
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T0(,%%rdi,8), %%r9"
       "\n	xorq	T1(,%%rsi,8), %%r8"
       "\n	shrq	$16, %%rcx"
       "\n	movzbl	%%dl, %%esi"
       "\n	movzbl	%%dh, %%edi"
       "\n	xorq	T0(,%%rsi,8), %%r11"
       "\n	xorq	T1(,%%rdi,8), %%r10"
       "\n	shrq	$16, %%rdx"



       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm7"
       "\n	pxor	T3(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rcx"
       "\n	movzbl	%%dl, %%esi"
       "\n	movzbl	%%dh, %%edi"
       "\n	xorq	T2(,%%rsi,8), %%r9"
       "\n	xorq	T3(,%%rdi,8), %%r8"
       "\n	shrq	$16, %%rdx"



       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm5"
       "\n	pxor	T5(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rcx"
       "\n	movzbl	%%dl, %%esi"
       "\n	movzbl	%%dh, %%edi"
       "\n	pxor	T4(,%%rsi,8), %%mm7"
       "\n	pxor	T5(,%%rdi,8), %%mm6"
       "\n	shrq	$16, %%rdx"



       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm3"
       "\n	xorq	T7(,%%rsi,8), %%r14"
       "\n	movzbl	%%dl, %%esi"
       "\n	movzbl	%%dh, %%edi"
       "\n	pxor	T6(,%%rsi,8), %%mm5"
       "\n	pxor	T7(,%%rdi,8), %%mm0"



       "\n	movq	104(%0), %%rcx"
       "\n	movq	120(%0), %%rdx"

       "\n	# processing input words x[8]=rax and x[10]=rbx "
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T0(,%%rdi,8), %%r8"
       "\n	pxor	T1(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rax"
       "\n	movzbl	%%bl, %%esi"
       "\n	movzbl	%%bh, %%edi"
       "\n	xorq	T0(,%%rsi,8), %%r10"
       "\n	xorq	T1(,%%rdi,8), %%r9"
       "\n	shrq	$16, %%rbx"



       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm6"
       "\n	pxor	T3(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rax"
       "\n	movzbl	%%bl, %%esi"
       "\n	movzbl	%%bh, %%edi"
       "\n	xorq	T2(,%%rsi,8), %%r8"
       "\n	pxor	T3(,%%rdi,8), %%mm7"
       "\n	shrq	$16, %%rbx"



       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm4"
       "\n	pxor	T5(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rax"
       "\n	movzbl	%%bl, %%esi"
       "\n	movzbl	%%bh, %%edi"
       "\n	pxor	T4(,%%rsi,8), %%mm6"
       "\n	pxor	T5(,%%rdi,8), %%mm5"
       "\n	shrq	$16, %%rbx"



       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm2"
       "\n	xorq	T7(,%%rsi,8), %%r13"
       "\n	movzbl	%%bl, %%esi"
       "\n	movzbl	%%bh, %%edi"
       "\n	pxor	T6(,%%rsi,8), %%mm4"
       "\n	xorq	T7(,%%rdi,8), %%r15"

       "\n	movq	96(%0), %%rax"
       "\n	movq	112(%0), %%rbx"

       "\n	# processing input words x[13]=rcx and x[15]=rdx "
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T0(,%%rdi,8), %%r13"
       "\n	xorq	T1(,%%rsi,8), %%r12"
       "\n	shrq	$16, %%rcx"
       "\n	movzbl	%%dl, %%esi"
       "\n	movzbl	%%dh, %%edi"
       "\n	xorq	T0(,%%rsi,8), %%r15"
       "\n	xorq	T1(,%%rdi,8), %%r14"
       "\n	shrq	$16, %%rdx"



       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r11"
       "\n	xorq	T3(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rcx"
       "\n	movzbl	%%dl, %%esi"
       "\n	movzbl	%%dh, %%edi"
       "\n	xorq	T2(,%%rsi,8), %%r13"
       "\n	xorq	T3(,%%rdi,8), %%r12"
       "\n	shrq	$16, %%rdx"



       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r9"
       "\n	xorq	T5(,%%rsi,8), %%r8"
       "\n	shrq	$16, %%rcx"
       "\n	movzbl	%%dl, %%esi"
       "\n	movzbl	%%dh, %%edi"
       "\n	xorq	T4(,%%rsi,8), %%r11"
       "\n	xorq	T5(,%%rdi,8), %%r10"
       "\n	shrq	$16, %%rdx"



       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm7"
       "\n	pxor	T7(,%%rsi,8), %%mm2"
       "\n	movzbl	%%dl, %%esi"
       "\n	movzbl	%%dh, %%edi"
       "\n	xorq	T6(,%%rsi,8), %%r9"
       "\n	pxor	T7(,%%rdi,8), %%mm4"



       "\n	# processing input words x[12]=rax and x[14]=rbx "
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T0(,%%rdi,8), %%r12"
       "\n	xorq	T1(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rax"
       "\n	movzbl	%%bl, %%esi"
       "\n	movzbl	%%bh, %%edi"
       "\n	xorq	T0(,%%rsi,8), %%r14"
       "\n	xorq	T1(,%%rdi,8), %%r13"
       "\n	shrq	$16, %%rbx"



       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r10"
       "\n	xorq	T3(,%%rsi,8), %%r9"
       "\n	shrq	$16, %%rax"
       "\n	movzbl	%%bl, %%esi"
       "\n	movzbl	%%bh, %%edi"
       "\n	xorq	T2(,%%rsi,8), %%r12"
       "\n	xorq	T3(,%%rdi,8), %%r11"
       "\n	shrq	$16, %%rbx"



       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r8"
       "\n	pxor	T5(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rax"
       "\n	movzbl	%%bl, %%esi"
       "\n	movzbl	%%bh, %%edi"
       "\n	xorq	T4(,%%rsi,8), %%r10"
       "\n	xorq	T5(,%%rdi,8), %%r9"
       "\n	shrq	$16, %%rbx"



       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm6"
       "\n	pxor	T7(,%%rsi,8), %%mm1"
       "\n	movzbl	%%bl, %%esi"
       "\n	movzbl	%%bh, %%edi"
       "\n	xorq	T6(,%%rsi,8), %%r8"
       "\n	pxor	T7(,%%rdi,8), %%mm3"


       "\n	movq	8(%0), %%rdi"
       "\n	cmp	$14, %%edi"
       "\n	je	2f"
       "\n	movq	%%mm1, %%rcx"
       "\n	movq	%%mm3, %%rdx"
       "\n	movq	%%mm0, 0(%0)"
       "\n	movq	%%mm2, 16(%0)"
       "\n	movq	%%mm4, 32(%0)"
       "\n	movq	%%mm5, 40(%0)"
       "\n	movq	%%mm6, 48(%0)"
       "\n	movq	%%mm7, 56(%0)"
       "\n	movq	%%r8 , 64(%0)"
       "\n	movq	%%r9 , 72(%0)"
       "\n	movq	%%r10, 80(%0)"
       "\n	movq	%%r11, 88(%0)"
       "\n	movq	%%r12, 96(%0)"
       "\n	movq	%%r13, 104(%0)"
       "\n	movq	%%r14, 112(%0)"
       "\n	movq	%%r15, 120(%0)"
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
       "\n	movq	%%r8 , 64(%0)"
       "\n	movq	%%r9 , 72(%0)"
       "\n	movq	%%r10, 80(%0)"
       "\n	movq	%%r11, 88(%0)"
       "\n	movq	%%r12, 96(%0)"
       "\n	movq	%%r13, 104(%0)"
       "\n	movq	%%r14, 112(%0)"
       "\n	movq	%%r15, 120(%0)"
       : /*no output, only memory is modified */
       : "r"(x)
       : "%rax", "%rbx", "%rcx", "%rdx", "%rdi", "%rsi", "%r8", "%r9", "%r10", "%r11", "%r12", "%r13", "%r14", "%r15", "memory" , "%mm0", "%mm1", "%mm2" , "%mm3" , "%mm4" , "%mm5" , "%mm6" , "%mm7" );
}//P512ASM()


inline void Q1024ASM (u64 *x) {
  asm (
       "\n	movq	8(%0), %%rcx"
       "\n	movq	24(%0), %%rdx"
       "\n	movq	$255, 8(%0)"
       "\n	1:"

       "\n	movq	0(%0), %%rax"
       "\n	movq	16(%0), %%rbx"

       "\n	# processing input words x[1]=rcx and x[3]=rdx "
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	movq	T0(,%%rdi,8), %%mm1"
       "\n	movq	T1(,%%rsi,8), %%mm0"
       "\n	shrq	$16, %%rcx"
       "\n	movzbl	%%dl, %%esi"
       "\n	movzbl	%%dh, %%edi"
       "\n	movq	T0(,%%rsi,8), %%mm3"
       "\n	movq	T1(,%%rdi,8), %%mm2"
       "\n	shrq	$16, %%rdx"



       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	movq	T2(,%%rdi,8), %%r15"
       "\n	movq	T3(,%%rsi,8), %%r14"
       "\n	shrq	$16, %%rcx"
       "\n	movzbl	%%dl, %%esi"
       "\n	movzbl	%%dh, %%edi"
       "\n	pxor	T2(,%%rsi,8), %%mm1"
       "\n	pxor	T3(,%%rdi,8), %%mm0"
       "\n	shrq	$16, %%rdx"



       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	movq	T4(,%%rdi,8), %%r13"
       "\n	movq	T5(,%%rsi,8), %%r12"
       "\n	shrq	$16, %%rcx"
       "\n	movzbl	%%dl, %%esi"
       "\n	movzbl	%%dh, %%edi"
       "\n	xorq	T4(,%%rsi,8), %%r15"
       "\n	xorq	T5(,%%rdi,8), %%r14"
       "\n	shrq	$16, %%rdx"



       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	movq	T6(,%%rdi,8), %%r11"
       "\n	movq	T7(,%%rsi,8), %%mm6"
       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r13"
       "\n	movq	T7(,%%rsi,8), %%r8"



       "\n	movq	40(%0), %%rcx"
       "\n	movq	56(%0), %%rdx"

       "\n	# processing input words x[0]=rax and x[2]=rbx "
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm0"
       "\n	xorq	T1(,%%rsi,8), %%r15"
       "\n	shrq	$16, %%rax"
       "\n	movzbl	%%bl, %%esi"
       "\n	movzbl	%%bh, %%edi"
       "\n	pxor	T0(,%%rsi,8), %%mm2"
       "\n	pxor	T1(,%%rdi,8), %%mm1"
       "\n	shrq	$16, %%rbx"



       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r14"
       "\n	xorq	T3(,%%rsi,8), %%r13"
       "\n	shrq	$16, %%rax"
       "\n	movzbl	%%bl, %%esi"
       "\n	movzbl	%%bh, %%edi"
       "\n	pxor	T2(,%%rsi,8), %%mm0"
       "\n	xorq	T3(,%%rdi,8), %%r15"
       "\n	shrq	$16, %%rbx"



       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r12"
       "\n	xorq	T5(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rax"
       "\n	movzbl	%%bl, %%esi"
       "\n	movzbl	%%bh, %%edi"
       "\n	xorq	T4(,%%rsi,8), %%r14"
       "\n	xorq	T5(,%%rdi,8), %%r13"
       "\n	shrq	$16, %%rbx"



       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	8(%0), %%rsi		#xor round constant"
       "\n	decq	8(%0)			#decrement counter"
       "\n	movq	T6(,%%rdi,8), %%r10"
       "\n	movq	T7(,%%rsi,8), %%mm5"
       "\n	movzbl	%%bl, %%esi"
       "\n	movzbl	%%bh, %%edi"
       "\n	xorq	T6(,%%rsi,8), %%r12"
       "\n	movq	T7(,%%rdi,8), %%mm7"




       "\n	movq	32(%0), %%rax"
       "\n	movq	48(%0), %%rbx"

       "\n	# processing input words x[5]=rcx and x[7]=rdx "
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm5"
       "\n	movq	T1(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rcx"
       "\n	movzbl	%%dl, %%esi"
       "\n	movzbl	%%dh, %%edi"
       "\n	pxor	T0(,%%rsi,8), %%mm7"
       "\n	pxor	T1(,%%rdi,8), %%mm6"
       "\n	shrq	$16, %%rdx"



       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm3"
       "\n	pxor	T3(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rcx"
       "\n	movzbl	%%dl, %%esi"
       "\n	movzbl	%%dh, %%edi"
       "\n	pxor	T2(,%%rsi,8), %%mm5"
       "\n	pxor	T3(,%%rdi,8), %%mm4"
       "\n	shrq	$16, %%rdx"



       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm1"
       "\n	pxor	T5(,%%rsi,8), %%mm0"
       "\n	shrq	$16, %%rcx"
       "\n	movzbl	%%dl, %%esi"
       "\n	movzbl	%%dh, %%edi"
       "\n	pxor	T4(,%%rsi,8), %%mm3"
       "\n	pxor	T5(,%%rdi,8), %%mm2"
       "\n	shrq	$16, %%rdx"



       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r15"
       "\n	xorq	T7(,%%rsi,8), %%r10"
       "\n	movzbl	%%dl, %%esi"
       "\n	movzbl	%%dh, %%edi"
       "\n	pxor	T6(,%%rsi,8), %%mm1"
       "\n	xorq	T7(,%%rdi,8), %%r12"



       "\n	movq	72(%0), %%rcx"
       "\n	movq	88(%0), %%rdx"

       "\n	# processing input words x[4]=rax and x[6]=rbx "
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm4"
       "\n	pxor	T1(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rax"
       "\n	movzbl	%%bl, %%esi"
       "\n	movzbl	%%bh, %%edi"
       "\n	pxor	T0(,%%rsi,8), %%mm6"
       "\n	pxor	T1(,%%rdi,8), %%mm5"
       "\n	shrq	$16, %%rbx"



       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm2"
       "\n	pxor	T3(,%%rsi,8), %%mm1"
       "\n	shrq	$16, %%rax"
       "\n	movzbl	%%bl, %%esi"
       "\n	movzbl	%%bh, %%edi"
       "\n	pxor	T2(,%%rsi,8), %%mm4"
       "\n	pxor	T3(,%%rdi,8), %%mm3"
       "\n	shrq	$16, %%rbx"



       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm0"
       "\n	xorq	T5(,%%rsi,8), %%r15"
       "\n	shrq	$16, %%rax"
       "\n	movzbl	%%bl, %%esi"
       "\n	movzbl	%%bh, %%edi"
       "\n	pxor	T4(,%%rsi,8), %%mm2"
       "\n	pxor	T5(,%%rdi,8), %%mm1"
       "\n	shrq	$16, %%rbx"



       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r14"
       "\n	movq	T7(,%%rsi,8), %%r9"
       "\n	movzbl	%%bl, %%esi"
       "\n	movzbl	%%bh, %%edi"
       "\n	pxor	T6(,%%rsi,8), %%mm0"
       "\n	xorq	T7(,%%rdi,8), %%r11"


       "\n	movq	64(%0), %%rax"
       "\n	movq	80(%0), %%rbx"

       "\n	# processing input words x[9]=rcx and x[11]=rdx "
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T0(,%%rdi,8), %%r9"
       "\n	xorq	T1(,%%rsi,8), %%r8"
       "\n	shrq	$16, %%rcx"
       "\n	movzbl	%%dl, %%esi"
       "\n	movzbl	%%dh, %%edi"
       "\n	xorq	T0(,%%rsi,8), %%r11"
       "\n	xorq	T1(,%%rdi,8), %%r10"
       "\n	shrq	$16, %%rdx"



       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm7"
       "\n	pxor	T3(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rcx"
       "\n	movzbl	%%dl, %%esi"
       "\n	movzbl	%%dh, %%edi"
       "\n	xorq	T2(,%%rsi,8), %%r9"
       "\n	xorq	T3(,%%rdi,8), %%r8"
       "\n	shrq	$16, %%rdx"



       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm5"
       "\n	pxor	T5(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rcx"
       "\n	movzbl	%%dl, %%esi"
       "\n	movzbl	%%dh, %%edi"
       "\n	pxor	T4(,%%rsi,8), %%mm7"
       "\n	pxor	T5(,%%rdi,8), %%mm6"
       "\n	shrq	$16, %%rdx"



       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm3"
       "\n	xorq	T7(,%%rsi,8), %%r14"
       "\n	movzbl	%%dl, %%esi"
       "\n	movzbl	%%dh, %%edi"
       "\n	pxor	T6(,%%rsi,8), %%mm5"
       "\n	pxor	T7(,%%rdi,8), %%mm0"



       "\n	movq	104(%0), %%rcx"
       "\n	movq	120(%0), %%rdx"

       "\n	# processing input words x[8]=rax and x[10]=rbx "
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T0(,%%rdi,8), %%r8"
       "\n	pxor	T1(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rax"
       "\n	movzbl	%%bl, %%esi"
       "\n	movzbl	%%bh, %%edi"
       "\n	xorq	T0(,%%rsi,8), %%r10"
       "\n	xorq	T1(,%%rdi,8), %%r9"
       "\n	shrq	$16, %%rbx"



       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm6"
       "\n	pxor	T3(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rax"
       "\n	movzbl	%%bl, %%esi"
       "\n	movzbl	%%bh, %%edi"
       "\n	xorq	T2(,%%rsi,8), %%r8"
       "\n	pxor	T3(,%%rdi,8), %%mm7"
       "\n	shrq	$16, %%rbx"



       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm4"
       "\n	pxor	T5(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rax"
       "\n	movzbl	%%bl, %%esi"
       "\n	movzbl	%%bh, %%edi"
       "\n	pxor	T4(,%%rsi,8), %%mm6"
       "\n	pxor	T5(,%%rdi,8), %%mm5"
       "\n	shrq	$16, %%rbx"



       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm2"
       "\n	xorq	T7(,%%rsi,8), %%r13"
       "\n	movzbl	%%bl, %%esi"
       "\n	movzbl	%%bh, %%edi"
       "\n	pxor	T6(,%%rsi,8), %%mm4"
       "\n	xorq	T7(,%%rdi,8), %%r15"

       "\n	movq	96(%0), %%rax"
       "\n	movq	112(%0), %%rbx"

       "\n	# processing input words x[13]=rcx and x[15]=rdx "
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T0(,%%rdi,8), %%r13"
       "\n	xorq	T1(,%%rsi,8), %%r12"
       "\n	shrq	$16, %%rcx"
       "\n	movzbl	%%dl, %%esi"
       "\n	movzbl	%%dh, %%edi"
       "\n	xorq	T0(,%%rsi,8), %%r15"
       "\n	xorq	T1(,%%rdi,8), %%r14"
       "\n	shrq	$16, %%rdx"



       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r11"
       "\n	xorq	T3(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rcx"
       "\n	movzbl	%%dl, %%esi"
       "\n	movzbl	%%dh, %%edi"
       "\n	xorq	T2(,%%rsi,8), %%r13"
       "\n	xorq	T3(,%%rdi,8), %%r12"
       "\n	shrq	$16, %%rdx"



       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r9"
       "\n	xorq	T5(,%%rsi,8), %%r8"
       "\n	shrq	$16, %%rcx"
       "\n	movzbl	%%dl, %%esi"
       "\n	movzbl	%%dh, %%edi"
       "\n	xorq	T4(,%%rsi,8), %%r11"
       "\n	xorq	T5(,%%rdi,8), %%r10"
       "\n	shrq	$16, %%rdx"



       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm7"
       "\n	pxor	T7(,%%rsi,8), %%mm2"
       "\n	movzbl	%%dl, %%esi"
       "\n	movzbl	%%dh, %%edi"
       "\n	xorq	T6(,%%rsi,8), %%r9"
       "\n	pxor	T7(,%%rdi,8), %%mm4"



       "\n	# processing input words x[12]=rax and x[14]=rbx "
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T0(,%%rdi,8), %%r12"
       "\n	xorq	T1(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rax"
       "\n	movzbl	%%bl, %%esi"
       "\n	movzbl	%%bh, %%edi"
       "\n	xorq	T0(,%%rsi,8), %%r14"
       "\n	xorq	T1(,%%rdi,8), %%r13"
       "\n	shrq	$16, %%rbx"



       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r10"
       "\n	xorq	T3(,%%rsi,8), %%r9"
       "\n	shrq	$16, %%rax"
       "\n	movzbl	%%bl, %%esi"
       "\n	movzbl	%%bh, %%edi"
       "\n	xorq	T2(,%%rsi,8), %%r12"
       "\n	xorq	T3(,%%rdi,8), %%r11"
       "\n	shrq	$16, %%rbx"



       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r8"
       "\n	pxor	T5(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rax"
       "\n	movzbl	%%bl, %%esi"
       "\n	movzbl	%%bh, %%edi"
       "\n	xorq	T4(,%%rsi,8), %%r10"
       "\n	xorq	T5(,%%rdi,8), %%r9"
       "\n	shrq	$16, %%rbx"



       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm6"
       "\n	pxor	T7(,%%rsi,8), %%mm1"
       "\n	movzbl	%%bl, %%esi"
       "\n	movzbl	%%bh, %%edi"
       "\n	xorq	T6(,%%rsi,8), %%r8"
       "\n	pxor	T7(,%%rdi,8), %%mm3"


       "\n	movq	8(%0), %%rdi"
       "\n	cmp	$241, %%edi"
       "\n	je	2f"
       "\n	movq	%%mm1, %%rcx"
       "\n	movq	%%mm3, %%rdx"
       "\n	movq	%%mm0, 0(%0)"
       "\n	movq	%%mm2, 16(%0)"
       "\n	movq	%%mm4, 32(%0)"
       "\n	movq	%%mm5, 40(%0)"
       "\n	movq	%%mm6, 48(%0)"
       "\n	movq	%%mm7, 56(%0)"
       "\n	movq	%%r8 , 64(%0)"
       "\n	movq	%%r9 , 72(%0)"
       "\n	movq	%%r10, 80(%0)"
       "\n	movq	%%r11, 88(%0)"
       "\n	movq	%%r12, 96(%0)"
       "\n	movq	%%r13, 104(%0)"
       "\n	movq	%%r14, 112(%0)"
       "\n	movq	%%r15, 120(%0)"
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
       "\n	movq	%%r8 , 64(%0)"
       "\n	movq	%%r9 , 72(%0)"
       "\n	movq	%%r10, 80(%0)"
       "\n	movq	%%r11, 88(%0)"
       "\n	movq	%%r12, 96(%0)"
       "\n	movq	%%r13, 104(%0)"
       "\n	movq	%%r14, 112(%0)"
       "\n	movq	%%r15, 120(%0)"
       : /*no output, only memory is modified */
       : "r"(x)
       : "%rax", "%rbx", "%rcx", "%rdx", "%rdi", "%rsi", "%r8", "%r9", "%r10", "%r11", "%r12", "%r13", "%r14", "%r15", "memory" , "%mm0", "%mm1", "%mm2" , "%mm3" , "%mm4" , "%mm5" , "%mm6" , "%mm7" );
}//Q512ASM()

