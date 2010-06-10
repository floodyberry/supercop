/**
 * Finite field arithmetic for field with 2^256 - c elements.
 * For this implementation c = 587.
 *
 * Huseyin Hisil.
 * 2009-2010.
 **/
#define VOLATILE volatile
#define INLINE /*inline*/

#define _PRM_ 587 /*p = 2^256 - c with c = 587.*/

static INLINE unsigned int fp_is0_256(uni an){
	return (an[0] == 0) && (an[1] == 0) && (an[2] == 0) && (an[3] == 0);
}

static INLINE void fp_mld_256(uni zn, uni_t a, uni bn){
#ifdef COUNT_OPERATIONS
	COUNT_MLD++;
#endif
	__asm__ VOLATILE (
		"movq %2, %%rsi;" /*a*/

		/*#C# km_mul_2(cr, zn[0], a, bn[0]);*/
		"movq 8*0(%%rbx), %%rax;"
		"mulq %%rsi;"
		"movq %%rax, %%r8;"
		"movq %%rdx, %%rdi;"

		/*#C# km_mul_2_add_c(cr, zn[1], a, bn[1], cr);*/
		"movq 8*1(%%rbx), %%rax;"
		"mulq %%rsi;"
		"addq %%rdi, %%rax;"
		"movq %%rax, %%r9;"
		"adcq $0x0, %%rdx;"
		"movq %%rdx, %%rdi;"

		/*#C# km_mul_2_add_c(cr, zn[2], a, bn[2], cr);*/
		"movq 8*2(%%rbx), %%rax;"
		"mulq %%rsi;"
		"addq %%rdi, %%rax;"
		"movq %%rax, %%r10;"
		"adcq $0x0, %%rdx;"
		"movq %%rdx, %%rdi;"

		/*#C# km_mul_2_add_c(cr, zn[3], a, bn[3], cr);*/
		"movq 8*3(%%rbx), %%rax;"
		"mulq %%rsi;"
		"addq %%rdi, %%rax;"
		"movq %%rax, %%r11;"
		"adcq $0x0, %%rdx;"

		/*[cl,r11,r10,r9,r8] = [r11,r10,r9,r8] + [$PRM]*[rdx]*/

		/*#C# km_mul_2_add_c(cr, zn[0], cr, bb, zn[0]);*/
		/*#C# km_add(cr, zn[1], cr, zn[1]);*/
		/*#C# km_add(cr, zn[2], cr, zn[2]);*/
		/*#C# km_add(cr, zn[3], cr, zn[3]);*/
		"movq %0, %%rax;"
		"mulq %%rdx;"
		"addq %%rax, %%r8;"
		"adcq $0x0, %%r9;"
		"mov $0x0, %%si;"
		"adcq $0x0, %%r10;"
		"adcq $0x0, %%r11;"
		"adc $0x0, %%si;"

		/*[r15, r14, r13, r12] = [r11, r10, r9, r8]*/
		/*[r15, r14, r13, r12] += [$0, $0, $0, $PRM]*/
		"movq %%r8, %%r12;"
		"addq %0, %%r8;"
		"movq %%r9, %%r13;"
		"adcq $0x0, %%r9;"
		"movq %%r10, %%r14;"
		"adcq $0x0, %%r10;"
		"movq %%r11, %%r15;"
		"adcq $0x0, %%r11;"
		"adc $0x1, %%si;"
		"shr $0x2, %%si;"

		/*zn[3, 2, 1, 0] =c= [r15, r14, r13, r12]*/
		"cmovnc %%r12, %%r8;"
		"movq %%r8, 8*0(%%rcx);"
		"cmovnc %%r13, %%r9;"
		"movq %%r9, 8*1(%%rcx);"
		"cmovnc %%r14, %%r10;"
		"movq %%r10, 8*2(%%rcx);"
		"cmovnc %%r15, %%r11;"
		"movq %%r11, 8*3(%%rcx);"

		: : "n" (_PRM_), "c" (zn), "g" (a), "b" (bn)
		: "rax", "rsi", "rdi", "rdx", "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15", "memory"
	);
}

static INLINE void fp_ml2_256(uni zn, uni an){
#ifdef COUNT_OPERATIONS
	COUNT_ADD++;
#endif
	__asm__ VOLATILE (
		"mov $0x0, %%cl;"

		/*[r11, r10, r9, r8] = an[3, 2, 1, 0] << 1*/
		"movq 8*0(%%rax), %%r8;"
		"shlq $0x1, %%r8;"
		"movq 8*1(%%rax), %%r9;"
		"rclq $0x1, %%r9;"
		"movq 8*2(%%rax), %%r10;"
		"rclq $0x1, %%r10;"
		"movq 8*3(%%rax), %%r11;"
		"rclq $0x1, %%r11;"
		"adc $0x0, %%cl;"

		/*[r15, r14, r13, r12] = [r11, r10, r9, r8]*/
		/*[r15, r14, r13, r12] += [$0, $0, $0, $PRM]*/
		"movq %%r8, %%r12;"
		"addq %0, %%r8;"
		"movq %%r9, %%r13;"
		"adcq $0x0, %%r9;"
		"movq %%r10, %%r14;"
		"adcq $0x0, %%r10;"
		"movq %%r11, %%r15;"
		"adcq $0x0, %%r11;"
		"adc $0x1, %%cl;"
		"shr $0x2, %%cl;"

		/*zn[3, 2, 1, 0] =c= [r15, r14, r13, r12]*/
		"cmovnc %%r12, %%r8;"
		"movq %%r8, 8*0(%%rdx);"
		"cmovnc %%r13, %%r9;"
		"movq %%r9, 8*1(%%rdx);"
		"cmovnc %%r14, %%r10;"
		"movq %%r10, 8*2(%%rdx);"
		"cmovnc %%r15, %%r11;"
		"movq %%r11, 8*3(%%rdx);"

		: : "n" (_PRM_), "d" (zn), "a" (an)
		: "cl", "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15", "memory"
	);
}

