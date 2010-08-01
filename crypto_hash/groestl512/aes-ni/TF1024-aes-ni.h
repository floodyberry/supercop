/* TF1024-aes-ni.h     July 2010
 *
 * Groestl implementation with inline assembly containing sse and aes
 * instructions. Has been tested on an Intel Core i7 620LM.
 *
 * Authors:
 *  Günther A. Roland
 *
 * This code is placed in the public domain
 */

#define SET_CONSTANTS_1024(){\
  ((u64*)TRANSP_MASK)[0] = 0x0d0509010c040800ULL;\
  ((u64*)TRANSP_MASK)[1] = 0x0f070b030e060a02ULL;\
  ((u64*)ALL_7F)[0] = 0x7f7f7f7f7f7f7f7fULL;\
  ((u64*)ALL_7F)[1] = 0x7f7f7f7f7f7f7f7fULL;\
  ((u64*)ALL_1B)[0] = 0x1b1b1b1b1b1b1b1bULL;\
  ((u64*)ALL_1B)[1] = 0x1b1b1b1b1b1b1b1bULL;\
	((u64*)SUBSH_MASK)[0] =  0x0b0e0104070a0d00ULL;\
	((u64*)SUBSH_MASK)[1] =  0x0306090c0f020508ULL;\
	((u64*)SUBSH_MASK)[2] =  0x0c0f0205080b0e01ULL;\
	((u64*)SUBSH_MASK)[3] =  0x04070a0d00030609ULL;\
	((u64*)SUBSH_MASK)[4] =  0x0d000306090c0f02ULL;\
	((u64*)SUBSH_MASK)[5] =  0x05080b0e0104070aULL;\
	((u64*)SUBSH_MASK)[6] =  0x0e0104070a0d0003ULL;\
	((u64*)SUBSH_MASK)[7] =  0x06090c0f0205080bULL;\
	((u64*)SUBSH_MASK)[8] =  0x0f0205080b0e0104ULL;\
	((u64*)SUBSH_MASK)[9] =  0x070a0d000306090cULL;\
	((u64*)SUBSH_MASK)[10] = 0x000306090c0f0205ULL;\
	((u64*)SUBSH_MASK)[11] = 0x080b0e0104070a0dULL;\
	((u64*)SUBSH_MASK)[12] = 0x0104070a0d000306ULL;\
	((u64*)SUBSH_MASK)[13] = 0x090c0f0205080b0eULL;\
	((u64*)SUBSH_MASK)[14] = 0x06090c0f0205080bULL;\
	((u64*)SUBSH_MASK)[15] = 0x0e0104070a0d0003ULL;\
	for(i = 0; i < ROUNDS; i++)\
	{\
		((u64*)ROUND_P)[2*i+1] = 0x0000000000000000ULL;\
		((u64*)ROUND_P)[2*i+0] = (u64) i;\
		((u64*)ROUND_Q)[2*i+1] = 0x0000000000000000ULL;\
		((u64*)ROUND_Q)[2*i+0] = 0x00000000000000ffULL ^ (u64) i;\
	}\
}while(0);

#define tos(a)    #a
#define tostr(a)  tos(a)

/* xmm[i] will be multiplied by 2
 * xmm[k] has to be all 0x1b
 * xmm[l] has to be all 0x7f
 * xmm[0] & [j] will be lost */
#define MUL2(i, j, k, l){\
    asm ("movdqa xmm0, xmm"tostr(i)"");\
    asm ("pand  xmm"tostr(i)", xmm"tostr(l)"");\
    asm ("pxor xmm"tostr(j)", xmm"tostr(j)"");\
    asm ("paddb xmm"tostr(i)", xmm"tostr(i)"");\
    asm ("pblendvb xmm"tostr(j)", xmm"tostr(k)"");\
    asm ("pxor  xmm"tostr(i)", xmm"tostr(j)"");\
}/**/
#define MUL2_B(i, j, k, l){\
    asm ("movdqa xmm"tostr(i)", xmm0");\
    asm ("pxor xmm"tostr(j)", xmm"tostr(j)"");\
    asm ("pand  xmm"tostr(i)", xmm"tostr(l)"");\
    asm ("pblendvb xmm"tostr(j)", xmm"tostr(k)"");\
    asm ("paddb xmm"tostr(i)", xmm"tostr(i)"");\
    asm ("pxor  xmm"tostr(i)", xmm"tostr(j)"");\
}


#define Push_All_Regs() do{\
    asm("push rax");\
    asm("push rbx");\
    asm("push rcx");\
}while(0);

#define Pop_All_Regs() do{\
    asm("pop rcx");\
    asm("pop rbx");\
    asm("pop rax");\
}while(0);

