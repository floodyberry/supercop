/* hash.c     December 2008
 *
 * Groestl implementation with inline assembly containing mmx and sse
 * instructions.
 * Author: Krystian Matusiewicz
 *
 * This code is placed in the public domain
 */

#include "crypto_hash.h"
#include "hash.h"
#include "tables.h"

#ifdef __x86_64
inline void P512ASM (u64 *x) {
asm (
	
	"\n	movaps	0(%0), %%xmm0"
	"\n	movhlps	%%xmm0, %%xmm1"
	"\n	movaps	16(%0), %%xmm2"
	"\n	movhlps	%%xmm2, %%xmm3"
	"\n	movaps	32(%0), %%xmm4"
	"\n	movhlps	%%xmm4, %%xmm5"
	"\n	movaps	48(%0), %%xmm6"
	"\n	movhlps	%%xmm6, %%xmm7"
	"\n	xorq	%%rbx, %%rbx"	
	"\n	1:"
	"\n	# processing input words x[0] and x[2] "
	"\n	movq	%%xmm0, %%rax"
	"\n	movq	%%xmm2, %%rcx"
	
	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	xorq	%%rbx, %%rdi		#xor the round constant"
	"\n	incq %%rbx"
		
	"\n	movq	T0(,%%rdi,8), %%mm0"
	"\n	movq	T0(,%%rdx,8), %%mm2"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrq	$16, %%rax"
	"\n	movq	T1(,%%rdi,8), %%mm7"
	"\n	shrq	$16, %%rcx"
	"\n	movq	T1(,%%rdx,8), %%mm1"


	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	movq	T2(,%%rdi,8), %%mm6"
	"\n	pxor	T2(,%%rdx,8), %%mm0"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrq	$16, %%rax"
	"\n	movq	T3(,%%rdi,8), %%mm5"
	"\n	shrq	$16, %%rcx"
	"\n	pxor	T3(,%%rdx,8), %%mm7"



	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	movq	T4(,%%rdi,8), %%mm4"
	"\n	pxor	T4(,%%rdx,8), %%mm6"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrq	$16, %%rax"
	"\n	movq	T5(,%%rdi,8), %%mm3"
	"\n	shrq	$16, %%rcx"
	"\n	pxor	T5(,%%rdx,8), %%mm5"



	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T6(,%%rdi,8), %%mm2"
	"\n	pxor	T6(,%%rdx,8), %%mm4"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	pxor	T7(,%%rdi,8), %%mm1"
	"\n	pxor	T7(,%%rdx,8), %%mm3"

	"\n	# processing input words x[1] and x[3] "
	"\n	movq	%%xmm1, %%rax"
	"\n	movq	%%xmm3, %%rcx"	
	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T0(,%%rdi,8), %%mm1"
	"\n	pxor	T0(,%%rdx,8), %%mm3"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrq	$16, %%rax"
	"\n	pxor	T1(,%%rdi,8), %%mm0"
	"\n	shrq	$16, %%rcx"
	"\n	pxor	T1(,%%rdx,8), %%mm2"



	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T2(,%%rdi,8), %%mm7"
	"\n	pxor	T2(,%%rdx,8), %%mm1"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrq	$16, %%rax"
	"\n	pxor	T3(,%%rdi,8), %%mm6"
	"\n	shrq	$16, %%rcx"
	"\n	pxor	T3(,%%rdx,8), %%mm0"



	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T4(,%%rdi,8), %%mm5"
	"\n	pxor	T4(,%%rdx,8), %%mm7"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrq	$16, %%rax"
	"\n	pxor	T5(,%%rdi,8), %%mm4"
	"\n	shrq	$16, %%rcx"
	"\n	pxor	T5(,%%rdx,8), %%mm6"



	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T6(,%%rdi,8), %%mm3"
	"\n	pxor	T6(,%%rdx,8), %%mm5"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	pxor	T7(,%%rdi,8), %%mm2"
	"\n	pxor	T7(,%%rdx,8), %%mm4"



	"\n	# processing input words x[4] and x[6] "
	"\n	movq	%%xmm4, %%rax"
	"\n	movq	%%xmm6, %%rcx"
	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T0(,%%rdi,8), %%mm4"
	"\n	pxor	T0(,%%rdx,8), %%mm6"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrq	$16, %%rax"
	"\n	pxor	T1(,%%rdi,8), %%mm3"
	"\n	shrq	$16, %%rcx"
	"\n	pxor	T1(,%%rdx,8), %%mm5"



	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T2(,%%rdi,8), %%mm2"
	"\n	pxor	T2(,%%rdx,8), %%mm4"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrq	$16, %%rax"
	"\n	pxor	T3(,%%rdi,8), %%mm1"
	"\n	shrq	$16, %%rcx"
	"\n	pxor	T3(,%%rdx,8), %%mm3"



	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T4(,%%rdi,8), %%mm0"
	"\n	pxor	T4(,%%rdx,8), %%mm2"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrq	$16, %%rax"
	"\n	pxor	T5(,%%rdi,8), %%mm7"
	"\n	shrq	$16, %%rcx"
	"\n	pxor	T5(,%%rdx,8), %%mm1"



	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T6(,%%rdi,8), %%mm6"
	"\n	pxor	T6(,%%rdx,8), %%mm0"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	pxor	T7(,%%rdi,8), %%mm5"
	"\n	pxor	T7(,%%rdx,8), %%mm7"



	"\n	# processing input words x[5] and x[7] "
	"\n	movq	%%xmm5, %%rax"
	"\n	movq	%%xmm7, %%rcx"
	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T0(,%%rdi,8), %%mm5"
	"\n	pxor	T0(,%%rdx,8), %%mm7"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrq	$16, %%rax"
	"\n	pxor	T1(,%%rdi,8), %%mm4"
	"\n	shrq	$16, %%rcx"
	"\n	pxor	T1(,%%rdx,8), %%mm6"


	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T2(,%%rdi,8), %%mm3"
	"\n	pxor	T2(,%%rdx,8), %%mm5"
		
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrq	$16, %%rax"
	"\n	pxor	T3(,%%rdi,8), %%mm2"
	"\n	shrq	$16, %%rcx"
	"\n	pxor	T3(,%%rdx,8), %%mm4"


	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T4(,%%rdi,8), %%mm1"
	"\n	pxor	T4(,%%rdx,8), %%mm3"
		
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrq	$16, %%rax"
	"\n	pxor	T5(,%%rdi,8), %%mm0"
	"\n	shrq	$16, %%rcx"
	"\n	pxor	T5(,%%rdx,8), %%mm2"

	"\n	movq2dq	%%mm5, %%xmm5"
	"\n	movq2dq	%%mm4, %%xmm4"		
	"\n	movq2dq	%%mm3, %%xmm3"	
	"\n	movq2dq	%%mm2, %%xmm2"

	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"	
	"\n	pxor	T6(,%%rdi,8), %%mm7"
	"\n	pxor	T6(,%%rdx,8), %%mm1"
		
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	pxor	T7(,%%rdi,8), %%mm6"
	"\n	pxor	T7(,%%rdx,8), %%mm0"
		
	"\n	movq2dq	%%mm7, %%xmm7"
	"\n	movq2dq	%%mm1, %%xmm1"
	"\n	movq2dq	%%mm6, %%xmm6"	
	"\n	movq2dq	%%mm0, %%xmm0"


	"\n	cmp	$10, %%ebx"
	"\n	jne	1b"
		

	"\n	movlhps	%%xmm1, %%xmm0"	
	"\n	movaps	%%xmm0, 0(%0)"
	"\n	movlhps	%%xmm3, %%xmm2"	
	"\n	movaps	%%xmm2, 16(%0)"
	"\n	movlhps	%%xmm5, %%xmm4"	
	"\n	movaps	%%xmm4, 32(%0)"
	"\n	movlhps	%%xmm7, %%xmm6"	
	"\n	movaps	%%xmm6, 48(%0)"

: /*no output, only memory is modifed */
: "r"(x)
: "%rax", "%rbx", "%rcx", "%rdx", "%rdi", "memory" , "%mm0" , "%mm1" , "%mm2" , "%mm3" , "%mm4" , "%mm5" , "%mm6" , "%mm7" , "%xmm0" , "%xmm1" , "%xmm2" , "%xmm3" , "%xmm4" , "%xmm5" , "%xmm6" , "%xmm7" );
}//P512ASM()



