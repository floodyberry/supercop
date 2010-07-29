/* TF512-aes-ni.h     July 2010
 *
 * Groestl implementation with inline assembly containing sse and aes
 * instructions. Has been tested on an Intel Core i7 620LM.
 *
 * Authors:
 *  Günther A. Roland
 *
 * This code is placed in the public domain
 */

#define SET_CONSTANTS_512(){\
  ((u64*)TRANSP_MASK)[0] = 0x0d0509010c040800ULL;\
  ((u64*)TRANSP_MASK)[1] = 0x0f070b030e060a02ULL;\
  ((u64*)ALL_7F)[0] = 0x7f7f7f7f7f7f7f7fULL;\
  ((u64*)ALL_7F)[1] = 0x7f7f7f7f7f7f7f7fULL;\
  ((u64*)ALL_1B)[0] = 0x1b1b1b1b1b1b1b1bULL;\
  ((u64*)ALL_1B)[1] = 0x1b1b1b1b1b1b1b1bULL;\
	((u64*)SUBSH_MASK)[0] =  0x0b0e0104070a0d00ULL;\
	((u64*)SUBSH_MASK)[1] =  0x0306090c0f020508ULL;\
	((u64*)SUBSH_MASK)[2] =  0x0c0f0205000b0e01ULL;\
	((u64*)SUBSH_MASK)[3] =  0x04070a0d08030609ULL;\
	((u64*)SUBSH_MASK)[4] =  0x0d080306010c0f02ULL;\
	((u64*)SUBSH_MASK)[5] =  0x05000b0e0904070aULL;\
	((u64*)SUBSH_MASK)[6] =  0x0e090407020d0803ULL;\
	((u64*)SUBSH_MASK)[7] =  0x06010c0f0a05000bULL;\
	((u64*)SUBSH_MASK)[8] =  0x0f0a0500030e0904ULL;\
	((u64*)SUBSH_MASK)[9] =  0x07020d080b06010cULL;\
	((u64*)SUBSH_MASK)[10] = 0x080b0601040f0a05ULL;\
	((u64*)SUBSH_MASK)[11] = 0x00030e090c07020dULL;\
	((u64*)SUBSH_MASK)[12] = 0x090c070205080b06ULL;\
	((u64*)SUBSH_MASK)[13] = 0x01040f0a0d00030eULL;\
	((u64*)SUBSH_MASK)[14] = 0x0a0d000306090c07ULL;\
	((u64*)SUBSH_MASK)[15] = 0x0205080b0e01040fULL;\
	for(i = 0; i < ROUNDS; i++)\
	{\
		((u64*)ROUND_P)[2*i+1] = 0x0000000000000000ULL;\
		((u64*)ROUND_P)[2*i+0] = (u64) i;\
		((u64*)ROUND_Q)[2*i+1] = 0x00000000000000ffULL ^ (u64) i;\
		((u64*)ROUND_Q)[2*i+0] = 0x0000000000000000ULL;\
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


/* Round function for round 1,3,... */
#define ROUND_A(i){\
    /* Add Round Constant */\
    asm ("pxor xmm0,  xmm0");\
\
    /* ShiftBytes + SubBytes */\
    asm ("pshufb xmm8,  [SUBSH_MASK+0*16]");\
    asm ("aesenclast xmm8,  xmm0");\
    asm ("pxor xmm15, [ROUND_Q+"tostr(i)"*16]");\
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
    /* 8-bit AVR Algorithm ("Byte-sliced") */\
    /* Part 1: *1 */\
		asm ("movdqa xmm0, xmm10");\
		asm ("pxor xmm1, xmm11");\
		asm ("pxor xmm0, xmm13");\
		asm ("pxor xmm2, xmm14");\
		asm ("pxor xmm3, xmm15");\
		asm ("movdqa xmm6, xmm12");\
		asm ("pxor xmm6, xmm1");\
		asm ("pxor xmm6, xmm0");\
		asm ("pxor xmm1, xmm14");\
		asm ("movdqa xmm4, xmm10");\
		asm ("movaps [TEMP+6*16], xmm6");\
		asm ("pxor xmm4, xmm9");\
		asm ("pxor xmm4, xmm1");\
		asm ("pxor xmm1, xmm13");\
		asm ("movaps [TEMP+4*16], xmm4");\
		asm ("pxor xmm1, xmm15");\
		asm ("movdqa xmm5, xmm11");\
		asm ("movaps [TEMP+1*16], xmm1");\
		asm ("pxor xmm5, xmm10");\
		asm ("pxor xmm5, xmm3");\
		asm ("pxor xmm5, xmm12");\
		asm ("movdqa xmm7, xmm2");\
		asm ("movaps [TEMP+5*16], xmm5");\
		asm ("pxor xmm7, xmm9");\
		asm ("pxor xmm7, xmm11");\
		asm ("pxor xmm7, xmm13");\
		asm ("pxor xmm0, xmm2");\
		asm ("movaps [TEMP+7*16], xmm7");\
		asm ("pxor xmm0, xmm15");\
		asm ("pxor xmm3, xmm8");\
		asm ("movaps [TEMP+0*16], xmm0");\
		asm ("pxor xmm2, xmm3");\
		asm ("pxor xmm3, xmm10");\
		asm ("movaps [TEMP+2*16], xmm2");\
		asm ("pxor xmm3, xmm13");\
		asm ("movaps xmm2, [ALL_1B]");\
		asm ("movaps [TEMP+3*16], xmm3");\
		asm ("movaps xmm3, [ALL_7F]");\
\
    /* store tmp[0-7] in memory */\
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
    /* Part 2: *2 */\
    asm ("movdqa xmm5, xmm10");\
    asm ("movdqa xmm6, xmm8");\
    asm ("movdqa xmm7, xmm12");\
    asm ("movdqa xmm0, xmm9");\
    asm ("pxor xmm5, xmm13");\
    asm ("pxor xmm6, xmm11");\
    asm ("pxor xmm7, xmm14");\
    asm ("pxor xmm0, xmm15");\
    asm ("movdqa xmm3, xmm5");\
    asm ("pxor xmm3, xmm12");\
    asm ("pxor xmm3, xmm6");\
    asm ("pxor xmm6, xmm14");\
    asm ("movdqa xmm1, xmm6");\
    asm ("pxor xmm6, xmm13");\
    asm ("pxor xmm1, xmm9");\
    asm ("pxor xmm6, xmm15");\
    asm ("pxor xmm1, xmm10");\
    asm ("movdqa xmm2, xmm0");\
    asm ("pxor xmm2, xmm10");\
    asm ("pxor xmm2, xmm11");\
    asm ("pxor xmm2, xmm12");\
    asm ("movdqa xmm4, xmm7");\
    asm ("pxor xmm5, xmm7");\
    asm ("pxor xmm4, xmm9");\
    asm ("pxor xmm5, [TEMP+5*16]");\
    asm ("pxor xmm4, xmm11");\
    asm ("pxor xmm5, xmm15");\
    asm ("pxor xmm4, xmm13");\
    asm ("pxor xmm6, [TEMP+6*16]");\
    asm ("pxor xmm0, xmm8");\
    asm ("pxor xmm4, [TEMP+4*16]");\
    asm ("pxor xmm7, xmm0");\
    asm ("pxor xmm7, [TEMP+7*16]");\
    asm ("pxor xmm0, xmm10");\
    asm ("pxor xmm0, [TEMP+0*16]");\
\
    asm ("pxor xmm1, [TEMP+1*16]");\
    asm ("pxor xmm0, xmm13");\
    asm ("movaps [TEMP+1*16], xmm1");\
    asm ("pxor xmm2, [TEMP+2*16]");\
    asm ("movaps [TEMP+2*16], xmm2");\
    asm ("pxor xmm3, [TEMP+3*16]");\
    asm ("movaps [TEMP+3*16], xmm3");\
\
    /* XOR part 1 and 2  and write back xmm0-3 for part 3*/\
    asm ("movaps xmm2, [ALL_1B]");\
    asm ("movaps [TEMP+0*16], xmm0");\
    asm ("movaps xmm3, [ALL_7F]");\
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
    /* Part 3: *4 */\
    /* optimized *4 addition */\
    asm ("movdqa xmm0, xmm8");\
    asm ("pxor xmm0, xmm11");\
    asm ("pxor xmm4, xmm0");\
    asm ("pxor xmm5, xmm0");\
    asm ("movdqa xmm1, xmm9");\
    asm ("pxor xmm1, xmm12");\
    asm ("pxor xmm5, xmm1");\
    asm ("pxor xmm6, xmm1");\
    asm ("movdqa xmm2, xmm10");\
    asm ("pxor xmm2, xmm13");\
    asm ("pxor xmm6, xmm2");\
    asm ("pxor xmm7, xmm2");\
    asm ("movdqa xmm3, xmm10");\
    asm ("pxor xmm3, xmm15");\
    asm ("pxor xmm4, xmm3");\
    asm ("pxor xmm3, [TEMP+3*16]");\
    asm ("movdqa xmm2, xmm9");\
    asm ("pxor xmm2, xmm14");\
    asm ("pxor xmm3, xmm2");\
    asm ("pxor xmm2, [TEMP+2*16]");\
    asm ("movdqa xmm1, xmm8");\
    asm ("pxor xmm1, xmm13");\
    asm ("pxor xmm2, xmm1");\
    asm ("pxor xmm1, [TEMP+1*16]");\
    asm ("movdqa xmm0, xmm12");\
    asm ("pxor xmm0, xmm15");\
    asm ("pxor xmm1, xmm0");\
    asm ("pxor xmm0, [TEMP+0*16]");\
    asm ("movdqa xmm8, xmm11");\
    asm ("pxor xmm8, xmm14");\
    asm ("pxor xmm0, xmm8");\
    asm ("pxor xmm7, xmm8");\
}