/* Round function for round 1,3,... */
#define ROUND_A(){\
    /* ShiftBytes + SubBytes */\
    asm ("pxor xmm0,  xmm0");\
    asm ("pshufb xmm8,  [SUBSH_MASK+0*16]");\
    asm ("aesenclast xmm8,  xmm0");\
    asm ("pshufb xmm9,  [SUBSH_MASK+1*16]");\
    asm ("aesenclast xmm9,  xmm0");\
    asm ("pshufb xmm10, [SUBSH_MASK+2*16]");\
    asm ("aesenclast xmm10, xmm0");\
    asm ("pshufb xmm11, [SUBSH_MASK+3*16]");\
    asm ("aesenclast xmm11, xmm0");\
    asm ("pshufb xmm12, [SUBSH_MASK+4*16]");\
    asm ("aesenclast xmm12, xmm0");\
    asm ("pshufb xmm13, [SUBSH_MASK+5*16]");\
    asm ("movdqa xmm1, xmm8");\
    asm ("aesenclast xmm13, xmm0");\
    asm ("pshufb xmm14, [SUBSH_MASK+6*16]");\
    asm ("movdqa xmm2, xmm12");\
    asm ("aesenclast xmm14, xmm0");\
    asm ("pshufb xmm15, [SUBSH_MASK+7*16]");\
    asm ("movdqa xmm3, xmm9");\
    asm ("aesenclast xmm15, xmm0");\
\
		/* MixBytes Version 2 */\
		/* save *1 values */\
		asm ("movaps [TMP_MUL1+0*16], xmm8");\
		asm ("movaps [TMP_MUL1+1*16], xmm9");\
		asm ("movaps [TMP_MUL1+2*16], xmm10");\
		asm ("movaps [TMP_MUL1+3*16], xmm11");\
		asm ("movaps [TMP_MUL1+4*16], xmm12");\
		asm ("movaps [TMP_MUL1+5*16], xmm13");\
		asm ("movaps [TMP_MUL1+6*16], xmm14");\
		asm ("movaps [TMP_MUL1+7*16], xmm15");\
		\
		/* multiply by 2 */\
		asm ("movaps xmm2, [ALL_1B]");\
		asm ("movaps xmm3, [ALL_7F]");\
		MUL2(8,  1, 2, 3);\
		MUL2(9,  1, 2, 3);\
		MUL2(10, 1, 2, 3);\
		MUL2(11, 1, 2, 3);\
		MUL2(12, 1, 2, 3);\
		MUL2(13, 1, 2, 3);\
		MUL2(14, 1, 2, 3);\
		MUL2(15, 1, 2, 3);\
		\
		/* save *2 values */\
		asm ("movaps [TMP_MUL2+0*16], xmm8");\
		asm ("movaps [TMP_MUL2+1*16], xmm9");\
		asm ("movaps [TMP_MUL2+2*16], xmm10");\
		asm ("movaps [TMP_MUL2+3*16], xmm11");\
		asm ("movaps [TMP_MUL2+4*16], xmm12");\
		asm ("movaps [TMP_MUL2+5*16], xmm13");\
		asm ("movaps [TMP_MUL2+6*16], xmm14");\
		asm ("movaps [TMP_MUL2+7*16], xmm15");\
		asm ("movdqa xmm7, xmm8");\
		asm ("movdqa xmm4, xmm11");\
		asm ("movdqa xmm5, xmm15");\
		\
		/* multiply by 2 */\
		MUL2(8,  1, 2, 3);\
		MUL2(9,  1, 2, 3);\
		MUL2(10, 1, 2, 3);\
		MUL2(11, 1, 2, 3);\
		MUL2(12, 1, 2, 3);\
		MUL2(13, 1, 2, 3);\
		MUL2(14, 1, 2, 3);\
		MUL2(15, 1, 2, 3);\
		\
		/* save *4 values */\
		asm ("movaps [TMP_MUL4], xmm11");\
		\
		/* 1 */\
		asm ("movdqa xmm1, xmm8");\
		asm ("pxor xmm1, xmm13");\
		asm ("pxor xmm1, xmm4");\
		asm ("pxor xmm1, [TMP_MUL1+0*16]");\
		asm ("movdqa xmm2, xmm1");\
		\
		/* 2 */\
		asm ("pxor xmm5, xmm9");\
		asm ("pxor xmm5, xmm12");\
		asm ("pxor xmm5, [TMP_MUL1+4*16]");\
		asm ("movdqa xmm6, xmm5");\
		\
		/* 3 */\
		asm ("movdqa xmm0, xmm7");\
		asm ("pxor xmm0, [TMP_MUL1+5*16]");\
		asm ("pxor xmm0, [TMP_MUL1+7*16]");\
		asm ("pxor xmm0, xmm15");\
		asm ("pxor xmm0, [TMP_MUL2+2*16]");\
		asm ("movdqa xmm3, xmm0");\
		asm ("pxor xmm1, xmm0");\
		\
		/* 4 */\
		asm ("movdqa xmm7, xmm14");\
		asm ("pxor xmm7, [TMP_MUL1+4*16]");\
		asm ("pxor xmm7, [TMP_MUL1+6*16]");\
		asm ("pxor xmm7, [TMP_MUL2+1*16]");\
		asm ("pxor xmm7, [TMP_MUL2+7*16]");\
		asm ("pxor xmm0, xmm7");\
		asm ("pxor xmm2, xmm7");\
		\
		/* 5 */\
		asm ("movdqa xmm4, xmm10");\
		asm ("pxor xmm4, [TMP_MUL1+0*16]");\
		asm ("pxor xmm4, [TMP_MUL1+2*16]");\
		asm ("pxor xmm4, [TMP_MUL2+3*16]");\
		asm ("pxor xmm4, [TMP_MUL2+5*16]");\
		asm ("pxor xmm3, xmm4");\
		asm ("pxor xmm6, xmm4");\
		\
		/* 6 */\
		asm ("pxor xmm11, [TMP_MUL1+1*16]");\
		asm ("pxor xmm11, [TMP_MUL1+3*16]");\
		asm ("pxor xmm11, [TMP_MUL2+4*16]");\
		asm ("pxor xmm11, [TMP_MUL2+6*16]");\
		asm ("pxor xmm4, xmm11");\
		asm ("pxor xmm5, xmm11");\
		asm ("pxor xmm7, xmm11");\
		\
		/* 7 */\
		asm ("pxor xmm9, [TMP_MUL1+1*16]");\
		asm ("pxor xmm9, [TMP_MUL2+4*16]");\
		asm ("pxor xmm2, xmm9");\
		asm ("pxor xmm3, xmm9");\
		\
		/* 8 */\
		asm ("pxor xmm13, [TMP_MUL1+5*16]");\
		asm ("pxor xmm13, [TMP_MUL2+0*16]");\
		asm ("pxor xmm6, xmm13");\
		asm ("pxor xmm7, xmm13");\
		\
		/* 9 */\
		asm ("movaps xmm11, [TMP_MUL1+2*16]");\
		asm ("pxor xmm11,   [TMP_MUL2+5*16]");\
		asm ("pxor xmm0, xmm11");\
		asm ("pxor xmm5, xmm11");\
		\
		/* 10 */\
		asm ("movaps xmm9, [TMP_MUL1+6*16]");\
		asm ("pxor xmm9,   [TMP_MUL2+1*16]");\
		asm ("pxor xmm1, xmm9");\
		asm ("pxor xmm4, xmm9");\
		\
		/* 11 */\
		asm ("movaps xmm13, [TMP_MUL1+3*16]");\
		asm ("pxor xmm13,   [TMP_MUL2+6*16]");\
		asm ("pxor xmm1, xmm13");\
		asm ("pxor xmm6, xmm13");\
		\
		/* 12 */\
		asm ("movaps xmm11, [TMP_MUL1+7*16]");\
		asm ("pxor xmm11,   [TMP_MUL2+2*16]");\
		asm ("pxor xmm2, xmm11");\
		asm ("pxor xmm5, xmm11");\
		\
		/* 13 */\
		asm ("pxor xmm0, [TMP_MUL4]");\
		asm ("pxor xmm0, xmm12");\
		asm ("pxor xmm1, xmm12");\
		asm ("pxor xmm3, xmm14");\
		asm ("pxor xmm4, xmm8");\
		asm ("pxor xmm4, xmm15");\
		asm ("pxor xmm5, xmm8");\
		asm ("pxor xmm7, xmm10");\
		\
}