inline void Q512ASM (u64 *x) {
asm (
	"\n	movaps	0(%0), %%xmm0"
	"\n	movhlps	%%xmm0, %%xmm1"
	"\n	movaps	16(%0), %%xmm2"
	"\n	movhlps	%%xmm2, %%xmm3"
	"\n	movaps	32(%0), %%xmm4"
	"\n	movhlps	%%xmm4, %%xmm5"
	"\n	movaps	48(%0), %%xmm6"
	"\n	movhlps	%%xmm6, %%xmm7"
	"\n	xorq	%%rbx, %%rbx"
	"\n	1:"
	"\n	# processing input words x[0] and x[2] "
	"\n	movq	%%xmm0, %%rax"
	"\n	movq	%%xmm2, %%rcx"
	
	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	movq	T0(,%%rdi,8), %%mm0"
	"\n	movq	T0(,%%rdx,8), %%mm2"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrq	$16, %%rax"
	"\n	movq	T1(,%%rdi,8), %%mm7"
	"\n	shrq	$16, %%rcx"
	"\n	movq	T1(,%%rdx,8), %%mm1"



	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	movq	T2(,%%rdi,8), %%mm6"
	"\n	pxor	T2(,%%rdx,8), %%mm0"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrq	$16, %%rax"
	"\n	movq	T3(,%%rdi,8), %%mm5"
	"\n	shrq	$16, %%rcx"
	"\n	pxor	T3(,%%rdx,8), %%mm7"



	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	movq	T4(,%%rdi,8), %%mm4"
	"\n	pxor	T4(,%%rdx,8), %%mm6"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrq	$16, %%rax"
	"\n	movq	T5(,%%rdi,8), %%mm3"
	"\n	shrq	$16, %%rcx"
	"\n	pxor	T5(,%%rdx,8), %%mm5"



	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T6(,%%rdi,8), %%mm2"
	"\n	pxor	T6(,%%rdx,8), %%mm4"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	xorq	%%rbx, %%rdi	#xor the round constant"
	"\n	xorq	$0xff, %%rdi"
	"\n	incq %%rbx"
	"\n	pxor	T7(,%%rdi,8), %%mm1"
	"\n	pxor	T7(,%%rdx,8), %%mm3"



	"\n	# processing input words x[1] and x[3] "
	"\n	movq	%%xmm1, %%rax"
	"\n	movq	%%xmm3, %%rcx"
	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T0(,%%rdi,8), %%mm1"
	"\n	pxor	T0(,%%rdx,8), %%mm3"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrq	$16, %%rax"
	"\n	pxor	T1(,%%rdi,8), %%mm0"
	"\n	shrq	$16, %%rcx"
	"\n	pxor	T1(,%%rdx,8), %%mm2"



	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T2(,%%rdi,8), %%mm7"
	"\n	pxor	T2(,%%rdx,8), %%mm1"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrq	$16, %%rax"
	"\n	pxor	T3(,%%rdi,8), %%mm6"
	"\n	shrq	$16, %%rcx"
	"\n	pxor	T3(,%%rdx,8), %%mm0"



	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T4(,%%rdi,8), %%mm5"
	"\n	pxor	T4(,%%rdx,8), %%mm7"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrq	$16, %%rax"
	"\n	pxor	T5(,%%rdi,8), %%mm4"
	"\n	shrq	$16, %%rcx"
	"\n	pxor	T5(,%%rdx,8), %%mm6"



	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T6(,%%rdi,8), %%mm3"
	"\n	pxor	T6(,%%rdx,8), %%mm5"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	pxor	T7(,%%rdi,8), %%mm2"
	"\n	pxor	T7(,%%rdx,8), %%mm4"



	"\n	# processing input words x[4] and x[6] "
	"\n	movq	%%xmm4, %%rax"
	"\n	movq	%%xmm6, %%rcx"
	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T0(,%%rdi,8), %%mm4"
	"\n	pxor	T0(,%%rdx,8), %%mm6"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrq	$16, %%rax"
	"\n	pxor	T1(,%%rdi,8), %%mm3"
	"\n	shrq	$16, %%rcx"
	"\n	pxor	T1(,%%rdx,8), %%mm5"



	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T2(,%%rdi,8), %%mm2"
	"\n	pxor	T2(,%%rdx,8), %%mm4"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrq	$16, %%rax"
	"\n	pxor	T3(,%%rdi,8), %%mm1"
	"\n	shrq	$16, %%rcx"
	"\n	pxor	T3(,%%rdx,8), %%mm3"



	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T4(,%%rdi,8), %%mm0"
	"\n	pxor	T4(,%%rdx,8), %%mm2"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrq	$16, %%rax"
	"\n	pxor	T5(,%%rdi,8), %%mm7"
	"\n	shrq	$16, %%rcx"
	"\n	pxor	T5(,%%rdx,8), %%mm1"



	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T6(,%%rdi,8), %%mm6"
	"\n	pxor	T6(,%%rdx,8), %%mm0"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	pxor	T7(,%%rdi,8), %%mm5"
	"\n	pxor	T7(,%%rdx,8), %%mm7"



	"\n	# processing input words x[5] and x[7] "
	"\n	movq	%%xmm5, %%rax"
	"\n	movq	%%xmm7, %%rcx"
	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T0(,%%rdi,8), %%mm5"
	"\n	pxor	T0(,%%rdx,8), %%mm7"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrq	$16, %%rax"
	"\n	pxor	T1(,%%rdi,8), %%mm4"
	"\n	shrq	$16, %%rcx"
	"\n	pxor	T1(,%%rdx,8), %%mm6"



	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T2(,%%rdi,8), %%mm3"
	"\n	pxor	T2(,%%rdx,8), %%mm5"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	
	"\n	shrq	$16, %%rax"
	"\n	pxor	T3(,%%rdi,8), %%mm2"
	"\n	shrq	$16, %%rcx"
	"\n	pxor	T3(,%%rdx,8), %%mm4"

	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	
	"\n	pxor	T4(,%%rdi,8), %%mm1"
	"\n	pxor	T4(,%%rdx,8), %%mm3"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	
	"\n	shrq	$16, %%rax"
	"\n	pxor	T5(,%%rdi,8), %%mm0"
	"\n	shrq	$16, %%rcx"
	"\n	pxor	T5(,%%rdx,8), %%mm2"

	"\n	movq2dq	%%mm5, %%xmm5"
	"\n	movq2dq	%%mm4, %%xmm4"
	"\n	movq2dq	%%mm3, %%xmm3"	
	"\n	movq2dq	%%mm2, %%xmm2"
		
	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	
	"\n	pxor	T6(,%%rdi,8), %%mm7"
	"\n	pxor	T6(,%%rdx,8), %%mm1"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	pxor	T7(,%%rdi,8), %%mm6"
	"\n	pxor	T7(,%%rdx,8), %%mm0"

	"\n	movq2dq	%%mm7, %%xmm7"
	"\n	movq2dq	%%mm1, %%xmm1"
	"\n	movq2dq	%%mm6, %%xmm6"
	"\n	movq2dq	%%mm0, %%xmm0"

	"\n	cmp	$10, %%ebx			#repeat until 10 rounds"
	"\n	jne	1b"
				
	"\n	movlhps	%%xmm1, %%xmm0"	
	"\n	movaps	%%xmm0, 0(%0)"
	"\n	movlhps	%%xmm3, %%xmm2"	
	"\n	movaps	%%xmm2, 16(%0)"
	"\n	movlhps	%%xmm5, %%xmm4"	
	"\n	movaps	%%xmm4, 32(%0)"
	"\n	movlhps	%%xmm7, %%xmm6"	
	"\n	movaps	%%xmm6, 48(%0)"

: /*no output, only memory is modifed */
: "r"(x)
: "%rax", "%rbx", "%rcx", "%rdx", "%rdi", "memory" , "%mm0" , "%mm1" , "%mm2" , "%mm3" , "%mm4" , "%mm5" , "%mm6" , "%mm7" , "%xmm0" , "%xmm1" , "%xmm2" , "%xmm3" , "%xmm4" , "%xmm5" , "%xmm6" , "%xmm7" );
}//Q512ASM()

