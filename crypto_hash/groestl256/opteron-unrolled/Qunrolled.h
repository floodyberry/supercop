inline void Q512ASM (u64 *x) {
  asm (
       "\n	movq	0(%0), %%rcx"
       "\n	movq	8(%0), %%rax"
       "\n	movq	16(%0), %%rdx"
       "\n	movq	24(%0), %%rbx"

       /* Round 0 */

       "\n	movq	$0xffffffffffffffff, %%r14"
       "\n	movq	$0xefffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rcx"
       "\n	xorq	%%r15, %%rax"
       "\n	movq	$0xdfffffffffffffff, %%r14"
       "\n	movq	$0xcfffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rdx"
       "\n	xorq	%%r15, %%rbx"

       /* processing columns 1 and 3 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T0(,%%rdi,8), %%r10"
       "\n	movq	T1(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	movq	T0(,%%rdi,8), %%mm2"
       "\n	xorq	T1(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T2(,%%rdi,8), %%mm4"
       "\n	pxor	T3(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm6"
       "\n	pxor	T3(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T4(,%%rdi,8), %%r11"
       "\n	movq	T5(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	movq	T4(,%%rdi,8), %%mm3"
       "\n	xorq	T5(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T6(,%%rdi,8), %%mm5"
       "\n	pxor	T7(,%%rsi,8), %%mm3"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm7"
       "\n	pxor	T7(,%%rsi,8), %%mm5"


       /* processing columns 0 and 2 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm7"
       "\n	pxor	T1(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T0(,%%rdi,8), %%r11"
       "\n	pxor	T1(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm3"
       "\n	xorq	T3(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm5"
       "\n	pxor	T3(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r10"
       "\n	pxor	T5(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm2"
       "\n	xorq	T5(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm4"
       "\n	pxor	T7(,%%rsi,8), %%mm2"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm6"
       "\n	pxor	T7(,%%rsi,8), %%mm4"


       "\n	movq	32(%0), %%rcx"
       "\n	movq	40(%0), %%rax"
       "\n	movq	48(%0), %%rdx"
       "\n	movq	56(%0), %%rbx"

       "\n	movq	$0xbfffffffffffffff, %%r14"
       "\n	movq	$0xafffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rcx"
       "\n	xorq	%%r15, %%rax"
       "\n	movq	$0x9fffffffffffffff, %%r14"
       "\n	movq	$0x8fffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rdx"
       "\n	xorq	%%r15, %%rbx"

       /* processing columns 5 and 7 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm4"
       "\n	pxor	T1(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm6"
       "\n	pxor	T1(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r10"
       "\n	pxor	T3(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm2"
       "\n	xorq	T3(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm5"
       "\n	pxor	T5(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm7"
       "\n	pxor	T5(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r11"
       "\n	pxor	T7(,%%rsi,8), %%mm7"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm3"
       "\n	xorq	T7(,%%rsi,8), %%r11"


       /* processing columns 4 and 6 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm3"
       "\n	xorq	T1(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm5"
       "\n	pxor	T1(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm7"
       "\n	pxor	T3(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r11"
       "\n	pxor	T3(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm4"
       "\n	pxor	T5(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm6"
       "\n	pxor	T5(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r10"
       "\n	pxor	T7(,%%rsi,8), %%mm6"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm2"
       "\n	xorq	T7(,%%rsi,8), %%r10"



       "\n	movq	%%r11, %%rax"
       "\n	movq	%%mm3, %%rbx"
       "\n	movq	%%r10, %%rcx"
       "\n	movq	%%mm2, %%rdx"
       "\n	movq	%%mm4, 32(%0)"
       "\n	movq	%%mm5, 40(%0)"
       "\n	movq	%%mm6, 48(%0)"
       "\n	movq	%%mm7, 56(%0)"

       /* Round 1 */

       "\n	movq	$0xfeffffffffffffff, %%r14"
       "\n	movq	$0xeeffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rcx"
       "\n	xorq	%%r15, %%rax"
       "\n	movq	$0xdeffffffffffffff, %%r14"
       "\n	movq	$0xceffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rdx"
       "\n	xorq	%%r15, %%rbx"

       /* processing columns 1 and 3 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T0(,%%rdi,8), %%r10"
       "\n	movq	T1(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	movq	T0(,%%rdi,8), %%mm2"
       "\n	xorq	T1(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T2(,%%rdi,8), %%mm4"
       "\n	pxor	T3(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm6"
       "\n	pxor	T3(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T4(,%%rdi,8), %%r11"
       "\n	movq	T5(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	movq	T4(,%%rdi,8), %%mm3"
       "\n	xorq	T5(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T6(,%%rdi,8), %%mm5"
       "\n	pxor	T7(,%%rsi,8), %%mm3"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm7"
       "\n	pxor	T7(,%%rsi,8), %%mm5"


       /* processing columns 0 and 2 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm7"
       "\n	pxor	T1(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T0(,%%rdi,8), %%r11"
       "\n	pxor	T1(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm3"
       "\n	xorq	T3(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm5"
       "\n	pxor	T3(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r10"
       "\n	pxor	T5(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm2"
       "\n	xorq	T5(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm4"
       "\n	pxor	T7(,%%rsi,8), %%mm2"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm6"
       "\n	pxor	T7(,%%rsi,8), %%mm4"


       "\n	movq	32(%0), %%rcx"
       "\n	movq	40(%0), %%rax"
       "\n	movq	48(%0), %%rdx"
       "\n	movq	56(%0), %%rbx"

       "\n	movq	$0xbeffffffffffffff, %%r14"
       "\n	movq	$0xaeffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rcx"
       "\n	xorq	%%r15, %%rax"
       "\n	movq	$0x9effffffffffffff, %%r14"
       "\n	movq	$0x8effffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rdx"
       "\n	xorq	%%r15, %%rbx"

       /* processing columns 5 and 7 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm4"
       "\n	pxor	T1(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm6"
       "\n	pxor	T1(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r10"
       "\n	pxor	T3(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm2"
       "\n	xorq	T3(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm5"
       "\n	pxor	T5(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm7"
       "\n	pxor	T5(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r11"
       "\n	pxor	T7(,%%rsi,8), %%mm7"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm3"
       "\n	xorq	T7(,%%rsi,8), %%r11"


       /* processing columns 4 and 6 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm3"
       "\n	xorq	T1(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm5"
       "\n	pxor	T1(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm7"
       "\n	pxor	T3(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r11"
       "\n	pxor	T3(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm4"
       "\n	pxor	T5(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm6"
       "\n	pxor	T5(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r10"
       "\n	pxor	T7(,%%rsi,8), %%mm6"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm2"
       "\n	xorq	T7(,%%rsi,8), %%r10"



       "\n	movq	%%r11, %%rax"
       "\n	movq	%%mm3, %%rbx"
       "\n	movq	%%r10, %%rcx"
       "\n	movq	%%mm2, %%rdx"
       "\n	movq	%%mm4, 32(%0)"
       "\n	movq	%%mm5, 40(%0)"
       "\n	movq	%%mm6, 48(%0)"
       "\n	movq	%%mm7, 56(%0)"

       /* Round 2 */

       "\n	movq	$0xfdffffffffffffff, %%r14"
       "\n	movq	$0xedffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rcx"
       "\n	xorq	%%r15, %%rax"
       "\n	movq	$0xddffffffffffffff, %%r14"
       "\n	movq	$0xcdffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rdx"
       "\n	xorq	%%r15, %%rbx"

       /* processing columns 1 and 3 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T0(,%%rdi,8), %%r10"
       "\n	movq	T1(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	movq	T0(,%%rdi,8), %%mm2"
       "\n	xorq	T1(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T2(,%%rdi,8), %%mm4"
       "\n	pxor	T3(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm6"
       "\n	pxor	T3(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T4(,%%rdi,8), %%r11"
       "\n	movq	T5(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	movq	T4(,%%rdi,8), %%mm3"
       "\n	xorq	T5(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T6(,%%rdi,8), %%mm5"
       "\n	pxor	T7(,%%rsi,8), %%mm3"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm7"
       "\n	pxor	T7(,%%rsi,8), %%mm5"


       /* processing columns 0 and 2 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm7"
       "\n	pxor	T1(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T0(,%%rdi,8), %%r11"
       "\n	pxor	T1(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm3"
       "\n	xorq	T3(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm5"
       "\n	pxor	T3(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r10"
       "\n	pxor	T5(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm2"
       "\n	xorq	T5(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm4"
       "\n	pxor	T7(,%%rsi,8), %%mm2"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm6"
       "\n	pxor	T7(,%%rsi,8), %%mm4"


       "\n	movq	32(%0), %%rcx"
       "\n	movq	40(%0), %%rax"
       "\n	movq	48(%0), %%rdx"
       "\n	movq	56(%0), %%rbx"

       "\n	movq	$0xbdffffffffffffff, %%r14"
       "\n	movq	$0xadffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rcx"
       "\n	xorq	%%r15, %%rax"
       "\n	movq	$0x9dffffffffffffff, %%r14"
       "\n	movq	$0x8dffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rdx"
       "\n	xorq	%%r15, %%rbx"

       /* processing columns 5 and 7 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm4"
       "\n	pxor	T1(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm6"
       "\n	pxor	T1(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r10"
       "\n	pxor	T3(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm2"
       "\n	xorq	T3(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm5"
       "\n	pxor	T5(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm7"
       "\n	pxor	T5(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r11"
       "\n	pxor	T7(,%%rsi,8), %%mm7"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm3"
       "\n	xorq	T7(,%%rsi,8), %%r11"


       /* processing columns 4 and 6 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm3"
       "\n	xorq	T1(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm5"
       "\n	pxor	T1(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm7"
       "\n	pxor	T3(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r11"
       "\n	pxor	T3(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm4"
       "\n	pxor	T5(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm6"
       "\n	pxor	T5(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r10"
       "\n	pxor	T7(,%%rsi,8), %%mm6"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm2"
       "\n	xorq	T7(,%%rsi,8), %%r10"



       "\n	movq	%%r11, %%rax"
       "\n	movq	%%mm3, %%rbx"
       "\n	movq	%%r10, %%rcx"
       "\n	movq	%%mm2, %%rdx"
       "\n	movq	%%mm4, 32(%0)"
       "\n	movq	%%mm5, 40(%0)"
       "\n	movq	%%mm6, 48(%0)"
       "\n	movq	%%mm7, 56(%0)"

       /* Round 3 */

       "\n	movq	$0xfcffffffffffffff, %%r14"
       "\n	movq	$0xecffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rcx"
       "\n	xorq	%%r15, %%rax"
       "\n	movq	$0xdcffffffffffffff, %%r14"
       "\n	movq	$0xccffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rdx"
       "\n	xorq	%%r15, %%rbx"

       /* processing columns 1 and 3 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T0(,%%rdi,8), %%r10"
       "\n	movq	T1(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	movq	T0(,%%rdi,8), %%mm2"
       "\n	xorq	T1(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T2(,%%rdi,8), %%mm4"
       "\n	pxor	T3(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm6"
       "\n	pxor	T3(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T4(,%%rdi,8), %%r11"
       "\n	movq	T5(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	movq	T4(,%%rdi,8), %%mm3"
       "\n	xorq	T5(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T6(,%%rdi,8), %%mm5"
       "\n	pxor	T7(,%%rsi,8), %%mm3"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm7"
       "\n	pxor	T7(,%%rsi,8), %%mm5"


       /* processing columns 0 and 2 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm7"
       "\n	pxor	T1(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T0(,%%rdi,8), %%r11"
       "\n	pxor	T1(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm3"
       "\n	xorq	T3(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm5"
       "\n	pxor	T3(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r10"
       "\n	pxor	T5(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm2"
       "\n	xorq	T5(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm4"
       "\n	pxor	T7(,%%rsi,8), %%mm2"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm6"
       "\n	pxor	T7(,%%rsi,8), %%mm4"


       "\n	movq	32(%0), %%rcx"
       "\n	movq	40(%0), %%rax"
       "\n	movq	48(%0), %%rdx"
       "\n	movq	56(%0), %%rbx"

       "\n	movq	$0xbcffffffffffffff, %%r14"
       "\n	movq	$0xacffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rcx"
       "\n	xorq	%%r15, %%rax"
       "\n	movq	$0x9cffffffffffffff, %%r14"
       "\n	movq	$0x8cffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rdx"
       "\n	xorq	%%r15, %%rbx"

       /* processing columns 5 and 7 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm4"
       "\n	pxor	T1(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm6"
       "\n	pxor	T1(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r10"
       "\n	pxor	T3(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm2"
       "\n	xorq	T3(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm5"
       "\n	pxor	T5(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm7"
       "\n	pxor	T5(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r11"
       "\n	pxor	T7(,%%rsi,8), %%mm7"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm3"
       "\n	xorq	T7(,%%rsi,8), %%r11"


       /* processing columns 4 and 6 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm3"
       "\n	xorq	T1(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm5"
       "\n	pxor	T1(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm7"
       "\n	pxor	T3(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r11"
       "\n	pxor	T3(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm4"
       "\n	pxor	T5(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm6"
       "\n	pxor	T5(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r10"
       "\n	pxor	T7(,%%rsi,8), %%mm6"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm2"
       "\n	xorq	T7(,%%rsi,8), %%r10"



       "\n	movq	%%r11, %%rax"
       "\n	movq	%%mm3, %%rbx"
       "\n	movq	%%r10, %%rcx"
       "\n	movq	%%mm2, %%rdx"
       "\n	movq	%%mm4, 32(%0)"
       "\n	movq	%%mm5, 40(%0)"
       "\n	movq	%%mm6, 48(%0)"
       "\n	movq	%%mm7, 56(%0)"

       /* Round 4 */

       "\n	movq	$0xfbffffffffffffff, %%r14"
       "\n	movq	$0xebffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rcx"
       "\n	xorq	%%r15, %%rax"
       "\n	movq	$0xdbffffffffffffff, %%r14"
       "\n	movq	$0xcbffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rdx"
       "\n	xorq	%%r15, %%rbx"

       /* processing columns 1 and 3 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T0(,%%rdi,8), %%r10"
       "\n	movq	T1(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	movq	T0(,%%rdi,8), %%mm2"
       "\n	xorq	T1(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T2(,%%rdi,8), %%mm4"
       "\n	pxor	T3(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm6"
       "\n	pxor	T3(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T4(,%%rdi,8), %%r11"
       "\n	movq	T5(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	movq	T4(,%%rdi,8), %%mm3"
       "\n	xorq	T5(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T6(,%%rdi,8), %%mm5"
       "\n	pxor	T7(,%%rsi,8), %%mm3"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm7"
       "\n	pxor	T7(,%%rsi,8), %%mm5"


       /* processing columns 0 and 2 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm7"
       "\n	pxor	T1(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T0(,%%rdi,8), %%r11"
       "\n	pxor	T1(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm3"
       "\n	xorq	T3(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm5"
       "\n	pxor	T3(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r10"
       "\n	pxor	T5(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm2"
       "\n	xorq	T5(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm4"
       "\n	pxor	T7(,%%rsi,8), %%mm2"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm6"
       "\n	pxor	T7(,%%rsi,8), %%mm4"


       "\n	movq	32(%0), %%rcx"
       "\n	movq	40(%0), %%rax"
       "\n	movq	48(%0), %%rdx"
       "\n	movq	56(%0), %%rbx"

       "\n	movq	$0xbbffffffffffffff, %%r14"
       "\n	movq	$0xabffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rcx"
       "\n	xorq	%%r15, %%rax"
       "\n	movq	$0x9bffffffffffffff, %%r14"
       "\n	movq	$0x8bffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rdx"
       "\n	xorq	%%r15, %%rbx"

       /* processing columns 5 and 7 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm4"
       "\n	pxor	T1(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm6"
       "\n	pxor	T1(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r10"
       "\n	pxor	T3(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm2"
       "\n	xorq	T3(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm5"
       "\n	pxor	T5(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm7"
       "\n	pxor	T5(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r11"
       "\n	pxor	T7(,%%rsi,8), %%mm7"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm3"
       "\n	xorq	T7(,%%rsi,8), %%r11"


       /* processing columns 4 and 6 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm3"
       "\n	xorq	T1(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm5"
       "\n	pxor	T1(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm7"
       "\n	pxor	T3(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r11"
       "\n	pxor	T3(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm4"
       "\n	pxor	T5(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm6"
       "\n	pxor	T5(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r10"
       "\n	pxor	T7(,%%rsi,8), %%mm6"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm2"
       "\n	xorq	T7(,%%rsi,8), %%r10"



       "\n	movq	%%r11, %%rax"
       "\n	movq	%%mm3, %%rbx"
       "\n	movq	%%r10, %%rcx"
       "\n	movq	%%mm2, %%rdx"
       "\n	movq	%%mm4, 32(%0)"
       "\n	movq	%%mm5, 40(%0)"
       "\n	movq	%%mm6, 48(%0)"
       "\n	movq	%%mm7, 56(%0)"

       /* Round 5 */

       "\n	movq	$0xfaffffffffffffff, %%r14"
       "\n	movq	$0xeaffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rcx"
       "\n	xorq	%%r15, %%rax"
       "\n	movq	$0xdaffffffffffffff, %%r14"
       "\n	movq	$0xcaffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rdx"
       "\n	xorq	%%r15, %%rbx"

       /* processing columns 1 and 3 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T0(,%%rdi,8), %%r10"
       "\n	movq	T1(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	movq	T0(,%%rdi,8), %%mm2"
       "\n	xorq	T1(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T2(,%%rdi,8), %%mm4"
       "\n	pxor	T3(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm6"
       "\n	pxor	T3(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T4(,%%rdi,8), %%r11"
       "\n	movq	T5(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	movq	T4(,%%rdi,8), %%mm3"
       "\n	xorq	T5(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T6(,%%rdi,8), %%mm5"
       "\n	pxor	T7(,%%rsi,8), %%mm3"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm7"
       "\n	pxor	T7(,%%rsi,8), %%mm5"


       /* processing columns 0 and 2 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm7"
       "\n	pxor	T1(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T0(,%%rdi,8), %%r11"
       "\n	pxor	T1(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm3"
       "\n	xorq	T3(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm5"
       "\n	pxor	T3(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r10"
       "\n	pxor	T5(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm2"
       "\n	xorq	T5(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm4"
       "\n	pxor	T7(,%%rsi,8), %%mm2"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm6"
       "\n	pxor	T7(,%%rsi,8), %%mm4"


       "\n	movq	32(%0), %%rcx"
       "\n	movq	40(%0), %%rax"
       "\n	movq	48(%0), %%rdx"
       "\n	movq	56(%0), %%rbx"

       "\n	movq	$0xbaffffffffffffff, %%r14"
       "\n	movq	$0xaaffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rcx"
       "\n	xorq	%%r15, %%rax"
       "\n	movq	$0x9affffffffffffff, %%r14"
       "\n	movq	$0x8affffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rdx"
       "\n	xorq	%%r15, %%rbx"

       /* processing columns 5 and 7 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm4"
       "\n	pxor	T1(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm6"
       "\n	pxor	T1(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r10"
       "\n	pxor	T3(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm2"
       "\n	xorq	T3(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm5"
       "\n	pxor	T5(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm7"
       "\n	pxor	T5(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r11"
       "\n	pxor	T7(,%%rsi,8), %%mm7"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm3"
       "\n	xorq	T7(,%%rsi,8), %%r11"


       /* processing columns 4 and 6 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm3"
       "\n	xorq	T1(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm5"
       "\n	pxor	T1(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm7"
       "\n	pxor	T3(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r11"
       "\n	pxor	T3(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm4"
       "\n	pxor	T5(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm6"
       "\n	pxor	T5(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r10"
       "\n	pxor	T7(,%%rsi,8), %%mm6"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm2"
       "\n	xorq	T7(,%%rsi,8), %%r10"



       "\n	movq	%%r11, %%rax"
       "\n	movq	%%mm3, %%rbx"
       "\n	movq	%%r10, %%rcx"
       "\n	movq	%%mm2, %%rdx"
       "\n	movq	%%mm4, 32(%0)"
       "\n	movq	%%mm5, 40(%0)"
       "\n	movq	%%mm6, 48(%0)"
       "\n	movq	%%mm7, 56(%0)"

       /* Round 6 */

       "\n	movq	$0xf9ffffffffffffff, %%r14"
       "\n	movq	$0xe9ffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rcx"
       "\n	xorq	%%r15, %%rax"
       "\n	movq	$0xd9ffffffffffffff, %%r14"
       "\n	movq	$0xc9ffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rdx"
       "\n	xorq	%%r15, %%rbx"

       /* processing columns 1 and 3 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T0(,%%rdi,8), %%r10"
       "\n	movq	T1(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	movq	T0(,%%rdi,8), %%mm2"
       "\n	xorq	T1(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T2(,%%rdi,8), %%mm4"
       "\n	pxor	T3(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm6"
       "\n	pxor	T3(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T4(,%%rdi,8), %%r11"
       "\n	movq	T5(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	movq	T4(,%%rdi,8), %%mm3"
       "\n	xorq	T5(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T6(,%%rdi,8), %%mm5"
       "\n	pxor	T7(,%%rsi,8), %%mm3"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm7"
       "\n	pxor	T7(,%%rsi,8), %%mm5"


       /* processing columns 0 and 2 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm7"
       "\n	pxor	T1(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T0(,%%rdi,8), %%r11"
       "\n	pxor	T1(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm3"
       "\n	xorq	T3(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm5"
       "\n	pxor	T3(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r10"
       "\n	pxor	T5(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm2"
       "\n	xorq	T5(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm4"
       "\n	pxor	T7(,%%rsi,8), %%mm2"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm6"
       "\n	pxor	T7(,%%rsi,8), %%mm4"


       "\n	movq	32(%0), %%rcx"
       "\n	movq	40(%0), %%rax"
       "\n	movq	48(%0), %%rdx"
       "\n	movq	56(%0), %%rbx"

       "\n	movq	$0xb9ffffffffffffff, %%r14"
       "\n	movq	$0xa9ffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rcx"
       "\n	xorq	%%r15, %%rax"
       "\n	movq	$0x99ffffffffffffff, %%r14"
       "\n	movq	$0x89ffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rdx"
       "\n	xorq	%%r15, %%rbx"

       /* processing columns 5 and 7 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm4"
       "\n	pxor	T1(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm6"
       "\n	pxor	T1(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r10"
       "\n	pxor	T3(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm2"
       "\n	xorq	T3(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm5"
       "\n	pxor	T5(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm7"
       "\n	pxor	T5(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r11"
       "\n	pxor	T7(,%%rsi,8), %%mm7"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm3"
       "\n	xorq	T7(,%%rsi,8), %%r11"


       /* processing columns 4 and 6 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm3"
       "\n	xorq	T1(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm5"
       "\n	pxor	T1(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm7"
       "\n	pxor	T3(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r11"
       "\n	pxor	T3(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm4"
       "\n	pxor	T5(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm6"
       "\n	pxor	T5(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r10"
       "\n	pxor	T7(,%%rsi,8), %%mm6"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm2"
       "\n	xorq	T7(,%%rsi,8), %%r10"



       "\n	movq	%%r11, %%rax"
       "\n	movq	%%mm3, %%rbx"
       "\n	movq	%%r10, %%rcx"
       "\n	movq	%%mm2, %%rdx"
       "\n	movq	%%mm4, 32(%0)"
       "\n	movq	%%mm5, 40(%0)"
       "\n	movq	%%mm6, 48(%0)"
       "\n	movq	%%mm7, 56(%0)"

       /* Round 7 */

       "\n	movq	$0xf8ffffffffffffff, %%r14"
       "\n	movq	$0xe8ffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rcx"
       "\n	xorq	%%r15, %%rax"
       "\n	movq	$0xd8ffffffffffffff, %%r14"
       "\n	movq	$0xc8ffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rdx"
       "\n	xorq	%%r15, %%rbx"

       /* processing columns 1 and 3 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T0(,%%rdi,8), %%r10"
       "\n	movq	T1(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	movq	T0(,%%rdi,8), %%mm2"
       "\n	xorq	T1(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T2(,%%rdi,8), %%mm4"
       "\n	pxor	T3(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm6"
       "\n	pxor	T3(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T4(,%%rdi,8), %%r11"
       "\n	movq	T5(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	movq	T4(,%%rdi,8), %%mm3"
       "\n	xorq	T5(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T6(,%%rdi,8), %%mm5"
       "\n	pxor	T7(,%%rsi,8), %%mm3"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm7"
       "\n	pxor	T7(,%%rsi,8), %%mm5"


       /* processing columns 0 and 2 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm7"
       "\n	pxor	T1(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T0(,%%rdi,8), %%r11"
       "\n	pxor	T1(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm3"
       "\n	xorq	T3(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm5"
       "\n	pxor	T3(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r10"
       "\n	pxor	T5(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm2"
       "\n	xorq	T5(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm4"
       "\n	pxor	T7(,%%rsi,8), %%mm2"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm6"
       "\n	pxor	T7(,%%rsi,8), %%mm4"


       "\n	movq	32(%0), %%rcx"
       "\n	movq	40(%0), %%rax"
       "\n	movq	48(%0), %%rdx"
       "\n	movq	56(%0), %%rbx"

       "\n	movq	$0xb8ffffffffffffff, %%r14"
       "\n	movq	$0xa8ffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rcx"
       "\n	xorq	%%r15, %%rax"
       "\n	movq	$0x98ffffffffffffff, %%r14"
       "\n	movq	$0x88ffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rdx"
       "\n	xorq	%%r15, %%rbx"

       /* processing columns 5 and 7 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm4"
       "\n	pxor	T1(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm6"
       "\n	pxor	T1(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r10"
       "\n	pxor	T3(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm2"
       "\n	xorq	T3(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm5"
       "\n	pxor	T5(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm7"
       "\n	pxor	T5(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r11"
       "\n	pxor	T7(,%%rsi,8), %%mm7"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm3"
       "\n	xorq	T7(,%%rsi,8), %%r11"


       /* processing columns 4 and 6 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm3"
       "\n	xorq	T1(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm5"
       "\n	pxor	T1(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm7"
       "\n	pxor	T3(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r11"
       "\n	pxor	T3(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm4"
       "\n	pxor	T5(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm6"
       "\n	pxor	T5(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r10"
       "\n	pxor	T7(,%%rsi,8), %%mm6"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm2"
       "\n	xorq	T7(,%%rsi,8), %%r10"



       "\n	movq	%%r11, %%rax"
       "\n	movq	%%mm3, %%rbx"
       "\n	movq	%%r10, %%rcx"
       "\n	movq	%%mm2, %%rdx"
       "\n	movq	%%mm4, 32(%0)"
       "\n	movq	%%mm5, 40(%0)"
       "\n	movq	%%mm6, 48(%0)"
       "\n	movq	%%mm7, 56(%0)"

       /* Round 8 */

       "\n	movq	$0xf7ffffffffffffff, %%r14"
       "\n	movq	$0xe7ffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rcx"
       "\n	xorq	%%r15, %%rax"
       "\n	movq	$0xd7ffffffffffffff, %%r14"
       "\n	movq	$0xc7ffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rdx"
       "\n	xorq	%%r15, %%rbx"

       /* processing columns 1 and 3 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T0(,%%rdi,8), %%r10"
       "\n	movq	T1(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	movq	T0(,%%rdi,8), %%mm2"
       "\n	xorq	T1(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T2(,%%rdi,8), %%mm4"
       "\n	pxor	T3(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm6"
       "\n	pxor	T3(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T4(,%%rdi,8), %%r11"
       "\n	movq	T5(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	movq	T4(,%%rdi,8), %%mm3"
       "\n	xorq	T5(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T6(,%%rdi,8), %%mm5"
       "\n	pxor	T7(,%%rsi,8), %%mm3"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm7"
       "\n	pxor	T7(,%%rsi,8), %%mm5"


       /* processing columns 0 and 2 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm7"
       "\n	pxor	T1(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T0(,%%rdi,8), %%r11"
       "\n	pxor	T1(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm3"
       "\n	xorq	T3(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm5"
       "\n	pxor	T3(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r10"
       "\n	pxor	T5(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm2"
       "\n	xorq	T5(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm4"
       "\n	pxor	T7(,%%rsi,8), %%mm2"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm6"
       "\n	pxor	T7(,%%rsi,8), %%mm4"


       "\n	movq	32(%0), %%rcx"
       "\n	movq	40(%0), %%rax"
       "\n	movq	48(%0), %%rdx"
       "\n	movq	56(%0), %%rbx"

       "\n	movq	$0xb7ffffffffffffff, %%r14"
       "\n	movq	$0xa7ffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rcx"
       "\n	xorq	%%r15, %%rax"
       "\n	movq	$0x97ffffffffffffff, %%r14"
       "\n	movq	$0x87ffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rdx"
       "\n	xorq	%%r15, %%rbx"

       /* processing columns 5 and 7 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm4"
       "\n	pxor	T1(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm6"
       "\n	pxor	T1(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r10"
       "\n	pxor	T3(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm2"
       "\n	xorq	T3(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm5"
       "\n	pxor	T5(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm7"
       "\n	pxor	T5(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r11"
       "\n	pxor	T7(,%%rsi,8), %%mm7"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm3"
       "\n	xorq	T7(,%%rsi,8), %%r11"


       /* processing columns 4 and 6 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm3"
       "\n	xorq	T1(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm5"
       "\n	pxor	T1(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm7"
       "\n	pxor	T3(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r11"
       "\n	pxor	T3(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm4"
       "\n	pxor	T5(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm6"
       "\n	pxor	T5(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r10"
       "\n	pxor	T7(,%%rsi,8), %%mm6"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm2"
       "\n	xorq	T7(,%%rsi,8), %%r10"



       "\n	movq	%%r11, %%rax"
       "\n	movq	%%mm3, %%rbx"
       "\n	movq	%%r10, %%rcx"
       "\n	movq	%%mm2, %%rdx"
       "\n	movq	%%mm4, 32(%0)"
       "\n	movq	%%mm5, 40(%0)"
       "\n	movq	%%mm6, 48(%0)"
       "\n	movq	%%mm7, 56(%0)"

       /* Round 9 */

       "\n	movq	$0xf6ffffffffffffff, %%r14"
       "\n	movq	$0xe6ffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rcx"
       "\n	xorq	%%r15, %%rax"
       "\n	movq	$0xd6ffffffffffffff, %%r14"
       "\n	movq	$0xc6ffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rdx"
       "\n	xorq	%%r15, %%rbx"

       /* processing columns 1 and 3 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T0(,%%rdi,8), %%r10"
       "\n	movq	T1(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	movq	T0(,%%rdi,8), %%mm2"
       "\n	xorq	T1(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T2(,%%rdi,8), %%mm4"
       "\n	pxor	T3(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm6"
       "\n	pxor	T3(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T4(,%%rdi,8), %%r11"
       "\n	movq	T5(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	movq	T4(,%%rdi,8), %%mm3"
       "\n	xorq	T5(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T6(,%%rdi,8), %%mm5"
       "\n	pxor	T7(,%%rsi,8), %%mm3"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm7"
       "\n	pxor	T7(,%%rsi,8), %%mm5"


       /* processing columns 0 and 2 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm7"
       "\n	pxor	T1(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T0(,%%rdi,8), %%r11"
       "\n	pxor	T1(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm3"
       "\n	xorq	T3(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm5"
       "\n	pxor	T3(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r10"
       "\n	pxor	T5(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm2"
       "\n	xorq	T5(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm4"
       "\n	pxor	T7(,%%rsi,8), %%mm2"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm6"
       "\n	pxor	T7(,%%rsi,8), %%mm4"


       "\n	movq	32(%0), %%rcx"
       "\n	movq	40(%0), %%rax"
       "\n	movq	48(%0), %%rdx"
       "\n	movq	56(%0), %%rbx"

       "\n	movq	$0xb6ffffffffffffff, %%r14"
       "\n	movq	$0xa6ffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rcx"
       "\n	xorq	%%r15, %%rax"
       "\n	movq	$0x96ffffffffffffff, %%r14"
       "\n	movq	$0x86ffffffffffffff, %%r15"
       "\n	xorq	%%r14, %%rdx"
       "\n	xorq	%%r15, %%rbx"

       /* processing columns 5 and 7 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm4"
       "\n	pxor	T1(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm6"
       "\n	pxor	T1(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r10"
       "\n	pxor	T3(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm2"
       "\n	xorq	T3(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm5"
       "\n	pxor	T5(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm7"
       "\n	pxor	T5(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r11"
       "\n	pxor	T7(,%%rsi,8), %%mm7"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm3"
       "\n	xorq	T7(,%%rsi,8), %%r11"


       /* processing columns 4 and 6 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm3"
       "\n	xorq	T1(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm5"
       "\n	pxor	T1(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm7"
       "\n	pxor	T3(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r11"
       "\n	pxor	T3(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm4"
       "\n	pxor	T5(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm6"
       "\n	pxor	T5(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r10"
       "\n	pxor	T7(,%%rsi,8), %%mm6"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm2"
       "\n	xorq	T7(,%%rsi,8), %%r10"



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
       : "%rax", "%rbx", "%rcx", "%rdx", "%rdi", "%rsi", "%r8", "%r10", "%r11", "%r14", "%r15", "memory" , "%mm2" , "%mm3" , "%mm4" , "%mm5" , "%mm6" , "%mm7" );
}//Q512ASM()