/* Round function for round 2,4,... */
#define ROUND_B(){\
    /* ShiftBytes + SubBytes */\
    asm ("pxor xmm8, xmm8");\
    asm ("pshufb xmm0,  [SUBSH_MASK+0*16]");\
    asm ("aesenclast xmm0,  xmm8");\
    asm ("pshufb xmm1,  [SUBSH_MASK+1*16]");\
    asm ("aesenclast xmm1,  xmm8");\
    asm ("pshufb xmm2, [SUBSH_MASK+2*16]");\
    asm ("aesenclast xmm2, xmm8");\
    asm ("pshufb xmm3, [SUBSH_MASK+3*16]");\
    asm ("aesenclast xmm3, xmm8");\
    asm ("pshufb xmm4, [SUBSH_MASK+4*16]");\
    asm ("aesenclast xmm4, xmm8");\
    asm ("pshufb xmm5, [SUBSH_MASK+5*16]");\
    asm ("movdqa xmm9, xmm0");\
    asm ("aesenclast xmm5, xmm8");\
    asm ("pshufb xmm6, [SUBSH_MASK+6*16]");\
    asm ("movdqa xmm10, xmm4");\
    asm ("aesenclast xmm6, xmm8");\
    asm ("pshufb xmm7, [SUBSH_MASK+7*16]");\
    asm ("movdqa xmm11, xmm1");\
    asm ("aesenclast xmm7, xmm8");\