#else
inline void P512ASM(u32 *x) {
asm (
	"\n	movaps	0(%0), %%xmm0"
	"\n	movhlps	%%xmm0, %%xmm1"
	"\n	movaps	16(%0), %%xmm2"
	"\n	movhlps	%%xmm2, %%xmm3"
	"\n	movaps	32(%0), %%xmm4"
	"\n	movhlps	%%xmm4, %%xmm5"
	"\n	movaps	48(%0), %%xmm6"
	"\n	movhlps	%%xmm6, %%xmm7"
	"\n	xorl %%ebx, %%ebx"

	"\n	1:	#start of the loop"
	"\n	# processing input words x[0] and x[2] "
	"\n	movd	%%xmm0, %%eax"
	"\n	movd	%%xmm2, %%ecx"
	"\n	pshufd	$57, %%xmm0, %%xmm0"
	"\n	pshufd	$57, %%xmm2, %%xmm2"
	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	xorl	%%ebx, %%edi		#xor the round constant"
	"\n	incl	%%ebx"
	"\n	movq	T0(,%%edi,8), %%mm0"
	"\n	movq	T0(,%%edx,8), %%mm2"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrl	$16, %%eax"
	"\n	movq	T1(,%%edi,8), %%mm7"
	"\n	movq	T1(,%%edx,8), %%mm1"
	"\n	shrl	$16, %%ecx"

	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	movq	T2(,%%edi,8), %%mm6"
	"\n	pxor	T2(,%%edx,8), %%mm0"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	movq	T3(,%%edi,8), %%mm5"
	"\n	pxor	T3(,%%edx,8), %%mm7"

	"\n	movd	%%xmm0, %%eax"
	"\n	movd	%%xmm2, %%ecx"
	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	movq	T4(,%%edi,8), %%mm4"
	"\n	pxor	T4(,%%edx,8), %%mm6"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrl	$16, %%eax"
	"\n	movq	T5(,%%edi,8), %%mm3"
	"\n	pxor	T5(,%%edx,8), %%mm5"
	"\n	shrl	$16, %%ecx"

	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T6(,%%edi,8), %%mm2"
	"\n	pxor	T6(,%%edx,8), %%mm4"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	pxor	T7(,%%edi,8), %%mm1"
	"\n	pxor	T7(,%%edx,8), %%mm3"

	"\n	# processing input words x[1] and x[3] "
	"\n	movd	%%xmm1, %%eax"
	"\n	movd	%%xmm3, %%ecx"
	"\n	pshufd	$57, %%xmm1, %%xmm1"
	"\n	pshufd	$57, %%xmm3, %%xmm3"
	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T0(,%%edi,8), %%mm1"
	"\n	pxor	T0(,%%edx,8), %%mm3"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrl	$16, %%eax"
	"\n	pxor	T1(,%%edi,8), %%mm0"
	"\n	pxor	T1(,%%edx,8), %%mm2"
	"\n	shrl	$16, %%ecx"

	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T2(,%%edi,8), %%mm7"
	"\n	pxor	T2(,%%edx,8), %%mm1"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	pxor	T3(,%%edi,8), %%mm6"
	"\n	pxor	T3(,%%edx,8), %%mm0"

	"\n	movd	%%xmm1, %%eax"
	"\n	movd	%%xmm3, %%ecx"
	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T4(,%%edi,8), %%mm5"
	"\n	pxor	T4(,%%edx,8), %%mm7"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrl	$16, %%eax"
	"\n	pxor	T5(,%%edi,8), %%mm4"
	"\n	pxor	T5(,%%edx,8), %%mm6"
	"\n	shrl	$16, %%ecx"

	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T6(,%%edi,8), %%mm3"
	"\n	pxor	T6(,%%edx,8), %%mm5"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	pxor	T7(,%%edi,8), %%mm2"
	"\n	pxor	T7(,%%edx,8), %%mm4"

	"\n	# processing input words x[4] and x[6] "
	"\n	movd	%%xmm4, %%eax"
	"\n	movd	%%xmm6, %%ecx"
	"\n	pshufd	$57, %%xmm4, %%xmm4"
	"\n	pshufd	$57, %%xmm6, %%xmm6"
	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T0(,%%edi,8), %%mm4"
	"\n	pxor	T0(,%%edx,8), %%mm6"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrl	$16, %%eax"
	"\n	pxor	T1(,%%edi,8), %%mm3"
	"\n	pxor	T1(,%%edx,8), %%mm5"
	"\n	shrl	$16, %%ecx"

	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T2(,%%edi,8), %%mm2"
	"\n	pxor	T2(,%%edx,8), %%mm4"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	pxor	T3(,%%edi,8), %%mm1"
	"\n	pxor	T3(,%%edx,8), %%mm3"

	"\n	movd	%%xmm4, %%eax"
	"\n	movd	%%xmm6, %%ecx"
	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T4(,%%edi,8), %%mm0"
	"\n	pxor	T4(,%%edx,8), %%mm2"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrl	$16, %%eax"
	"\n	pxor	T5(,%%edi,8), %%mm7"
	"\n	pxor	T5(,%%edx,8), %%mm1"
	"\n	shrl	$16, %%ecx"

	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T6(,%%edi,8), %%mm6"
	"\n	pxor	T6(,%%edx,8), %%mm0"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	pxor	T7(,%%edi,8), %%mm5"
	"\n	pxor	T7(,%%edx,8), %%mm7"

	"\n	# processing input words x[5] and x[7] "
	"\n	movd	%%xmm5, %%eax"
	"\n	movd	%%xmm7, %%ecx"
	"\n	pshufd	$57, %%xmm5, %%xmm5"
	"\n	pshufd	$57, %%xmm7, %%xmm7"
	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T0(,%%edi,8), %%mm5"
	"\n	pxor	T0(,%%edx,8), %%mm7"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrl	$16, %%eax"
	"\n	pxor	T1(,%%edi,8), %%mm4"
	"\n	pxor	T1(,%%edx,8), %%mm6"
	"\n	shrl	$16, %%ecx"

	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T2(,%%edi,8), %%mm3"
	"\n	pxor	T2(,%%edx,8), %%mm5"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	pxor	T3(,%%edi,8), %%mm2"
	"\n	pxor	T3(,%%edx,8), %%mm4"

	"\n	movd	%%xmm5, %%eax"
	"\n	movd	%%xmm7, %%ecx"
	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T4(,%%edi,8), %%mm1"
	"\n	pxor	T4(,%%edx,8), %%mm3"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrl	$16, %%eax"
	"\n	pxor	T5(,%%edi,8), %%mm0"
	"\n	pxor	T5(,%%edx,8), %%mm2"
	"\n	shrl	$16, %%ecx"

	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T6(,%%edi,8), %%mm7"
	"\n	pxor	T6(,%%edx,8), %%mm1"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	pxor	T7(,%%edi,8), %%mm6"
	"\n	pxor	T7(,%%edx,8), %%mm0"

	"\n	movq2dq	%%mm5, %%xmm5"
	"\n	movq2dq	%%mm4, %%xmm4"
	"\n	movq2dq	%%mm3, %%xmm3"
	"\n	movq2dq	%%mm2, %%xmm2"
	"\n	movq2dq	%%mm7, %%xmm7"
	"\n	movq2dq	%%mm1, %%xmm1"
	"\n	movq2dq	%%mm6, %%xmm6"
	"\n	movq2dq	%%mm0, %%xmm0"
	"\n	cmp $10, %%ebx			#repeat until 10 rounds"
	"\n	jne 1b"

	"\n	# pack contents of xmms and finally write back to memory"
	"\n	movlhps	%%xmm1, %%xmm0"
	"\n	movaps	%%xmm0, 0(%0)"
	"\n	movlhps	%%xmm3, %%xmm2"
	"\n	movaps	%%xmm2, 16(%0)"
	"\n	movlhps	%%xmm5, %%xmm4"
	"\n	movaps	%%xmm4, 32(%0)"
	"\n	movlhps	%%xmm7, %%xmm6"
	"\n	movaps	%%xmm6, 48(%0)"
: /*no output, only memory is modifed */
: "r"(x)
: "%eax", "%ebx", "%ecx", "%edx", "%edi", "memory", "%mm0", "%mm1", "%mm2", "%mm3", "%mm4", "%mm5", "%mm6", "%mm7",   "%xmm0", "%xmm1", "%xmm2", "%xmm3", "%xmm4", "%xmm5", "%xmm6", "%xmm7"
);
}//PP512()
inline void Q512ASM(u32 *x) {
asm (
	"\n	movaps	0(%0), %%xmm0"
	"\n	movhlps	%%xmm0, %%xmm1"
	"\n	movaps	16(%0), %%xmm2"
	"\n	movhlps	%%xmm2, %%xmm3"
	"\n	movaps	32(%0), %%xmm4"
	"\n	movhlps	%%xmm4, %%xmm5"
	"\n	movaps	48(%0), %%xmm6"
	"\n	movhlps	%%xmm6, %%xmm7"
	"\n	xorl %%ebx, %%ebx"

	"\n	1:	#start of the loop"
	"\n	# processing input words x[0] and x[2] "
	"\n	movd	%%xmm0, %%eax"
	"\n	movd	%%xmm2, %%ecx"
	"\n	pshufd	$57, %%xmm0, %%xmm0"
	"\n	pshufd	$57, %%xmm2, %%xmm2"
	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	movq	T0(,%%edi,8), %%mm0"
	"\n	movq	T0(,%%edx,8), %%mm2"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrl	$16, %%eax"
	"\n	movq	T1(,%%edi,8), %%mm7"
	"\n	movq	T1(,%%edx,8), %%mm1"
	"\n	shrl	$16, %%ecx"

	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	movq	T2(,%%edi,8), %%mm6"
	"\n	pxor	T2(,%%edx,8), %%mm0"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	movq	T3(,%%edi,8), %%mm5"
	"\n	pxor	T3(,%%edx,8), %%mm7"

	"\n	movd	%%xmm0, %%eax"
	"\n	movd	%%xmm2, %%ecx"
	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	movq	T4(,%%edi,8), %%mm4"
	"\n	pxor	T4(,%%edx,8), %%mm6"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrl	$16, %%eax"
	"\n	movq	T5(,%%edi,8), %%mm3"
	"\n	pxor	T5(,%%edx,8), %%mm5"
	"\n	shrl	$16, %%ecx"

	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T6(,%%edi,8), %%mm2"
	"\n	pxor	T6(,%%edx,8), %%mm4"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	xorl	%%ebx, %%edi	#xor the round constant"
	"\n	xorl $0xff, %%edi"
	"\n	incl %%ebx"
	"\n	pxor	T7(,%%edi,8), %%mm1"
	"\n	pxor	T7(,%%edx,8), %%mm3"

	"\n	# processing input words x[1] and x[3] "
	"\n	movd	%%xmm1, %%eax"
	"\n	movd	%%xmm3, %%ecx"
	"\n	pshufd	$57, %%xmm1, %%xmm1"
	"\n	pshufd	$57, %%xmm3, %%xmm3"
	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T0(,%%edi,8), %%mm1"
	"\n	pxor	T0(,%%edx,8), %%mm3"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrl	$16, %%eax"
	"\n	pxor	T1(,%%edi,8), %%mm0"
	"\n	pxor	T1(,%%edx,8), %%mm2"
	"\n	shrl	$16, %%ecx"

	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T2(,%%edi,8), %%mm7"
	"\n	pxor	T2(,%%edx,8), %%mm1"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	pxor	T3(,%%edi,8), %%mm6"
	"\n	pxor	T3(,%%edx,8), %%mm0"

	"\n	movd	%%xmm1, %%eax"
	"\n	movd	%%xmm3, %%ecx"
	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T4(,%%edi,8), %%mm5"
	"\n	pxor	T4(,%%edx,8), %%mm7"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrl	$16, %%eax"
	"\n	pxor	T5(,%%edi,8), %%mm4"
	"\n	pxor	T5(,%%edx,8), %%mm6"
	"\n	shrl	$16, %%ecx"

	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T6(,%%edi,8), %%mm3"
	"\n	pxor	T6(,%%edx,8), %%mm5"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	pxor	T7(,%%edi,8), %%mm2"
	"\n	pxor	T7(,%%edx,8), %%mm4"

	"\n	# processing input words x[4] and x[6] "
	"\n	movd	%%xmm4, %%eax"
	"\n	movd	%%xmm6, %%ecx"
	"\n	pshufd	$57, %%xmm4, %%xmm4"
	"\n	pshufd	$57, %%xmm6, %%xmm6"
	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T0(,%%edi,8), %%mm4"
	"\n	pxor	T0(,%%edx,8), %%mm6"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrl	$16, %%eax"
	"\n	pxor	T1(,%%edi,8), %%mm3"
	"\n	pxor	T1(,%%edx,8), %%mm5"
	"\n	shrl	$16, %%ecx"

	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T2(,%%edi,8), %%mm2"
	"\n	pxor	T2(,%%edx,8), %%mm4"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	pxor	T3(,%%edi,8), %%mm1"
	"\n	pxor	T3(,%%edx,8), %%mm3"

	"\n	movd	%%xmm4, %%eax"
	"\n	movd	%%xmm6, %%ecx"
	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T4(,%%edi,8), %%mm0"
	"\n	pxor	T4(,%%edx,8), %%mm2"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrl	$16, %%eax"
	"\n	pxor	T5(,%%edi,8), %%mm7"
	"\n	pxor	T5(,%%edx,8), %%mm1"
	"\n	shrl	$16, %%ecx"

	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T6(,%%edi,8), %%mm6"
	"\n	pxor	T6(,%%edx,8), %%mm0"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	pxor	T7(,%%edi,8), %%mm5"
	"\n	pxor	T7(,%%edx,8), %%mm7"

	"\n	# processing input words x[5] and x[7] "
	"\n	movd	%%xmm5, %%eax"
	"\n	movd	%%xmm7, %%ecx"
	"\n	pshufd	$57, %%xmm5, %%xmm5"
	"\n	pshufd	$57, %%xmm7, %%xmm7"
	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T0(,%%edi,8), %%mm5"
	"\n	pxor	T0(,%%edx,8), %%mm7"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrl	$16, %%eax"
	"\n	pxor	T1(,%%edi,8), %%mm4"
	"\n	pxor	T1(,%%edx,8), %%mm6"
	"\n	shrl	$16, %%ecx"

	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T2(,%%edi,8), %%mm3"
	"\n	pxor	T2(,%%edx,8), %%mm5"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	pxor	T3(,%%edi,8), %%mm2"
	"\n	pxor	T3(,%%edx,8), %%mm4"

	"\n	movd	%%xmm5, %%eax"
	"\n	movd	%%xmm7, %%ecx"
	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T4(,%%edi,8), %%mm1"
	"\n	pxor	T4(,%%edx,8), %%mm3"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	shrl	$16, %%eax"
	"\n	pxor	T5(,%%edi,8), %%mm0"
	"\n	pxor	T5(,%%edx,8), %%mm2"
	"\n	shrl	$16, %%ecx"

	"\n	movzbl	%%al, %%edi"
	"\n	movzbl	%%cl, %%edx"
	"\n	pxor	T6(,%%edi,8), %%mm7"
	"\n	pxor	T6(,%%edx,8), %%mm1"
	"\n	movzbl	%%ah, %%edi"
	"\n	movzbl	%%ch, %%edx"
	"\n	pxor	T7(,%%edi,8), %%mm6"
	"\n	pxor	T7(,%%edx,8), %%mm0"

	"\n	movq2dq	%%mm5, %%xmm5"
	"\n	movq2dq	%%mm4, %%xmm4"
	"\n	movq2dq	%%mm3, %%xmm3"
	"\n	movq2dq	%%mm2, %%xmm2"
	"\n	movq2dq	%%mm7, %%xmm7"
	"\n	movq2dq	%%mm1, %%xmm1"
	"\n	movq2dq	%%mm6, %%xmm6"
	"\n	movq2dq	%%mm0, %%xmm0"
	"\n	cmp $10, %%ebx			#repeat until 10 rounds"
	"\n	jne 1b"

	"\n	# pack contents of xmms and finally write back to memory"
	"\n	movlhps	%%xmm1, %%xmm0"
	"\n	movaps	%%xmm0, 0(%0)"
	"\n	movlhps	%%xmm3, %%xmm2"
	"\n	movaps	%%xmm2, 16(%0)"
	"\n	movlhps	%%xmm5, %%xmm4"
	"\n	movaps	%%xmm4, 32(%0)"
	"\n	movlhps	%%xmm7, %%xmm6"
	"\n	movaps	%%xmm6, 48(%0)"
: /*no output, only memory is modifed */
: "r"(x)
: "%eax", "%ebx", "%ecx", "%edx", "%edi", "memory", "%mm0", "%mm1", "%mm2", "%mm3", "%mm4", "%mm5", "%mm6", "%mm7",   "%xmm0", "%xmm1", "%xmm2", "%xmm3", "%xmm4", "%xmm5", "%xmm6", "%xmm7"
);
}//PQ512()
#endif

