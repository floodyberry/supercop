/*
 * file        : echo_bitsliced.c
 * version     : 1.0.208
 * date        : 14.12.2010
 * 
 * - ECHO bitsliced implementation
 * - implements NIST hash api
 * - assumes that message lenght is multiple of 8-bits
 * - _ECHO_BITSLICED_ must be defined if compiling with ../main.c
 * 
 * Cagdas Calik
 * ccalik@metu.edu.tr
 * Institute of Applied Mathematics, Middle East Technical University, Turkey.
 *
 */

#include <memory.h>
#include <tmmintrin.h>
#include "hash_api.h"
#include "bitslice.h"
MYALIGN const unsigned int _BS0[] = {0x55555555, 0x55555555, 0x55555555, 0x55555555};
MYALIGN const unsigned int _BS1[] = {0x33333333, 0x33333333, 0x33333333, 0x33333333};
MYALIGN const unsigned int _BS2[] = {0x0f0f0f0f, 0x0f0f0f0f, 0x0f0f0f0f, 0x0f0f0f0f};
MYALIGN const unsigned int _ONE[] = {0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff};


MYALIGN const unsigned int const1[]			= {0x00000001, 0x00000000, 0x00000000, 0x00000000};
MYALIGN const unsigned int mixcol1[]		= {0x00030201, 0x04070605, 0x080b0a09, 0x0c0f0e0d};
MYALIGN const unsigned int mixcol2[]		= {0x01000302, 0x05040706, 0x09080b0a, 0x0d0c0f0e};
MYALIGN const unsigned int mixcol3[]		= {0x02010003, 0x06050407, 0x0a09080b, 0x0e0d0c0f};
MYALIGN const unsigned int shiftrowsslice[]	= {0x0f0a0500, 0x030e0904, 0x07020d08, 0x0b06010c};
MYALIGN const unsigned int lownibblemask[]	= {0x0f0f0f0f, 0x0f0f0f0f, 0x0f0f0f0f, 0x0f0f0f0f};
MYALIGN const unsigned int bigshiftrows1[]	= {0x06040200, 0x0e0c0a08, 0x07050301, 0x0f0d0b09};
MYALIGN const unsigned int bigshiftrows2[]	= {0xc0804000, 0xd0905010, 0xe0a06020, 0xf0b07030};
MYALIGN const unsigned int bigshiftrows3[]	= {0x09010800, 0x0b030a02, 0x0d050c04, 0x0f070e06};


#include "crypto_hash.h"

 int crypto_hash(
   unsigned char *out,
   const unsigned char *in,
   unsigned long long inlen
 )
 {

	 if(Hash(256, in, inlen * 8, out) == SUCCESS) 
		 return 0;
	 
	 return -1;
 }

/*
int main()
{
	return 0;
}
*/



#if 0
void DumpState(__m128i *ps)
{
	int i, j, k;
	unsigned int ucol;

	for(j = 0; j < 4; j++)
	{
		for(i = 0; i < 4; i++)
		{
			printf("row %d,col %d : ", i, j);
			for(k = 0; k < 4; k++)
			{
				ucol = *((int*)ps + 16 * i + 4 * j + k);
				printf("%02x%02x%02x%02x ", (ucol >> 0) & 0xff, (ucol >> 8) & 0xff, (ucol >> 16) & 0xff, (ucol >> 24) & 0xff);
			}

			printf("\n");
		}
	}

	printf("\n");
}
#endif



#define BIGMIXCOLUMNS(i)\
				mixed[i][0] = row[i][7];\
				mixed[i][0] = _mm_xor_si128(mixed[i][0], row[(i + 1) % 4][0]);\
				mixed[i][0] = _mm_xor_si128(mixed[i][0], row[(i + 1) % 4][7]);\
				mixed[i][0] = _mm_xor_si128(mixed[i][0], row[(i + 2) % 4][0]);\
				mixed[i][0] = _mm_xor_si128(mixed[i][0], row[(i + 3) % 4][0]);\
				mixed[i][1] = row[i][0];\
				mixed[i][1] = _mm_xor_si128(mixed[i][1], row[i][7]);\
				mixed[i][1] = _mm_xor_si128(mixed[i][1], row[(i + 1) % 4][0]);\
				mixed[i][1] = _mm_xor_si128(mixed[i][1], row[(i + 1) % 4][1]);\
				mixed[i][1] = _mm_xor_si128(mixed[i][1], row[(i + 1) % 4][7]);\
				mixed[i][1] = _mm_xor_si128(mixed[i][1], row[(i + 2) % 4][1]);\
				mixed[i][1] = _mm_xor_si128(mixed[i][1], row[(i + 3) % 4][1]);\
				mixed[i][2] = row[i][1];\
				mixed[i][2] = _mm_xor_si128(mixed[i][2], row[(i + 1) % 4][1]);\
				mixed[i][2] = _mm_xor_si128(mixed[i][2], row[(i + 1) % 4][2]);\
				mixed[i][2] = _mm_xor_si128(mixed[i][2], row[(i + 2) % 4][2]);\
				mixed[i][2] = _mm_xor_si128(mixed[i][2], row[(i + 3) % 4][2]);\
				mixed[i][3] = row[i][2];\
				mixed[i][3] = _mm_xor_si128(mixed[i][3], row[i][7]);\
				mixed[i][3] = _mm_xor_si128(mixed[i][3], row[(i + 1) % 4][2]);\
				mixed[i][3] = _mm_xor_si128(mixed[i][3], row[(i + 1) % 4][3]);\
				mixed[i][3] = _mm_xor_si128(mixed[i][3], row[(i + 1) % 4][7]);\
				mixed[i][3] = _mm_xor_si128(mixed[i][3], row[(i + 2) % 4][3]);\
				mixed[i][3] = _mm_xor_si128(mixed[i][3], row[(i + 3) % 4][3]);\
				mixed[i][4] = row[i][3];\
				mixed[i][4] = _mm_xor_si128(mixed[i][4], row[i][7]);\
				mixed[i][4] = _mm_xor_si128(mixed[i][4], row[(i + 1) % 4][3]);\
				mixed[i][4] = _mm_xor_si128(mixed[i][4], row[(i + 1) % 4][4]);\
				mixed[i][4] = _mm_xor_si128(mixed[i][4], row[(i + 1) % 4][7]);\
				mixed[i][4] = _mm_xor_si128(mixed[i][4], row[(i + 2) % 4][4]);\
				mixed[i][4] = _mm_xor_si128(mixed[i][4], row[(i + 3) % 4][4]);\
				mixed[i][5] = row[i][4];\
				mixed[i][5] = _mm_xor_si128(mixed[i][5], row[(i + 1) % 4][4]);\
				mixed[i][5] = _mm_xor_si128(mixed[i][5], row[(i + 1) % 4][5]);\
				mixed[i][5] = _mm_xor_si128(mixed[i][5], row[(i + 2) % 4][5]);\
				mixed[i][5] = _mm_xor_si128(mixed[i][5], row[(i + 3) % 4][5]);\
				mixed[i][6] = row[i][5];\
				mixed[i][6] = _mm_xor_si128(mixed[i][6], row[(i + 1) % 4][5]);\
				mixed[i][6] = _mm_xor_si128(mixed[i][6], row[(i + 1) % 4][6]);\
				mixed[i][6] = _mm_xor_si128(mixed[i][6], row[(i + 2) % 4][6]);\
				mixed[i][6] = _mm_xor_si128(mixed[i][6], row[(i + 3) % 4][6]);\
				mixed[i][7] = row[i][6];\
				mixed[i][7] = _mm_xor_si128(mixed[i][7], row[(i + 1) % 4][6]);\
				mixed[i][7] = _mm_xor_si128(mixed[i][7], row[(i + 1) % 4][7]);\
				mixed[i][7] = _mm_xor_si128(mixed[i][7], row[(i + 2) % 4][7]);\
				mixed[i][7] = _mm_xor_si128(mixed[i][7], row[(i + 3) % 4][7])



