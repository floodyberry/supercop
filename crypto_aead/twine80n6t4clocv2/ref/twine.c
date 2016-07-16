/* Copyright (c) 2014, NEC Corporation. All rights reserved.
*
* LICENSE
*
* 1. NEC Corporation ("NEC") hereby grants users to use and reproduce 
*twine program ("Software") for testing and evaluation purpose for 
*CAESAR (Competition for Authenticated Encryption: Security, Applicability, 
*and Robustness). The users must not use the Software for any other purpose 
*or distribute it to any third party.
*
* 2. THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS 
*OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
*FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL NEC 
*BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, OR CONSEQUENTIAL 
*DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
*ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OF THE 
*SOFTWARE.
*
* 3. In the event of an user's failure to comply with any term of this License 
*or wrongful act, NEC may terminate such user's use of the Software. Upon such 
*termination the user must cease all use of the Software and destroy all copies 
*of the Software.
*
* 4. The users shall comply with all applicable laws and regulations, including 
*export and import control laws, which govern the usage of the Software.
*/

#include <stdio.h>
#include "twine.h"
void pstate(const unsigned char* st, int len);


int pswitch = 0;
const uint8 S[16] = {
	0xc, 0x0, 0xf, 0xa, 0x2, 0xb, 0x9, 0x5, 
	0x8, 0x3, 0xd, 0x7, 0x1, 0xe, 0x6, 0x4
};

// Key schedule constants 
const uint8 CON_H[ROUND-1] = {0,0,0,1,2,4,0,0,1,3,6,4,0,1,2,5,2,4,1,3,7,7,6,5,2,4,0,1,3,7,6,4,1,2,4};  // HIGH 3-bit
const uint8 CON_L[ROUND-1] = {1,2,4,0,0,0,3,6,4,0,0,3,5,2,4,0,3,6,7,6,4,3,5,1,1,2,7,6,4,0,3,5,1,2,4};  // LOW 3-bit

uint8	ek[ROUND][8]; 					// Extended key area: 4bit x Round

void pstate3(const unsigned char* st, int len)
{
	int i;
	for(i = 0; i < len; i++){
		printf("%01x", st[i]&0xf);
		if(((i%16) == (16-1)) && (i+1 !=len)) printf("\n");
	}
	printf("\n");
}