static INLINE void fp_dv2_256(uni zn, uni an){
#ifdef COUNT_OPERATIONS
	COUNT_ADD++;
#endif
	__asm__ VOLATILE (
		"movq 8*3(%%rax), %%r11;"
		"shrq $0x1, %%r11;"
		"movq 8*2(%%rax), %%r10;"
		"rcrq $0x1, %%r10;"
		"movq 8*1(%%rax), %%r9;"
		"rcrq $0x1, %%r9;"
		"movq 8*0(%%rax), %%r8;"
		"rcrq $0x1, %%r8;"

		"movq %0, %%r12;"
		"movq $0x0, %%rcx;"
		"cmovnc %%rcx, %%r12;"
		"movq $0x8000000000000000, %%rbx;"
		"cmovnc %%rcx, %%rbx;"
		"subq %%r12, %%r8;"
		"movq %%r8, 8*0(%%rdx);"
		"sbbq $0x0, %%r9;"
		"movq %%r9, 8*1(%%rdx);"
		"sbbq $0x0, %%r10;"
		"movq %%r10, 8*2(%%rdx);"
		"sbbq %%rbx, %%r11;"
		"movq %%r11, 8*3(%%rdx);"

		: : "n" (((_PRM_ - 1) >> 1)), "d" (zn), "a" (an)
		: "rbx", "rcx", "r8", "r9", "r10", "r11", "r12", "memory"
	);
}

static INLINE void fp_cpy_256(uni zn, uni an){
#ifdef COUNT_OPERATIONS
	COUNT_ADD++;
#endif
	__asm__ VOLATILE (
		/*zn[3, 2, 1, 0] = an[3, 2, 1, 0]*/
		"movq 8*3(%%rax), %%rbx;"
		"movq %%rbx, 8*3(%%rdx);"
		"movq 8*2(%%rax), %%rbx;"
		"movq %%rbx, 8*2(%%rdx);"
		"movq 8*1(%%rax), %%rbx;"
		"movq %%rbx, 8*1(%%rdx);"
		"movq 8*0(%%rax), %%rbx;"
		"movq %%rbx, 8*0(%%rdx);"

		: : "d" (zn), "a" (an)
		: "rbx", "memory"
	);
}

static INLINE void fp_set_1_256(uni zn, uni_t a){
#ifdef COUNT_OPERATIONS
	COUNT_ADD++;
#endif
	__asm__ VOLATILE (
		/*zn[3, 2, 1, 0] = [$0, $0, $0, $a]*/
		"movq %%rax, 8*0(%%rdx);"
		"movq $0x0, 8*1(%%rdx);"
		"movq $0x0, 8*2(%%rdx);"
		"movq $0x0, 8*3(%%rdx);"

		: : "d" (zn), "a" (a)
		: "memory"
	);
}

static INLINE void fp_add_1_256(uni zn, uni an, uni_t b){
#ifdef COUNT_OPERATIONS
	COUNT_ADD++;
#endif
	__asm__ VOLATILE (
		"mov $0x0, %%cl;"

		/*[r11, r10, r9, r8] = an[3, 2, 1, 0] + bn[3, 2, 1, 0]*/
		"movq 8*0(%%rax), %%r8;"
		"addq %%rbx, %%r8;"
		"movq 8*1(%%rax), %%r9;"
		"adcq $0x0, %%r9;"
		"movq 8*2(%%rax), %%r10;"
		"adcq $0x0, %%r10;"
		"movq 8*3(%%rax), %%r11;"
		"adcq $0x0, %%r11;"
		"adc $0x0, %%cl;"

		/*[r15, r14, r13, r12] = [r11, r10, r9, r8]*/
		/*[r15, r14, r13, r12] += [$0, $0, $0, $PRM]*/
		"movq %%r8, %%r12;"
		"addq %0, %%r8;"
		"movq %%r9, %%r13;"
		"adcq $0x0, %%r9;"
		"movq %%r10, %%r14;"
		"adcq $0x0, %%r10;"
		"movq %%r11, %%r15;"
		"adcq $0x0, %%r11;"
		"adc $0x1, %%cl;"
		"shr $0x2, %%cl;"

		/*zn[3, 2, 1, 0] =c= [r15, r14, r13, r12]*/
		"cmovnc %%r12, %%r8;"
		"movq %%r8, 8*0(%%rdx);"
		"cmovnc %%r13, %%r9;"
		"movq %%r9, 8*1(%%rdx);"
		"cmovnc %%r14, %%r10;"
		"movq %%r10, 8*2(%%rdx);"
		"cmovnc %%r15, %%r11;"
		"movq %%r11, 8*3(%%rdx);"

		: : "n" (_PRM_), "d" (zn), "a" (an), "b" (b)
		: "cl", "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15", "memory"
	);
}