/* Round function for round 2,4,... */
#define ROUND_B(i){\
    /* Add Round Constant */\
    asm ("pxor xmm0, [ROUND_P+"tostr(i)"*16]");\
    asm ("pxor xmm8, xmm8");\
\
    /* ShiftBytes + SubBytes */\
    asm ("pshufb xmm0,  [SUBSH_MASK+0*16]");\
    asm ("aesenclast xmm0,  xmm8");\
    asm ("pxor xmm7, [ROUND_Q+"tostr(i)"*16]");\
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
    /* 8-bit AVR Algorithm ("Byte-sliced") */\
    /* Part 1: *1 */\
    asm ("movdqa xmm8, xmm2");\
    asm ("pxor xmm9, xmm3");\
    asm ("pxor xmm8, xmm5");\
    asm ("movdqa xmm14, xmm4");\
    asm ("pxor xmm10, xmm6");\
    asm ("pxor xmm14, xmm9");\
    asm ("pxor xmm11, xmm7");\
    asm ("pxor xmm14, xmm8");\
    asm ("movdqa xmm12, xmm1");\
    asm ("movaps [TEMP+6*16], xmm14");\
    asm ("pxor xmm12, xmm2");\
    asm ("pxor xmm9, xmm6");\
    asm ("movdqa xmm15, xmm10");\
    asm ("pxor xmm12, xmm9");\
    asm ("movdqa xmm13, xmm2");\
    asm ("movaps [TEMP+4*16], xmm12");\
    asm ("pxor xmm9, xmm5");\
    asm ("pxor xmm13, xmm11");\
    asm ("pxor xmm15, xmm1");\
    asm ("pxor xmm9, xmm7");\
    asm ("pxor xmm13, xmm3");\
    asm ("pxor xmm15, xmm3");\
    asm ("movaps [TEMP+1*16], xmm9");\
    asm ("pxor xmm13, xmm4");\
    asm ("movaps [TEMP+5*16], xmm13");\
    asm ("pxor xmm15, xmm5");\
    asm ("movaps [TEMP+7*16], xmm15");\
    asm ("pxor xmm8, xmm10");\
    asm ("pxor xmm8, xmm7");\
    asm ("movaps [TEMP+0*16], xmm8");\
    asm ("pxor xmm11, xmm0");\
    asm ("pxor xmm10, xmm11");\
    asm ("movaps [TEMP+2*16], xmm10");\
    asm ("pxor xmm11, xmm2");\
    asm ("movaps xmm10, [ALL_1B]");\
    asm ("pxor xmm11, xmm5");\
    asm ("movaps [TEMP+3*16], xmm11");\
    asm ("movaps xmm11, [ALL_7F]");\