/** Encryption **/
void Encode(uint8 text[8], uint8 cipher[8])
{
#ifdef _PRINT
	printf("Twine  input: ");
	pstate(text, 8);
#endif
	uint8	i;
	uint8	data1[16], tmp, t_data[16];

	//Set plaintext
	data1[0] = text[0]>>4;
	data1[1] = text[0]&0xf;
	data1[2] = text[1]>>4;
	data1[3] = text[1]&0xf;
	data1[4] = text[2]>>4;
	data1[5] = text[2]&0xf;
	data1[6] = text[3]>>4;
	data1[7] = text[3]&0xf;
	data1[8] = text[4]>>4;
	data1[9] = text[4]&0xf;
	data1[10] = text[5]>>4;
	data1[11] = text[5]&0xf;
	data1[12] = text[6]>>4;
	data1[13] = text[6]&0xf;
	data1[14] = text[7]>>4;
	data1[15] = text[7]&0xf;

	//Round functions
	for(i=0; ; i++)
	{
 		data1[1] ^= S[data1[0] ^ ek[i][0]];
		data1[3] ^= S[data1[2] ^ ek[i][1]];
		data1[5] ^= S[data1[4] ^ ek[i][2]];
		data1[7] ^= S[data1[6] ^ ek[i][3]];
		data1[9] ^= S[data1[8] ^ ek[i][4]];
		data1[11] ^= S[data1[10] ^ ek[i][5]];
		data1[13] ^= S[data1[12] ^ ek[i][6]];
		data1[15] ^= S[data1[14] ^ ek[i][7]];

        if(pswitch){
            t_data[0] = data1[1];
            t_data[1] = data1[2];
            t_data[2] = data1[11];
            t_data[3] = data1[6];
            t_data[4] = data1[3];
            t_data[5] = data1[0];
            t_data[6] = data1[9];
            t_data[7] = data1[4];
            t_data[8] = data1[7];
            t_data[9] = data1[10];
            t_data[10] = data1[13];
            t_data[11] = data1[14];
            t_data[12] = data1[5];
            t_data[13] = data1[8];
            t_data[14] = data1[15];
            t_data[15] = data1[12];
            printf("ROUND %02d: ", i);
            pstate3(t_data, 16);
        }
		i++;
 		data1[2] ^= S[data1[1] ^ ek[i][0]];
		data1[6] ^= S[data1[11] ^ ek[i][1]];
		data1[0] ^= S[data1[3] ^ ek[i][2]];
		data1[4] ^= S[data1[9] ^ ek[i][3]];
		data1[10] ^= S[data1[7] ^ ek[i][4]];
		data1[14] ^= S[data1[13] ^ ek[i][5]];
		data1[8] ^= S[data1[5] ^ ek[i][6]];
		data1[12] ^= S[data1[15] ^ ek[i][7]];

		if(i == (ROUND-1))
			break;

		tmp = data1[0];
		data1[0] = data1[2];
		data1[2] = data1[14];
		data1[14] = data1[12];
		data1[12] = tmp;

		tmp = data1[1];
		data1[1] = data1[11];
		data1[11] = data1[15];
		data1[15] = data1[5];
		data1[5] = tmp;

		tmp = data1[3];
		data1[3] = data1[9];
		data1[9] = data1[13];
		data1[13] = data1[7];
		data1[7] = tmp;

		tmp = data1[4];
		data1[4] = data1[6];
		data1[6] = data1[10];
		data1[10] = data1[8];
		data1[8] = tmp;
        if(pswitch){
            printf("ROUND %02d: ", i);
            pstate3(data1, 16);
        }
	}

	//Set ciphertext
	cipher[0] = (data1[1]<<4) ^ data1[2];
	cipher[1] = (data1[11]<<4) ^ data1[6];
	cipher[2] = (data1[3]<<4) ^ data1[0];
	cipher[3] = (data1[9]<<4) ^ data1[4];
	cipher[4] = (data1[7]<<4) ^ data1[10];
	cipher[5] = (data1[13]<<4) ^ data1[14];
	cipher[6] = (data1[5]<<4) ^ data1[8];
	cipher[7] = (data1[15]<<4) ^ data1[12];
#ifdef _PRINT
	printf("Twine output: ");
	pstate(cipher, 8);
#endif
}

