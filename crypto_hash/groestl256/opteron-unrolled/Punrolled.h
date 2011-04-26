inline void P512ASM (u64 *x) {
  asm (
       "\n	movq	0(%0), %%rcx"
       "\n	movq	8(%0), %%rax"
       "\n	movq	16(%0), %%rdx"
       "\n	movq	24(%0), %%rbx"

       /* Round 0 */

       "\n	xorq	$0x00, %%rcx"
       "\n	xorq	$0x10, %%rax"
       "\n	xorq	$0x20, %%rdx"
       "\n	xorq	$0x30, %%rbx"

       /* processing columns 1 and 3 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T0(,%%rdi,8), %%r11"
       "\n	movq	T1(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	movq	T0(,%%rdi,8), %%mm3"
       "\n	movq	T1(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T2(,%%rdi,8), %%mm7"
       "\n	movq	T3(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r11"
       "\n	xorq	T3(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T4(,%%rdi,8), %%mm5"
       "\n	movq	T5(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm7"
       "\n	pxor	T5(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm3"
       "\n	pxor	T7(,%%rsi,8), %%mm2"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm5"
       "\n	pxor	T7(,%%rsi,8), %%mm4"


       /* processing columns 0 and 2 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T0(,%%rdi,8), %%r10"
       "\n	pxor	T1(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm2"
       "\n	xorq	T1(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm6"
       "\n	pxor	T3(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r10"
       "\n	pxor	T3(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm4"
       "\n	pxor	T5(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm6"
       "\n	pxor	T5(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm2"
       "\n	xorq	T7(,%%rsi,8), %%r11"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm4"
       "\n	pxor	T7(,%%rsi,8), %%mm3"


       "\n	movq	32(%0), %%rcx"
       "\n	movq	40(%0), %%rax"
       "\n	movq	48(%0), %%rdx"
       "\n	movq	56(%0), %%rbx"

       "\n	xorq	$0x40, %%rcx"
       "\n	xorq	$0x50, %%rax"
       "\n	xorq	$0x60, %%rdx"
       "\n	xorq	$0x70, %%rbx"

       /* processing columns 5 and 7 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm5"
       "\n	pxor	T1(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm7"
       "\n	pxor	T1(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm3"
       "\n	pxor	T3(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm5"
       "\n	pxor	T3(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r11"
       "\n	xorq	T5(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm3"
       "\n	pxor	T5(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm7"
       "\n	pxor	T7(,%%rsi,8), %%mm6"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r11"
       "\n	xorq	T7(,%%rsi,8), %%r10"


       /* processing columns 4 and 6 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm4"
       "\n	pxor	T1(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm6"
       "\n	pxor	T1(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm2"
       "\n	xorq	T3(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm4"
       "\n	pxor	T3(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r10"
       "\n	pxor	T5(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm2"
       "\n	xorq	T5(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm6"
       "\n	pxor	T7(,%%rsi,8), %%mm5"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r10"
       "\n	pxor	T7(,%%rsi,8), %%mm7"



       "\n	movq	%%r11, %%rax"
       "\n	movq	%%mm3, %%rbx"
       "\n	movq	%%r10, %%rcx"
       "\n	movq	%%mm2, %%rdx"
       "\n	movq	%%mm4, 32(%0)"
       "\n	movq	%%mm5, 40(%0)"
       "\n	movq	%%mm6, 48(%0)"
       "\n	movq	%%mm7, 56(%0)"

       /* Round 1 */

       "\n	xorq	$0x01, %%rcx"
       "\n	xorq	$0x11, %%rax"
       "\n	xorq	$0x21, %%rdx"
       "\n	xorq	$0x31, %%rbx"

       /* processing columns 1 and 3 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T0(,%%rdi,8), %%r11"
       "\n	movq	T1(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	movq	T0(,%%rdi,8), %%mm3"
       "\n	movq	T1(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T2(,%%rdi,8), %%mm7"
       "\n	movq	T3(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r11"
       "\n	xorq	T3(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T4(,%%rdi,8), %%mm5"
       "\n	movq	T5(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm7"
       "\n	pxor	T5(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm3"
       "\n	pxor	T7(,%%rsi,8), %%mm2"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm5"
       "\n	pxor	T7(,%%rsi,8), %%mm4"


       /* processing columns 0 and 2 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T0(,%%rdi,8), %%r10"
       "\n	pxor	T1(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm2"
       "\n	xorq	T1(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm6"
       "\n	pxor	T3(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r10"
       "\n	pxor	T3(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm4"
       "\n	pxor	T5(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm6"
       "\n	pxor	T5(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm2"
       "\n	xorq	T7(,%%rsi,8), %%r11"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm4"
       "\n	pxor	T7(,%%rsi,8), %%mm3"


       "\n	movq	32(%0), %%rcx"
       "\n	movq	40(%0), %%rax"
       "\n	movq	48(%0), %%rdx"
       "\n	movq	56(%0), %%rbx"

       "\n	xorq	$0x41, %%rcx"
       "\n	xorq	$0x51, %%rax"
       "\n	xorq	$0x61, %%rdx"
       "\n	xorq	$0x71, %%rbx"

       /* processing columns 5 and 7 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm5"
       "\n	pxor	T1(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm7"
       "\n	pxor	T1(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm3"
       "\n	pxor	T3(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm5"
       "\n	pxor	T3(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r11"
       "\n	xorq	T5(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm3"
       "\n	pxor	T5(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm7"
       "\n	pxor	T7(,%%rsi,8), %%mm6"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r11"
       "\n	xorq	T7(,%%rsi,8), %%r10"


       /* processing columns 4 and 6 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm4"
       "\n	pxor	T1(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm6"
       "\n	pxor	T1(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm2"
       "\n	xorq	T3(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm4"
       "\n	pxor	T3(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r10"
       "\n	pxor	T5(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm2"
       "\n	xorq	T5(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm6"
       "\n	pxor	T7(,%%rsi,8), %%mm5"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r10"
       "\n	pxor	T7(,%%rsi,8), %%mm7"



       "\n	movq	%%r11, %%rax"
       "\n	movq	%%mm3, %%rbx"
       "\n	movq	%%r10, %%rcx"
       "\n	movq	%%mm2, %%rdx"
       "\n	movq	%%mm4, 32(%0)"
       "\n	movq	%%mm5, 40(%0)"
       "\n	movq	%%mm6, 48(%0)"
       "\n	movq	%%mm7, 56(%0)"

       /* Round 2 */

       "\n	xorq	$0x02, %%rcx"
       "\n	xorq	$0x12, %%rax"
       "\n	xorq	$0x22, %%rdx"
       "\n	xorq	$0x32, %%rbx"

       /* processing columns 1 and 3 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T0(,%%rdi,8), %%r11"
       "\n	movq	T1(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	movq	T0(,%%rdi,8), %%mm3"
       "\n	movq	T1(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T2(,%%rdi,8), %%mm7"
       "\n	movq	T3(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r11"
       "\n	xorq	T3(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T4(,%%rdi,8), %%mm5"
       "\n	movq	T5(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm7"
       "\n	pxor	T5(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm3"
       "\n	pxor	T7(,%%rsi,8), %%mm2"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm5"
       "\n	pxor	T7(,%%rsi,8), %%mm4"


       /* processing columns 0 and 2 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T0(,%%rdi,8), %%r10"
       "\n	pxor	T1(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm2"
       "\n	xorq	T1(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm6"
       "\n	pxor	T3(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r10"
       "\n	pxor	T3(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm4"
       "\n	pxor	T5(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm6"
       "\n	pxor	T5(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm2"
       "\n	xorq	T7(,%%rsi,8), %%r11"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm4"
       "\n	pxor	T7(,%%rsi,8), %%mm3"


       "\n	movq	32(%0), %%rcx"
       "\n	movq	40(%0), %%rax"
       "\n	movq	48(%0), %%rdx"
       "\n	movq	56(%0), %%rbx"

       "\n	xorq	$0x42, %%rcx"
       "\n	xorq	$0x52, %%rax"
       "\n	xorq	$0x62, %%rdx"
       "\n	xorq	$0x72, %%rbx"

       /* processing columns 5 and 7 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm5"
       "\n	pxor	T1(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm7"
       "\n	pxor	T1(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm3"
       "\n	pxor	T3(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm5"
       "\n	pxor	T3(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r11"
       "\n	xorq	T5(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm3"
       "\n	pxor	T5(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm7"
       "\n	pxor	T7(,%%rsi,8), %%mm6"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r11"
       "\n	xorq	T7(,%%rsi,8), %%r10"


       /* processing columns 4 and 6 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm4"
       "\n	pxor	T1(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm6"
       "\n	pxor	T1(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm2"
       "\n	xorq	T3(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm4"
       "\n	pxor	T3(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r10"
       "\n	pxor	T5(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm2"
       "\n	xorq	T5(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm6"
       "\n	pxor	T7(,%%rsi,8), %%mm5"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r10"
       "\n	pxor	T7(,%%rsi,8), %%mm7"



       "\n	movq	%%r11, %%rax"
       "\n	movq	%%mm3, %%rbx"
       "\n	movq	%%r10, %%rcx"
       "\n	movq	%%mm2, %%rdx"
       "\n	movq	%%mm4, 32(%0)"
       "\n	movq	%%mm5, 40(%0)"
       "\n	movq	%%mm6, 48(%0)"
       "\n	movq	%%mm7, 56(%0)"

       /* Round 3 */

       "\n	xorq	$0x03, %%rcx"
       "\n	xorq	$0x13, %%rax"
       "\n	xorq	$0x23, %%rdx"
       "\n	xorq	$0x33, %%rbx"

       /* processing columns 1 and 3 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T0(,%%rdi,8), %%r11"
       "\n	movq	T1(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	movq	T0(,%%rdi,8), %%mm3"
       "\n	movq	T1(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T2(,%%rdi,8), %%mm7"
       "\n	movq	T3(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r11"
       "\n	xorq	T3(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T4(,%%rdi,8), %%mm5"
       "\n	movq	T5(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm7"
       "\n	pxor	T5(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm3"
       "\n	pxor	T7(,%%rsi,8), %%mm2"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm5"
       "\n	pxor	T7(,%%rsi,8), %%mm4"


       /* processing columns 0 and 2 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T0(,%%rdi,8), %%r10"
       "\n	pxor	T1(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm2"
       "\n	xorq	T1(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm6"
       "\n	pxor	T3(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r10"
       "\n	pxor	T3(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm4"
       "\n	pxor	T5(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm6"
       "\n	pxor	T5(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm2"
       "\n	xorq	T7(,%%rsi,8), %%r11"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm4"
       "\n	pxor	T7(,%%rsi,8), %%mm3"


       "\n	movq	32(%0), %%rcx"
       "\n	movq	40(%0), %%rax"
       "\n	movq	48(%0), %%rdx"
       "\n	movq	56(%0), %%rbx"

       "\n	xorq	$0x43, %%rcx"
       "\n	xorq	$0x53, %%rax"
       "\n	xorq	$0x63, %%rdx"
       "\n	xorq	$0x73, %%rbx"

       /* processing columns 5 and 7 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm5"
       "\n	pxor	T1(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm7"
       "\n	pxor	T1(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm3"
       "\n	pxor	T3(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm5"
       "\n	pxor	T3(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r11"
       "\n	xorq	T5(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm3"
       "\n	pxor	T5(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm7"
       "\n	pxor	T7(,%%rsi,8), %%mm6"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r11"
       "\n	xorq	T7(,%%rsi,8), %%r10"


       /* processing columns 4 and 6 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm4"
       "\n	pxor	T1(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm6"
       "\n	pxor	T1(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm2"
       "\n	xorq	T3(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm4"
       "\n	pxor	T3(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r10"
       "\n	pxor	T5(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm2"
       "\n	xorq	T5(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm6"
       "\n	pxor	T7(,%%rsi,8), %%mm5"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r10"
       "\n	pxor	T7(,%%rsi,8), %%mm7"



       "\n	movq	%%r11, %%rax"
       "\n	movq	%%mm3, %%rbx"
       "\n	movq	%%r10, %%rcx"
       "\n	movq	%%mm2, %%rdx"
       "\n	movq	%%mm4, 32(%0)"
       "\n	movq	%%mm5, 40(%0)"
       "\n	movq	%%mm6, 48(%0)"
       "\n	movq	%%mm7, 56(%0)"

       /* Round 4 */

       "\n	xorq	$0x04, %%rcx"
       "\n	xorq	$0x14, %%rax"
       "\n	xorq	$0x24, %%rdx"
       "\n	xorq	$0x34, %%rbx"

       /* processing columns 1 and 3 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T0(,%%rdi,8), %%r11"
       "\n	movq	T1(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	movq	T0(,%%rdi,8), %%mm3"
       "\n	movq	T1(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T2(,%%rdi,8), %%mm7"
       "\n	movq	T3(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r11"
       "\n	xorq	T3(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T4(,%%rdi,8), %%mm5"
       "\n	movq	T5(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm7"
       "\n	pxor	T5(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm3"
       "\n	pxor	T7(,%%rsi,8), %%mm2"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm5"
       "\n	pxor	T7(,%%rsi,8), %%mm4"


       /* processing columns 0 and 2 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T0(,%%rdi,8), %%r10"
       "\n	pxor	T1(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm2"
       "\n	xorq	T1(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm6"
       "\n	pxor	T3(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r10"
       "\n	pxor	T3(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm4"
       "\n	pxor	T5(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm6"
       "\n	pxor	T5(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm2"
       "\n	xorq	T7(,%%rsi,8), %%r11"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm4"
       "\n	pxor	T7(,%%rsi,8), %%mm3"


       "\n	movq	32(%0), %%rcx"
       "\n	movq	40(%0), %%rax"
       "\n	movq	48(%0), %%rdx"
       "\n	movq	56(%0), %%rbx"

       "\n	xorq	$0x44, %%rcx"
       "\n	xorq	$0x54, %%rax"
       "\n	xorq	$0x64, %%rdx"
       "\n	xorq	$0x74, %%rbx"

       /* processing columns 5 and 7 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm5"
       "\n	pxor	T1(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm7"
       "\n	pxor	T1(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm3"
       "\n	pxor	T3(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm5"
       "\n	pxor	T3(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r11"
       "\n	xorq	T5(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm3"
       "\n	pxor	T5(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm7"
       "\n	pxor	T7(,%%rsi,8), %%mm6"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r11"
       "\n	xorq	T7(,%%rsi,8), %%r10"


       /* processing columns 4 and 6 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm4"
       "\n	pxor	T1(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm6"
       "\n	pxor	T1(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm2"
       "\n	xorq	T3(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm4"
       "\n	pxor	T3(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r10"
       "\n	pxor	T5(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm2"
       "\n	xorq	T5(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm6"
       "\n	pxor	T7(,%%rsi,8), %%mm5"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r10"
       "\n	pxor	T7(,%%rsi,8), %%mm7"



       "\n	movq	%%r11, %%rax"
       "\n	movq	%%mm3, %%rbx"
       "\n	movq	%%r10, %%rcx"
       "\n	movq	%%mm2, %%rdx"
       "\n	movq	%%mm4, 32(%0)"
       "\n	movq	%%mm5, 40(%0)"
       "\n	movq	%%mm6, 48(%0)"
       "\n	movq	%%mm7, 56(%0)"

       /* Round 5 */

       "\n	xorq	$0x05, %%rcx"
       "\n	xorq	$0x15, %%rax"
       "\n	xorq	$0x25, %%rdx"
       "\n	xorq	$0x35, %%rbx"

       /* processing columns 1 and 3 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T0(,%%rdi,8), %%r11"
       "\n	movq	T1(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	movq	T0(,%%rdi,8), %%mm3"
       "\n	movq	T1(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T2(,%%rdi,8), %%mm7"
       "\n	movq	T3(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r11"
       "\n	xorq	T3(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T4(,%%rdi,8), %%mm5"
       "\n	movq	T5(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm7"
       "\n	pxor	T5(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm3"
       "\n	pxor	T7(,%%rsi,8), %%mm2"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm5"
       "\n	pxor	T7(,%%rsi,8), %%mm4"


       /* processing columns 0 and 2 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T0(,%%rdi,8), %%r10"
       "\n	pxor	T1(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm2"
       "\n	xorq	T1(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm6"
       "\n	pxor	T3(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r10"
       "\n	pxor	T3(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm4"
       "\n	pxor	T5(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm6"
       "\n	pxor	T5(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm2"
       "\n	xorq	T7(,%%rsi,8), %%r11"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm4"
       "\n	pxor	T7(,%%rsi,8), %%mm3"


       "\n	movq	32(%0), %%rcx"
       "\n	movq	40(%0), %%rax"
       "\n	movq	48(%0), %%rdx"
       "\n	movq	56(%0), %%rbx"

       "\n	xorq	$0x45, %%rcx"
       "\n	xorq	$0x55, %%rax"
       "\n	xorq	$0x65, %%rdx"
       "\n	xorq	$0x75, %%rbx"

       /* processing columns 5 and 7 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm5"
       "\n	pxor	T1(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm7"
       "\n	pxor	T1(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm3"
       "\n	pxor	T3(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm5"
       "\n	pxor	T3(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r11"
       "\n	xorq	T5(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm3"
       "\n	pxor	T5(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm7"
       "\n	pxor	T7(,%%rsi,8), %%mm6"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r11"
       "\n	xorq	T7(,%%rsi,8), %%r10"


       /* processing columns 4 and 6 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm4"
       "\n	pxor	T1(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm6"
       "\n	pxor	T1(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm2"
       "\n	xorq	T3(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm4"
       "\n	pxor	T3(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r10"
       "\n	pxor	T5(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm2"
       "\n	xorq	T5(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm6"
       "\n	pxor	T7(,%%rsi,8), %%mm5"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r10"
       "\n	pxor	T7(,%%rsi,8), %%mm7"



       "\n	movq	%%r11, %%rax"
       "\n	movq	%%mm3, %%rbx"
       "\n	movq	%%r10, %%rcx"
       "\n	movq	%%mm2, %%rdx"
       "\n	movq	%%mm4, 32(%0)"
       "\n	movq	%%mm5, 40(%0)"
       "\n	movq	%%mm6, 48(%0)"
       "\n	movq	%%mm7, 56(%0)"

       /* Round 6 */

       "\n	xorq	$0x06, %%rcx"
       "\n	xorq	$0x16, %%rax"
       "\n	xorq	$0x26, %%rdx"
       "\n	xorq	$0x36, %%rbx"

       /* processing columns 1 and 3 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T0(,%%rdi,8), %%r11"
       "\n	movq	T1(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	movq	T0(,%%rdi,8), %%mm3"
       "\n	movq	T1(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T2(,%%rdi,8), %%mm7"
       "\n	movq	T3(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r11"
       "\n	xorq	T3(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T4(,%%rdi,8), %%mm5"
       "\n	movq	T5(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm7"
       "\n	pxor	T5(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm3"
       "\n	pxor	T7(,%%rsi,8), %%mm2"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm5"
       "\n	pxor	T7(,%%rsi,8), %%mm4"


       /* processing columns 0 and 2 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T0(,%%rdi,8), %%r10"
       "\n	pxor	T1(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm2"
       "\n	xorq	T1(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm6"
       "\n	pxor	T3(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r10"
       "\n	pxor	T3(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm4"
       "\n	pxor	T5(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm6"
       "\n	pxor	T5(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm2"
       "\n	xorq	T7(,%%rsi,8), %%r11"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm4"
       "\n	pxor	T7(,%%rsi,8), %%mm3"


       "\n	movq	32(%0), %%rcx"
       "\n	movq	40(%0), %%rax"
       "\n	movq	48(%0), %%rdx"
       "\n	movq	56(%0), %%rbx"

       "\n	xorq	$0x46, %%rcx"
       "\n	xorq	$0x56, %%rax"
       "\n	xorq	$0x66, %%rdx"
       "\n	xorq	$0x76, %%rbx"

       /* processing columns 5 and 7 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm5"
       "\n	pxor	T1(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm7"
       "\n	pxor	T1(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm3"
       "\n	pxor	T3(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm5"
       "\n	pxor	T3(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r11"
       "\n	xorq	T5(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm3"
       "\n	pxor	T5(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm7"
       "\n	pxor	T7(,%%rsi,8), %%mm6"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r11"
       "\n	xorq	T7(,%%rsi,8), %%r10"


       /* processing columns 4 and 6 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm4"
       "\n	pxor	T1(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm6"
       "\n	pxor	T1(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm2"
       "\n	xorq	T3(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm4"
       "\n	pxor	T3(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r10"
       "\n	pxor	T5(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm2"
       "\n	xorq	T5(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm6"
       "\n	pxor	T7(,%%rsi,8), %%mm5"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r10"
       "\n	pxor	T7(,%%rsi,8), %%mm7"



       "\n	movq	%%r11, %%rax"
       "\n	movq	%%mm3, %%rbx"
       "\n	movq	%%r10, %%rcx"
       "\n	movq	%%mm2, %%rdx"
       "\n	movq	%%mm4, 32(%0)"
       "\n	movq	%%mm5, 40(%0)"
       "\n	movq	%%mm6, 48(%0)"
       "\n	movq	%%mm7, 56(%0)"

       /* Round 7 */

       "\n	xorq	$0x07, %%rcx"
       "\n	xorq	$0x17, %%rax"
       "\n	xorq	$0x27, %%rdx"
       "\n	xorq	$0x37, %%rbx"

       /* processing columns 1 and 3 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T0(,%%rdi,8), %%r11"
       "\n	movq	T1(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	movq	T0(,%%rdi,8), %%mm3"
       "\n	movq	T1(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T2(,%%rdi,8), %%mm7"
       "\n	movq	T3(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r11"
       "\n	xorq	T3(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T4(,%%rdi,8), %%mm5"
       "\n	movq	T5(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm7"
       "\n	pxor	T5(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm3"
       "\n	pxor	T7(,%%rsi,8), %%mm2"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm5"
       "\n	pxor	T7(,%%rsi,8), %%mm4"


       /* processing columns 0 and 2 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T0(,%%rdi,8), %%r10"
       "\n	pxor	T1(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm2"
       "\n	xorq	T1(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm6"
       "\n	pxor	T3(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r10"
       "\n	pxor	T3(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm4"
       "\n	pxor	T5(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm6"
       "\n	pxor	T5(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm2"
       "\n	xorq	T7(,%%rsi,8), %%r11"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm4"
       "\n	pxor	T7(,%%rsi,8), %%mm3"


       "\n	movq	32(%0), %%rcx"
       "\n	movq	40(%0), %%rax"
       "\n	movq	48(%0), %%rdx"
       "\n	movq	56(%0), %%rbx"

       "\n	xorq	$0x47, %%rcx"
       "\n	xorq	$0x57, %%rax"
       "\n	xorq	$0x67, %%rdx"
       "\n	xorq	$0x77, %%rbx"

       /* processing columns 5 and 7 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm5"
       "\n	pxor	T1(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm7"
       "\n	pxor	T1(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm3"
       "\n	pxor	T3(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm5"
       "\n	pxor	T3(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r11"
       "\n	xorq	T5(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm3"
       "\n	pxor	T5(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm7"
       "\n	pxor	T7(,%%rsi,8), %%mm6"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r11"
       "\n	xorq	T7(,%%rsi,8), %%r10"


       /* processing columns 4 and 6 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm4"
       "\n	pxor	T1(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm6"
       "\n	pxor	T1(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm2"
       "\n	xorq	T3(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm4"
       "\n	pxor	T3(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r10"
       "\n	pxor	T5(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm2"
       "\n	xorq	T5(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm6"
       "\n	pxor	T7(,%%rsi,8), %%mm5"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r10"
       "\n	pxor	T7(,%%rsi,8), %%mm7"



       "\n	movq	%%r11, %%rax"
       "\n	movq	%%mm3, %%rbx"
       "\n	movq	%%r10, %%rcx"
       "\n	movq	%%mm2, %%rdx"
       "\n	movq	%%mm4, 32(%0)"
       "\n	movq	%%mm5, 40(%0)"
       "\n	movq	%%mm6, 48(%0)"
       "\n	movq	%%mm7, 56(%0)"

       /* Round 8 */

       "\n	xorq	$0x08, %%rcx"
       "\n	xorq	$0x18, %%rax"
       "\n	xorq	$0x28, %%rdx"
       "\n	xorq	$0x38, %%rbx"

       /* processing columns 1 and 3 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T0(,%%rdi,8), %%r11"
       "\n	movq	T1(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	movq	T0(,%%rdi,8), %%mm3"
       "\n	movq	T1(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T2(,%%rdi,8), %%mm7"
       "\n	movq	T3(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r11"
       "\n	xorq	T3(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T4(,%%rdi,8), %%mm5"
       "\n	movq	T5(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm7"
       "\n	pxor	T5(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm3"
       "\n	pxor	T7(,%%rsi,8), %%mm2"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm5"
       "\n	pxor	T7(,%%rsi,8), %%mm4"


       /* processing columns 0 and 2 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T0(,%%rdi,8), %%r10"
       "\n	pxor	T1(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm2"
       "\n	xorq	T1(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm6"
       "\n	pxor	T3(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r10"
       "\n	pxor	T3(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm4"
       "\n	pxor	T5(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm6"
       "\n	pxor	T5(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm2"
       "\n	xorq	T7(,%%rsi,8), %%r11"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm4"
       "\n	pxor	T7(,%%rsi,8), %%mm3"


       "\n	movq	32(%0), %%rcx"
       "\n	movq	40(%0), %%rax"
       "\n	movq	48(%0), %%rdx"
       "\n	movq	56(%0), %%rbx"

       "\n	xorq	$0x48, %%rcx"
       "\n	xorq	$0x58, %%rax"
       "\n	xorq	$0x68, %%rdx"
       "\n	xorq	$0x78, %%rbx"

       /* processing columns 5 and 7 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm5"
       "\n	pxor	T1(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm7"
       "\n	pxor	T1(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm3"
       "\n	pxor	T3(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm5"
       "\n	pxor	T3(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r11"
       "\n	xorq	T5(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm3"
       "\n	pxor	T5(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm7"
       "\n	pxor	T7(,%%rsi,8), %%mm6"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r11"
       "\n	xorq	T7(,%%rsi,8), %%r10"


       /* processing columns 4 and 6 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm4"
       "\n	pxor	T1(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm6"
       "\n	pxor	T1(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm2"
       "\n	xorq	T3(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm4"
       "\n	pxor	T3(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r10"
       "\n	pxor	T5(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm2"
       "\n	xorq	T5(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm6"
       "\n	pxor	T7(,%%rsi,8), %%mm5"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r10"
       "\n	pxor	T7(,%%rsi,8), %%mm7"



       "\n	movq	%%r11, %%rax"
       "\n	movq	%%mm3, %%rbx"
       "\n	movq	%%r10, %%rcx"
       "\n	movq	%%mm2, %%rdx"
       "\n	movq	%%mm4, 32(%0)"
       "\n	movq	%%mm5, 40(%0)"
       "\n	movq	%%mm6, 48(%0)"
       "\n	movq	%%mm7, 56(%0)"

       /* Round 9 */

       "\n	xorq	$0x09, %%rcx"
       "\n	xorq	$0x19, %%rax"
       "\n	xorq	$0x29, %%rdx"
       "\n	xorq	$0x39, %%rbx"

       /* processing columns 1 and 3 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T0(,%%rdi,8), %%r11"
       "\n	movq	T1(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	movq	T0(,%%rdi,8), %%mm3"
       "\n	movq	T1(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T2(,%%rdi,8), %%mm7"
       "\n	movq	T3(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r11"
       "\n	xorq	T3(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	movq	T4(,%%rdi,8), %%mm5"
       "\n	movq	T5(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm7"
       "\n	pxor	T5(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm3"
       "\n	pxor	T7(,%%rsi,8), %%mm2"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm5"
       "\n	pxor	T7(,%%rsi,8), %%mm4"


       /* processing columns 0 and 2 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T0(,%%rdi,8), %%r10"
       "\n	pxor	T1(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm2"
       "\n	xorq	T1(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm6"
       "\n	pxor	T3(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T2(,%%rdi,8), %%r10"
       "\n	pxor	T3(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm4"
       "\n	pxor	T5(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm6"
       "\n	pxor	T5(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm2"
       "\n	xorq	T7(,%%rsi,8), %%r11"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm4"
       "\n	pxor	T7(,%%rsi,8), %%mm3"


       "\n	movq	32(%0), %%rcx"
       "\n	movq	40(%0), %%rax"
       "\n	movq	48(%0), %%rdx"
       "\n	movq	56(%0), %%rbx"

       "\n	xorq	$0x49, %%rcx"
       "\n	xorq	$0x59, %%rax"
       "\n	xorq	$0x69, %%rdx"
       "\n	xorq	$0x79, %%rbx"

       /* processing columns 5 and 7 */
       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm5"
       "\n	pxor	T1(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm7"
       "\n	pxor	T1(,%%rsi,8), %%mm6"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm3"
       "\n	pxor	T3(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm5"
       "\n	pxor	T3(,%%rsi,8), %%mm4"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r11"
       "\n	xorq	T5(,%%rsi,8), %%r10"
       "\n	shrq	$16, %%rax"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm3"
       "\n	pxor	T5(,%%rsi,8), %%mm2"
       "\n	shrq	$16, %%rbx"

       "\n	movzbl	%%al, %%edi"
       "\n	movzbl	%%ah, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm7"
       "\n	pxor	T7(,%%rsi,8), %%mm6"

       "\n	movzbl	%%bl, %%edi"
       "\n	movzbl	%%bh, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r11"
       "\n	xorq	T7(,%%rsi,8), %%r10"


       /* processing columns 4 and 6 */
       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm4"
       "\n	pxor	T1(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T0(,%%rdi,8), %%mm6"
       "\n	pxor	T1(,%%rsi,8), %%mm5"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm2"
       "\n	xorq	T3(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T2(,%%rdi,8), %%mm4"
       "\n	pxor	T3(,%%rsi,8), %%mm3"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	xorq	T4(,%%rdi,8), %%r10"
       "\n	pxor	T5(,%%rsi,8), %%mm7"
       "\n	shrq	$16, %%rcx"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	pxor	T4(,%%rdi,8), %%mm2"
       "\n	xorq	T5(,%%rsi,8), %%r11"
       "\n	shrq	$16, %%rdx"

       "\n	movzbl	%%cl, %%edi"
       "\n	movzbl	%%ch, %%esi"
       "\n	pxor	T6(,%%rdi,8), %%mm6"
       "\n	pxor	T7(,%%rsi,8), %%mm5"

       "\n	movzbl	%%dl, %%edi"
       "\n	movzbl	%%dh, %%esi"
       "\n	xorq	T6(,%%rdi,8), %%r10"
       "\n	pxor	T7(,%%rsi,8), %%mm7"



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
