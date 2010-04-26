inline void P512ASM (u64 *x) {
  asm (
       "\n	xorq	%%r8, %%r8"
       "\n	movq	8(%0), %%rax"
       "\n	movq	24(%0), %%rbx"
       "\n	nop"
       "\n	1:"
       
       "\n	movq	0(%0), %%rcx"
       "\n	movq	16(%0), %%rdx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T0(,%%rdi,8), %%r11 # col1" /* r11 is new column 1 */
       "\n	movq	T1(,%%rsi,8), %%r10 # col1" /* r10 is new column 0 */
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	movq	T0(,%%rdi,8), %%mm3 # col3" /* mmn is new column n */
       "\n	movq	T1(,%%rsi,8), %%mm2 # col3"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T2(,%%rdi,8), %%mm7 # col1"
       "\n	movq	T3(,%%rsi,8), %%mm6 # col1"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r11 # col3"
       "\n	xorq	T3(,%%rsi,8), %%r10 # col3"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T4(,%%rdi,8), %%mm5 # col1"
       "\n	movq	T5(,%%rsi,8), %%mm4 # col1"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm7 # col3"
       "\n	pxor	T5(,%%rsi,8), %%mm6 # col3"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm3 # col1"
       "\n	pxor	T7(,%%rsi,8), %%mm2 # col1"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm5 # col3"
       "\n	pxor	T7(,%%rsi,8), %%mm4 # col3"


       "\n	xorq	%%r8, %%rcx" /* xor round constant */
       "\n	incq	%%r8"        /* increment counter */

       "\n	movq	40(%0), %%rax"
       "\n	movq	56(%0), %%rbx"


       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T0(,%%rdi,8), %%r10 # col0"
       "\n	pxor	T1(,%%rsi,8), %%mm7 # col0"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm2 # col2"
       "\n	xorq	T1(,%%rsi,8), %%r11 # col2"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm6 # col0"
       "\n	pxor	T3(,%%rsi,8), %%mm5 # col0"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r10 # col2"
       "\n	pxor	T3(,%%rsi,8), %%mm7 # col2"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm4 # col0"
       "\n	pxor	T5(,%%rsi,8), %%mm3 # col0"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm6 # col2"
       "\n	pxor	T5(,%%rsi,8), %%mm5 # col2"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm2 # col0"
       "\n	xorq	T7(,%%rsi,8), %%r11 # col0"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm4 # col2"
       "\n	pxor	T7(,%%rsi,8), %%mm3 # col2"


       "\n	movq	32(%0), %%rcx"
       "\n	movq	48(%0), %%rdx"


       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm5 # col5"
       "\n	pxor	T1(,%%rsi,8), %%mm4 # col5"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm7 # col7"
       "\n	pxor	T1(,%%rsi,8), %%mm6 # col7"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm3 # col5"
       "\n	pxor	T3(,%%rsi,8), %%mm2 # col5"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm5 # col7"
       "\n	pxor	T3(,%%rsi,8), %%mm4 # col7"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r11 # col5"
       "\n	xorq	T5(,%%rsi,8), %%r10 # col5"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm3 # col7"
       "\n	pxor	T5(,%%rsi,8), %%mm2 # col7"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm7 # col5"
       "\n	pxor	T7(,%%rsi,8), %%mm6 # col5"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r11 # col7"
       "\n	xorq	T7(,%%rsi,8), %%r10 # col7"


       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	movzbl	%%dl, %%eax"
       "\n	movzbl	%%dh, %%ebx"
       "\n	pxor	T0(,%%rdi,8), %%mm4 # col4"
       "\n	pxor	T1(,%%rsi,8), %%mm3 # col4"
       "\n	shrq	$16, %%rcx"
       "\n	pxor	T0(,%%rax,8), %%mm6 # col6"
       "\n	pxor	T1(,%%rbx,8), %%mm5 # col6"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm2 # col4"
       "\n	xorq	T3(,%%rsi,8), %%r11 # col4"
       "\n	shrq	$16, %%rcx"
       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm4 # col6"
       "\n	pxor	T3(,%%rsi,8), %%mm3 # col6"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r10 # col4"
       "\n	pxor	T5(,%%rsi,8), %%mm7 # col4"
       "\n	shrq	$16, %%rcx"
       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm2 # col6"
       "\n	xorq	T5(,%%rsi,8), %%r11 # col6"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm6 # col4"
       "\n	pxor	T7(,%%rsi,8), %%mm5 # col4"
       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r10 # col6"
       "\n	pxor	T7(,%%rsi,8), %%mm7 # col6"


       "\n	cmp	$10, %%r8"
       "\n	je	2f"
       "\n	movq	%%r11, %%rax"
       "\n	movq	%%mm3, %%rbx"
       "\n	movq	%%r10, 0(%0)"
       "\n	movq	%%mm2, 16(%0)"
       "\n	movq	%%mm4, 32(%0)"
       "\n	movq	%%mm5, 40(%0)"
       "\n	movq	%%mm6, 48(%0)"
       "\n	movq	%%mm7, 56(%0)"
       "\n	jmp	1b"

       "\n	2:"
       "\n	movq	%%r11, 8(%0)"
       "\n	movq	%%mm3, 24(%0)"
       "\n	movq	%%r10, 0(%0)"
       "\n	movq	%%mm2, 16(%0)"
       "\n	movq	%%mm4, 32(%0)"
       "\n	movq	%%mm5, 40(%0)"
       "\n	movq	%%mm6, 48(%0)"
       "\n	movq	%%mm7, 56(%0)"
       : /*no output, only memory is modified */
       : "r" (x) /* input variable: x */
       : "%rax", "%rbx", "%rcx", "%rdx", "%rdi", "%rsi", "%r8", "%r10", "%r11", "memory" , "%mm2" , "%mm3" , "%mm4" , "%mm5" , "%mm6" , "%mm7" );
}//P512ASM()