/** Decryption **/
void Decode(uint8 cipher[8], uint8 text[8])
{
	uint8	i, tmp;
	uint8	data1[16];

	//Set ciphertext
	data1[0] = cipher[0]>>4;
	data1[1] = cipher[0]&0xf;
	data1[2] = cipher[1]>>4;
	data1[3] = cipher[1]&0xf;
	data1[4] = cipher[2]>>4;
	data1[5] = cipher[2]&0xf;
	data1[6] = cipher[3]>>4;
	data1[7] = cipher[3]&0xf;
	data1[8] = cipher[4]>>4;
	data1[9] = cipher[4]&0xf;
	data1[10] = cipher[5]>>4;
	data1[11] = cipher[5]&0xf;
	data1[12] = cipher[6]>>4;
	data1[13] = cipher[6]&0xf;
	data1[14] = cipher[7]>>4;
	data1[15] = cipher[7]&0xf;

	//Round functions
	for(i=ROUND-1; ; i--)
	{
		data1[1] ^= S[data1[0] ^ ek[i][0]];
		data1[3] ^= S[data1[2] ^ ek[i][1]];
		data1[5] ^= S[data1[4] ^ ek[i][2]];
		data1[7] ^= S[data1[6] ^ ek[i][3]];
		data1[9] ^= S[data1[8] ^ ek[i][4]];
		data1[11] ^= S[data1[10] ^ ek[i][5]];
		data1[13] ^= S[data1[12] ^ ek[i][6]];
		data1[15] ^= S[data1[14] ^ ek[i][7]];

		i--;
		data1[0] ^= S[data1[5] ^ ek[i][0]];
		data1[4] ^= S[data1[1] ^ ek[i][1]];
		data1[12] ^= S[data1[7] ^ ek[i][2]];
		data1[8] ^= S[data1[3] ^ ek[i][3]];
		data1[6] ^= S[data1[13] ^ ek[i][4]];
		data1[2] ^= S[data1[9] ^ ek[i][5]];
		data1[10] ^= S[data1[15] ^ ek[i][6]];
		data1[14] ^= S[data1[11] ^ ek[i][7]];

		if(i == 0)
			break;

		tmp = data1[1];
		data1[1] = data1[5];
		data1[5] = data1[15];
		data1[15] = data1[11];
		data1[11] = tmp;

		tmp = data1[3];
		data1[3] = data1[7];
		data1[7] = data1[13];
		data1[13] = data1[9];
		data1[9] = tmp;

		tmp = data1[0];
		data1[0] = data1[12];
		data1[12] = data1[14];
		data1[14] = data1[2];
		data1[2] = tmp;

		tmp = data1[4];
		data1[4] = data1[8];
		data1[8] = data1[10];
		data1[10] = data1[6];
		data1[6] = tmp;
    
	}

	//Set plaintext
	text[0] = (data1[5]<<4) ^ data1[0];
	text[1] = (data1[1]<<4) ^ data1[4];
	text[2] = (data1[7]<<4) ^ data1[12];
	text[3] = (data1[3]<<4) ^ data1[8];
	text[4] = (data1[13]<<4) ^ data1[6];
	text[5] = (data1[9]<<4) ^ data1[2];
	text[6] = (data1[15]<<4) ^ data1[10];
	text[7] = (data1[11]<<4) ^ data1[14];
#ifdef _PRINT
	printf("Twine (decode) output: ");
	pstate(text, 8);
#endif
}

/** 80-bit Key schedule for single-block **/
void Keyschedule80(const uint8 sk[80/8])
{
	int	i;
	uint8	tmp[80/4];
	uint8	wk[4];
        
	//Copy the key 
#if 1
	for(i=0; i<(80/4); i+=2)
	{
		tmp[i] = sk[i/2] >> 4;
		tmp[i+1] = sk[i/2] & 0x0f;
	}
#else
	tmp[0] = sk[0] >> 4;
	tmp[1] = sk[0] & 0x0f;
	tmp[2] = sk[1] >> 4;
	tmp[3] = sk[1] & 0x0f;
	tmp[4] = sk[2] >> 4;
	tmp[5] = sk[2] & 0x0f;
	tmp[6] = sk[3] >> 4;
	tmp[7] = sk[3] & 0x0f;
	tmp[8] = sk[4] >> 4;
	tmp[9] = sk[4] & 0x0f;
	tmp[10] = sk[5] >> 4;
	tmp[11] = sk[5] & 0x0f;
	tmp[12] = sk[6] >> 4;
	tmp[13] = sk[6] & 0x0f;
	tmp[14] = sk[7] >> 4;
	tmp[15] = sk[7] & 0x0f;
	tmp[16] = sk[8] >> 4;
	tmp[17] = sk[8] & 0x0f;
	tmp[18] = sk[9] >> 4;
	tmp[19] = sk[9] & 0x0f;
#endif
        
	//Extended key (ek) generation
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
}

