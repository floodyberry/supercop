/* Copyright (c) 2014, NEC Corporation. All rights reserved.
*
* LICENSE
*
* 1. NEC Corporation ("NEC") hereby grants users to use and reproduce 
*AES-OTR program ("Software") for testing and evaluation purpose for 
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
#include "t-aes_define.h"
#include "t-aes_table_enc_only.h"

static unsigned int ekey[4*(14+1)]; //AES round keys

int KeySchedule(int skeylen, int mode, const unsigned char *skey)
{
	int				i;
	int				Nk, Nr;
	unsigned int	tmp;

	/* Set Nk, Nr from skeylen*/
	switch(skeylen)
	{
		case 128:
			Nk = 4;
			Nr = 10;
			break;
		case 192:
			Nk = 6;
			Nr = 12;
			break;
		case 256:
			Nk = 8;
			Nr = 14;
			break;
		default:
			/* key-length error */
			return INVALID_PARAMETER;
	}
	
	/* enc/dec mode error */
	if((mode != ENC) && (mode != DEC))
	{
		return INVALID_PARAMETER;
	}

	/* round-key generation for enc mode */
	for(i=0; i<Nk; i++)
	{
		ekey[i] = (skey[4*i] << 24) | (skey[4*i+1] << 16) | (skey[4*i+2] << 8) | skey[4*i+3];
	}

	for(i=Nk; i<4*(Nr+1); i++)
	{
		if((i % Nk) == 0)
		{
			tmp  = S[(ekey[i-1] >> 16) & 0xff] << 24;
			tmp |= S[(ekey[i-1] >>  8) & 0xff] << 16;
			tmp |= S[ ekey[i-1]        & 0xff] <<  8;
			tmp |= S[ ekey[i-1] >> 24        ];
			ekey[i] = ekey[i-Nk] ^ tmp ^ RC[i/Nk-1];
		}
		else if((Nk == 8) && ((i % Nk) == 4))
		{
			tmp  = S[ ekey[i-1] >> 24        ] << 24;
			tmp |= S[(ekey[i-1] >> 16) & 0xff] << 16;
			tmp |= S[(ekey[i-1] >>  8) & 0xff] <<  8;
			tmp |= S[ ekey[i-1]        & 0xff];
			ekey[i] = ekey[i-Nk] ^ tmp;
		}
		else
		{
			ekey[i] = ekey[i-Nk] ^ ekey[i-1];
		}
	}

	/* round-key generation for dec mode */
	if(mode == DEC)
	{ return INVALID_PARAMETER;
	}

	return SUCCESS;
}

int Encryption(int skeylen, unsigned char *plain, unsigned char *cipher)
{
	int				i, j;
	int				Nr;
	unsigned int	tmp_in[4];
	unsigned int	tmp_out[4];
	
	/* Set Nk, Nr from skeylen*/
	switch(skeylen)
	{
		case 128:
			Nr = 10;
			break;
		case 192:
			Nr = 12;
			break;
		case 256:
			Nr = 14;
			break;
		default:
			/* key-length error */
			return INVALID_PARAMETER;
	}
	
	/* round-key index initilization */
	i = 0;

	/* AddRoundKey */
	tmp_in[0] = ((plain[ 0] << 24) | (plain[ 1] << 16) | (plain[ 2] << 8) | plain[ 3]) ^ ekey[i++];
	tmp_in[1] = ((plain[ 4] << 24) | (plain[ 5] << 16) | (plain[ 6] << 8) | plain[ 7]) ^ ekey[i++];
	tmp_in[2] = ((plain[ 8] << 24) | (plain[ 9] << 16) | (plain[10] << 8) | plain[11]) ^ ekey[i++];
	tmp_in[3] = ((plain[12] << 24) | (plain[13] << 16) | (plain[14] << 8) | plain[15]) ^ ekey[i++];
	
	for(j=1; j<=(Nr-1); j++)
	{
		/* SubBytes + ShiftRows + MixColumns */
		tmp_out[0] = T0[tmp_in[0] >> 24] ^ T1[(tmp_in[1] >> 16) & 0xff] ^ T2[(tmp_in[2] >> 8) & 0xff] ^ T3[tmp_in[3] & 0xff];
		tmp_out[1] = T0[tmp_in[1] >> 24] ^ T1[(tmp_in[2] >> 16) & 0xff] ^ T2[(tmp_in[3] >> 8) & 0xff] ^ T3[tmp_in[0] & 0xff];
		tmp_out[2] = T0[tmp_in[2] >> 24] ^ T1[(tmp_in[3] >> 16) & 0xff] ^ T2[(tmp_in[0] >> 8) & 0xff] ^ T3[tmp_in[1] & 0xff];
		tmp_out[3] = T0[tmp_in[3] >> 24] ^ T1[(tmp_in[0] >> 16) & 0xff] ^ T2[(tmp_in[1] >> 8) & 0xff] ^ T3[tmp_in[2] & 0xff];

		/* AddRoundKey */
		tmp_in[0] = tmp_out[0] ^ ekey[i++];
		tmp_in[1] = tmp_out[1] ^ ekey[i++];
		tmp_in[2] = tmp_out[2] ^ ekey[i++];
		tmp_in[3] = tmp_out[3] ^ ekey[i++];
	}

	/* SubBytes + ShiftRows + AddRoundKey */
	cipher[ 0] = S[ tmp_in[0] >> 24        ] ^  (ekey[i  ] >> 24)        ;
	cipher[ 1] = S[(tmp_in[1] >> 16) & 0xff] ^ ((ekey[i  ] >> 16) & 0xff);
	cipher[ 2] = S[(tmp_in[2] >>  8) & 0xff] ^ ((ekey[i  ] >>  8) & 0xff);
	cipher[ 3] = S[ tmp_in[3]        & 0xff] ^ ( ekey[i++]        & 0xff);
	cipher[ 4] = S[ tmp_in[1] >> 24        ] ^  (ekey[i  ] >> 24)        ;
	cipher[ 5] = S[(tmp_in[2] >> 16) & 0xff] ^ ((ekey[i  ] >> 16) & 0xff);
	cipher[ 6] = S[(tmp_in[3] >>  8) & 0xff] ^ ((ekey[i  ] >>  8) & 0xff);
	cipher[ 7] = S[ tmp_in[0]        & 0xff] ^ ( ekey[i++]        & 0xff);
	cipher[ 8] = S[ tmp_in[2] >> 24        ] ^  (ekey[i  ] >> 24)        ;
	cipher[ 9] = S[(tmp_in[3] >> 16) & 0xff] ^ ((ekey[i  ] >> 16) & 0xff);
	cipher[10] = S[(tmp_in[0] >>  8) & 0xff] ^ ((ekey[i  ] >>  8) & 0xff);
	cipher[11] = S[ tmp_in[1]        & 0xff] ^ ( ekey[i++]        & 0xff);
	cipher[12] = S[ tmp_in[3] >> 24        ] ^  (ekey[i  ] >> 24)        ;
	cipher[13] = S[(tmp_in[0] >> 16) & 0xff] ^ ((ekey[i  ] >> 16) & 0xff);
	cipher[14] = S[(tmp_in[1] >>  8) & 0xff] ^ ((ekey[i  ] >>  8) & 0xff);
	cipher[15] = S[ tmp_in[2]        & 0xff] ^ ( ekey[i  ]        & 0xff);

	return SUCCESS;
}

