#include "crypto_hash.h"

/*
 * This code is from the SHABAL submission to the NIST SHA-3 competition.
 * It was adapted to the eBASH API (which relies on SUPERCOP).
 *
 * (c) 2008,2009 SAPHIR project. This software is provided 'as-is', without
 * any express or implied warranty. In no event will the authors be held
 * liable for any damages arising from the use of this software.
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to no restriction.
 *
 * Technical remarks and questions can be addressed to:
 * <thomas.pornin@cryptolog.com>
 */

#include <stddef.h>
#include <string.h>

/*
 * SUPERCOP provides a header with a "proper" 32-bit integer.
 */
#include "crypto_uint32.h"

typedef crypto_uint32 shabal_word32;

#define SHABAL_BLOCK_SIZE   16
#ifndef SHABAL_PARAM_R
#define SHABAL_PARAM_R      12
#endif

/*
 * State structure for Shabal. A structure instance holds the running
 * state for a hash computation. The function implementation is
 * thread-safe and reentrant, as long as the different has computations
 * use distinct instances of this structure. State structures are
 * meant to be allocated by the caller; allocation can be performed
 * in any suitable memory area, including local variables, global
 * variables, and the heap. The structure contains no pointer value
 * and thus can be moved, duplicated (with memcpy()) or serialized
 * at will. In particular, making a copy of a structure instance takes
 * a "snapshot" of the hash computation at that point, which can be
 * resumed later on with alternate subsequence input data.
 *
 * The "hashbitlen" field contains the intended output length, in bits.
 * It is initialized in the Init() function. The other fields are private
 * and should not be accessed externally.
 */
typedef struct {
	unsigned char buffer[SHABAL_BLOCK_SIZE * 4];
	size_t buffer_ptr;
	unsigned last_byte_significant_bits;
	int hashbitlen;
	shabal_word32 A[SHABAL_PARAM_R];
	shabal_word32 B[SHABAL_BLOCK_SIZE];
	shabal_word32 C[SHABAL_BLOCK_SIZE];
	shabal_word32 Whigh, Wlow;
} shabal512_state;

/*
 * Part of this code was automatically generated (the part between
 * the "BEGIN" and "END" markers). See optgen.c for details.
 */

/*
 * If the "p" and "e" parameters are modified for research purpose,
 * the the automatic code generation program must be run again.
 */
#ifndef SHABAL_PARAM_P
#define SHABAL_PARAM_P   3
#endif
#ifndef SHABAL_PARAM_E
#define SHABAL_PARAM_E   3
#endif

#if SHABAL_BLOCK_SIZE != 16
#error Non-standard block size; this code is not valid
#endif
#define sM    SHABAL_BLOCK_SIZE
#define u32   shabal_word32

/*
 * We perform explicit truncations to 32 bits. This is necessary on some
 * quite exotic platforms, where the "u32" type turns out to have more
 * than 32 bits. On the more common platforms where "u32" has exactly
 * 32 bits, then the compiler is smart enough to notice that T32() has
 * no effect.
 */
#define C32(x)   ((u32)x ## UL)
#define T32(x)   ((x) & C32(0xFFFFFFFF))

#define O1   13
#define O2    9
#define O3    6

/*
 * C compilers following the current C standard (ISO 9899:1999), and
 * older GNU C compiler versions, understand the "inline" keyword.
 * Old Microsoft Visual C compilers know it under the "__inline"
 * keyword. For other compilers, we just rely on the compiler to
 * guess which calls should be inlined.
 */
#if (defined __STDC__ && __STDC_VERSION__ >= 199901L) || defined __GNUC__
#define INLINE inline
#elif defined _MSC_VER
#define INLINE __inline
#else
#define INLINE
#endif

/*
 * Decode a 32-bit word with little-endian convention, assuming that
 * the input data is correctly aligned for a direct 32-bit access
 * (alignment is the reason why we defined the "buffer[]" array to be the
 * first field in the "shabal512_state" structure).
 *
 * On x86 processors (either in 32-bit or 64-bit mode), we know that
 * the local convention is little-endian, hence we ca perform a
 * direct access. On SPARC v9 processors, convention is big-endian but
 * there are special opcodes for little-endian access, which we use
 * here (only if using GNU C, because we use inline assembly with a
 * syntax specific to GNU C). On all other platforms, the generic code
 * works. This could be enhanced with specific code for other platforms
 * and compilers. Note that message decoding does not contribute much
 * to the overall computation speed.
 */