#define AES_SHIFT_ROWS(s)\
			s[0][0] = _mm_shuffle_epi8(s[0][0], M128(shiftrowsslice));\
			s[0][1] = _mm_shuffle_epi8(s[0][1], M128(shiftrowsslice));\
			s[0][2] = _mm_shuffle_epi8(s[0][2], M128(shiftrowsslice));\
			s[0][3] = _mm_shuffle_epi8(s[0][3], M128(shiftrowsslice));\
			s[1][0] = _mm_shuffle_epi8(s[1][0], M128(shiftrowsslice));\
			s[1][1] = _mm_shuffle_epi8(s[1][1], M128(shiftrowsslice));\
			s[1][2] = _mm_shuffle_epi8(s[1][2], M128(shiftrowsslice));\
			s[1][3] = _mm_shuffle_epi8(s[1][3], M128(shiftrowsslice));\
			s[2][0] = _mm_shuffle_epi8(s[2][0], M128(shiftrowsslice));\
			s[2][1] = _mm_shuffle_epi8(s[2][1], M128(shiftrowsslice));\
			s[2][2] = _mm_shuffle_epi8(s[2][2], M128(shiftrowsslice));\
			s[2][3] = _mm_shuffle_epi8(s[2][3], M128(shiftrowsslice));\
			s[3][0] = _mm_shuffle_epi8(s[3][0], M128(shiftrowsslice));\
			s[3][1] = _mm_shuffle_epi8(s[3][1], M128(shiftrowsslice));\
			s[3][2] = _mm_shuffle_epi8(s[3][2], M128(shiftrowsslice));\
			s[3][3] = _mm_shuffle_epi8(s[3][3], M128(shiftrowsslice))