\
		/* MixBytes Version 2 */\
		/* save *1 values */\
		asm ("movaps [TMP_MUL1+0*16], xmm0");\
		asm ("movaps [TMP_MUL1+1*16], xmm1");\
		asm ("movaps [TMP_MUL1+2*16], xmm2");\
		asm ("movaps [TMP_MUL1+3*16], xmm3");\
		asm ("movaps [TMP_MUL1+4*16], xmm4");\
		asm ("movaps [TMP_MUL1+5*16], xmm5");\
		asm ("movaps [TMP_MUL1+6*16], xmm6");\
		asm ("movaps [TMP_MUL1+7*16], xmm7");\
		\
		/* multiply by 2 */\
		asm ("movaps xmm10, [ALL_1B]");\
		asm ("movaps xmm11, [ALL_7F]");\
		MUL2_B(8, 9, 10, 11);\
		MUL2(1, 9, 10, 11);\
		MUL2(2, 9, 10, 11);\
		MUL2(3, 9, 10, 11);\
		MUL2(4, 9, 10, 11);\
		MUL2(5, 9, 10, 11);\
		MUL2(6, 9, 10, 11);\
		MUL2(7, 9, 10, 11);\
		\
		/* save *2 values */\
		asm ("movaps [TMP_MUL2+0*16], xmm8");\
		asm ("movaps [TMP_MUL2+1*16], xmm1");\
		asm ("movaps [TMP_MUL2+2*16], xmm2");\
		asm ("movaps [TMP_MUL2+3*16], xmm3");\
		asm ("movaps [TMP_MUL2+4*16], xmm4");\
		asm ("movaps [TMP_MUL2+5*16], xmm5");\
		asm ("movaps [TMP_MUL2+6*16], xmm6");\
		asm ("movaps [TMP_MUL2+7*16], xmm7");\
		asm ("movdqa xmm15, xmm8");\
		asm ("movdqa xmm12, xmm3");\
		asm ("movdqa xmm13, xmm7");\
		\
		/* multiply by 2 */\
		MUL2(8, 9, 10, 11);\
		MUL2(1, 9, 10, 11);\
		MUL2(2, 9, 10, 11);\
		MUL2(3, 9, 10, 11);\
		MUL2(4, 9, 10, 11);\
		MUL2(5, 9, 10, 11);\
		MUL2(6, 9, 10, 11);\
		MUL2(7, 9, 10, 11);\
		asm ("movdqa xmm0, xmm8");\
		\
		/* save *4 values */\
		asm ("movaps [TMP_MUL4], xmm3");\
		\
		/* 1 */\
		asm ("movdqa xmm9, xmm0");\
		asm ("pxor xmm9, xmm5");\
		asm ("pxor xmm9, xmm12");\
		asm ("pxor xmm9, [TMP_MUL1+0*16]");\
		asm ("movdqa xmm10, xmm9");\
		\
		/* 2 */\
		asm ("pxor xmm13, xmm1");\
		asm ("pxor xmm13, xmm4");\
		asm ("pxor xmm13, [TMP_MUL1+4*16]");\
		asm ("movdqa xmm14, xmm13");\
		\
		/* 3 */\
		asm ("movdqa xmm8, xmm15");\
		asm ("pxor xmm8, [TMP_MUL1+5*16]");\
		asm ("pxor xmm8, [TMP_MUL1+7*16]");\
		asm ("pxor xmm8, xmm7");\
		asm ("pxor xmm8, [TMP_MUL2+2*16]");\
		asm ("movdqa xmm11, xmm8");\
		asm ("pxor xmm9, xmm8");\
		\
		/* 4 */\
		asm ("movdqa xmm15, xmm6");\
		asm ("pxor xmm15, [TMP_MUL1+4*16]");\
		asm ("pxor xmm15, [TMP_MUL1+6*16]");\
		asm ("pxor xmm15, [TMP_MUL2+1*16]");\
		asm ("pxor xmm15, [TMP_MUL2+7*16]");\
		asm ("pxor xmm8, xmm15");\
		asm ("pxor xmm10, xmm15");\
		\
		/* 5 */\
		asm ("movdqa xmm12, xmm2");\
		asm ("pxor xmm12, [TMP_MUL1+0*16]");\
		asm ("pxor xmm12, [TMP_MUL1+2*16]");\
		asm ("pxor xmm12, [TMP_MUL2+3*16]");\
		asm ("pxor xmm12, [TMP_MUL2+5*16]");\
		asm ("pxor xmm11, xmm12");\
		asm ("pxor xmm14, xmm12");\
		\
		/* 6 */\
		asm ("pxor xmm3, [TMP_MUL1+1*16]");\
		asm ("pxor xmm3, [TMP_MUL1+3*16]");\
		asm ("pxor xmm3, [TMP_MUL2+4*16]");\
		asm ("pxor xmm3, [TMP_MUL2+6*16]");\
		asm ("pxor xmm12, xmm3");\
		asm ("pxor xmm13, xmm3");\
		asm ("pxor xmm15, xmm3");\
		\
		/* 7 */\
		asm ("pxor xmm1, [TMP_MUL1+1*16]");\
		asm ("pxor xmm1, [TMP_MUL2+4*16]");\
		asm ("pxor xmm10, xmm1");\
		asm ("pxor xmm11, xmm1");\
		\
		/* 8 */\
		asm ("pxor xmm5, [TMP_MUL1+5*16]");\
		asm ("pxor xmm5, [TMP_MUL2+0*16]");\
		asm ("pxor xmm14, xmm5");\
		asm ("pxor xmm15, xmm5");\
		\
		/* 9 */\
		asm ("movaps xmm3, [TMP_MUL1+2*16]");\
		asm ("pxor xmm3,   [TMP_MUL2+5*16]");\
		asm ("pxor xmm8, xmm3");\
		asm ("pxor xmm13, xmm3");\
		\
		/* 10 */\
		asm ("movaps xmm1, [TMP_MUL1+6*16]");\
		asm ("pxor xmm1,   [TMP_MUL2+1*16]");\
		asm ("pxor xmm9, xmm1");\
		asm ("pxor xmm12, xmm1");\
		\
		/* 11 */\
		asm ("movaps xmm5, [TMP_MUL1+3*16]");\
		asm ("pxor xmm5,   [TMP_MUL2+6*16]");\
		asm ("pxor xmm9, xmm5");\
		asm ("pxor xmm14, xmm5");\
		\
		/* 12 */\
		asm ("movaps xmm3, [TMP_MUL1+7*16]");\
		asm ("pxor xmm3,   [TMP_MUL2+2*16]");\
		asm ("pxor xmm10, xmm3");\
		asm ("pxor xmm13, xmm3");\
		\
		/* 13 */\
		asm ("pxor xmm8, [TMP_MUL4]");\
		asm ("pxor xmm8, xmm4");\
		asm ("pxor xmm9, xmm4");\
		asm ("pxor xmm11, xmm6");\
		asm ("pxor xmm12, xmm0");\
		asm ("pxor xmm12, xmm7");\
		asm ("pxor xmm13, xmm0");\
		asm ("pxor xmm15, xmm2");\
		\
}