/** 128-bit Key schedule for single-block **/
void Keyschedule128(const uint8 sk[128/4])
{
	int	i;
	uint8	tmp[128/4];
	uint8	wk[5];

	//Copy the key 
#if 1
	for(i=0; i<(128/4); i+=2)
	{
		tmp[i] = sk[i/2] >> 4;
		tmp[i+1] = sk[i/2] & 0x0f;
	}
#else
	tmp[0] = sk[0] >> 4;
	tmp[1] = sk[0] & 0x0f;
	tmp[2] = sk[1] >> 4;
	tmp[3] = sk[1] & 0x0f;
	tmp[4] = sk[2] >> 4;
	tmp[5] = sk[2] & 0x0f;
	tmp[6] = sk[3] >> 4;
	tmp[7] = sk[3] & 0x0f;
	tmp[8] = sk[4] >> 4;
	tmp[9] = sk[4] & 0x0f;
	tmp[10] = sk[5] >> 4;
	tmp[11] = sk[5] & 0x0f;
	tmp[12] = sk[6] >> 4;
	tmp[13] = sk[6] & 0x0f;
	tmp[14] = sk[7] >> 4;
	tmp[15] = sk[7] & 0x0f;
	tmp[16] = sk[8] >> 4;
	tmp[17] = sk[8] & 0x0f;
	tmp[18] = sk[9] >> 4;
	tmp[19] = sk[9] & 0x0f;
	tmp[20] = sk[10] >> 4;
	tmp[21] = sk[10] & 0x0f;
	tmp[22] = sk[11] >> 4;
	tmp[23] = sk[11] & 0x0f;
	tmp[24] = sk[12] >> 4;
	tmp[25] = sk[12] & 0x0f;
	tmp[26] = sk[13] >> 4;
	tmp[27] = sk[13] & 0x0f;
	tmp[28] = sk[14] >> 4;
	tmp[29] = sk[14] & 0x0f;
	tmp[30] = sk[15] >> 4;
	tmp[31] = sk[15] & 0x0f;
#endif
        
	//Extended key (ek) generation
	for(i=0; ; i+=2)
	{
		//ek for two rounds
		ek[i][0] = tmp[2];
		ek[i][1] = tmp[3];
		ek[i][2] = tmp[12];
		ek[i][3] = tmp[15];
		ek[i][4] = tmp[17];
		ek[i][5] = tmp[18];
		ek[i][6] = tmp[28];
		ek[i][7] = tmp[31];

		ek[i+1][0] = tmp[6];
		ek[i+1][1] = tmp[7] ^ CON_H[i];
		ek[i+1][2] = tmp[16];
		ek[i+1][3] = tmp[19] ^ CON_L[i];
		ek[i+1][4] = tmp[21];
		ek[i+1][5] = tmp[22];
		ek[i+1][6] = tmp[1] ^ S[tmp[0]];
		ek[i+1][7] = tmp[0];
	
		//to the last two rounds
		if(i == (ROUND-2))
			break;

		//rotations for two rounds 
		wk[3] = tmp[4] ^ S[tmp[16]];
		wk[0] = tmp[5] ^ S[wk[3]];
		wk[1] = tmp[6];
		wk[2] = tmp[7] ^ CON_H[i];

		tmp[4] = tmp[12];
		tmp[5] = tmp[13];
		tmp[6] = tmp[14];
		tmp[7] = tmp[15];

		tmp[12] = tmp[20];
		tmp[13] = tmp[21];
		tmp[14] = tmp[22];
		tmp[15] = tmp[23] ^ S[tmp[30]] ^ CON_L[i+1];

		wk[4] = tmp[20];
		tmp[20] = tmp[28];
		tmp[21] = tmp[29];
		tmp[22] = tmp[30];
		tmp[23] = tmp[31];

		tmp[28] = wk[0];
		tmp[29] = wk[1];
		tmp[30] = wk[2];
		tmp[31] = wk[3];


		wk[3] = tmp[0];
		wk[0] = ek[i+1][6];
		wk[1] = tmp[2];
		wk[2] = tmp[3];

		tmp[0] = tmp[8] ^ S[wk[4]];
		tmp[1] = tmp[9];
		tmp[2] = tmp[10];
		tmp[3] = tmp[11] ^ CON_H[i+1];

		tmp[8] = tmp[16];
		tmp[9] = tmp[17];
		tmp[10] = tmp[18];
		tmp[11] = tmp[19] ^ CON_L[i];

		tmp[16] = tmp[24];
		tmp[17] = tmp[25];
		tmp[18] = tmp[26];
		tmp[19] = tmp[27] ^ S[wk[2]];

		tmp[24] = wk[0];
		tmp[25] = wk[1];
		tmp[26] = wk[2];
		tmp[27] = wk[3];
	}
}

int Keyschedule(const uint32 key_len, const uint8 sk[128/8])
{
	if(key_len == 80)
		Keyschedule80(sk);
	else if(key_len == 128)
		Keyschedule128(sk);
	else
		return -1;

	return 0;
}