#define AES_MIX_COLUMNS(s1, s2)\
			s1[1][3] = s2[0][0];\
			s1[1][3] = _mm_xor_si128(s1[1][3], _mm_shuffle_epi8(s2[0][0], M128(mixcol1)));\
			s1[1][3] = _mm_xor_si128(s1[1][3], _mm_shuffle_epi8(s2[1][3], M128(mixcol1)));\
			s1[1][3] = _mm_xor_si128(s1[1][3], _mm_shuffle_epi8(s2[1][3], M128(mixcol2)));\
			s1[1][3] = _mm_xor_si128(s1[1][3], _mm_shuffle_epi8(s2[1][3], M128(mixcol3)));\
			s1[1][2] = s2[0][0];\
			s1[1][2] = _mm_xor_si128(s1[1][2], s2[1][3]);\
			s1[1][2] = _mm_xor_si128(s1[1][2], _mm_shuffle_epi8(s2[0][0], M128(mixcol1)));\
			s1[1][2] = _mm_xor_si128(s1[1][2], _mm_shuffle_epi8(s2[1][2], M128(mixcol1)));\
			s1[1][2] = _mm_xor_si128(s1[1][2], _mm_shuffle_epi8(s2[1][3], M128(mixcol1)));\
			s1[1][2] = _mm_xor_si128(s1[1][2], _mm_shuffle_epi8(s2[1][2], M128(mixcol2)));\
			s1[1][2] = _mm_xor_si128(s1[1][2], _mm_shuffle_epi8(s2[1][2], M128(mixcol3)));\
			s1[1][1] = s2[1][2];\
			s1[1][1] = _mm_xor_si128(s1[1][1], _mm_shuffle_epi8(s2[1][2], M128(mixcol1)));\
			s1[1][1] = _mm_xor_si128(s1[1][1], _mm_shuffle_epi8(s2[1][1], M128(mixcol1)));\
			s1[1][1] = _mm_xor_si128(s1[1][1], _mm_shuffle_epi8(s2[1][1], M128(mixcol2)));\
			s1[1][1] = _mm_xor_si128(s1[1][1], _mm_shuffle_epi8(s2[1][1], M128(mixcol3)));\
			s1[1][0] = s2[0][0];\
			s1[1][0] = _mm_xor_si128(s1[1][0], s2[1][1]);\
			s1[1][0] = _mm_xor_si128(s1[1][0], _mm_shuffle_epi8(s2[1][1], M128(mixcol1)));\
			s1[1][0] = _mm_xor_si128(s1[1][0], _mm_shuffle_epi8(s2[1][0], M128(mixcol1)));\
			s1[1][0] = _mm_xor_si128(s1[1][0], _mm_shuffle_epi8(s2[0][0], M128(mixcol1)));\
			s1[1][0] = _mm_xor_si128(s1[1][0], _mm_shuffle_epi8(s2[1][0], M128(mixcol2)));\
			s1[1][0] = _mm_xor_si128(s1[1][0], _mm_shuffle_epi8(s2[1][0], M128(mixcol3)));\
			s1[0][3] = s2[1][0];\
			s1[0][3] = _mm_xor_si128(s1[0][3], s2[0][0]);\
			s1[0][3] = _mm_xor_si128(s1[0][3], _mm_shuffle_epi8(s2[1][0], M128(mixcol1)));\
			s1[0][3] = _mm_xor_si128(s1[0][3], _mm_shuffle_epi8(s2[0][3], M128(mixcol1)));\
			s1[0][3] = _mm_xor_si128(s1[0][3], _mm_shuffle_epi8(s2[0][0], M128(mixcol1)));\
			s1[0][3] = _mm_xor_si128(s1[0][3], _mm_shuffle_epi8(s2[0][3], M128(mixcol2)));\
			s1[0][3] = _mm_xor_si128(s1[0][3], _mm_shuffle_epi8(s2[0][3], M128(mixcol3)));\
			s1[0][2] = s2[0][3];\
			s1[0][2] = _mm_xor_si128(s1[0][2], _mm_shuffle_epi8(s2[0][3], M128(mixcol1)));\
			s1[0][2] = _mm_xor_si128(s1[0][2], _mm_shuffle_epi8(s2[0][2], M128(mixcol1)));\
			s1[0][2] = _mm_xor_si128(s1[0][2], _mm_shuffle_epi8(s2[0][2], M128(mixcol2)));\
			s1[0][2] = _mm_xor_si128(s1[0][2], _mm_shuffle_epi8(s2[0][2], M128(mixcol3)));\
			s1[0][1] = s2[0][2];\
			s1[0][1] = _mm_xor_si128(s1[0][1], _mm_shuffle_epi8(s2[0][2], M128(mixcol1)));\
			s1[0][1] = _mm_xor_si128(s1[0][1], _mm_shuffle_epi8(s2[0][1], M128(mixcol1)));\
			s1[0][1] = _mm_xor_si128(s1[0][1], _mm_shuffle_epi8(s2[0][1], M128(mixcol2)));\
			s1[0][1] = _mm_xor_si128(s1[0][1], _mm_shuffle_epi8(s2[0][1], M128(mixcol3)));\
			s1[0][0] = s2[0][1];\
			s1[0][0] = _mm_xor_si128(s1[0][0], _mm_shuffle_epi8(s2[0][1], M128(mixcol1)));\
			s1[0][0] = _mm_xor_si128(s1[0][0], _mm_shuffle_epi8(s2[0][0], M128(mixcol1)));\
			s1[0][0] = _mm_xor_si128(s1[0][0], _mm_shuffle_epi8(s2[0][0], M128(mixcol2)));\
			s1[0][0] = _mm_xor_si128(s1[0][0], _mm_shuffle_epi8(s2[0][0], M128(mixcol3)));\
			s1[3][3] = s2[2][0];\
			s1[3][3] = _mm_xor_si128(s1[3][3], _mm_shuffle_epi8(s2[2][0], M128(mixcol1)));\
			s1[3][3] = _mm_xor_si128(s1[3][3], _mm_shuffle_epi8(s2[3][3], M128(mixcol1)));\
			s1[3][3] = _mm_xor_si128(s1[3][3], _mm_shuffle_epi8(s2[3][3], M128(mixcol2)));\
			s1[3][3] = _mm_xor_si128(s1[3][3], _mm_shuffle_epi8(s2[3][3], M128(mixcol3)));\
			s1[3][2] = s2[2][0];\
			s1[3][2] = _mm_xor_si128(s1[3][2], s2[3][3]);\
			s1[3][2] = _mm_xor_si128(s1[3][2], _mm_shuffle_epi8(s2[2][0], M128(mixcol1)));\
			s1[3][2] = _mm_xor_si128(s1[3][2], _mm_shuffle_epi8(s2[3][2], M128(mixcol1)));\
			s1[3][2] = _mm_xor_si128(s1[3][2], _mm_shuffle_epi8(s2[3][3], M128(mixcol1)));\
			s1[3][2] = _mm_xor_si128(s1[3][2], _mm_shuffle_epi8(s2[3][2], M128(mixcol2)));\
			s1[3][2] = _mm_xor_si128(s1[3][2], _mm_shuffle_epi8(s2[3][2], M128(mixcol3)));\
			s1[3][1] = s2[3][2];\
			s1[3][1] = _mm_xor_si128(s1[3][1], _mm_shuffle_epi8(s2[3][2], M128(mixcol1)));\
			s1[3][1] = _mm_xor_si128(s1[3][1], _mm_shuffle_epi8(s2[3][1], M128(mixcol1)));\
			s1[3][1] = _mm_xor_si128(s1[3][1], _mm_shuffle_epi8(s2[3][1], M128(mixcol2)));\
			s1[3][1] = _mm_xor_si128(s1[3][1], _mm_shuffle_epi8(s2[3][1], M128(mixcol3)));\
			s1[3][0] = s2[2][0];\
			s1[3][0] = _mm_xor_si128(s1[3][0], s2[3][1]);\
			s1[3][0] = _mm_xor_si128(s1[3][0], _mm_shuffle_epi8(s2[3][1], M128(mixcol1)));\
			s1[3][0] = _mm_xor_si128(s1[3][0], _mm_shuffle_epi8(s2[3][0], M128(mixcol1)));\
			s1[3][0] = _mm_xor_si128(s1[3][0], _mm_shuffle_epi8(s2[2][0], M128(mixcol1)));\
			s1[3][0] = _mm_xor_si128(s1[3][0], _mm_shuffle_epi8(s2[3][0], M128(mixcol2)));\
			s1[3][0] = _mm_xor_si128(s1[3][0], _mm_shuffle_epi8(s2[3][0], M128(mixcol3)));\
			s1[2][3] = s2[3][0];\
			s1[2][3] = _mm_xor_si128(s1[2][3], s2[2][0]);\
			s1[2][3] = _mm_xor_si128(s1[2][3], _mm_shuffle_epi8(s2[3][0], M128(mixcol1)));\
			s1[2][3] = _mm_xor_si128(s1[2][3], _mm_shuffle_epi8(s2[2][3], M128(mixcol1)));\
			s1[2][3] = _mm_xor_si128(s1[2][3], _mm_shuffle_epi8(s2[2][0], M128(mixcol1)));\
			s1[2][3] = _mm_xor_si128(s1[2][3], _mm_shuffle_epi8(s2[2][3], M128(mixcol2)));\
			s1[2][3] = _mm_xor_si128(s1[2][3], _mm_shuffle_epi8(s2[2][3], M128(mixcol3)));\
			s1[2][2] = s2[2][3];\
			s1[2][2] = _mm_xor_si128(s1[2][2], _mm_shuffle_epi8(s2[2][3], M128(mixcol1)));\
			s1[2][2] = _mm_xor_si128(s1[2][2], _mm_shuffle_epi8(s2[2][2], M128(mixcol1)));\
			s1[2][2] = _mm_xor_si128(s1[2][2], _mm_shuffle_epi8(s2[2][2], M128(mixcol2)));\
			s1[2][2] = _mm_xor_si128(s1[2][2], _mm_shuffle_epi8(s2[2][2], M128(mixcol3)));\
			s1[2][1] = s2[2][2];\
			s1[2][1] = _mm_xor_si128(s1[2][1], _mm_shuffle_epi8(s2[2][2], M128(mixcol1)));\
			s1[2][1] = _mm_xor_si128(s1[2][1], _mm_shuffle_epi8(s2[2][1], M128(mixcol1)));\
			s1[2][1] = _mm_xor_si128(s1[2][1], _mm_shuffle_epi8(s2[2][1], M128(mixcol2)));\
			s1[2][1] = _mm_xor_si128(s1[2][1], _mm_shuffle_epi8(s2[2][1], M128(mixcol3)));\
			s1[2][0] = s2[2][1];\
			s1[2][0] = _mm_xor_si128(s1[2][0], _mm_shuffle_epi8(s2[2][1], M128(mixcol1)));\
			s1[2][0] = _mm_xor_si128(s1[2][0], _mm_shuffle_epi8(s2[2][0], M128(mixcol1)));\
			s1[2][0] = _mm_xor_si128(s1[2][0], _mm_shuffle_epi8(s2[2][0], M128(mixcol2)));\
			s1[2][0] = _mm_xor_si128(s1[2][0], _mm_shuffle_epi8(s2[2][0], M128(mixcol3)))

