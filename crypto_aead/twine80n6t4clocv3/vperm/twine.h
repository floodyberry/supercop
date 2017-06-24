/*
modify by gfairyh

it is ok to run.
*/

/* a vperm implementation of TWINE block cipher */
#include "common.h"

#define ROUND  36

dqword lsbox, usbox;                  /* the twine sbox with lower and upper 4-bits, usbox = lsbox << 4 */
unsigned char ek[ROUND][8];
dqword rks[ROUND];

ALIGN16(const unsigned char S[16]) = {
	0xc, 0x0, 0xf, 0xa, 0x2, 0xb, 0x9, 0x5,
	0x8, 0x3, 0xd, 0x7, 0x1, 0xe, 0x6, 0x4
};

/* shuffle 64 bits message in the lower half, re-group it into 16 nibbles of 4-bits,
 * and distribute each nibble to each unsigned char of the 128-bit word, in the original order,
 * note the TWINE design treats the upper 4-bits of the first unsigned char as the first nibble
 */


const unsigned char CON_H[ROUND-1] = {0,0,0,1,2,4,0,0,1,3,6,4,0,1,2,5,2,4,1,3,7,7,6,5,2,4,0,1,3,7,6,4,1,2,4};  // HIGH 3-bit
const unsigned char CON_L[ROUND-1] = {1,2,4,0,0,0,3,6,4,0,0,3,5,2,4,0,3,6,7,6,4,3,5,1,1,2,7,6,4,0,3,5,1,2,4};  // LOW 3-bit

ALIGN16(const unsigned char TWINE_ROUND_SHUFFLE[12][16]) =
{
    {1, 0, 4, 5, 2, 3, 7, 6, 9, 8, 12, 13, 10, 11, 15, 14},
	{5, 3, 7, 1, 6, 0, 4, 2, 13, 11, 15, 9, 14, 8, 12, 10},
	{6, 7, 3, 2, 5, 4, 0, 1, 14, 15, 11, 10, 13, 12, 8, 9},
	{2, 4, 0, 6, 1, 7, 3, 5, 10, 12, 8, 14, 9, 15, 11, 13},
	{0, 2, 6, 4, 3, 1, 5, 7, 8, 10, 14, 12, 11, 9, 13, 15},
	{2, 0, 3, 1, 6, 4, 7, 5, 10, 8, 11, 9, 14, 12, 15, 13}
};

/* the optimized SSE implementation of twine80 */
void TWINE80_enc(dqword *state) {              
	dqword left, right, tmp;                 
	left = SRLW((MASK4U(*state)), 4);				
	right = MASK4L(*state);					
	int _i = 0;                             
	for(_i = 0; _i < ROUND; _i+=4){         
		tmp = XORDQW(left, rks[_i+0]);		
		tmp = PSHUFB(lsbox, tmp);			
		right = XORDQW(right, tmp);			
		tmp = LOAD(TWINE_ROUND_SHUFFLE[0]);		
		left = PSHUFB(left, tmp);			
		
		tmp = XORDQW(right, rks[_i+1]);		
		tmp = PSHUFB(lsbox, tmp);			
		left = XORDQW(left, tmp);				
		tmp = LOAD(TWINE_ROUND_SHUFFLE[1]);		
		right = PSHUFB(right, tmp);		
		
		tmp = XORDQW(left, rks[_i+2]);		
		tmp = PSHUFB(lsbox, tmp);			
		right = XORDQW(right, tmp);			
		tmp = LOAD(TWINE_ROUND_SHUFFLE[2]);		
		left = PSHUFB(left, tmp);			
		
		tmp = XORDQW(right, rks[_i+3]);		
		tmp = PSHUFB(lsbox, tmp);			
		left = XORDQW(left, tmp);				
		tmp = LOAD(TWINE_ROUND_SHUFFLE[3]);		
		right = PSHUFB(right, tmp);		
		
	}                                       
	left = PSHUFB(left, LOAD(TWINE_ROUND_SHUFFLE[4]));
	right = PSHUFB(right, LOAD(TWINE_ROUND_SHUFFLE[5]));
	right = SLLW(right, 4);
	*state = XORDQW(left, right);
}





/* 80-bit Key schedule for double-block with the master key */
void TWINE80_Keyschedule(const unsigned char sk[80/8])
{
	lsbox = LOAD(S);
	usbox = SLLW(lsbox, 4);

	int	i;
	unsigned char	tmp[80/4];
	unsigned char	wk[4];

	for(i=0; i<(80/4); i+=2)
	{
		tmp[i] = sk[i/2] >> 4;
		tmp[i+1] = sk[i/2] & 0x0f;
	}

	for(i=0; ; i+=2)
	{
		//ek for two rounds
		ek[i][0] = tmp[1];
		ek[i][1] = tmp[3];
		ek[i][2] = tmp[4];
		ek[i][3] = tmp[6];
		ek[i][4] = tmp[13];
		ek[i][5] = tmp[14];
		ek[i][6] = tmp[15];
		ek[i][7] = tmp[16];

		ek[i+1][0] = tmp[5];
		ek[i+1][1] = tmp[7] ^ CON_H[i];
		ek[i+1][2] = tmp[8];
		ek[i+1][3] = tmp[10];
		ek[i+1][4] = tmp[17];
		ek[i+1][5] = tmp[18];
		ek[i+1][6] = tmp[19] ^ CON_L[i];
		ek[i+1][7] = tmp[1] ^ S[tmp[0]];

		//to the last two rounds
		if(i == (ROUND-2))
			break;

		//rotations for two rounds
		wk[3] = tmp[4] ^ S[tmp[16]];
		wk[0] = tmp[5] ^ S[wk[3]];
		wk[1] = tmp[6];
		wk[2] = ek[i+1][1];

		tmp[4] = tmp[12];
		tmp[5] = tmp[13];
		tmp[6] = tmp[14];
		tmp[7] = tmp[15];

		tmp[12] = ek[i+1][7];
		tmp[13] = tmp[2];
		tmp[14] = tmp[3];
		tmp[15] = tmp[0] ^ CON_L[i+1];

		tmp[0] = tmp[8] ^ S[ek[i+1][7]];
		tmp[1] = tmp[9];
		tmp[2] = tmp[10];
		tmp[3] = tmp[11] ^ CON_H[i+1];

		tmp[8] = tmp[16];
		tmp[9] = tmp[17];
		tmp[10] = tmp[18];
		tmp[11] = tmp[19] ^ CON_L[i];

		tmp[16] = wk[0];
		tmp[17] = wk[1];
		tmp[18] = wk[2];
		tmp[19] = wk[3];
	}

	for(i = 0; i < ROUND; i++)
	{
        /* key setup for the optimized implementation */
		rks[i] = LOAD128L(ek[i]);
		switch(i%4){
			case 0:
				rks[i] = PSHUFB(rks[i], _mm_setr_epi8(0,1,2,3,4,5,6,7,0,1,2,3,4,5,6,7));
				break;
			case 1:
				rks[i] = PSHUFB(rks[i], _mm_setr_epi8(0,2,6,4,3,1,5,7,0,2,6,4,3,1,5,7));
				break;
			case 2:
				rks[i] = PSHUFB(rks[i], _mm_setr_epi8(0,6,5,3,4,2,1,7,0,6,5,3,4,2,1,7));
				break;
			case 3:
				rks[i] = PSHUFB(rks[i], _mm_setr_epi8(0,5,1,4,3,6,2,7,0,5,1,4,3,6,2,7));
				break;
		}
	}
}
