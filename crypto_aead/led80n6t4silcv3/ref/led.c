/* 
 *	Copyright (c) 2014. All rights are reserved by Jian Guo
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS 
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
 * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL WE
 * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, OR CONSEQUENTIAL 
 * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OF THE 
 * SOFTWARE.
 * 
 * Thanks to Yuichi Niwa at Nagoya University for an independent implementation, 
 * and for pointing out an error in Key Schedule.
 * 
 * This version of LED is between the CHES 2011 http://dx.doi.org/10.1007/978-3-642-23951-9_22
 * and eprint version http://eprint.iacr.org/2012/600.pdf i.e., the round-constants
 * are round and key-size dependent, and the key with size (64,128] will be padded
 * with all 0s as in CHES 2011 version, instead of repeatition as in eprint version.
 * 
 * Contact: Jian Guo, ntu.guo@gmail.com
 * Last Modified: 27 June 2014
 */


#include <string.h>
#include <stdio.h>
#include "led.h"

void pstate(const unsigned char* st, int len);

int LED = 64;
const unsigned char MixColMatrix[4][4] = {
	{4,  1, 2, 2},
	{8,  6, 5, 6},
	{11,14,10, 9},
	{2,  2,15,11},
};
const unsigned char sbox[16] = {12, 5, 6, 11, 9, 0, 10, 13, 3, 14, 15, 8, 4, 7, 1, 2};
const unsigned char WORDFILTER = 0xF;

int DEBUG = 0;
unsigned char FieldMult(unsigned char a, unsigned char b)
{
	const unsigned char ReductionPoly = 0x3;
	unsigned char x = a, ret = 0;
	int i;
	for(i = 0; i < 4; i++) {
		if((b>>i)&1) ret ^= x;
		if(x&0x8) {
			x <<= 1;
			x ^= ReductionPoly;
		}
		else x <<= 1;
	}
	return ret&WORDFILTER;
}

void AddKey(unsigned char state[4][4], unsigned char* keyBytes, int half)
{
	int i, j;
	if((half&1) == 0){
		for(i = 0; i < 4; i++)
			for(j = 0; j < 4; j++)
				state[i][j] ^= keyBytes[4*i+j];
	}
	else{
		for(i = 0; i < 4; i++)
			for(j = 0; j < 4; j++)
				state[i][j] ^= keyBytes[4*i+j+(LED>64?16:0)];
	}
}

void AddConstants(unsigned char state[4][4], int r)
{
	const unsigned char RC[48] = {
		0x01, 0x03, 0x07, 0x0F, 0x1F, 0x3E, 0x3D, 0x3B, 0x37, 0x2F,
		0x1E, 0x3C, 0x39, 0x33, 0x27, 0x0E, 0x1D, 0x3A, 0x35, 0x2B,
		0x16, 0x2C, 0x18, 0x30, 0x21, 0x02, 0x05, 0x0B, 0x17, 0x2E,
		0x1C, 0x38, 0x31, 0x23, 0x06, 0x0D, 0x1B, 0x36, 0x2D, 0x1A,
		0x34, 0x29, 0x12, 0x24, 0x08, 0x11, 0x22, 0x04
	};
    /* row-dependent constants */
	state[1][0] ^= 1;
	state[2][0] ^= 2;
	state[3][0] ^= 3;

    /* key-size dependent constants */
	state[0][0] ^= (LED>>4)&0xf;
	state[1][0] ^= (LED>>4)&0xf;
	state[2][0] ^= LED & 0xf;
	state[3][0] ^= LED & 0xf;

    /* round-dependent constants */
	unsigned char tmp = (RC[r] >> 3) & 7;
	state[0][1] ^= tmp;
	state[2][1] ^= tmp;
	tmp =  RC[r] & 7;
	state[1][1] ^= tmp;
	state[3][1] ^= tmp;
}

void SubCell(unsigned char state[4][4])
{
	int i,j;
	for(i = 0; i < 4; i++)
		for(j = 0; j <  4; j++)
			state[i][j] = sbox[state[i][j]];
}

void ShiftRow(unsigned char state[4][4])
{
	int i, j;
	unsigned char tmp[4];
	for(i = 1; i < 4; i++) {
		for(j = 0; j < 4; j++)
			tmp[j] = state[i][j];
		for(j = 0; j < 4; j++)
			state[i][j] = tmp[(j+i)%4];
	}
}

void MixColumn(unsigned char state[4][4])
{
	int i, j, k;
	unsigned char tmp[4];
	for(j = 0; j < 4; j++){
		for(i = 0; i < 4; i++) {
			unsigned char sum = 0;
			for(k = 0; k < 4; k++)
				sum ^= FieldMult(MixColMatrix[i][k], state[k][j]);
			tmp[i] = sum;
		}
		for(i = 0; i < 4; i++)
			state[i][j] = tmp[i];
	}
}

void LED80_enc(unsigned char* input, const unsigned char* userkey)
{
	LED_enc(input, userkey, 80);
}

/* assume the ksbits is multiple of 4 */
void LED_enc(unsigned char* input, const unsigned char* userkey, int ksbits)
{
#ifdef _PRINT
	printf("LED  input: ");
	pstate(input, 8);
#endif
	unsigned char state[4][4];
	unsigned char keyNibbles[32];
	int i;
	for(i = 0; i < 16; i++) {
		if(i%2) state[i/4][i%4] = input[i>>1]&0xF;
		else state[i/4][i%4] = (input[i>>1]>>4)&0xF;
	}

	/* break the key into 4-bit nibbles */
	memset(keyNibbles, 0, 32);
	for(i = 0; i < ksbits/4; i++){
		if(i%2) keyNibbles[i] = userkey[i>>1]&0xF;
		else keyNibbles[i] = (userkey[i>>1]>>4)&0xF;
	}
	LED = ksbits;
	int RN = 48;
	if(LED <= 64)
		RN = 32;
	int j;
	AddKey(state, keyNibbles, 0);
	for(i = 0; i < RN/4; i++){
		for(j = 0; j < 4; j++)
		{
			AddConstants(state, i*4+j);
			SubCell(state);
			ShiftRow(state);
			MixColumn(state);
		}
		AddKey(state, keyNibbles, i+1);
	}
	for(i = 0; i < 8; i++)
		input[i] = ((state[(2*i)/4][(2*i)%4] & 0xF) << 4) | (state[(2*i+1)/4][(2*i+1)%4] & 0xF);
#ifdef _PRINT
	printf("LED output: ");
	pstate(input, 8);
#endif
}