#define ADD_CONSTANT(s)\
			s[1][3] = _mm_xor_si128(s[1][3], konst[13]);\
			s[1][2] = _mm_xor_si128(s[1][2], konst[9]);\
			s[1][1] = _mm_xor_si128(s[1][1], konst[5]);\
			s[1][0] = _mm_xor_si128(s[1][0], konst[1]);\
			s[0][3] = _mm_xor_si128(s[0][3], konst[12]);\
			s[0][2] = _mm_xor_si128(s[0][2], konst[8]);\
			s[0][1] = _mm_xor_si128(s[0][1], konst[4]);\
			s[0][0] = _mm_xor_si128(s[0][0], konst[0]);\
			s[3][3] = _mm_xor_si128(s[3][3], konst[15]);\
			s[3][2] = _mm_xor_si128(s[3][2], konst[11]);\
			s[3][1] = _mm_xor_si128(s[3][1], konst[7]);\
			s[3][0] = _mm_xor_si128(s[3][0], konst[3]);\
			s[2][3] = _mm_xor_si128(s[2][3], konst[14]);\
			s[2][2] = _mm_xor_si128(s[2][2], konst[10]);\
			s[2][1] = _mm_xor_si128(s[2][1], konst[6]);\
			s[2][0] = _mm_xor_si128(s[2][0], konst[2])

#if 0
// problem wit msc-32
#define BIGSHIFTROWS(state)\
			state[0][0] = _mm_xor_si128(_mm_andnot_si128(M128(lownibblemask), state[0][0]), _mm_shuffle_epi8(M128(bigshiftrows1), _mm_and_si128(state[0][0], M128(lownibblemask))));\
			state[0][1] = _mm_xor_si128(_mm_andnot_si128(M128(lownibblemask), state[0][1]), _mm_shuffle_epi8(M128(bigshiftrows1), _mm_and_si128(state[0][1], M128(lownibblemask))));\
			state[0][2] = _mm_xor_si128(_mm_andnot_si128(M128(lownibblemask), state[0][2]), _mm_shuffle_epi8(M128(bigshiftrows1), _mm_and_si128(state[0][2], M128(lownibblemask))));\
			state[0][3] = _mm_xor_si128(_mm_andnot_si128(M128(lownibblemask), state[0][3]), _mm_shuffle_epi8(M128(bigshiftrows1), _mm_and_si128(state[0][3], M128(lownibblemask))));\
			state[1][0] = _mm_xor_si128(_mm_andnot_si128(M128(lownibblemask), state[1][0]), _mm_shuffle_epi8(M128(bigshiftrows1), _mm_and_si128(state[1][0], M128(lownibblemask))));\
			state[1][1] = _mm_xor_si128(_mm_andnot_si128(M128(lownibblemask), state[1][1]), _mm_shuffle_epi8(M128(bigshiftrows1), _mm_and_si128(state[1][1], M128(lownibblemask))));\
			state[1][2] = _mm_xor_si128(_mm_andnot_si128(M128(lownibblemask), state[1][2]), _mm_shuffle_epi8(M128(bigshiftrows1), _mm_and_si128(state[1][2], M128(lownibblemask))));\
			state[1][3] = _mm_xor_si128(_mm_andnot_si128(M128(lownibblemask), state[1][3]), _mm_shuffle_epi8(M128(bigshiftrows1), _mm_and_si128(state[1][3], M128(lownibblemask))));\
			state[2][0] = _mm_xor_si128(_mm_shuffle_epi8(M128(bigshiftrows2), _mm_srli_epi32(_mm_andnot_si128(M128(lownibblemask), state[2][0]), 4)), _mm_shuffle_epi8(M128(bigshiftrows3), _mm_and_si128(state[2][0], M128(lownibblemask))));\
			state[2][1] = _mm_xor_si128(_mm_shuffle_epi8(M128(bigshiftrows2), _mm_srli_epi32(_mm_andnot_si128(M128(lownibblemask), state[2][1]), 4)), _mm_shuffle_epi8(M128(bigshiftrows3), _mm_and_si128(state[2][1], M128(lownibblemask))));\
			state[2][2] = _mm_xor_si128(_mm_shuffle_epi8(M128(bigshiftrows2), _mm_srli_epi32(_mm_andnot_si128(M128(lownibblemask), state[2][2]), 4)), _mm_shuffle_epi8(M128(bigshiftrows3), _mm_and_si128(state[2][2], M128(lownibblemask))));\
			state[2][3] = _mm_xor_si128(_mm_shuffle_epi8(M128(bigshiftrows2), _mm_srli_epi32(_mm_andnot_si128(M128(lownibblemask), state[2][3]), 4)), _mm_shuffle_epi8(M128(bigshiftrows3), _mm_and_si128(state[2][3], M128(lownibblemask))));\
			state[3][0] = _mm_xor_si128(_mm_shuffle_epi8(M128(bigshiftrows2), _mm_srli_epi32(_mm_andnot_si128(M128(lownibblemask), state[3][0]), 4)), _mm_shuffle_epi8(M128(bigshiftrows3), _mm_and_si128(state[3][0], M128(lownibblemask))));\
			state[3][1] = _mm_xor_si128(_mm_shuffle_epi8(M128(bigshiftrows2), _mm_srli_epi32(_mm_andnot_si128(M128(lownibblemask), state[3][1]), 4)), _mm_shuffle_epi8(M128(bigshiftrows3), _mm_and_si128(state[3][1], M128(lownibblemask))));\
			state[3][2] = _mm_xor_si128(_mm_shuffle_epi8(M128(bigshiftrows2), _mm_srli_epi32(_mm_andnot_si128(M128(lownibblemask), state[3][2]), 4)), _mm_shuffle_epi8(M128(bigshiftrows3), _mm_and_si128(state[3][2], M128(lownibblemask))));\
			state[3][3] = _mm_xor_si128(_mm_shuffle_epi8(M128(bigshiftrows2), _mm_srli_epi32(_mm_andnot_si128(M128(lownibblemask), state[3][3]), 4)), _mm_shuffle_epi8(M128(bigshiftrows3), _mm_and_si128(state[3][3], M128(lownibblemask))))