static INLINE u32
dec32le_aligned(const void *src)
{
#if defined __i386__ || defined __x86_64
	return *(const u32 *)src;
#elif defined __GNUC__ && defined __sparcv9 && !defined SHABAL_NO_ASM
	u32 tmp;

	__asm__ __volatile__ (
		"lda [%1]0x88,%0" : "=r" (tmp) : "r" (src));
	return tmp;
#else
	return (u32)(((const unsigned char *)src)[0])
		| ((u32)(((const unsigned char *)src)[1]) << 8)
		| ((u32)(((const unsigned char *)src)[2]) << 16)
		| ((u32)(((const unsigned char *)src)[3]) << 24);
#endif
}

/*
 * Encode a 32-bit word into bytes, using little-endian convention.
 * This works regardless of the data alignment. We do not optimize
 * this function since it is used only at the end of the hash
 * computation, to encode the output.
 */
static INLINE void
enc32le(void *dst, u32 val)
{
	((unsigned char *)dst)[0] = val;
	((unsigned char *)dst)[1] = val >> 8;
	((unsigned char *)dst)[2] = val >> 16;
	((unsigned char *)dst)[3] = val >> 24;
}

/*
 * We copy the state into local variables, so that the compiler knows
 * that it can optimize them at will.
 */

/* BEGIN -- automatically generated code. */

#if SHABAL_PARAM_P != 3 || SHABAL_PARAM_R != 12
#error Parameters changed; code below is not valid
#endif

#define DECL_STATE   \
	u32 A00, A01, A02, A03, A04, A05, A06, A07, \
	    A08, A09, A0A, A0B; \
	u32 B0, B1, B2, B3, B4, B5, B6, B7, \
	    B8, B9, BA, BB, BC, BD, BE, BF; \
	u32 C0, C1, C2, C3, C4, C5, C6, C7, \
	    C8, C9, CA, CB, CC, CD, CE, CF; \
	u32 M0, M1, M2, M3, M4, M5, M6, M7, \
	    M8, M9, MA, MB, MC, MD, ME, MF; \
	u32 Wlow, Whigh;

#define READ_STATE(state)   do { \
		A00 = (state)->A[0]; \
		A01 = (state)->A[1]; \
		A02 = (state)->A[2]; \
		A03 = (state)->A[3]; \
		A04 = (state)->A[4]; \
		A05 = (state)->A[5]; \
		A06 = (state)->A[6]; \
		A07 = (state)->A[7]; \
		A08 = (state)->A[8]; \
		A09 = (state)->A[9]; \
		A0A = (state)->A[10]; \
		A0B = (state)->A[11]; \
		B0 = (state)->B[0]; \
		B1 = (state)->B[1]; \
		B2 = (state)->B[2]; \
		B3 = (state)->B[3]; \
		B4 = (state)->B[4]; \
		B5 = (state)->B[5]; \
		B6 = (state)->B[6]; \
		B7 = (state)->B[7]; \
		B8 = (state)->B[8]; \
		B9 = (state)->B[9]; \
		BA = (state)->B[10]; \
		BB = (state)->B[11]; \
		BC = (state)->B[12]; \
		BD = (state)->B[13]; \
		BE = (state)->B[14]; \
		BF = (state)->B[15]; \
		C0 = (state)->C[0]; \
		C1 = (state)->C[1]; \
		C2 = (state)->C[2]; \
		C3 = (state)->C[3]; \
		C4 = (state)->C[4]; \
		C5 = (state)->C[5]; \
		C6 = (state)->C[6]; \
		C7 = (state)->C[7]; \
		C8 = (state)->C[8]; \
		C9 = (state)->C[9]; \
		CA = (state)->C[10]; \
		CB = (state)->C[11]; \
		CC = (state)->C[12]; \
		CD = (state)->C[13]; \
		CE = (state)->C[14]; \
		CF = (state)->C[15]; \
		Wlow = (state)->Wlow; \
		Whigh = (state)->Whigh; \
	} while (0)