\
    /* multiply by 2 */\
    MUL2_B(8, 9, 10, 11);\
    MUL2(1, 9, 10, 11);\
    MUL2(2, 9, 10, 11);\
    MUL2(3, 9, 10, 11);\
    MUL2(4, 9, 10, 11);\
    MUL2(5, 9, 10, 11);\
    MUL2(6, 9, 10, 11);\
    MUL2(7, 9, 10, 11);\
    asm ("movdqa xmm0, xmm8");\
\
    /* Part 2: *2 */\
    asm ("movdqa xmm13, xmm2");\
    asm ("movdqa xmm14, xmm8");\
    asm ("movdqa xmm15, xmm4");\
    asm ("movdqa xmm8, xmm1");\
    asm ("pxor xmm13, xmm5");\
    asm ("pxor xmm14, xmm3");\
    asm ("pxor xmm15, xmm6");\
    asm ("pxor xmm8, xmm7");\
    asm ("movdqa xmm11, xmm13");\
    asm ("pxor xmm11, xmm4");\
    asm ("pxor xmm11, xmm14");\
    asm ("pxor xmm14, xmm6");\
    asm ("movdqa xmm9, xmm14");\
    asm ("pxor xmm9, xmm1");\
    asm ("pxor xmm9, xmm2");\
    asm ("pxor xmm14, xmm5");\
    asm ("pxor xmm14, xmm7");\
    asm ("movdqa xmm10, xmm8");\
    asm ("pxor xmm10, xmm2");\
    asm ("pxor xmm10, xmm3");\
    asm ("pxor xmm10, xmm4");\
    asm ("movdqa xmm12, xmm15");\
    asm ("pxor xmm12, xmm1");\
    asm ("pxor xmm12, xmm3");\
    asm ("pxor xmm12, xmm5");\
    asm ("pxor xmm13, xmm15");\
    asm ("pxor xmm13, [TEMP+5*16]");\
    asm ("pxor xmm13, xmm7");\
    asm ("pxor xmm14, [TEMP+6*16]");\
    asm ("pxor xmm8, xmm0");\
    asm ("pxor xmm15, [TEMP+7*16]");\
    asm ("pxor xmm15, xmm8");\
    asm ("pxor xmm12, [TEMP+4*16]");\
    asm ("pxor xmm8, xmm2");\
    asm ("pxor xmm8, [TEMP+0*16]");\