#else

#define BIGSHIFTROWS(state)\
			state[0][0] = _mm_xor_si128(_mm_andnot_si128(M128(lownibblemask), state[0][0]), _mm_shuffle_epi8(M128(bigshiftrows1), _mm_and_si128(state[0][0], M128(lownibblemask))));\
			state[0][1] = _mm_xor_si128(_mm_andnot_si128(M128(lownibblemask), state[0][1]), _mm_shuffle_epi8(M128(bigshiftrows1), _mm_and_si128(state[0][1], M128(lownibblemask))));\
			state[0][2] = _mm_xor_si128(_mm_andnot_si128(M128(lownibblemask), state[0][2]), _mm_shuffle_epi8(M128(bigshiftrows1), _mm_and_si128(state[0][2], M128(lownibblemask))));\
			state[0][3] = _mm_xor_si128(_mm_andnot_si128(M128(lownibblemask), state[0][3]), _mm_shuffle_epi8(M128(bigshiftrows1), _mm_and_si128(state[0][3], M128(lownibblemask))));\
			state[1][0] = _mm_xor_si128(_mm_andnot_si128(M128(lownibblemask), state[1][0]), _mm_shuffle_epi8(M128(bigshiftrows1), _mm_and_si128(state[1][0], M128(lownibblemask))));\
			state[1][1] = _mm_xor_si128(_mm_andnot_si128(M128(lownibblemask), state[1][1]), _mm_shuffle_epi8(M128(bigshiftrows1), _mm_and_si128(state[1][1], M128(lownibblemask))));\
			state[1][2] = _mm_xor_si128(_mm_andnot_si128(M128(lownibblemask), state[1][2]), _mm_shuffle_epi8(M128(bigshiftrows1), _mm_and_si128(state[1][2], M128(lownibblemask))));\
			state[1][3] = _mm_xor_si128(_mm_andnot_si128(M128(lownibblemask), state[1][3]), _mm_shuffle_epi8(M128(bigshiftrows1), _mm_and_si128(state[1][3], M128(lownibblemask))));\
			state[2][0] = _mm_xor_si128(_mm_shuffle_epi8(M128(bigshiftrows2), _mm_and_si128(_mm_srli_epi32(state[2][0], 4), M128(lownibblemask))), _mm_shuffle_epi8(M128(bigshiftrows3), _mm_and_si128(state[2][0], M128(lownibblemask))));\
			state[2][1] = _mm_xor_si128(_mm_shuffle_epi8(M128(bigshiftrows2), _mm_and_si128(_mm_srli_epi32(state[2][1], 4), M128(lownibblemask))), _mm_shuffle_epi8(M128(bigshiftrows3), _mm_and_si128(state[2][1], M128(lownibblemask))));\
			state[2][2] = _mm_xor_si128(_mm_shuffle_epi8(M128(bigshiftrows2), _mm_and_si128(_mm_srli_epi32(state[2][2], 4), M128(lownibblemask))), _mm_shuffle_epi8(M128(bigshiftrows3), _mm_and_si128(state[2][2], M128(lownibblemask))));\
			state[2][3] = _mm_xor_si128(_mm_shuffle_epi8(M128(bigshiftrows2), _mm_and_si128(_mm_srli_epi32(state[2][3], 4), M128(lownibblemask))), _mm_shuffle_epi8(M128(bigshiftrows3), _mm_and_si128(state[2][3], M128(lownibblemask))));\
			state[3][0] = _mm_xor_si128(_mm_shuffle_epi8(M128(bigshiftrows2), _mm_and_si128(_mm_srli_epi32(state[3][0], 4), M128(lownibblemask))), _mm_shuffle_epi8(M128(bigshiftrows3), _mm_and_si128(state[3][0], M128(lownibblemask))));\
			state[3][1] = _mm_xor_si128(_mm_shuffle_epi8(M128(bigshiftrows2), _mm_and_si128(_mm_srli_epi32(state[3][1], 4), M128(lownibblemask))), _mm_shuffle_epi8(M128(bigshiftrows3), _mm_and_si128(state[3][1], M128(lownibblemask))));\
			state[3][2] = _mm_xor_si128(_mm_shuffle_epi8(M128(bigshiftrows2), _mm_and_si128(_mm_srli_epi32(state[3][2], 4), M128(lownibblemask))), _mm_shuffle_epi8(M128(bigshiftrows3), _mm_and_si128(state[3][2], M128(lownibblemask))));\
			state[3][3] = _mm_xor_si128(_mm_shuffle_epi8(M128(bigshiftrows2), _mm_and_si128(_mm_srli_epi32(state[3][3], 4), M128(lownibblemask))), _mm_shuffle_epi8(M128(bigshiftrows3), _mm_and_si128(state[3][3], M128(lownibblemask))))
#endif