#define WRITE_STATE(state)   do { \
		(state)->A[0] = A00; \
		(state)->A[1] = A01; \
		(state)->A[2] = A02; \
		(state)->A[3] = A03; \
		(state)->A[4] = A04; \
		(state)->A[5] = A05; \
		(state)->A[6] = A06; \
		(state)->A[7] = A07; \
		(state)->A[8] = A08; \
		(state)->A[9] = A09; \
		(state)->A[10] = A0A; \
		(state)->A[11] = A0B; \
		(state)->B[0] = B0; \
		(state)->B[1] = B1; \
		(state)->B[2] = B2; \
		(state)->B[3] = B3; \
		(state)->B[4] = B4; \
		(state)->B[5] = B5; \
		(state)->B[6] = B6; \
		(state)->B[7] = B7; \
		(state)->B[8] = B8; \
		(state)->B[9] = B9; \
		(state)->B[10] = BA; \
		(state)->B[11] = BB; \
		(state)->B[12] = BC; \
		(state)->B[13] = BD; \
		(state)->B[14] = BE; \
		(state)->B[15] = BF; \
		(state)->C[0] = C0; \
		(state)->C[1] = C1; \
		(state)->C[2] = C2; \
		(state)->C[3] = C3; \
		(state)->C[4] = C4; \
		(state)->C[5] = C5; \
		(state)->C[6] = C6; \
		(state)->C[7] = C7; \
		(state)->C[8] = C8; \
		(state)->C[9] = C9; \
		(state)->C[10] = CA; \
		(state)->C[11] = CB; \
		(state)->C[12] = CC; \
		(state)->C[13] = CD; \
		(state)->C[14] = CE; \
		(state)->C[15] = CF; \
		(state)->Wlow = Wlow; \
		(state)->Whigh = Whigh; \
	} while (0)

#define DECODE_BLOCK   do { \
		M0 = dec32le_aligned(buffer + 0); \
		M1 = dec32le_aligned(buffer + 4); \
		M2 = dec32le_aligned(buffer + 8); \
		M3 = dec32le_aligned(buffer + 12); \
		M4 = dec32le_aligned(buffer + 16); \
		M5 = dec32le_aligned(buffer + 20); \
		M6 = dec32le_aligned(buffer + 24); \
		M7 = dec32le_aligned(buffer + 28); \
		M8 = dec32le_aligned(buffer + 32); \
		M9 = dec32le_aligned(buffer + 36); \
		MA = dec32le_aligned(buffer + 40); \
		MB = dec32le_aligned(buffer + 44); \
		MC = dec32le_aligned(buffer + 48); \
		MD = dec32le_aligned(buffer + 52); \
		ME = dec32le_aligned(buffer + 56); \
		MF = dec32le_aligned(buffer + 60); \
	} while (0)

#define INPUT_BLOCK_ADD   do { \
		B0 = T32(B0 + M0); \
		B1 = T32(B1 + M1); \
		B2 = T32(B2 + M2); \
		B3 = T32(B3 + M3); \
		B4 = T32(B4 + M4); \
		B5 = T32(B5 + M5); \
		B6 = T32(B6 + M6); \
		B7 = T32(B7 + M7); \
		B8 = T32(B8 + M8); \
		B9 = T32(B9 + M9); \
		BA = T32(BA + MA); \
		BB = T32(BB + MB); \
		BC = T32(BC + MC); \
		BD = T32(BD + MD); \
		BE = T32(BE + ME); \
		BF = T32(BF + MF); \
	} while (0)

#define INPUT_BLOCK_SUB   do { \
		C0 = T32(C0 - M0); \
		C1 = T32(C1 - M1); \
		C2 = T32(C2 - M2); \
		C3 = T32(C3 - M3); \
		C4 = T32(C4 - M4); \
		C5 = T32(C5 - M5); \
		C6 = T32(C6 - M6); \
		C7 = T32(C7 - M7); \
		C8 = T32(C8 - M8); \
		C9 = T32(C9 - M9); \
		CA = T32(CA - MA); \
		CB = T32(CB - MB); \
		CC = T32(CC - MC); \
		CD = T32(CD - MD); \
		CE = T32(CE - ME); \
		CF = T32(CF - MF); \
	} while (0)

#define XOR_W   do { \
		A00 ^= Wlow; \
		A01 ^= Whigh; \
	} while (0)

#define SWAP(v1, v2)   do { \
		u32 tmp = (v1); \
		(v1) = (v2); \
		(v2) = tmp; \
	} while (0)