inline void Q512ASM (u64 *x) {
  asm (
       "\n	xorq	%%r8, %%r8"
       "\n	movq	8(%0), %%rax"
       "\n	not	%%r8b"
       "\n	movq	24(%0), %%rbx"
       "\n	nop"
       "\n	1:"
       
       "\n	movq	0(%0), %%rcx"
       "\n	movq	16(%0), %%rdx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T0(,%%rdi,8), %%r11 # col1"
       "\n	movq	T1(,%%rsi,8), %%r10 # col1"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	movq	T0(,%%rdi,8), %%mm3 # col3"
       "\n	movq	T1(,%%rsi,8), %%mm2 # col3"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T2(,%%rdi,8), %%mm7 # col1"
       "\n	movq	T3(,%%rsi,8), %%mm6 # col1"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r11 # col3"
       "\n	xorq	T3(,%%rsi,8), %%r10 # col3"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T4(,%%rdi,8), %%mm5 # col1"
       "\n	movq	T5(,%%rsi,8), %%mm4 # col1"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm7 # col3"
       "\n	pxor	T5(,%%rsi,8), %%mm6 # col3"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm3 # col1"
       "\n	pxor	T7(,%%rsi,8), %%mm2 # col1"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm5 # col3"
       "\n	pxor	T7(,%%rsi,8), %%mm4 # col3"


       "\n	movq	40(%0), %%rax"
       "\n	movq	56(%0), %%rbx"


       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T0(,%%rdi,8), %%r10 # col0"
       "\n	pxor	T1(,%%rsi,8), %%mm7 # col0"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm2 # col2"
       "\n	xorq	T1(,%%rsi,8), %%r11 # col2"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm6 # col0"
       "\n	pxor	T3(,%%rsi,8), %%mm5 # col0"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r10 # col2"
       "\n	pxor	T3(,%%rsi,8), %%mm7 # col2"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm4 # col0"
       "\n	pxor	T5(,%%rsi,8), %%mm3 # col0"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm6 # col2"
       "\n	pxor	T5(,%%rsi,8), %%mm5 # col2"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	%%r8, %%rsi" /* xor round constant */
       "\n	decq	%%r8"        /* decrement counter */
       "\n	pxor	T6(,%%rdi,8), %%mm2 # col0"
       "\n	xorq	T7(,%%rsi,8), %%r11 # col0"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm4 # col2"
       "\n	pxor	T7(,%%rsi,8), %%mm3 # col2"


       "\n	movq	32(%0), %%rcx"
       "\n	movq	48(%0), %%rdx"


       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm5 # col5"
       "\n	pxor	T1(,%%rsi,8), %%mm4 # col5"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm7 # col7"
       "\n	pxor	T1(,%%rsi,8), %%mm6 # col7"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm3 # col5"
       "\n	pxor	T3(,%%rsi,8), %%mm2 # col5"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm5 # col7"
       "\n	pxor	T3(,%%rsi,8), %%mm4 # col7"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r11 # col5"
       "\n	xorq	T5(,%%rsi,8), %%r10 # col5"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm3 # col7"
       "\n	pxor	T5(,%%rsi,8), %%mm2 # col7"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm7 # col5"
       "\n	pxor	T7(,%%rsi,8), %%mm6 # col5"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r11 # col7"
       "\n	xorq	T7(,%%rsi,8), %%r10 # col7"



       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm4 # col4"
       "\n	pxor	T1(,%%rsi,8), %%mm3 # col4"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%eax"
       "\n	movzbl	%%dh, %%ebx"
       "\n	pxor	T0(,%%rax,8), %%mm6 # col6"
       "\n	pxor	T1(,%%rbx,8), %%mm5 # col6"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm2 # col4"
       "\n	xorq	T3(,%%rsi,8), %%r11 # col4"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%eax"
       "\n	movzbl	%%dh, %%ebx"
       "\n	pxor	T2(,%%rax,8), %%mm4 # col6"
       "\n	pxor	T3(,%%rbx,8), %%mm3 # col6"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r10 # col4"
       "\n	pxor	T5(,%%rsi,8), %%mm7 # col4"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%eax"
       "\n	movzbl	%%dh, %%ebx"
       "\n	pxor	T4(,%%rax,8), %%mm2 # col6"
       "\n	xorq	T5(,%%rbx,8), %%r11 # col6"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm6 # col4"
       "\n	pxor	T7(,%%rsi,8), %%mm5 # col4"

       "\n	movzbl	%%dl, %%eax"
       "\n	movzbl	%%dh, %%ebx"
       "\n	xorq	T6(,%%rax,8), %%r10 # col6"
       "\n	pxor	T7(,%%rbx,8), %%mm7 # col6"


       "\n	cmp	$245, %%r8d"
       "\n	je	2f"
       "\n	movq	%%r11, %%rax"
       "\n	movq	%%mm3, %%rbx"
       "\n	movq	%%r10, 0(%0)"
       "\n	movq	%%mm2, 16(%0)"
       "\n	movq	%%mm4, 32(%0)"
       "\n	movq	%%mm5, 40(%0)"
       "\n	movq	%%mm6, 48(%0)"
       "\n	movq	%%mm7, 56(%0)"
       "\n	jmp	1b"

       "\n	2:"
       "\n	movq	%%r11, 8(%0)"
       "\n	movq	%%mm3, 24(%0)"
       "\n	movq	%%r10, 0(%0)"
       "\n	movq	%%mm2, 16(%0)"
       "\n	movq	%%mm4, 32(%0)"
       "\n	movq	%%mm5, 40(%0)"
       "\n	movq	%%mm6, 48(%0)"
       "\n	movq	%%mm7, 56(%0)"
       : /*no output, only memory is modified */
       : "r" (x) /* input variable: x */
       : "%rax", "%rbx", "%rcx", "%rdx", "%rdi", "%rsi", "%r8", "%r10", "%r11", "memory" , "%mm2" , "%mm3" , "%mm4" , "%mm5" , "%mm6" , "%mm7" );
}//Q512ASM()