static INLINE void fp_sub_1_256(uni zn, uni an, uni_t b){
#ifdef COUNT_OPERATIONS
	COUNT_ADD++;
#endif
	__asm__(
		/*[r11, r10, r9, r8] = an[3, 2, 1, 0] - bn[3, 2, 1, 0]*/
		/*[r15, r14, r13, r12] = [$0, $0, $0, $0]*/
		/*[rdi, rdi, rdi, rcx] = [$-1, $-1, $-1, $-PRM] = 2^256 - PRM*/
		"movq 8*0(%%rax), %%r8;"
		"movq $0x0, %%r12;"
		"movq %0, %%rcx;"
		"subq %%rbx, %%r8;"
		"movq 8*1(%%rax), %%r9;"
		"movq $0x0, %%r13;"
		"sbbq $0x0, %%r9;"
		"movq 8*2(%%rax), %%r10;"
		"movq $0x0, %%r14;"
		"sbbq $0x0, %%r10;"
		"movq 8*3(%%rax), %%r11;"
		"movq $0x0, %%r15;"
		"movq $0x0-0x1, %%rdi;"
		"sbbq $0x0, %%r11;"

		/*Select PRM or 0 depending on the borrow bit*/
		"cmovc %%rdi, %%r13;"
		"cmovc %%rcx, %%r12;"
		"cmovc %%rdi, %%r14;"
		"cmovc %%rdi, %%r15;"

		/*Reduce with the selected value*/
		"addq %%r12, %%r8;"
		"movq %1, %%rdx;"
		"movq %%r8, (%%rdx);"
		"adcq %%r13, %%r9;"
		"movq %%r9, 8(%%rdx);"
		"adcq %%r14, %%r10;"
		"movq %%r10, 16(%%rdx);"
		"adcq %%r15, %%r11;"
		"movq %%r11, 24(%%rdx);"

		: : "n" (0 - _PRM_), "d" (zn), "a" (an), "b" (b)
		: "rcx", "rdi", "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15", "memory"
	);
}

static INLINE void fp_sub_2_256(uni zn, uni_t a, uni bn){
#ifdef COUNT_OPERATIONS
	COUNT_ADD++;
#endif
	__asm__(
		/*[r11, r10, r9, r8] = an[3, 2, 1, 0] - bn[3, 2, 1, 0]*/
		/*[r15, r14, r13, r12] = [$0, $0, $0, $0]*/
		/*[rdi, rdi, rdi, rcx] = [$-1, $-1, $-1, $-PRM] (= 2^256 - PRM)*/
		"movq %2, %%r8;" /*a*/

		"movq $0x0, %%r12;"
		"movq %0, %%rcx;"
		"subq 8*0(%%rbx), %%r8;"
		"movq $0x0, %%r9;"
		"movq $0x0, %%r13;"
		"sbbq 8*1(%%rbx), %%r9;"
		"movq $0x0, %%r10;"
		"movq $0x0, %%r14;"
		"movq $0x0-0x1, %%rdi;"
		"sbbq 8*2(%%rbx), %%r10;"
		"movq $0x0, %%r11;"
		"movq $0x0, %%r15;"
		"sbbq 8*3(%%rbx), %%r11;"

		/*Select PRM or 0 depending on the borrow bit*/
		"cmovc %%rdi, %%r13;"
		"cmovc %%rcx, %%r12;"
		"cmovc %%rdi, %%r14;"
		"cmovc %%rdi, %%r15;"

		/*Reduce with the selected value*/
		"addq %%r12, %%r8;"
		"movq %%r8, (%%rdx);"
		"adcq %%r13, %%r9;"
		"movq %%r9, 8(%%rdx);"
		"adcq %%r14, %%r10;"
		"movq %%r10, 16(%%rdx);"
		"adcq %%r15, %%r11;"
		"movq %%r11, 24(%%rdx);"

		: : "n" (0 - _PRM_), "d" (zn), "g" (a), "b" (bn)
		: "rcx", "rdi", "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15", "memory"
	);
}

