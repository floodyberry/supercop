//Implementation of Luffa-224 v1.0
//Author: Thomaz Eduardo de Figueiredo Oliveira
//Universidade de Campinas - Institute of Computing - Brazil
//thomaz.oliveira@students.ic.unicamp.br

//#include "crypto_hash.h"
#include <stdio.h>
#include <string.h>
#include "crypto_hash.h"

typedef unsigned char u8;
typedef unsigned int u32;
typedef unsigned long long u64;

//round constants
static const u32 CONSTS[48] = {
0x303994a6,0xe0337818,0xc0e65299,0x441ba90d,
0x6cc33a12,0x7f34d442,0xdc56983e,0x9389217f,
0x1e00108f,0xe5a8bce6,0x7800423d,0x5274baf4,
0x8f5b7882,0x26889ba7,0x96e1db12,0x9a226e9d,
0xb6de10ed,0x01685f3d,0x70f47aae,0x05a17cf4,
0x0707a3d4,0xbd09caca,0x1c1e8f51,0xf4272b28,
0x707a3d45,0x144ae5cc,0xaeb28562,0xfaa7ae2b,
0xbaca1589,0x2e48f1c1,0x40a46f3e,0xb923c704,
0xfc20d9d2,0xe25e72c1,0x34552e25,0xe623bb72,
0x7ad8818f,0x5c58a4a4,0x8438764a,0x1e38e2e7,
0xbb6de032,0x78e38b9d,0xedb780c8,0x27586719,
0xd9847356,0x36eda57f,0xa2c78434,0x703aace7
};

//IV
static const u32 IV[24] = {
0x6d251e69,0x44b051e0,0x4eaa6fb4,0xdbf78465,
0x6e292011,0x90152df4,0xee058139,0xdef610bb,
0xc3b44b95,0xd9d2f256,0x70eee9a0,0xde099fa3,
0x5d9b0557,0x8fc944b3,0xcf1ccf0e,0x746cd581,
0xf7efc89d,0x5dba5781,0x04016ce5,0xad659c05,
0x0306194f,0x666d1836,0x24aa230a,0x8b264ae7
};

//global var
static u32 chaining[24];

//round subcrumb
static void fLuffaRoundPermSubCrumb(u32 *r0, u32 *r1, u32 *r2, u32 *r3) {
	u32 aux;

	aux = *r0;
	*r0 = *r0 | *r1;
	*r2 = *r2 ^ *r3;
	*r1 = ~(*r1);
	*r0 = *r0 ^ *r3;
	*r3 = *r3 & aux;
	*r1 = *r1 ^ *r3;
	*r3 = *r3 ^ *r2;
	*r2 = *r2 & *r0;
	*r0 = ~(*r0);
	*r2 = *r2 ^ *r1;
	*r1 = *r1 | *r3;
	aux = aux ^ *r1;
	*r3 = *r3 ^ *r2;
	*r2 = *r2 & *r1;
	*r1 = *r1 ^ *r0;
	*r0 = aux;
}

static void fLuffaRoundPermMixWord(u32 *ch0, u32 *ch4) {
	*ch4 = *ch4 ^ *ch0;
	*ch0 = (*ch0 << 2) | (*ch0 >> 30);

	*ch0 = *ch0 ^ *ch4;
	*ch4 = (*ch4 << 14) | (*ch4 >> 18);

	*ch4 = *ch4 ^ *ch0;
	*ch0 = (*ch0 << 10) | (*ch0 >> 22);

	*ch0 = *ch0 ^ *ch4;
	*ch4 = (*ch4 << 1) | (*ch4 >> 31);	
}

//round tweak
static void fLuffaRoundPermTweak() {
	int i;

	for (i=12;i<16;i++) {
		chaining[i] = (chaining[i] << 1) | (chaining[i] >> 31);
		chaining[i+8] = (chaining[i+8] << 2) | (chaining[i+8] >> 30);
	}

}

//multiplication by 0x02 in GF(2^8)^32
static void fLuffaRoundMImult2(u32 *num) {
	u32 aux;

	aux = num[7];
	num[7] = num[6];
	num[6] = num[5];
	num[5] = num[4];
	num[4] = num[3] ^ aux;
	num[3] = num[2] ^ aux;
	num[2] = num[1];
	num[1] = num[0] ^ aux;
	num[0] = aux;
}

//big to little endian
static void fLittleEndian(u32 *buffer) {
	int i;

	for (i=0;i<8;i++) {
		buffer[i] = (buffer[i] & 0x00FF00FF) << 8 | (buffer[i] & 0xFF00FF00) >> 8;
		buffer[i] = (buffer[i] & 0x0000FFFF) << 16 | (buffer[i] & 0xFFFF0000) >> 16;
	}
}