#define SWAP_BC   do { \
		SWAP(B0, C0); \
		SWAP(B1, C1); \
		SWAP(B2, C2); \
		SWAP(B3, C3); \
		SWAP(B4, C4); \
		SWAP(B5, C5); \
		SWAP(B6, C6); \
		SWAP(B7, C7); \
		SWAP(B8, C8); \
		SWAP(B9, C9); \
		SWAP(BA, CA); \
		SWAP(BB, CB); \
		SWAP(BC, CC); \
		SWAP(BD, CD); \
		SWAP(BE, CE); \
		SWAP(BF, CF); \
	} while (0)

#define PERM_ELT(xa0, xa1, xb0, xb1, xb2, xb3, xc, xm)   do { \
		xa0 = T32((xa0 \
			^ (((xa1 << 15) | (xa1 >> 17)) * 5U) \
			^ xc) * 3U) \
			^ xb1 ^ (xb2 & ~xb3) ^ xm; \
		xb0 = T32(~(((xb0 << 1) | (xb0 >> 31)) ^ xa0)); \
	} while (0)

#define PERM_STEP_0   do { \
		PERM_ELT(A00, A0B, B0, BD, B9, B6, C8, M0); \
		PERM_ELT(A01, A00, B1, BE, BA, B7, C7, M1); \
		PERM_ELT(A02, A01, B2, BF, BB, B8, C6, M2); \
		PERM_ELT(A03, A02, B3, B0, BC, B9, C5, M3); \
		PERM_ELT(A04, A03, B4, B1, BD, BA, C4, M4); \
		PERM_ELT(A05, A04, B5, B2, BE, BB, C3, M5); \
		PERM_ELT(A06, A05, B6, B3, BF, BC, C2, M6); \
		PERM_ELT(A07, A06, B7, B4, B0, BD, C1, M7); \
		PERM_ELT(A08, A07, B8, B5, B1, BE, C0, M8); \
		PERM_ELT(A09, A08, B9, B6, B2, BF, CF, M9); \
		PERM_ELT(A0A, A09, BA, B7, B3, B0, CE, MA); \
		PERM_ELT(A0B, A0A, BB, B8, B4, B1, CD, MB); \
		PERM_ELT(A00, A0B, BC, B9, B5, B2, CC, MC); \
		PERM_ELT(A01, A00, BD, BA, B6, B3, CB, MD); \
		PERM_ELT(A02, A01, BE, BB, B7, B4, CA, ME); \
		PERM_ELT(A03, A02, BF, BC, B8, B5, C9, MF); \
	} while (0)

#define PERM_STEP_1   do { \
		PERM_ELT(A04, A03, B0, BD, B9, B6, C8, M0); \
		PERM_ELT(A05, A04, B1, BE, BA, B7, C7, M1); \
		PERM_ELT(A06, A05, B2, BF, BB, B8, C6, M2); \
		PERM_ELT(A07, A06, B3, B0, BC, B9, C5, M3); \
		PERM_ELT(A08, A07, B4, B1, BD, BA, C4, M4); \
		PERM_ELT(A09, A08, B5, B2, BE, BB, C3, M5); \
		PERM_ELT(A0A, A09, B6, B3, BF, BC, C2, M6); \
		PERM_ELT(A0B, A0A, B7, B4, B0, BD, C1, M7); \
		PERM_ELT(A00, A0B, B8, B5, B1, BE, C0, M8); \
		PERM_ELT(A01, A00, B9, B6, B2, BF, CF, M9); \
		PERM_ELT(A02, A01, BA, B7, B3, B0, CE, MA); \
		PERM_ELT(A03, A02, BB, B8, B4, B1, CD, MB); \
		PERM_ELT(A04, A03, BC, B9, B5, B2, CC, MC); \
		PERM_ELT(A05, A04, BD, BA, B6, B3, CB, MD); \
		PERM_ELT(A06, A05, BE, BB, B7, B4, CA, ME); \
		PERM_ELT(A07, A06, BF, BC, B8, B5, C9, MF); \
	} while (0)