static INLINE void fp_add_256(uni zn, uni an, uni bn){
#ifdef COUNT_OPERATIONS
	COUNT_ADD++;
#endif
	__asm__ VOLATILE (
		"mov $0x0, %%cl;"

		/*[r11, r10, r9, r8] = an[3, 2, 1, 0] + bn[3, 2, 1, 0]*/
		"movq 8*0(%%rax), %%r8;"
		"addq 8*0(%%rbx), %%r8;"
		"movq 8*1(%%rax), %%r9;"
		"adcq 8*1(%%rbx), %%r9;"
		"movq 8*2(%%rax), %%r10;"
		"adcq 8*2(%%rbx), %%r10;"
		"movq 8*3(%%rax), %%r11;"
		"adcq 8*3(%%rbx), %%r11;"
		"adc $0x0, %%cl;"

		/*[r15, r14, r13, r12] = [r11, r10, r9, r8]*/
		/*[r15, r14, r13, r12] += [$0, $0, $0, $PRM]*/
		"movq %%r8, %%r12;"
		"addq %0, %%r8;"
		"movq %%r9, %%r13;"
		"adcq $0x0, %%r9;"
		"movq %%r10, %%r14;"
		"adcq $0x0, %%r10;"
		"movq %%r11, %%r15;"
		"adcq $0x0, %%r11;"
		"adc $0x1, %%cl;"
		"shr $0x2, %%cl;"

		/*zn[3, 2, 1, 0] =c= [r15, r14, r13, r12]*/
		"cmovnc %%r12, %%r8;"
		"movq %%r8, 8*0(%%rdx);"
		"cmovnc %%r13, %%r9;"
		"movq %%r9, 8*1(%%rdx);"
		"cmovnc %%r14, %%r10;"
		"movq %%r10, 8*2(%%rdx);"
		"cmovnc %%r15, %%r11;"
		"movq %%r11, 8*3(%%rdx);"

		: : "n" (_PRM_), "d" (zn), "a" (an), "b" (bn)
		: "cl", "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15", "memory"
	);
}

static INLINE void fp_sub_256(uni zn, uni an, uni bn){
#ifdef COUNT_OPERATIONS
	COUNT_ADD++;
#endif
	__asm__(
		/*[r11, r10, r9, r8] = an[3, 2, 1, 0] - bn[3, 2, 1, 0]*/
		/*[r15, r14, r13, r12] = [$0, $0, $0, $0]*/
		/*[rdi, rdi, rdi, rcx] = [$-1, $-1, $-1, $-PRM]*/
		"movq 8*0(%%rax), %%r8;"
		"movq $0x0, %%r12;"
		"movq %0, %%rcx;"
		"subq 8*0(%%rbx), %%r8;"
		"movq 8*1(%%rax), %%r9;"
		"movq $0x0, %%r13;"
		"movq $0x0-0x1, %%rdi;"
		"sbbq 8*1(%%rbx), %%r9;"
		"movq 8*2(%%rax), %%r10;"
		"movq $0x0, %%r14;"
		"sbbq 8*2(%%rbx), %%r10;"
		"movq 8*3(%%rax), %%r11;"
		"movq $0x0, %%r15;"
		"sbbq 8*3(%%rbx), %%r11;"

		/*[r15, r14, r13, r12] =c= [rdi, rdi, rdi, rcx]*/
		"cmovc %%rdi, %%r13;"
		"cmovc %%rcx, %%r12;"
		"cmovc %%rdi, %%r14;"
		"cmovc %%rdi, %%r15;"

		/*Reduce with the selected value*/
		"addq %%r12, %%r8;"
		"movq %%r8, 8*0(%%rdx);"
		"adcq %%r13, %%r9;"
		"movq %%r9, 8*1(%%rdx);"
		"adcq %%r14, %%r10;"
		"movq %%r10, 8*2(%%rdx);"
		"adcq %%r15, %%r11;"
		"movq %%r11, 8*3(%%rdx);"

		: : "n" (0 - _PRM_), "d" (zn), "a" (an), "b" (bn)
		: "rcx", "rdi", "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15", "memory"
	);
}