/* digest up to len bytes of input (full blocks only) */
void Transform(context *ctx, 
	       const unsigned char *in, 
	       unsigned long long len) {
  u64 y[COLS] __attribute__ ((aligned (16)));
  u64 z[COLS] __attribute__ ((aligned (16)));
  u64 *m, *h = (u64*)ctx->state;
  int i;
  
  /* increment block counter */
  ctx->block_counter += len/SIZE;
  
  asm volatile ("emms");
  /* digest message, one block at a time */
  for (; len >= SIZE; len -= SIZE, in += SIZE) {
    m = (u64*)in;
    for (i = 0; i < COLS; i++) {
      y[i] = m[i];
      z[i] = m[i] ^ h[i];
    }

#ifdef __x86_64    
    Q512ASM(y);
    P512ASM(z);
#else
    Q512ASM((u32*)y);
    P512ASM((u32*)z);
#endif
    
    /* h' == h + Q(m) + P(h+m) */
    for (i = 0; i < COLS; i++) {
      h[i] ^= z[i] ^ y[i];
    }
  }
  asm volatile ("emms");
}

/* given state h, do h <- P(h)+h */
void OutputTransformation(context *ctx) {
  u64 z[COLS] __attribute__ ((aligned (16)));
  int j;

  for (j = 0; j < COLS; j++) {
    z[j] = ctx->state[j];
  }
  asm volatile ("emms");
#ifdef __x86_64    
  P512ASM(z);
#else
  P512ASM((u32*)z);
#endif
  asm volatile ("emms");
  for (j = 0; j < COLS; j++) {
    ctx->state[j] ^= z[j];
  }
}