#define ROUNDS_P(){\
    asm ("xor rax, rax");\
    asm ("xor rbx, rbx");\
    asm ("add bl, 2");\
    asm ("1:");\
    asm ("pxor xmm8, [ROUND_P+eax*8]");\
    ROUND_A();\
    asm ("pxor xmm0, [ROUND_P+ebx*8]");\
    ROUND_B();\
    asm ("add al, 4");\
    asm ("add bl, 4");\
    asm ("mov rcx, rax");\
    asm ("sub cl, 28");\
    asm ("jb 1b");\
}

#define ROUNDS_Q(){\
    asm ("xor rax, rax");\
    asm ("xor rbx, rbx");\
    asm ("add bl, 2");\
    asm ("2:");\
    asm ("pxor xmm15, [ROUND_Q+eax*8]");\
    ROUND_A();\
    asm ("pxor xmm7,  [ROUND_Q+ebx*8]");\
    ROUND_B();\
    asm ("add al, 4");\
    asm ("add bl, 4");\
    asm ("mov rcx, rax");\
    asm ("sub cl, 28");\
    asm ("jb 2b");\
}

void INIT_CV()
{
  asm (".intel_syntax noprefix");
  asm volatile ("emms");

  /* load CV (IV) into registers xmm8 - xmm15 */
  asm ("movaps xmm0,  [TRANSP_MASK]");
  asm ("movaps xmm8,  [GLOBAL_CV_PTR+0*16]");
  asm ("movaps xmm9,  [GLOBAL_CV_PTR+1*16]");
  asm ("movaps xmm10, [GLOBAL_CV_PTR+2*16]");
  asm ("movaps xmm11, [GLOBAL_CV_PTR+3*16]");
  asm ("movaps xmm12, [GLOBAL_CV_PTR+4*16]");
  asm ("movaps xmm13, [GLOBAL_CV_PTR+5*16]");
  asm ("movaps xmm14, [GLOBAL_CV_PTR+6*16]");
  asm ("movaps xmm15, [GLOBAL_CV_PTR+7*16]");

  asm ("pshufb xmm8,  xmm0");
  asm ("pshufb xmm9,  xmm0");
  asm ("pshufb xmm10, xmm0");
  asm ("pshufb xmm11, xmm0");
  asm ("pshufb xmm12, xmm0");
  asm ("movdqa xmm1, xmm10"); //3
  asm ("pshufb xmm13, xmm0");
  asm ("movdqa xmm2, xmm12"); //5
  asm ("pshufb xmm14, xmm0");
  asm ("movdqa xmm3, xmm14"); //7
  asm ("pshufb xmm15, xmm0");

  /* continue with unpack using 4 temp registers */
  asm ("movdqa xmm0, xmm8");  //1
  asm ("punpckhwd xmm0,  xmm9");
  asm ("punpcklwd xmm8,  xmm9");
  asm ("punpckhwd xmm1,  xmm11");
  asm ("punpcklwd xmm10, xmm11");
  asm ("punpckhwd xmm2,  xmm13");
  asm ("punpcklwd xmm12, xmm13");
  asm ("punpckhwd xmm3,  xmm15");
  asm ("punpcklwd xmm14, xmm15");

  /* shuffle with immediate */
  asm ("pshufd xmm0,  xmm0,  216"); //1 216d = 11011000b
  asm ("pshufd xmm1,  xmm1,  216"); //3
  asm ("pshufd xmm2,  xmm2,  216"); //5
  asm ("pshufd xmm3,  xmm3,  216"); //7
  asm ("pshufd xmm8,  xmm8,  216"); //0
  asm ("pshufd xmm10, xmm10, 216"); //2
  asm ("pshufd xmm12, xmm12, 216"); //4
  asm ("pshufd xmm14, xmm14, 216"); //6

  /* continue with unpack */
  asm ("movdqa xmm4, xmm8");
  asm ("punpckldq xmm8,  xmm10"); //0
  asm ("punpckhdq xmm4,  xmm10"); //2
  asm ("movdqa xmm5, xmm0");
  asm ("punpckldq xmm0,  xmm1");  //1
  asm ("punpckhdq xmm5,  xmm1");  //3
  asm ("movdqa xmm6, xmm12");
  asm ("punpckldq xmm12, xmm14"); //4
  asm ("movdqa xmm7, xmm2");
  asm ("punpckhdq xmm6,  xmm14"); //6
  asm ("movdqa xmm10, xmm0");
  asm ("punpckldq xmm2,  xmm3");  //5
  asm ("movdqa xmm11, xmm0");
  asm ("punpckhdq xmm7,  xmm3");  //7

  /* there are now 2 rows in each xmm
   * unpack to get 1 row of CV in each xmm */
  asm ("movdqa xmm9, xmm8");
  asm ("punpckhqdq xmm9,  xmm12"); //1
  asm ("punpcklqdq xmm8,  xmm12"); //0
  asm ("movdqa xmm12, xmm4");
  asm ("punpckhqdq xmm11,  xmm2"); //3
  asm ("movdqa xmm13, xmm4");
  asm ("punpcklqdq xmm10,  xmm2"); //2
  asm ("movdqa xmm14, xmm5");
  asm ("punpckhqdq xmm13, xmm6");  //5
  asm ("movdqa xmm15, xmm5");
  asm ("punpcklqdq xmm12, xmm6");  //4
  asm ("punpckhqdq xmm15,  xmm7"); //7
  asm ("punpcklqdq xmm14,  xmm7"); //6
  /* transpose done */

  asm ("movaps [GLOBAL_CV_PTR+0*16], xmm8");
  asm ("movaps [GLOBAL_CV_PTR+1*16], xmm9");
  asm ("movaps [GLOBAL_CV_PTR+2*16], xmm10");
  asm ("movaps [GLOBAL_CV_PTR+3*16], xmm11");
  asm ("movaps [GLOBAL_CV_PTR+4*16], xmm12");
  asm ("movaps [GLOBAL_CV_PTR+5*16], xmm13");
  asm ("movaps [GLOBAL_CV_PTR+6*16], xmm14");
  asm ("movaps [GLOBAL_CV_PTR+7*16], xmm15");

  asm volatile ("emms");
  asm (".att_syntax noprefix");
}