//round function
static void fLuffaRound(u32 *buffer) {
	int i;
	u32 tmp[8];

	fLittleEndian(buffer);

	//MESSAGE INJECTION	
	for (i=0;i<8;i++) { tmp[i] = chaining[i] ^ chaining[8+i] ^ chaining[16+i]; }

	fLuffaRoundMImult2(&tmp[0]);	

	//w0
	for (i=0;i<8;i++) { chaining[i] = chaining[i] ^ tmp[i] ^ buffer[i]; }	

	//w1
	fLuffaRoundMImult2(&buffer[0]);
	for (i=0;i<8;i++) { chaining[8+i] = chaining[8+i] ^ tmp[i] ^ buffer[i]; }	

	//w2
	fLuffaRoundMImult2(&buffer[0]);
	for (i=0;i<8;i++) { chaining[16+i] = chaining[16+i] ^ tmp[i] ^ buffer[i]; }	

	//PERMUTATION	
	fLuffaRoundPermTweak();	
	
	//w0
	for (i=0;i<16;i=i+2) {
		fLuffaRoundPermSubCrumb(&chaining[0], &chaining[1], &chaining[2], &chaining[3]);
		fLuffaRoundPermSubCrumb(&chaining[5], &chaining[6], &chaining[7], &chaining[4]);

		fLuffaRoundPermMixWord(&chaining[0], &chaining[4]);		
		fLuffaRoundPermMixWord(&chaining[1], &chaining[5]);
		fLuffaRoundPermMixWord(&chaining[2], &chaining[6]);
		fLuffaRoundPermMixWord(&chaining[3], &chaining[7]);

		chaining[0] = chaining[0] ^ CONSTS[i];
		chaining[4] = chaining[4] ^ CONSTS[i+1];
	}

	//w1
	for (i=0;i<16;i=i+2) {
		fLuffaRoundPermSubCrumb(&chaining[8], &chaining[9], &chaining[10], &chaining[11]);
		fLuffaRoundPermSubCrumb(&chaining[13], &chaining[14], &chaining[15], &chaining[12]);

		fLuffaRoundPermMixWord(&chaining[8], &chaining[12]);		
		fLuffaRoundPermMixWord(&chaining[9], &chaining[13]);
		fLuffaRoundPermMixWord(&chaining[10], &chaining[14]);
		fLuffaRoundPermMixWord(&chaining[11], &chaining[15]);

		chaining[8] = chaining[8] ^ CONSTS[16+i];
		chaining[12] = chaining[12] ^ CONSTS[16+i+1];
	}

	//w2
	for (i=0;i<16;i=i+2) {
		fLuffaRoundPermSubCrumb(&chaining[16], &chaining[17], &chaining[18], &chaining[19]);
		fLuffaRoundPermSubCrumb(&chaining[21], &chaining[22], &chaining[23], &chaining[20]);

		fLuffaRoundPermMixWord(&chaining[16], &chaining[20]);		
		fLuffaRoundPermMixWord(&chaining[17], &chaining[21]);
		fLuffaRoundPermMixWord(&chaining[18], &chaining[22]);
		fLuffaRoundPermMixWord(&chaining[19], &chaining[23]);

		chaining[16] = chaining[16] ^ CONSTS[32+i];
		chaining[20] = chaining[20] ^ CONSTS[32+i+1];	
	}

}

//message padding
static void fLuffaPadding(u8 *buffer, int block) {
	buffer[block] = 0x80;	
	
	for (block=block+1;block<32;block++) { buffer[block] = 0x00; }
}

//finalization step
static void fLuffaFinalization(u32 *buffer) {
	int i;

	for (i=0;i<8;i++) { buffer[i] = 0; }

	fLuffaRound(buffer);

	for (i=0;i<8;i++) { chaining[i] = chaining[i] ^ chaining[8+i] ^ chaining[16+i]; }
}

static void fOutputPrint256(u8 *output, u8 *chaining) {
	int i;
	for (i=0;i<32;i++) { output[i] = chaining[i]; }
}

int crypto_hash(unsigned char *out, const unsigned char *in, unsigned long long inlen) {
	u8 buffer[32];
	int i;
	int bufinit = 0;

	//Init
	for (i=0;i<24;i++) { chaining[i] = IV[i]; }

	//Round
	while(inlen >= 32) {
		for (i=0;i<32;i++) { buffer[i] = in[bufinit + i]; }				
		fLuffaRound((u32 *) buffer);
		inlen = inlen - 32;
		bufinit = bufinit + 32;
	}

	for (i=0;i<inlen;i++) {	buffer[i] = in[bufinit + i]; }

	//Padding
	fLuffaPadding(buffer, inlen);
	fLuffaRound((u32 *) buffer);

	//Final message
	fLuffaFinalization((u32 *) buffer);

	//To output
	fLittleEndian(chaining);
	fOutputPrint256(out, (u8 *) chaining);	

	return 0;
}