#define UPDATE_CONSTANT\
			konst[0]  = k1; k1 = _mm_add_epi32(k1, M128(const1));\
			konst[1]  = k1; k1 = _mm_add_epi32(k1, M128(const1));\
			konst[2]  = k1; k1 = _mm_add_epi32(k1, M128(const1));\
			konst[3]  = k1; k1 = _mm_add_epi32(k1, M128(const1));\
			konst[4]  = k1; k1 = _mm_add_epi32(k1, M128(const1));\
			konst[5]  = k1; k1 = _mm_add_epi32(k1, M128(const1));\
			konst[6]  = k1; k1 = _mm_add_epi32(k1, M128(const1));\
			konst[7]  = k1; k1 = _mm_add_epi32(k1, M128(const1));\
			konst[8]  = k1; k1 = _mm_add_epi32(k1, M128(const1));\
			konst[9]  = k1; k1 = _mm_add_epi32(k1, M128(const1));\
			konst[10] = k1; k1 = _mm_add_epi32(k1, M128(const1));\
			konst[11] = k1; k1 = _mm_add_epi32(k1, M128(const1));\
			konst[12] = k1; k1 = _mm_add_epi32(k1, M128(const1));\
			konst[13] = k1; k1 = _mm_add_epi32(k1, M128(const1));\
			konst[14] = k1; k1 = _mm_add_epi32(k1, M128(const1));\
			konst[15] = k1; k1 = _mm_add_epi32(k1, M128(const1))

#define SPLIT_ROWS(row, state)\
			row[0][0] = ROW_U2D(state[1][3]);\
			row[0][1] = ROW_U2D(state[1][2]);\
			row[0][2] = ROW_U2D(state[1][1]);\
			row[0][3] = ROW_U2D(state[1][0]);\
			row[0][4] = ROW_U2D(state[0][3]);\
			row[0][5] = ROW_U2D(state[0][2]);\
			row[0][6] = ROW_U2D(state[0][1]);\
			row[0][7] = ROW_U2D(state[0][0]);\
			row[1][0] = ROW_D2D(state[1][3]);\
			row[1][1] = ROW_D2D(state[1][2]);\
			row[1][2] = ROW_D2D(state[1][1]);\
			row[1][3] = ROW_D2D(state[1][0]);\
			row[1][4] = ROW_D2D(state[0][3]);\
			row[1][5] = ROW_D2D(state[0][2]);\
			row[1][6] = ROW_D2D(state[0][1]);\
			row[1][7] = ROW_D2D(state[0][0]);\
			row[2][0] = ROW_U2D(state[3][3]);\
			row[2][1] = ROW_U2D(state[3][2]);\
			row[2][2] = ROW_U2D(state[3][1]);\
			row[2][3] = ROW_U2D(state[3][0]);\
			row[2][4] = ROW_U2D(state[2][3]);\
			row[2][5] = ROW_U2D(state[2][2]);\
			row[2][6] = ROW_U2D(state[2][1]);\
			row[2][7] = ROW_U2D(state[2][0]);\
			row[3][0] = ROW_D2D(state[3][3]);\
			row[3][1] = ROW_D2D(state[3][2]);\
			row[3][2] = ROW_D2D(state[3][1]);\
			row[3][3] = ROW_D2D(state[3][0]);\
			row[3][4] = ROW_D2D(state[2][3]);\
			row[3][5] = ROW_D2D(state[2][2]);\
			row[3][6] = ROW_D2D(state[2][1]);\
			row[3][7] = ROW_D2D(state[2][0])


#define COMBINE_ROWS(state, mixed)\
			state[1][3] = _mm_slli_epi32(mixed[0][0], 4);\
			state[1][2] = _mm_slli_epi32(mixed[0][1], 4);\
			state[1][1] = _mm_slli_epi32(mixed[0][2], 4);\
			state[1][0] = _mm_slli_epi32(mixed[0][3], 4);\
			state[0][3] = _mm_slli_epi32(mixed[0][4], 4);\
			state[0][2] = _mm_slli_epi32(mixed[0][5], 4);\
			state[0][1] = _mm_slli_epi32(mixed[0][6], 4);\
			state[0][0] = _mm_slli_epi32(mixed[0][7], 4);\
			state[1][3] = _mm_xor_si128(state[1][3], mixed[1][0]);\
			state[1][2] = _mm_xor_si128(state[1][2], mixed[1][1]);\
			state[1][1] = _mm_xor_si128(state[1][1], mixed[1][2]);\
			state[1][0] = _mm_xor_si128(state[1][0], mixed[1][3]);\
			state[0][3] = _mm_xor_si128(state[0][3], mixed[1][4]);\
			state[0][2] = _mm_xor_si128(state[0][2], mixed[1][5]);\
			state[0][1] = _mm_xor_si128(state[0][1], mixed[1][6]);\
			state[0][0] = _mm_xor_si128(state[0][0], mixed[1][7]);\
			state[3][3] = _mm_slli_epi32(mixed[2][0], 4);\
			state[3][2] = _mm_slli_epi32(mixed[2][1], 4);\
			state[3][1] = _mm_slli_epi32(mixed[2][2], 4);\
			state[3][0] = _mm_slli_epi32(mixed[2][3], 4);\
			state[2][3] = _mm_slli_epi32(mixed[2][4], 4);\
			state[2][2] = _mm_slli_epi32(mixed[2][5], 4);\
			state[2][1] = _mm_slli_epi32(mixed[2][6], 4);\
			state[2][0] = _mm_slli_epi32(mixed[2][7], 4);\
			state[3][3] = _mm_xor_si128(state[3][3], mixed[3][0]);\
			state[3][2] = _mm_xor_si128(state[3][2], mixed[3][1]);\
			state[3][1] = _mm_xor_si128(state[3][1], mixed[3][2]);\
			state[3][0] = _mm_xor_si128(state[3][0], mixed[3][3]);\
			state[2][3] = _mm_xor_si128(state[2][3], mixed[3][4]);\
			state[2][2] = _mm_xor_si128(state[2][2], mixed[3][5]);\
			state[2][1] = _mm_xor_si128(state[2][1], mixed[3][6]);\
			state[2][0] = _mm_xor_si128(state[2][0], mixed[3][7])


#define ROW_U2U(x) _mm_andnot_si128(M128(lownibblemask), x)
#define ROW_U2D(x) _mm_srli_epi32(_mm_andnot_si128(M128(lownibblemask), x), 4)
#define ROW_D2U(x) _mm_andnot_si128(M128(lownibblemask), _mm_slli_epi32(x, 4))
#define ROW_D2D(x) _mm_and_si128(M128(lownibblemask), x)