void TF1024AES(u64* message)
{
  /*  Note : message is in rdi thanks to the  */
  /*  __cdecl calling convention    */
  asm (".intel_syntax noprefix");
  Push_All_Regs();

  /* load message into registers xmm12 - xmm15 (Q = message) */
  asm ("movaps xmm0,  [TRANSP_MASK]");
  asm ("movaps xmm8,  [rdi+0*16]");
  asm ("movaps xmm9,  [rdi+1*16]");
  asm ("movaps xmm10, [rdi+2*16]");
  asm ("movaps xmm11, [rdi+3*16]");
  asm ("movaps xmm12, [rdi+4*16]");
  asm ("movaps xmm13, [rdi+5*16]");
  asm ("movaps xmm14, [rdi+6*16]");
  asm ("movaps xmm15, [rdi+7*16]");

  asm ("pshufb xmm8,  xmm0");
  asm ("pshufb xmm9,  xmm0");
  asm ("pshufb xmm10, xmm0");
  asm ("pshufb xmm11, xmm0");
  asm ("pshufb xmm12, xmm0");
  asm ("movdqa xmm1, xmm10"); //3
  asm ("pshufb xmm13, xmm0");
  asm ("movdqa xmm2, xmm12"); //5
  asm ("pshufb xmm14, xmm0");
  asm ("movdqa xmm3, xmm14"); //7
  asm ("pshufb xmm15, xmm0");

  /* continue with unpack using 4 temp registers */
  asm ("movdqa xmm0, xmm8");  //1
  asm ("punpckhwd xmm0,  xmm9");
  asm ("punpcklwd xmm8,  xmm9");
  asm ("punpckhwd xmm1,  xmm11");
  asm ("punpcklwd xmm10, xmm11");
  asm ("punpckhwd xmm2,  xmm13");
  asm ("punpcklwd xmm12, xmm13");
  asm ("punpckhwd xmm3,  xmm15");
  asm ("punpcklwd xmm14, xmm15");

  /* shuffle with immediate */
  asm ("pshufd xmm0,  xmm0,  216"); //1 216d = 11011000b
  asm ("pshufd xmm1,  xmm1,  216"); //3
  asm ("pshufd xmm2,  xmm2,  216"); //5
  asm ("pshufd xmm3,  xmm3,  216"); //7
  asm ("pshufd xmm8,  xmm8,  216"); //0
  asm ("pshufd xmm10, xmm10, 216"); //2
  asm ("pshufd xmm12, xmm12, 216"); //4
  asm ("pshufd xmm14, xmm14, 216"); //6

  /* continue with unpack */
  asm ("movdqa xmm4, xmm8");
  asm ("punpckldq xmm8,  xmm10"); //0
  asm ("punpckhdq xmm4,  xmm10"); //2
  asm ("movdqa xmm5, xmm0");
  asm ("punpckldq xmm0,  xmm1");  //1
  asm ("punpckhdq xmm5,  xmm1");  //3
  asm ("movdqa xmm6, xmm12");
  asm ("punpckldq xmm12, xmm14"); //4
  asm ("movdqa xmm7, xmm2");
  asm ("punpckhdq xmm6,  xmm14"); //6
  asm ("movdqa xmm10, xmm0");
  asm ("punpckldq xmm2,  xmm3");  //5
  asm ("movdqa xmm11, xmm0");
  asm ("punpckhdq xmm7,  xmm3");  //7

  /* there are now 2 rows in each xmm
   * unpack to get 1 row of CV in each xmm */
  asm ("movdqa xmm9, xmm8");
  asm ("punpckhqdq xmm9,  xmm12"); //1
  asm ("punpcklqdq xmm8,  xmm12"); //0
  asm ("movdqa xmm12, xmm4");
  asm ("punpckhqdq xmm11,  xmm2"); //3
  asm ("movdqa xmm13, xmm4");
  asm ("punpcklqdq xmm10,  xmm2"); //2
  asm ("movdqa xmm14, xmm5");
  asm ("punpckhqdq xmm13, xmm6");  //5
  asm ("movdqa xmm15, xmm5");
  asm ("punpcklqdq xmm12, xmm6");  //4
  asm ("punpckhqdq xmm15,  xmm7"); //7
  asm ("punpcklqdq xmm14,  xmm7"); //6
  /* transpose done */

  /* store Q for later */
  asm ("movaps [QTEMP+0*16], xmm8");
  asm ("movaps [QTEMP+1*16], xmm9");
  asm ("movaps [QTEMP+2*16], xmm10");
  asm ("movaps [QTEMP+3*16], xmm11");
  asm ("movaps [QTEMP+4*16], xmm12");
  asm ("movaps [QTEMP+5*16], xmm13");
  asm ("movaps [QTEMP+6*16], xmm14");
  asm ("movaps [QTEMP+7*16], xmm15");

  /* xor CV to get P */
  asm ("pxor xmm8,  [GLOBAL_CV_PTR+0*16]");
  asm ("pxor xmm9,  [GLOBAL_CV_PTR+1*16]");
  asm ("pxor xmm10, [GLOBAL_CV_PTR+2*16]");
  asm ("pxor xmm11, [GLOBAL_CV_PTR+3*16]");
  asm ("pxor xmm12, [GLOBAL_CV_PTR+4*16]");
  asm ("pxor xmm13, [GLOBAL_CV_PTR+5*16]");
  asm ("pxor xmm14, [GLOBAL_CV_PTR+6*16]");
  asm ("pxor xmm15, [GLOBAL_CV_PTR+7*16]");

  ROUNDS_P();

  /* XOR P to CV */
  asm ("pxor xmm8,  [GLOBAL_CV_PTR+0*16]");
  asm ("pxor xmm9,  [GLOBAL_CV_PTR+1*16]");
  asm ("pxor xmm10, [GLOBAL_CV_PTR+2*16]");
  asm ("pxor xmm11, [GLOBAL_CV_PTR+3*16]");
  asm ("pxor xmm12, [GLOBAL_CV_PTR+4*16]");
  asm ("pxor xmm13, [GLOBAL_CV_PTR+5*16]");
  asm ("pxor xmm14, [GLOBAL_CV_PTR+6*16]");
  asm ("pxor xmm15, [GLOBAL_CV_PTR+7*16]");
  asm ("movaps [GLOBAL_CV_PTR+0*16], xmm8");
  asm ("movaps [GLOBAL_CV_PTR+1*16], xmm9");
  asm ("movaps [GLOBAL_CV_PTR+2*16], xmm10");
  asm ("movaps [GLOBAL_CV_PTR+3*16], xmm11");
  asm ("movaps [GLOBAL_CV_PTR+4*16], xmm12");
  asm ("movaps [GLOBAL_CV_PTR+5*16], xmm13");
  asm ("movaps [GLOBAL_CV_PTR+6*16], xmm14");
  asm ("movaps [GLOBAL_CV_PTR+7*16], xmm15");

  /* restore Q into xmm8-15 */
  asm ("movaps xmm8,  [QTEMP+0*16]");
  asm ("movaps xmm9,  [QTEMP+1*16]");
  asm ("movaps xmm10, [QTEMP+2*16]");
  asm ("movaps xmm11, [QTEMP+3*16]");
  asm ("movaps xmm12, [QTEMP+4*16]");
  asm ("movaps xmm13, [QTEMP+5*16]");
  asm ("movaps xmm14, [QTEMP+6*16]");
  asm ("movaps xmm15, [QTEMP+7*16]");

  ROUNDS_Q();

  /* XOR P to CV */
  asm ("pxor xmm8,  [GLOBAL_CV_PTR+0*16]");
  asm ("pxor xmm9,  [GLOBAL_CV_PTR+1*16]");
  asm ("pxor xmm10, [GLOBAL_CV_PTR+2*16]");
  asm ("pxor xmm11, [GLOBAL_CV_PTR+3*16]");
  asm ("pxor xmm12, [GLOBAL_CV_PTR+4*16]");
  asm ("pxor xmm13, [GLOBAL_CV_PTR+5*16]");
  asm ("pxor xmm14, [GLOBAL_CV_PTR+6*16]");
  asm ("pxor xmm15, [GLOBAL_CV_PTR+7*16]");
  asm ("movaps [GLOBAL_CV_PTR+0*16], xmm8");
  asm ("movaps [GLOBAL_CV_PTR+1*16], xmm9");
  asm ("movaps [GLOBAL_CV_PTR+2*16], xmm10");
  asm ("movaps [GLOBAL_CV_PTR+3*16], xmm11");
  asm ("movaps [GLOBAL_CV_PTR+4*16], xmm12");
  asm ("movaps [GLOBAL_CV_PTR+5*16], xmm13");
  asm ("movaps [GLOBAL_CV_PTR+6*16], xmm14");
  asm ("movaps [GLOBAL_CV_PTR+7*16], xmm15");

  Pop_All_Regs();
  asm (".att_syntax noprefix");
  return;
}