/* initialise context */
int Init(context* ctx) {
  int i;

  /* set initial value */
  for (i = 0; i < COLS-1; i++) ctx->state[i] = 0;
  ctx->state[COLS-1] = U64BIG((u64)(8*DIGESTSIZE));

  /* set other variables */
  ctx->buf_ptr = 0;
  ctx->block_counter = 0;

  return 0;
}

/* update state with databitlen bits of input */
int Update(context* ctx,
	   const unsigned char* in,
	   unsigned long long len) {
  unsigned long long index = 0;

  /* if the buffer contains data that has not yet been digested, first
     add data to buffer until full */
  if (ctx->buf_ptr) {
    while (ctx->buf_ptr < SIZE && index < len) {
      ctx->buffer[(int)ctx->buf_ptr++] = in[index++];
    }
    if (ctx->buf_ptr < SIZE) return 0;

    /* digest buffer */
    ctx->buf_ptr = 0;
    Transform(ctx, ctx->buffer, SIZE);
  }

  /* digest bulk of message */
  Transform(ctx, in+index, len-index);
  index += ((len-index)/SIZE)*SIZE;

  /* store remaining data in buffer */
  while (index < len) {
    ctx->buffer[(int)ctx->buf_ptr++] = in[index++];
  }

  return 0;
}