#define PERM_STEP_2   do { \
		PERM_ELT(A08, A07, B0, BD, B9, B6, C8, M0); \
		PERM_ELT(A09, A08, B1, BE, BA, B7, C7, M1); \
		PERM_ELT(A0A, A09, B2, BF, BB, B8, C6, M2); \
		PERM_ELT(A0B, A0A, B3, B0, BC, B9, C5, M3); \
		PERM_ELT(A00, A0B, B4, B1, BD, BA, C4, M4); \
		PERM_ELT(A01, A00, B5, B2, BE, BB, C3, M5); \
		PERM_ELT(A02, A01, B6, B3, BF, BC, C2, M6); \
		PERM_ELT(A03, A02, B7, B4, B0, BD, C1, M7); \
		PERM_ELT(A04, A03, B8, B5, B1, BE, C0, M8); \
		PERM_ELT(A05, A04, B9, B6, B2, BF, CF, M9); \
		PERM_ELT(A06, A05, BA, B7, B3, B0, CE, MA); \
		PERM_ELT(A07, A06, BB, B8, B4, B1, CD, MB); \
		PERM_ELT(A08, A07, BC, B9, B5, B2, CC, MC); \
		PERM_ELT(A09, A08, BD, BA, B6, B3, CB, MD); \
		PERM_ELT(A0A, A09, BE, BB, B7, B4, CA, ME); \
		PERM_ELT(A0B, A0A, BF, BC, B8, B5, C9, MF); \
	} while (0)

#define APPLY_P   do { \
		B0 = T32(B0 << 17) | (B0 >> 15); \
		B1 = T32(B1 << 17) | (B1 >> 15); \
		B2 = T32(B2 << 17) | (B2 >> 15); \
		B3 = T32(B3 << 17) | (B3 >> 15); \
		B4 = T32(B4 << 17) | (B4 >> 15); \
		B5 = T32(B5 << 17) | (B5 >> 15); \
		B6 = T32(B6 << 17) | (B6 >> 15); \
		B7 = T32(B7 << 17) | (B7 >> 15); \
		B8 = T32(B8 << 17) | (B8 >> 15); \
		B9 = T32(B9 << 17) | (B9 >> 15); \
		BA = T32(BA << 17) | (BA >> 15); \
		BB = T32(BB << 17) | (BB >> 15); \
		BC = T32(BC << 17) | (BC >> 15); \
		BD = T32(BD << 17) | (BD >> 15); \
		BE = T32(BE << 17) | (BE >> 15); \
		BF = T32(BF << 17) | (BF >> 15); \
		PERM_STEP_0; \
		PERM_STEP_1; \
		PERM_STEP_2; \
		A0B = T32(A0B + C6); \
		A0A = T32(A0A + C5); \
		A09 = T32(A09 + C4); \
		A08 = T32(A08 + C3); \
		A07 = T32(A07 + C2); \
		A06 = T32(A06 + C1); \
		A05 = T32(A05 + C0); \
		A04 = T32(A04 + CF); \
		A03 = T32(A03 + CE); \
		A02 = T32(A02 + CD); \
		A01 = T32(A01 + CC); \
		A00 = T32(A00 + CB); \
		A0B = T32(A0B + CA); \
		A0A = T32(A0A + C9); \
		A09 = T32(A09 + C8); \
		A08 = T32(A08 + C7); \
		A07 = T32(A07 + C6); \
		A06 = T32(A06 + C5); \
		A05 = T32(A05 + C4); \
		A04 = T32(A04 + C3); \
		A03 = T32(A03 + C2); \
		A02 = T32(A02 + C1); \
		A01 = T32(A01 + C0); \
		A00 = T32(A00 + CF); \
		A0B = T32(A0B + CE); \
		A0A = T32(A0A + CD); \
		A09 = T32(A09 + CC); \
		A08 = T32(A08 + CB); \
		A07 = T32(A07 + CA); \
		A06 = T32(A06 + C9); \
		A05 = T32(A05 + C8); \
		A04 = T32(A04 + C7); \
		A03 = T32(A03 + C6); \
		A02 = T32(A02 + C5); \
		A01 = T32(A01 + C4); \
		A00 = T32(A00 + C3); \
	} while (0)

#define INCR_W   do { \
		if ((Wlow = T32(Wlow + 1)) == 0) \
			Whigh = T32(Whigh + 1); \
	} while (0)

static const u32 A_init_512[] = {
	C32(0x20728DFD), C32(0x46C0BD53), C32(0xE782B699), C32(0x55304632),
	C32(0x71B4EF90), C32(0x0EA9E82C), C32(0xDBB930F1), C32(0xFAD06B8B),
	C32(0xBE0CAE40), C32(0x8BD14410), C32(0x76D2ADAC), C32(0x28ACAB7F)
};