static INLINE void fp_mul_256(uni zn, uni an, uni bn){
#ifdef COUNT_OPERATIONS
	COUNT_MUL++;
#endif
	__asm__ VOLATILE (
		"movq %2, %%rdi;" /*an*/
		"movq %3, %%rsi;" /*bn*/

		"movq 8*0(%%rdi), %%rbx;"   /* an[0], store */
		/*#C# km_mul_2(cr, zn[0], an[0], bn[0]);*/
		"movq 8*0(%%rsi), %%xmm0;"	 /* bn[0], store */
		"movq %%xmm0, %%rax;"    /* bn[0] */
		"mulq %%rbx;"            /* an[0]*bn[0] */
		"movq %%rax, %%r8;"      /* zn[0] = final */
		"movq %%rdx, %%rcx;"     /* carry word */

		/*#C# km_mul_2_add_c(cr, zn[1], an[0], bn[1], cr);*/
		"movq 8*1(%%rsi), %%xmm1;"  /* bn[1], store */ /*from below*/
		"movq %%xmm1, %%rax;"    /* bn[1] */
		"mulq %%rbx;"            /* an[0]*bn[1] */
		"movq 8*2(%%rsi), %%xmm2;"   /* bn[2], store */ /*from below*/
		"addq %%rcx, %%rax;"
		"movq $0x0, %%rcx;"
		"adcq %%rdx, %%rcx;"
		"movq %%rax, %%r9;"      /* zn[1] = product, virtual */

		/*#C# km_mul_2_add_c(cr, zn[2], an[0], bn[2], cr);*/
		"movq %%xmm2, %%rax;"     /* bn[2] */
		"mulq %%rbx;"            /* an[0]*bn[2] */
		"movq 8*3(%%rsi), %%rsi;"   /* bn[3], store */ /*from below*/
		"addq %%rcx, %%rax;"
		"movq $0x0, %%rcx;"
		"adcq %%rdx, %%rcx;"
		"movq %%rax, %%r10;"      /* zn[2] = product, virtual */

		/*#C# km_mul_2_add_c(cr, zn[3], an[0], bn[3], cr);*/
		"movq %%rsi, %%rax;"     /* bn[3] */
		"mulq %%rbx;"
		"movq $0x0, %%r12;"
		"addq %%rcx, %%rax;"
		"adcq %%rdx, %%r12;"     /* zn[4] = product, virtual */
		/*zn[4] = cr;*/
		"movq %%rax, %%r11;"     /* zn[3] = product, virtual */

		"movq 8*1(%%rdi), %%rbx;"   /* an[1], store */
		/*#C# km_mul_2_add_c(cr, zn[1], an[1], bn[0], zn[1]);*/
		"movq %%xmm0, %%rax;"     /* bn[0], recall */
		"mulq %%rbx;"            /* an[1]*bn[0] */
		"addq %%rax, %%r9;"      /* zn[1], update */
		"movq $0x0, %%rcx;"
		"adcq %%rdx, %%rcx;"

		/*#C# km_mul_2_add_2(cr, zn[2], an[1], bn[1], zn[2], cr);*/
		"movq %%xmm1, %%rax;"     /* bn[1], recall */
		"mulq %%rbx;"            /* an[1]*bn[1] */
		"addq %%rcx, %%rax;"
		"movq $0x0, %%rcx;"
        "adcq $0x0, %%rdx;"
		"addq %%rax, %%r10;"      /* zn[2], update */
		"movq %%xmm2, %%rax;"     /* bn[2], recall */ /*from below*/
        "adcq %%rdx, %%rcx;"

		/*#C# km_mul_2_add_2(cr, zn[3], an[1], bn[2], zn[3], cr);*/
		"mulq %%rbx;"            /* an[1]*bn[2] */
		"addq %%rcx, %%rax;"
		"movq $0x0, %%rcx;"
		"adcq $0x0, %%rdx;"
		"addq %%rax, %%r11;"      /* zn[3], update */
		"movq %%rsi, %%rax;"     /* bn[3], recall */ /*from below*/
		"adcq %%rdx, %%rcx;"     /* carry */

		/*#C# km_mul_2_add_2(cr, zn[4], an[1], bn[3], zn[4], cr);*/
		"mulq %%rbx;"             /* an[1]*bn[3] */
		"addq %%rcx, %%rax;"
		"movq $0x0, %%r13;"
		"adcq $0x0, %%rdx;"
		"movq 8*2(%%rdi), %%rbx;"   /* an[2], store */ /*from below*/
		"addq %%rax, %%r12;"      /* zn[4], update */
		"movq %%xmm0, %%rax;"     /* bn[0], recall */ /*from below*/
		/*zn[5] = cr;*/
		"adcq %%rdx, %%r13;"      /* zn[5], store */

		/*#C# km_mul_2_add_c(cr, zn[2], an[2], bn[0], zn[2]);*/
		"mulq %%rbx;"            /* an[2]*bn[0] */
		"addq %%rax, %%r10;"      /* zn[2], update */
		"movq %%xmm1, %%rax;"     /* bn[1], recall */ /*from below*/
		"adcq $0x0, %%rdx;"
		"movq %%rdx, %%rcx;"     /* carry */

		/*#C# km_mul_2_add_2(cr, zn[3], an[2], bn[1], zn[3], cr);*/
		"mulq %%rbx;"            /* an[2]*bn[1] */
		"addq %%rcx, %%rax;"
		"adcq $0x0, %%rdx;"
		"addq %%rax, %%r11;"      /* zn[3], update */
		"movq %%xmm2, %%rax;"     /* bn[2], recall */ /*from below*/
		"adcq $0x0, %%rdx;"
		"movq %%rdx, %%rcx;"     /* carry */

		/*#C# km_mul_2_add_2(cr, zn[4], an[2], bn[2], zn[4], cr);*/
		"mulq %%rbx;"            /* an[2]*bn[2] */
		"addq %%rcx, %%rax;"
		"adcq $0x0, %%rdx;"
		"addq %%rax, %%r12;"      /* zn[4], update */
		"movq %%rsi, %%rax;"     /* bn[3], recall */ /*from below*/
		"adcq $0x0, %%rdx;"
		"movq %%rdx, %%rcx;"     /* carry */

		/*#C# km_mul_2_add_2(cr, zn[5], an[2], bn[3], zn[5], cr);*/
		"mulq %%rbx;"             /* an[2]*bn[3] */
		"addq %%rcx, %%rax;"
		"movq $0x0, %%r14;"
		"adcq $0x0, %%rdx;"
		"movq 8*3(%%rdi), %%rbx;"   /* an[3], store */ /*from below*/
		"addq %%rax, %%r13;"      /* zn[5], update */
		"movq %%xmm0, %%rax;"     /* bn[0], recall */ /*from below*/
		/*zn[6] = cr;*/
		"adcq %%rdx, %%r14;"     /* zn[6], store */

		/*#C# km_mul_2_add_c(cr, zn[3], an[3], bn[0], zn[3]);*/
		"mulq %%rbx;"            /* an[2]*bn[0] */
		"addq %%rax, %%r11;"      /* zn[3], update */
		"movq %%xmm1, %%rax;"     /* bn[1], recall */ /*from below*/
		"adcq $0x0, %%rdx;"
		"movq %%rdx, %%rcx;"     /* carry */

		/*#C# km_mul_2_add_2(cr, zn[4], an[3], bn[1], zn[4], cr);*/
		"mulq %%rbx;"            /* an[3]*bn[1] */
		"addq %%rcx, %%rax;"
		"adcq $0x0, %%rdx;"
		"addq %%rax, %%r12;"      /* zn[4], update */
		"movq %%xmm2, %%rax;"     /* bn[2], recall */ /*from below*/
		"adcq $0x0, %%rdx;"
		"movq %%rdx, %%rcx;"     /* carry */

		/*#C# km_mul_2_add_2(cr, zn[5], an[3], bn[2], zn[5], cr);*/
		"mulq %%rbx;"            /* an[3]*bn[2] */
		"addq %%rcx, %%rax;"
		"adcq $0x0, %%rdx;"
		"addq %%rax, %%r13;"      /* zn[5], update */
		"movq %%rsi, %%rax;"     /* bn[3], recall */ /*from below*/
		"adcq $0x0, %%rdx;"
		"movq %%rdx, %%rcx;"     /* carry */

		/*#C# km_mul_2_add_2(cr, zn[6], an[3], bn[3], zn[6], cr);*/
		"mulq %%rbx;"             /* an[3]*bn[3] */
		"addq %%rcx, %%rax;"
		"adcq $0x0, %%rdx;"
		"movq $0x0, %%r15;"     /* zn[7], store */
		"addq %%rax, %%r14;"     /* zn[6], update */
		"adcq %%rdx, %%r15;"   /*zn[7] = cr;*/

		/*[r15,r11,r10,r9,r8] = [r11,r10,r9,r8] + [$PRM]*[r15,r14,r13,r12]*/
		"movq %0, %%rsi;"

		/*#C# km_mul_2_add_c(cr, zn[0], tn[4], bb, tn[0]);*/
		"movq %%r12, %%rax;"
		"mulq %%rsi;"
		"addq %%rax, %%r8;"
		"movq $0x0, %%r12;"
		"adcq %%rdx, %%r12;"

		/*#C# km_mul_2_add_2(cr, zn[1], tn[5], bb, cr, tn[1]);*/
		"movq %%r13, %%rax;"
		"mulq %%rsi;"
		"addq %%rax, %%r9;"
		"movq $0x0, %%r13;"
		"adcq %%rdx, %%r13;"
		"addq %%r12, %%r9;"
		"movq %%r14, %%rax;" /*from below*/
		"adcq $0x0, %%r13;"

		/*#C# km_mul_2_add_2(cr, zn[2], tn[6], bb, cr, tn[2]);*/
		"mulq %%rsi;"
		"addq %%rax, %%r10;"
		"movq $0x0, %%r14;"
		"adcq %%rdx, %%r14;"
		"addq %%r13, %%r10;"
		"movq %%r15, %%rax;" /*from below*/
		"adcq $0x0, %%r14;"

		/*#C# km_mul_2_add_2(cr, zn[3], tn[7], bb, cr, tn[3]);*/
		"mulq %%rsi;"
		"addq %%rax, %%r11;"
		"movq $0x0, %%r15;"
		"adcq %%rdx, %%r15;"
		"addq %%r14, %%r11;"
		"movq %%r15, %%rax;" /*from below*/
		"adcq $0x0, %%r15;"

		/*[cl,r11,r10,r9,r8] = [r11,r10,r9,r8] + [$PRM]*[r15]*/

		/*#C# km_mul_2_add_c(cr, zn[0], cr, bb, zn[0]);*/
		/*#C# km_add(cr, zn[1], cr, zn[1]);*/
		/*#C# km_add(cr, zn[2], cr, zn[2]);*/
		/*#C# km_add(cr, zn[3], cr, zn[3]);*/
		"mulq %%rsi;"
		"movq %1, %%rbx;"
		"addq %%rax, %%r8;"
		"adcq $0x0, %%r9;"
		"mov $0x0, %%cl;"
		"adcq $0x0, %%r10;"
		"adcq $0x0, %%r11;"
		"adc $0x0, %%cl;"

		/*[r15, r14, r13, r12] = [r11, r10, r9, r8]*/
		/*[r15, r14, r13, r12] += [$0, $0, $0, $PRM]*/
		"movq %%r8, %%r12;"
		"addq %0, %%r8;"
		"movq %%r9, %%r13;"
		"adcq $0x0, %%r9;"
		"movq %%r10, %%r14;"
		"adcq $0x0, %%r10;"
		"movq %%r11, %%r15;"
		"adcq $0x0, %%r11;"
		"adc $0x1, %%cl;"
		"shr $0x2, %%cl;"

		/*zn[3, 2, 1, 0] =c= [r15, r14, r13, r12]*/
		"movq %1, %%rax;"
		"cmovnc %%r12, %%r8;"
		"movq %%r8, 8*0(%%rax);"
		"cmovnc %%r13, %%r9;"
		"movq %%r9, 8*1(%%rax);"
		"cmovnc %%r14, %%r10;"
		"movq %%r10, 8*2(%%rax);"
		"cmovnc %%r15, %%r11;"
		"movq %%r11, 8*3(%%rax);"

		: : "n" (_PRM_), "m" (zn), "m" (an), "m" (bn)
		: "rax", "rbx", "rcx", "rdx", "rsi", "rdi", "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15", "xmm0", "xmm1", "xmm2", "memory"
	);
}