\
    /* XOR part 1 and 2  and write back xmm8-3 for part 3*/\
    asm ("pxor xmm9, [TEMP+1*16]");\
    asm ("pxor xmm8, xmm5");\
    asm ("movaps [TEMP+1*16], xmm9");\
    asm ("pxor xmm10, [TEMP+2*16]");\
    asm ("movaps [TEMP+2*16], xmm10");\
    asm ("pxor xmm11, [TEMP+3*16]");\
    asm ("movaps [TEMP+3*16], xmm11");\
    asm ("movaps xmm10, [ALL_1B]");\
    asm ("movaps [TEMP+0*16], xmm8");\
    asm ("movaps xmm11, [ALL_7F]");\
\
    /* multiply by 2 */\
    MUL2_B(8, 9, 10, 11);\
    MUL2(1, 9, 10, 11);\
    MUL2(2, 9, 10, 11);\
    MUL2(3, 9, 10, 11);\
    MUL2(4, 9, 10, 11);\
    MUL2(5, 9, 10, 11);\
    MUL2(6, 9, 10, 11);\
    MUL2(7, 9, 10, 11);\
    asm ("movdqa xmm0, xmm8");\
\
    /* Part 3: *4 */\
    /* optimized *4 addition */\
    asm ("pxor xmm8, xmm3");\
    asm ("pxor xmm12, xmm8");\
    asm ("pxor xmm13, xmm8");\
    asm ("movdqa xmm9, xmm1");\
    asm ("pxor xmm9, xmm4");\
    asm ("pxor xmm13, xmm9");\
    asm ("pxor xmm14, xmm9");\
    asm ("movdqa xmm10, xmm2");\
    asm ("pxor xmm10, xmm5");\
    asm ("pxor xmm14, xmm10");\
    asm ("pxor xmm15, xmm10");\
    asm ("movdqa xmm11, xmm2");\
    asm ("pxor xmm11, xmm7");\
    asm ("pxor xmm12, xmm11");\
    asm ("pxor xmm11, [TEMP+3*16]");\
    asm ("movdqa xmm10, xmm1");\
    asm ("pxor xmm10, xmm6");\
    asm ("pxor xmm11, xmm10");\
    asm ("pxor xmm10, [TEMP+2*16]");\
    asm ("movdqa xmm9, xmm0");\
    asm ("pxor xmm9, xmm5");\
    asm ("pxor xmm10, xmm9");\
    asm ("pxor xmm9, [TEMP+1*16]");\
    asm ("movdqa xmm8, xmm4");\
    asm ("pxor xmm8, xmm7");\
    asm ("pxor xmm9, xmm8");\
    asm ("pxor xmm8, [TEMP+0*16]");\
    asm ("movdqa xmm0, xmm3");\
    asm ("pxor xmm0, xmm6");\
    asm ("pxor xmm8, xmm0");\
    asm ("pxor xmm15, xmm0");\
}