#define SAVESTATE(dst, src)\
		dst[0][0] = src[0][0];\
		dst[0][1] = src[0][1];\
		dst[0][2] = src[0][2];\
		dst[0][3] = src[0][3];\
		dst[1][0] = src[1][0];\
		dst[1][1] = src[1][1];\
		dst[1][2] = src[1][2];\
		dst[1][3] = src[1][3];\
		dst[2][0] = src[2][0];\
		dst[2][1] = src[2][1];\
		dst[2][2] = src[2][2];\
		dst[2][3] = src[2][3];\
		dst[3][0] = src[3][0];\
		dst[3][1] = src[3][1];\
		dst[3][2] = src[3][2];\
		dst[3][3] = src[3][3]

void Compress(hashState *ctx, const unsigned char *pmsg, unsigned int uBlockCount)
{
	__m128i k1, t0, t1, t2, t3, s0, s1, s2, s3, konst[16], row[4][8], mixed[4][8];
	__m128i _state[4][4], _state2[4][4], _statebackup[4][4];
	unsigned int b, r, i, j;


	for(i = 0; i < 4; i++)
		for(j = 0; j < ctx->uHashSize / 256; j++)
			_state[i][j] = ctx->state[i][j];

	for(b = 0; b < uBlockCount; b++)
	{
		ctx->k = _mm_add_epi64(ctx->k, ctx->const1536);

		// load message
		for(j = ctx->uHashSize / 256; j < 4; j++)
		{
			for(i = 0; i < 4; i++)
			{
				_state[i][j] = _mm_loadu_si128((__m128i*)pmsg + 4 * (j - (ctx->uHashSize / 256)) + i);
			}
		}

		// save state
		SAVESTATE(_statebackup, _state);

		//DumpState(_state);

		BITSLICE(_state[0][0], _state[0][1], _state[0][2], _state[0][3], _state[1][0], _state[1][1], _state[1][2], _state[1][3], t0);
		BITSLICE(_state[2][0], _state[2][1], _state[2][2], _state[2][3], _state[3][0], _state[3][1], _state[3][2], _state[3][3], t0);

		k1 = ctx->k;

		for(r = 0; r < ctx->uRounds; r++)
		{
			UPDATE_CONSTANT;

			BITSLICE(konst[0], konst[4], konst[8], konst[12], konst[1], konst[5], konst[9], konst[13], t0);
			BITSLICE(konst[2], konst[6], konst[10], konst[14], konst[3], konst[7], konst[11], konst[15], t0);

			// aes-subbytes
			SUBSTITUTE_BITSLICE(_state[1][3], _state[1][2], _state[1][1], _state[1][0], _state[0][3], _state[0][2], _state[0][1], _state[0][0], t0, t1, t2, t3, s0, s1, s2, s3);
			SUBSTITUTE_BITSLICE(_state[3][3], _state[3][2], _state[3][1], _state[3][0], _state[2][3], _state[2][2], _state[2][1], _state[2][0], t0, t1, t2, t3, s0, s1, s2, s3);

			// aes-shiftrows
			AES_SHIFT_ROWS(_state);

			// aes-mixcolumns
			AES_MIX_COLUMNS(_state2, _state);

			// add constant
			ADD_CONSTANT(_state2);

			// aes-subbytes
			SUBSTITUTE_BITSLICE(_state2[1][3], _state2[1][2], _state2[1][1], _state2[1][0], _state2[0][3], _state2[0][2], _state2[0][1], _state2[0][0], t0, t1, t2, t3, s0, s1, s2, s3);
			SUBSTITUTE_BITSLICE(_state2[3][3], _state2[3][2], _state2[3][1], _state2[3][0], _state2[2][3], _state2[2][2], _state2[2][1], _state2[2][0], t0, t1, t2, t3, s0, s1, s2, s3);

			// aes-shiftrows
			AES_SHIFT_ROWS(_state2);

			// aes-mixcolumns
			AES_MIX_COLUMNS(_state, _state2);

			// big shift rows
			BIGSHIFTROWS(_state);

			// big mix columns
			SPLIT_ROWS(row, _state);
			BIGMIXCOLUMNS(0);
			BIGMIXCOLUMNS(1);
			BIGMIXCOLUMNS(2);
			BIGMIXCOLUMNS(3);
			COMBINE_ROWS(_state, mixed);
		}																																							   
																																									   
		BITSLICE(_state[0][0], _state[0][1], _state[0][2], _state[0][3], _state[1][0], _state[1][1], _state[1][2], _state[1][3], t0);
		BITSLICE(_state[2][0], _state[2][1], _state[2][2], _state[2][3], _state[3][0], _state[3][1], _state[3][2], _state[3][3], t0);

		//DumpState(_state);

		// feed forward
		if(ctx->uHashSize == 256)
		{
			for(i = 0; i < 4; i++)
			{
				_state[i][0] = _mm_xor_si128(_state[i][0], _state[i][1]);
				_state[i][0] = _mm_xor_si128(_state[i][0], _state[i][2]);
				_state[i][0] = _mm_xor_si128(_state[i][0], _state[i][3]);

				_state[i][0] = _mm_xor_si128(_state[i][0], _statebackup[i][0]);
				_state[i][0] = _mm_xor_si128(_state[i][0], _statebackup[i][1]);
				_state[i][0] = _mm_xor_si128(_state[i][0], _statebackup[i][2]);
				_state[i][0] = _mm_xor_si128(_state[i][0], _statebackup[i][3]);
			}
		}
		else
		{
			for(i = 0; i < 4; i++)
			{
				_state[i][0] = _mm_xor_si128(_state[i][0], _state[i][2]);
				_state[i][1] = _mm_xor_si128(_state[i][1], _state[i][3]);

				_state[i][0] = _mm_xor_si128(_state[i][0], _statebackup[i][0]);
				_state[i][0] = _mm_xor_si128(_state[i][0], _statebackup[i][2]);

				_state[i][1] = _mm_xor_si128(_state[i][1], _statebackup[i][1]);
				_state[i][1] = _mm_xor_si128(_state[i][1], _statebackup[i][3]);
			}
		}

		//DumpState(_state);

		pmsg += ctx->uBlockLength;
	
		//ctx->k = _mm_add_epi64(ctx->k, ctx->const1536);
	}

	for(i = 0; i < 4; i++)
		for(j = 0; j < 4; j++)
			ctx->state[i][j] = _state[i][j];
}