/* finalise: process remaining data (including padding), perform
   output transformation, and write hash result to 'output' */
int Final(context* ctx,
	  unsigned char* out) {
  int i, j = 0;
  unsigned char *s = (unsigned char*)ctx->state;

  ctx->buffer[ctx->buf_ptr++] = 0x80;

  /* pad with '0'-bits */
  if (ctx->buf_ptr > SIZE-LENGTHFIELDLEN) {
    /* padding requires two blocks */
    while (ctx->buf_ptr < SIZE) {
      ctx->buffer[ctx->buf_ptr++] = 0;
    }
    /* digest first padding block */
    Transform(ctx, ctx->buffer, SIZE);
    ctx->buf_ptr = 0;
  }
  while (ctx->buf_ptr < SIZE-LENGTHFIELDLEN) {
    ctx->buffer[ctx->buf_ptr++] = 0;
  }

  /* length padding */
  ctx->block_counter++;
  ctx->buf_ptr = SIZE;
  while (ctx->buf_ptr > SIZE-LENGTHFIELDLEN) {
    ctx->buffer[--ctx->buf_ptr] = (unsigned char)ctx->block_counter;
    ctx->block_counter >>= 8;
  }

  /* digest final padding block */
  Transform(ctx, ctx->buffer, SIZE);
  /* perform output transformation */
  OutputTransformation(ctx);

  /* store hash result in output */
  for (i = SIZE-DIGESTSIZE; i < SIZE; i++,j++) {
    out[j] = s[i];
  }

  /* zeroise relevant variables and deallocate memory */
  for (i = 0; i < COLS; i++) {
    ctx->state[i] = 0;
  }
  for (i = 0; i < SIZE; i++) {
    ctx->buffer[i] = 0;
  }

  return 0;
}

int crypto_hash(unsigned char *out,
		const unsigned char *in,
		unsigned long long len) {
  int ret;
  context ctx;

  /* initialise */
  if ((ret = Init(&ctx)) < 0)
    return ret;

  /* process message */
  if ((ret = Update(&ctx, in, len)) < 0)
    return ret;

  /* finalise */
  ret = Final(&ctx, out);

  return ret;
}