void INIT_CV()
{
  asm (".intel_syntax noprefix");
  asm volatile ("emms");

  /* load CV (IV) into registers xmm12 - xmm15 */
  asm ("movaps xmm12, [GLOBAL_CV_PTR+0*16]");
  asm ("movaps xmm13, [GLOBAL_CV_PTR+1*16]");
  asm ("movaps xmm14, [GLOBAL_CV_PTR+2*16]");
  asm ("movaps xmm15, [GLOBAL_CV_PTR+3*16]");

  /* transpose matrix to get one line of P AND Q in each xmm */
  /* load transpose mask into a register, because it will be used 8 times */
  asm ("movaps xmm0, [TRANSP_MASK]");
  asm ("pshufb xmm12, xmm0");
  asm ("pshufb xmm13, xmm0");
  asm ("pshufb xmm14, xmm0");
  asm ("pshufb xmm15, xmm0");
  /* continue with unpack using 2 temp registers */
  asm ("movdqa xmm2, xmm12"); //5
  asm ("movdqa xmm3, xmm14"); //7
  asm ("punpckhwd xmm2,  xmm13");
  asm ("punpcklwd xmm12, xmm13");
  asm ("punpckhwd xmm3,  xmm15");
  asm ("punpcklwd xmm14, xmm15");
  /* shuffle with immediate */
  asm ("pshufd xmm2,  xmm2,  216"); //5
  asm ("pshufd xmm3,  xmm3,  216"); //7
  asm ("pshufd xmm12, xmm12, 216"); //4
  asm ("pshufd xmm14, xmm14, 216"); //6
  /* continue with unpack */
  asm ("movdqa xmm6, xmm12");
  asm ("movdqa xmm7, xmm2");
  asm ("punpckhdq xmm6,  xmm14"); //6
  asm ("punpckldq xmm12, xmm14"); //4
  asm ("punpckhdq xmm7,  xmm3");  //7
  asm ("punpckldq xmm2,  xmm3");  //5

  /* store transposed CV */
  asm ("movaps [GLOBAL_CV_PTR+0*16], xmm12");
  asm ("movaps [GLOBAL_CV_PTR+1*16], xmm2");
  asm ("movaps [GLOBAL_CV_PTR+2*16], xmm6");
  asm ("movaps [GLOBAL_CV_PTR+3*16], xmm7");


  asm volatile ("emms");
  asm (".att_syntax noprefix");
}