//
// Hash API
//
HashReturn Init(hashState *ctx, int nHashSize)
{
	int i, j;


	ctx->k = _mm_xor_si128(ctx->k, ctx->k);
	ctx->processed_bits = 0;
	ctx->uBufferBytes = 0;

	switch(nHashSize)
	{
		case 256:
			ctx->uHashSize = 256;
			ctx->uBlockLength = 192;
			ctx->uRounds = 8;
			ctx->hashsize = _mm_set_epi32(0, 0, 0, 0x00000100);
			ctx->const1536 = _mm_set_epi32(0x00000000, 0x00000000, 0x00000000, 0x00000600);
			break;

		case 512:
			ctx->uHashSize = 512;
			ctx->uBlockLength = 128;
			ctx->uRounds = 10;
			ctx->hashsize = _mm_set_epi32(0, 0, 0, 0x00000200);
			ctx->const1536 = _mm_set_epi32(0x00000000, 0x00000000, 0x00000000, 0x00000400);
			break;

		default:
			return BAD_HASHBITLEN;
	}


	for(i = 0; i < 4; i++)
		for(j = 0; j < nHashSize / 256; j++)
			ctx->state[i][j] = ctx->hashsize;

	for(i = 0; i < 4; i++)
		for(j = nHashSize / 256; j < 4; j++)
			ctx->state[i][j] = _mm_set_epi32(0, 0, 0, 0);

	return SUCCESS;
}


HashReturn Update(hashState *state, const BitSequence *data, DataLength databitlen)
{
	unsigned int uByteLength, uBlockCount, uRemainingBytes;

	uByteLength = (unsigned int)(databitlen / 8);

	if((state->uBufferBytes + uByteLength) >= state->uBlockLength)
	{
		if(state->uBufferBytes != 0)
		{
			// Fill the buffer
			memcpy(state->buffer + state->uBufferBytes, (void*)data, state->uBlockLength - state->uBufferBytes);

			// Process buffer
			Compress(state, state->buffer, 1);
			state->processed_bits += state->uBlockLength * 8;

			data += state->uBlockLength - state->uBufferBytes;
			uByteLength -= state->uBlockLength - state->uBufferBytes;
		}

		// buffer now does not contain any unprocessed bytes

		uBlockCount = uByteLength / state->uBlockLength;
		uRemainingBytes = uByteLength % state->uBlockLength;

		if(uBlockCount > 0)
		{
			Compress(state, data, uBlockCount);

			state->processed_bits += uBlockCount * state->uBlockLength * 8;
			data += uBlockCount * state->uBlockLength;
		}

		if(uRemainingBytes > 0)
		{
			memcpy(state->buffer, (void*)data, uRemainingBytes);
		}

		state->uBufferBytes = uRemainingBytes;
	}
	else
	{
		memcpy(state->buffer + state->uBufferBytes, (void*)data, uByteLength);
		state->uBufferBytes += uByteLength;
	}

	return SUCCESS;
}

HashReturn Final(hashState *state, BitSequence *hashval)
{
	__m128i remainingbits;

	// Add remaining bytes in the buffer
	state->processed_bits += state->uBufferBytes * 8;

	remainingbits = _mm_set_epi32(0, 0, 0, state->uBufferBytes * 8);

	// Pad with 0x80
	state->buffer[state->uBufferBytes++] = 0x80;
	
	// Enough buffer space for padding in this block?
	if((state->uBlockLength - state->uBufferBytes) >= 18)
	{
		// Pad with zeros
		memset(state->buffer + state->uBufferBytes, 0, state->uBlockLength - (state->uBufferBytes + 18));

		// Hash size
		*((unsigned short*)(state->buffer + state->uBlockLength - 18)) = state->uHashSize;

		// Processed bits
		*((DataLength*)(state->buffer + state->uBlockLength - 16)) = state->processed_bits;
		*((DataLength*)(state->buffer + state->uBlockLength - 8)) = 0;

		// Last block contains message bits?
		if(state->uBufferBytes == 1)
		{
			state->k = _mm_xor_si128(state->k, state->k);
			state->k = _mm_sub_epi64(state->k, state->const1536);
		}
		else
		{
			state->k = _mm_add_epi64(state->k, remainingbits);
			state->k = _mm_sub_epi64(state->k, state->const1536);
		}

		// Compress
		Compress(state, state->buffer, 1);
	}
	else
	{
		// Fill with zero and compress
		memset(state->buffer + state->uBufferBytes, 0, state->uBlockLength - state->uBufferBytes);
		state->k = _mm_add_epi64(state->k, remainingbits);
		state->k = _mm_sub_epi64(state->k, state->const1536);
		Compress(state, state->buffer, 1);

		// Last block
		memset(state->buffer, 0, state->uBlockLength - 18);

		// Hash size
		*((unsigned short*)(state->buffer + state->uBlockLength - 18)) = state->uHashSize;

		// Processed bits
		*((DataLength*)(state->buffer + state->uBlockLength - 16)) = state->processed_bits;
		*((DataLength*)(state->buffer + state->uBlockLength - 8)) = 0;

		// Compress the last block
		state->k = _mm_xor_si128(state->k, state->k);
		state->k = _mm_sub_epi64(state->k, state->const1536);
		Compress(state, state->buffer, 1);
	}

	// Store the hash value
	_mm_storeu_si128((__m128i*)hashval + 0, state->state[0][0]);
	_mm_storeu_si128((__m128i*)hashval + 1, state->state[1][0]);

	if(state->uHashSize == 512)
	{
		_mm_storeu_si128((__m128i*)hashval + 2, state->state[2][0]);
		_mm_storeu_si128((__m128i*)hashval + 3, state->state[3][0]);
	}

	return SUCCESS;
}



HashReturn Hash(int hashbitlen, const BitSequence *data, DataLength databitlen, BitSequence *hashval)
{
	HashReturn hRet;
	hashState hs;

	hRet = Init(&hs, hashbitlen);
	if(hRet != SUCCESS)
		return hRet;

	hRet = Update(&hs, data, databitlen);
	if(hRet != SUCCESS)
		return hRet;

	hRet = Final(&hs, hashval);
	if(hRet != SUCCESS)
		return hRet;

	return SUCCESS;
}