static const u32 B_init_512[] = {
	C32(0xC1099CB7), C32(0x07B385F3), C32(0xE7442C26), C32(0xCC8AD640),
	C32(0xEB6F56C7), C32(0x1EA81AA9), C32(0x73B9D314), C32(0x1DE85D08),
	C32(0x48910A5A), C32(0x893B22DB), C32(0xC5A0DF44), C32(0xBBC4324E),
	C32(0x72D2F240), C32(0x75941D99), C32(0x6D8BDE82), C32(0xA1A7502B)
};

static const u32 C_init_512[] = {
	C32(0xD9BF68D1), C32(0x58BAD750), C32(0x56028CB2), C32(0x8134F359),
	C32(0xB5D469D8), C32(0x941A8CC2), C32(0x418B2A6E), C32(0x04052780),
	C32(0x7F07D787), C32(0x5194358F), C32(0x3C60D665), C32(0xBE97D79A),
	C32(0x950C3434), C32(0xAED9A06D), C32(0x2537DC8D), C32(0x7CDB5969)
};

/* END -- automatically generated code. */

static void
shabal512_init(shabal512_state *state)
{
	memcpy(state->A, A_init_512, sizeof state->A);
	memcpy(state->B, B_init_512, sizeof state->B);
	memcpy(state->C, C_init_512, sizeof state->C);
	state->Wlow = 1;
	state->Whigh = 0;
	state->buffer_ptr = 0;
}

static void
shabal512_update(shabal512_state *state, const unsigned char *data, size_t len)
{
	unsigned char *buffer;
	size_t ptr;
	DECL_STATE

	buffer = state->buffer;
	ptr = state->buffer_ptr;

	/*
	 * We do not want to copy the state to local variables if the
	 * amount of data is less than what is needed to complete the
	 * current block. Note that it is anyway suboptimal to call
	 * this method many times for small chunks of data.
	 */
	if (len < (sizeof state->buffer) - ptr) {
		memcpy(buffer + ptr, data, len);
		ptr += len;
		if (state->last_byte_significant_bits != 0)
			buffer[ptr] = data[ptr];
		state->buffer_ptr = ptr;
		return;
	}

	READ_STATE(state);
	while (len > 0) {
		size_t clen;

		clen = (sizeof state->buffer) - ptr;
		if (clen > len)
			clen = len;
		memcpy(buffer + ptr, data, clen);
		ptr += clen;
		data += clen;
		len -= clen;
		if (ptr == sizeof state->buffer) {
			DECODE_BLOCK;
			INPUT_BLOCK_ADD;
			XOR_W;
			APPLY_P;
			INPUT_BLOCK_SUB;
			SWAP_BC;
			INCR_W;
			ptr = 0;
		}
	}
	WRITE_STATE(state);
	state->buffer_ptr = ptr;
}

static void
shabal512_final(shabal512_state *state, unsigned char *out)
{
	unsigned char *buffer;
	size_t ptr;
	int i;
	DECL_STATE

	buffer = state->buffer;
	ptr = state->buffer_ptr;
	buffer[ptr] = 0x80;
	memset(buffer + ptr + 1, 0, (sizeof state->buffer) - (ptr + 1));
	READ_STATE(state);
	DECODE_BLOCK;
	INPUT_BLOCK_ADD;
	XOR_W;
	APPLY_P;
	for (i = 0; i < SHABAL_PARAM_E; i ++) {
		SWAP_BC;
		XOR_W;
		APPLY_P;
	}

	enc32le(out +  0, B0);
	enc32le(out +  4, B1);
	enc32le(out +  8, B2);
	enc32le(out + 12, B3);
	enc32le(out + 16, B4);
	enc32le(out + 20, B5);
	enc32le(out + 24, B6);
	enc32le(out + 28, B7);
	enc32le(out + 32, B8);
	enc32le(out + 36, B9);
	enc32le(out + 40, BA);
	enc32le(out + 44, BB);
	enc32le(out + 48, BC);
	enc32le(out + 52, BD);
	enc32le(out + 56, BE);
	enc32le(out + 60, BF);
}

/*
 * The API for eBASH.
 */
int
crypto_hash(unsigned char *out, const unsigned char *in,
	unsigned long long inlen)
{
	shabal512_state st;

	shabal512_init(&st);
	shabal512_update(&st, in, (size_t)inlen);
	shabal512_final(&st, out);
	return 0;
}