static INLINE void fp_sqr_256(uni zn, uni an){
#ifdef COUNT_OPERATIONS
	COUNT_SQR++;
#endif
	__asm__ VOLATILE (
		"movq %2, %%rdi;" /*an*/

		"xorq %%r11, %%r11;"
		"movq $0x0, %%r12;"
		"movq 8*0(%%rdi), %%r8;"
		"xorq %%r13, %%r13;"
		"movq $0x0, %%r14;"

		/*#C# km_mul_2(cr, tn[1], an[1], an[0]);*/
		"movq 8*1(%%rdi), %%rsi;"
		"movq %%rsi, %%rax;"
		"mulq %%r8;"
		"movq %%rax, %%r9;" /*tn[1]*/
		"movq 8*2(%%rdi), %%rcx;" /*from below*/
		"movq %%rdx, %%r10;"

		/*#C# km_mul_2_add_c(cr, tn[2], an[2], an[0], cr);*/
		"movq %%rcx, %%rax;"
		"mulq %%r8;"
		"addq %%rax, %%r10;" /*tn[2]*/
		"movq 8*3(%%rdi), %%rbx;" /*from below*/
		"adcq %%rdx, %%r11;" /*tn[3]*/

		/*#C# km_mul_2_add_c(tn[4], tn[3], an[3], an[0], cr);*/
		"movq %%rbx, %%rax;"
		"mulq %%r8;"
		"addq %%rax, %%r11;" /*tn[3]*/
		"movq %%rcx, %%rax;" /*from below*/
		"adcq %%rdx, %%r12;" /*tn[4]*/

		/*#C# km_mul_2_add_c(cr, tn[3], an[2], an[1], tn[3]);*/
		"mulq %%rsi;"
		"addq %%rax, %%r11;" /*tn[3]*/
		"movq %%rbx, %%rax;" /*from below*/
		"adcq %%rdx, %%r13;" /*cr*/

		/*#C# km_mul_2_add_2(tn[5], tn[4], an[3], an[1], cr, tn[4]);*/
		"mulq %%rsi;"
		"addq %%rax, %%r13;"
		"movq %%rbx, %%rax;" /*from below*/
		"adcq $0x0, %%rdx;"
		"addq %%r13, %%r12;" /*tn[4]*/
		"movq $0x0, %%r13;"
		"adcq %%rdx, %%r13;" /*tn[5]*/

		/*#C# km_mul_2_add_c(tn[6], tn[5], an[3], an[2], tn[5]);*/
		"mulq %%rcx;"
		"addq %%rax, %%r13;" /*tn[5]*/
		"adcq %%rdx, %%r14;" /*tn[6]*/

		/*#C# mim_inc_n(tn[7], tn + 1, 6, tn + 1, 6, 0);*/
		"shlq $0x1, %%r9;"
		"rclq $0x1, %%r10;"
		"movq $0x0, %%r15;"
		"rclq $0x1, %%r11;"
		"rclq $0x1, %%r12;"
		"movq %%r8, %%rax;" /*from below*/
		"rclq $0x1, %%r13;"
		"rclq $0x1, %%r14;"
		"adcq $0x0, %%r15;"

		/*#C# km_mul_2(cr, tn[0], an[0], an[0]);*/
		/*#C# km_add(cr, tn[1], cr, tn[1]);*/
		"mulq %%rax;"
		"movq %%rax, %%r8;" /*tn[0]*/
		"movq %%rsi, %%rax;" /*from below*/
		"addq %%rdx, %%r9;" /*tn[1]*/

		/*#C# km_mul_2_add_2(cr, tn[2], an[1], an[1], cr, tn[2]);*/
		/*#C# km_add(cr, tn[3], cr, tn[3]);*/
		"movq $0x0, %%rsi;"
		"adcq $0x0, %%rsi;"
		"mulq %%rax;"
		"addq %%rax, %%rsi;"
		"adcq $0x0, %%rdx;"
		"movq %%rcx, %%rax;" /*from below*/
		"addq %%rsi, %%r10;" /*tn[2]*/
		"adcq %%rdx, %%r11;" /*tn[3]*/

		/*#C# km_mul_2_add_2(cr, tn[4], an[2], an[2], cr, tn[4]);*/
		/*#C# km_add(cr, tn[5], cr, tn[5]);*/
		"movq $0x0, %%rcx;"
		"adcq $0x0, %%rcx;"
		"mulq %%rax;"
		"addq %%rax, %%rcx;"
		"adcq $0x0, %%rdx;"
		"movq %%rbx, %%rax;" /*from below*/
		"addq %%rcx, %%r12;" /*tn[4]*/
		"adcq %%rdx, %%r13;" /*tn[5]*/

		/*#C# km_mul_2_add_2(cr, tn[6], an[3], an[3], cr, tn[6]);*/
		/*#C# tn[7] += cr;*/
		"movq $0x0, %%rbx;"
		"adcq $0x0, %%rbx;"
		"mulq %%rax;"
		"addq %%rax, %%rbx;"
		"adcq $0x0, %%rdx;"
		"addq %%rbx, %%r14;" /*tn[6]*/
		"adcq %%rdx, %%r15;" /*tn[7]*/

		/*[r15,r11,r10,r9,r8] = [r11,r10,r9,r8] + [$PRM]*[r15,r14,r13,r12]*/
		"movq %0, %%rsi;"

		/*#C# km_mul_2_add_c(cr, zn[0], tn[4], bb, tn[0]);*/
		"movq %%r12, %%rax;"
		"mulq %%rsi;"
		"addq %%rax, %%r8;"
		"movq $0x0, %%r12;"
		"adcq %%rdx, %%r12;"

		/*#C# km_mul_2_add_2(cr, zn[1], tn[5], bb, cr, tn[1]);*/
		"movq %%r13, %%rax;"
		"mulq %%rsi;"
		"addq %%rax, %%r9;"
		"movq $0x0, %%r13;"
		"adcq %%rdx, %%r13;"
		"addq %%r12, %%r9;"
		"movq %%r14, %%rax;" /*from below*/
		"adcq $0x0, %%r13;"

		/*#C# km_mul_2_add_2(cr, zn[2], tn[6], bb, cr, tn[2]);*/
		"mulq %%rsi;"
		"addq %%rax, %%r10;"
		"movq $0x0, %%r14;"
		"adcq %%rdx, %%r14;"
		"addq %%r13, %%r10;"
		"movq %%r15, %%rax;" /*from below*/
		"adcq $0x0, %%r14;"

		/*#C# km_mul_2_add_2(cr, zn[3], tn[7], bb, cr, tn[3]);*/
		"mulq %%rsi;"
		"addq %%rax, %%r11;"
		"movq $0x0, %%r15;"
		"adcq %%rdx, %%r15;"
		"addq %%r14, %%r11;"
		"movq %%r15, %%rax;" /*from below*/
		"adcq $0x0, %%r15;"

		/*[cl,r11,r10,r9,r8] = [r11,r10,r9,r8] + [$PRM]*[r15]*/

		/*#C# km_mul_2_add_c(cr, zn[0], cr, bb, zn[0]);*/
		/*#C# km_add(cr, zn[1], cr, zn[1]);*/
		/*#C# km_add(cr, zn[2], cr, zn[2]);*/
		/*#C# km_add(cr, zn[3], cr, zn[3]);*/
		"mulq %%rsi;"
		"movq %1, %%rbx;"
		"addq %%rax, %%r8;"
		"adcq $0x0, %%r9;"
		"mov $0x0, %%cl;"
		"adcq $0x0, %%r10;"
		"adcq $0x0, %%r11;"
		"adc $0x0, %%cl;"

		/*[r15, r14, r13, r12] = [r11, r10, r9, r8]*/
		/*[r15, r14, r13, r12] += [$0, $0, $0, $PRM]*/
		"movq %%r8, %%r12;"
		"addq %0, %%r8;"
		"movq %%r9, %%r13;"
		"adcq $0x0, %%r9;"
		"movq %%r10, %%r14;"
		"adcq $0x0, %%r10;"
		"movq %%r11, %%r15;"
		"adcq $0x0, %%r11;"
		"adc $0x1, %%cl;"
		"shr $0x2, %%cl;"

		/*zn[3, 2, 1, 0] =c= [r15, r14, r13, r12]*/
		"movq %1, %%rax;"
		"cmovnc %%r12, %%r8;"
		"movq %%r8, 8*0(%%rax);"
		"cmovnc %%r13, %%r9;"
		"movq %%r9, 8*1(%%rax);"
		"cmovnc %%r14, %%r10;"
		"movq %%r10, 8*2(%%rax);"
		"cmovnc %%r15, %%r11;"
		"movq %%r11, 8*3(%%rax);"

		: : "n" (_PRM_), "m" (zn), "m" (an)
		: "rax", "rbx", "rcx", "rdx", "rdi", "rsi", "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15", "memory"
	);
}