void TF512AES(u64* message)
{
  /*  Note : message is in rdi thanks to the  */
  /*  __cdecl calling convention    */
  asm (".intel_syntax noprefix");

  /* load message into registers xmm12 - xmm15 (Q = message) */
  asm ("movaps xmm0,  [TRANSP_MASK]");
  asm ("movaps xmm12, [rdi+0*16]");
  asm ("movaps xmm13, [rdi+1*16]");
  asm ("movaps xmm14, [rdi+2*16]");
  asm ("movaps xmm15, [rdi+3*16]");

  /* transpose matrix to get one line of P AND Q in each xmm */
  /* load transpose mask into a register, because it will be used 8 times */
  asm ("pshufb xmm12, xmm0");
  asm ("movdqa xmm2, xmm12"); //5
  asm ("pshufb xmm13, xmm0");
  asm ("pshufb xmm14, xmm0");
  asm ("movdqa xmm3, xmm14"); //7
  asm ("pshufb xmm15, xmm0");
  /* continue with unpack using 4 temp registers */
  asm ("punpckhwd xmm2,  xmm13");
  asm ("punpcklwd xmm12, xmm13");
  asm ("punpckhwd xmm3,  xmm15");
  asm ("punpcklwd xmm14, xmm15");

  /* shuffle with immediate */
  asm ("pshufd xmm2,  xmm2,  216"); //5
  asm ("movdqa xmm7, xmm2");
  asm ("pshufd xmm3,  xmm3,  216"); //7
  asm ("pshufd xmm12, xmm12, 216"); //4
  asm ("movdqa xmm6, xmm12");
  asm ("pshufd xmm14, xmm14, 216"); //6

  /* continue with unpack */
  asm ("punpckhdq xmm7,  xmm3");  //7
  asm ("movaps xmm8, [GLOBAL_CV_PTR+0*16]"); //0
  asm ("punpckldq xmm2,  xmm3");  //5
  asm ("movaps xmm0, [GLOBAL_CV_PTR+1*16]"); //1
  asm ("punpckhdq xmm6,  xmm14"); //6
  asm ("movaps xmm4, [GLOBAL_CV_PTR+2*16]"); //2
  asm ("punpckldq xmm12, xmm14"); //4
  asm ("movaps xmm5, [GLOBAL_CV_PTR+3*16]"); //3

  /* load CV into registers xmm8 - xmm11 (P = CV)*/
  /* xor Q to P to get P = h ^ m */
  asm ("pxor xmm8, xmm12");
  asm ("pxor xmm0, xmm2");
  asm ("pxor xmm4, xmm6");
  asm ("movdqa xmm9, xmm8");
  asm ("pxor xmm5, xmm7");
  asm ("movdqa xmm10, xmm0");

  /* there are now 2 rows in each xmm
   * unpack to get 1 row of P and Q in each xmm */
  asm ("punpckhqdq xmm9,  xmm12"); //1
  asm ("movdqa xmm11, xmm0");
  asm ("punpcklqdq xmm8,  xmm12"); //0
  asm ("movdqa xmm13, xmm4");
  asm ("movdqa xmm12, xmm4");
  asm ("punpckhqdq xmm11,  xmm2"); //3
  asm ("punpcklqdq xmm10,  xmm2"); //2
  asm ("movdqa xmm15, xmm5");
  asm ("punpckhqdq xmm13, xmm6");  //5
  asm ("movdqa xmm14, xmm5");
  asm ("punpcklqdq xmm12, xmm6");  //4
  asm ("punpckhqdq xmm15,  xmm7"); //7
  asm ("punpcklqdq xmm14,  xmm7"); //6
  /* transpose done */

  ROUND_A(0);
  ROUND_B(1);
  asm ("pxor xmm8,  [ROUND_P+"tostr(2)"*16]");\
  ROUND_A(2);
  ROUND_B(3);
  asm ("pxor xmm8,  [ROUND_P+"tostr(4)"*16]");\
  ROUND_A(4);
  ROUND_B(5);
  asm ("pxor xmm8,  [ROUND_P+"tostr(6)"*16]");\
  ROUND_A(6);
  ROUND_B(7);
  asm ("pxor xmm8,  [ROUND_P+"tostr(8)"*16]");\
  ROUND_A(8);
  ROUND_B(9);

  /* transpose matrix to get back input format */
  asm ("movdqa xmm0, xmm8");  // [Q(0), P(0)]
  asm ("punpckhqdq xmm0,  xmm9");  // = [Q(1), Q(0)]
  asm ("punpcklqdq xmm8,  xmm9");  // = [P(1), P(0)]
  asm ("movdqa xmm1, xmm10"); // [Q(2), P(2)]
  asm ("punpckhqdq xmm1,  xmm11"); // = [Q(3), Q(2)]
  asm ("punpcklqdq xmm10, xmm11"); // = [P(3), P(2)]
  asm ("movdqa xmm2, xmm12"); // [Q(4), P(4)]
  asm ("punpckhqdq xmm2,  xmm13"); // = [Q(5), Q(4)]
  asm ("punpcklqdq xmm12, xmm13"); // = [P(5), P(4)]
  asm ("movdqa xmm3, xmm14"); // [Q(6), P(6)]
  asm ("punpckhqdq xmm3,  xmm15"); // = [Q(7), Q(6)]
  asm ("punpcklqdq xmm14, xmm15"); // = [P(7), P(6)]

  /* xor P and Q */
  asm ("pxor xmm0, xmm8");
  asm ("pxor xmm1, xmm10");
  asm ("pxor xmm2, xmm12");
  asm ("pxor xmm3, xmm14");

  /* xor CV */
  asm ("pxor xmm0, [GLOBAL_CV_PTR+0*16]");
  asm ("pxor xmm1, [GLOBAL_CV_PTR+1*16]");
  asm ("pxor xmm2, [GLOBAL_CV_PTR+2*16]");
  asm ("pxor xmm3, [GLOBAL_CV_PTR+3*16]");

  /* store finished CV */
  asm ("movaps [GLOBAL_CV_PTR+0*16], xmm0");
  asm ("movaps [GLOBAL_CV_PTR+1*16], xmm1");
  asm ("movaps [GLOBAL_CV_PTR+2*16], xmm2");
  asm ("movaps [GLOBAL_CV_PTR+3*16], xmm3");

  asm (".att_syntax noprefix");
  return;
}