void OF1024AES () {
  asm (".intel_syntax noprefix");
  Push_All_Regs();

  asm ("pxor xmm0, xmm0");

  /* load CV into registers xmm8 - xmm11 (P = CV)*/
  asm ("movaps xmm8,  [GLOBAL_CV_PTR+0*16]");
  asm ("movaps xmm9,  [GLOBAL_CV_PTR+1*16]");
  asm ("movaps xmm10, [GLOBAL_CV_PTR+2*16]");
  asm ("movaps xmm11, [GLOBAL_CV_PTR+3*16]");
  asm ("movaps xmm12, [GLOBAL_CV_PTR+4*16]");
  asm ("movaps xmm13, [GLOBAL_CV_PTR+5*16]");
  asm ("movaps xmm14, [GLOBAL_CV_PTR+6*16]");
  asm ("movaps xmm15, [GLOBAL_CV_PTR+7*16]");

  ROUNDS_P();

  /* xor CV */
  asm ("pxor xmm8,  [GLOBAL_CV_PTR+0*16]");
  asm ("pxor xmm9,  [GLOBAL_CV_PTR+1*16]");
  asm ("pxor xmm10, [GLOBAL_CV_PTR+2*16]");
  asm ("pxor xmm11, [GLOBAL_CV_PTR+3*16]");
  asm ("pxor xmm12, [GLOBAL_CV_PTR+4*16]");
  asm ("pxor xmm13, [GLOBAL_CV_PTR+5*16]");
  asm ("pxor xmm14, [GLOBAL_CV_PTR+6*16]");
  asm ("pxor xmm15, [GLOBAL_CV_PTR+7*16]");

  /*  input is: xmm8-15
   *  transpose matrix to get output format */
  asm ("movdqa xmm0, xmm8");
  asm ("punpcklqdq xmm8,  xmm9");  //0
  asm ("punpckhqdq xmm0,  xmm9");  //4
  asm ("movdqa xmm1, xmm10");
  asm ("punpcklqdq xmm10, xmm11"); //1
  asm ("punpckhqdq xmm1,  xmm11"); //5
  asm ("movdqa xmm2, xmm12");
  asm ("punpcklqdq xmm12, xmm13"); //2
  asm ("punpckhqdq xmm2,  xmm13"); //6
  asm ("movdqa xmm4, [TRANSP_MASK]");
  asm ("movdqa xmm3, xmm14");
  asm ("punpcklqdq xmm14, xmm15"); //3
  asm ("punpckhqdq xmm3,  xmm15"); //7

  /* load transpose mask into a register, because it will be used 8 times */
  asm ("pshufb xmm8,  xmm4");
  asm ("pshufb xmm10, xmm4");
  asm ("pshufb xmm12, xmm4");
  asm ("pshufb xmm14, xmm4");
  asm ("pshufb xmm0,  xmm4");
  asm ("pshufb xmm1,  xmm4");
  asm ("pshufb xmm2,  xmm4");
  asm ("pshufb xmm3,  xmm4");
  /* continue with unpack using 4 temp registers */
  asm ("movdqa xmm5, xmm12"); //3
  asm ("movdqa xmm6, xmm0");  //5
  asm ("movdqa xmm4, xmm8");  //1
  asm ("movdqa xmm7, xmm2");  //7
  asm ("punpckhwd xmm5,  xmm14");
  asm ("punpcklwd xmm12, xmm14");
  asm ("punpckhwd xmm4,  xmm10");
  asm ("punpcklwd xmm8,  xmm10");
  asm ("punpckhwd xmm6,  xmm1");
  asm ("punpcklwd xmm0,  xmm1");
  asm ("punpckhwd xmm7,  xmm3");
  asm ("punpcklwd xmm2,  xmm3");
  /* shuffle with immediate */
  asm ("pshufd xmm4,  xmm4,  216"); //1 216d = 11011000b
  asm ("pshufd xmm5,  xmm5,  216"); //3
  asm ("pshufd xmm6,  xmm6,  216"); //5
  asm ("pshufd xmm7,  xmm7,  216"); //7
  asm ("pshufd xmm8,  xmm8,  216"); //0
  asm ("pshufd xmm12, xmm12, 216"); //2
  asm ("pshufd xmm0,  xmm0,  216"); //4
  asm ("pshufd xmm2,  xmm2,  216"); //6
  /* continue with unpack */
  asm ("movdqa xmm9,  xmm8");
  asm ("movdqa xmm11, xmm4");
  asm ("movdqa xmm13, xmm0");
  asm ("movdqa xmm15, xmm6");
  asm ("punpckhdq xmm9,  xmm12"); //2
  asm ("punpckldq xmm8,  xmm12"); //0
  asm ("punpckhdq xmm11, xmm5");  //3
  asm ("punpckldq xmm4,  xmm5");  //1
  asm ("punpckhdq xmm13, xmm2");  //6
  asm ("punpckldq xmm0,  xmm2");  //4
  asm ("punpckhdq xmm15, xmm7");  //7
  asm ("punpckldq xmm6,  xmm7");  //5
  /* transpose done */

  /* store finished "hash" */
  asm ("movaps [GLOBAL_CV_PTR+0*16], xmm8");
  asm ("movaps [GLOBAL_CV_PTR+1*16], xmm4");
  asm ("movaps [GLOBAL_CV_PTR+2*16], xmm9");
  asm ("movaps [GLOBAL_CV_PTR+3*16], xmm11");
  asm ("movaps [GLOBAL_CV_PTR+4*16], xmm0");
  asm ("movaps [GLOBAL_CV_PTR+5*16], xmm6");
  asm ("movaps [GLOBAL_CV_PTR+6*16], xmm13");
  asm ("movaps [GLOBAL_CV_PTR+7*16], xmm15");

  Pop_All_Regs();
  asm (".att_syntax noprefix");

  return;
}//OF1024AES()