void OF512AES () {
  asm (".intel_syntax noprefix");

  asm ("pxor xmm0, xmm0");

  /* load CV into registers xmm8 - xmm11 (P = CV)*/
  asm ("movaps xmm8,  [GLOBAL_CV_PTR+0*16]");
  asm ("movaps xmm10, [GLOBAL_CV_PTR+1*16]");
  asm ("movaps xmm12, [GLOBAL_CV_PTR+2*16]");
  asm ("movaps xmm14, [GLOBAL_CV_PTR+3*16]");

  /* there are now 2 rows in each xmm
   * unpack to get 1 row of P and Q in each xmm */
  asm ("movdqa xmm9, xmm8");
  asm ("movdqa xmm11, xmm10");
  asm ("movdqa xmm13, xmm12");
  asm ("movdqa xmm15, xmm14");
  asm ("punpcklqdq xmm8,  xmm0");  // = [*, 8L(0)]
  asm ("punpckhqdq xmm9,  xmm0");  // = [*, 8H(1)]
  asm ("punpcklqdq xmm10, xmm0");  // = [*, 9L(2)]
  asm ("punpckhqdq xmm11, xmm0");  // = [*, 9H(3)]
  asm ("punpcklqdq xmm12, xmm0");  // = [*,10L(4)]
  asm ("punpckhqdq xmm13, xmm0");  // = [*,10H(5)]
  asm ("punpcklqdq xmm14, xmm0");  // = [*,11L(6)]
  asm ("punpckhqdq xmm15, xmm0");  // = [*,11H(7)]
  /* transpose done */

  ROUND_A(0);
  ROUND_B(1);
  asm ("pxor xmm8,  [ROUND_P+"tostr(2)"*16]");\
  ROUND_A(2);
  ROUND_B(3);
  asm ("pxor xmm8,  [ROUND_P+"tostr(4)"*16]");\
  ROUND_A(4);
  ROUND_B(5);
  asm ("pxor xmm8,  [ROUND_P+"tostr(6)"*16]");\
  ROUND_A(6);
  ROUND_B(7);
  asm ("pxor xmm8,  [ROUND_P+"tostr(8)"*16]");\
  ROUND_A(8);
  ROUND_B(9);


  /* transpose matrix to get back input format */
  asm ("movaps xmm4, [TRANSP_MASK]");
  asm ("punpcklqdq xmm8,  xmm9");  // = [(1), (0)]
  asm ("punpcklqdq xmm10, xmm11"); // = [(3), (2)]
  asm ("punpcklqdq xmm12, xmm13"); // = [(5), (4)]
  asm ("punpcklqdq xmm14, xmm15"); // = [(7), (6)]

  /* xor CV */
  asm ("pxor xmm8,  [GLOBAL_CV_PTR+0*16]");
  asm ("pxor xmm10, [GLOBAL_CV_PTR+1*16]");
  asm ("pxor xmm12, [GLOBAL_CV_PTR+2*16]");
  asm ("pxor xmm14, [GLOBAL_CV_PTR+3*16]");

  /* load transpose mask into a register, because it will be used 8 times */
  asm ("pshufb xmm8,  xmm4");
  asm ("pshufb xmm10, xmm4");
  asm ("pshufb xmm12, xmm4");
  asm ("pshufb xmm14, xmm4");
  /* continue with unpack using 4 temp registers */
  asm ("movdqa xmm4, xmm8");  //1
  asm ("movdqa xmm5, xmm12"); //3
  asm ("punpcklwd xmm8,  xmm10");
  asm ("punpcklwd xmm12, xmm14");
  asm ("punpckhwd xmm4,  xmm10");
  asm ("punpckhwd xmm5,  xmm14");
  /* shuffle with immediate */
  asm ("pshufd xmm8,  xmm8,  216"); //0
  asm ("pshufd xmm12, xmm12, 216"); //2
  asm ("pshufd xmm4,  xmm4,  216"); //1 216d = 11011000b
  asm ("pshufd xmm5,  xmm5,  216"); //3
  /* continue with unpack */
  asm ("movdqa xmm9,  xmm8");
  asm ("movdqa xmm11, xmm4");
  asm ("punpckhdq xmm9,  xmm12"); //2
  asm ("punpckldq xmm8,  xmm12"); //0
  asm ("punpckhdq xmm11, xmm5");  //3
  asm ("punpckldq xmm4,  xmm5");  //1
  /* transpose done */

  /* store finished CV */
  asm ("movaps [GLOBAL_CV_PTR+0*16], xmm8");
  asm ("movaps [GLOBAL_CV_PTR+1*16], xmm4");
  asm ("movaps [GLOBAL_CV_PTR+2*16], xmm9");
  asm ("movaps [GLOBAL_CV_PTR+3*16], xmm11");

  asm (".att_syntax noprefix");

  return;
}//OF512AES()

