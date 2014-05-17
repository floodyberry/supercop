/******************************************************************************
  Written and Copyright (C) by Dirk Klose
  and the EmSec Embedded Security group of Ruhr-Universitaet Bochum. 
  All rights reserved.

  Contact lightweight@crypto.rub.de for comments & questions.
  This program is free software; You may use it or parts of it or
  modifiy it under the following terms:

  (1) Usage and/or redistribution and/or modification of the software 
  or parts of the software is permitted for non-commercial use only.

  (2a) If this software or parts are used as part of a new software, you
  must license the entire work, as a whole, under this License to anyone
  who comes into possession of a copy. This License will therefore
  apply, to the whole of the work, and all its parts, regardless of how
  they are packaged.

  (2b) You may expand this license by your own license. In this case this
  license still applies to the software as mentioned in (2a) and must
  not be changed. The expansion must be clearly recognizable as such. In
  any case of collision between the license and the expansion the
  license is superior to the expansion.

  (3) If this software or parts are used as part of a new software, you
  must provide equivalent access to the source code of the entire work,
  as a whole, to anyone who comes into possession of a copy, in the same
  way through the same place at no further charge, as for the binary
  version.

  (4) This program is distributed in the hope that it will be useful,
  but   WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
  (5) These notices must be retained in any copies of any part of this
  documentation and/or software.

  (6) If this software is used credit must be given to the
  "Embedded Security Group of Ruhr-Universitaet Bochum, Germany" as
  the authors of the parts of the software used. This can be in the form
  of a textual message at program startup or  at *beginning* of the
  documentation (online or textual) provided with the package.

  If you are interested in a commercial use 
  please contact '''lightweigth@crypto.rub.de'''
 ******************************************************************************/

// Include-file

#include <string.h>

int present_enc(unsigned char state[8], const unsigned char userkey[10])
{
	unsigned char key[10];
	memcpy(key, userkey, 10);
	const unsigned char sBox4[] =	{
		0xc,0x5,0x6,0xb,0x9,0x0,0xa,0xd,0x3,0xe,0xf,0x8,0x4,0x7,0x1,0x2
	};
	//	Counter
	unsigned char i = 0;
	//	pLayer variables
	unsigned char position = 0;
	unsigned char element_source = 0;
	unsigned char bit_source = 0;
	unsigned char element_destination	= 0;
	unsigned char bit_destination	= 0;
	unsigned char temp_pLayer[8];
	//	Key scheduling variables
	unsigned char round;
	unsigned char save1;
	unsigned char save2;
	//	****************** Encryption **************************
	round=0;
	do
	{
		//	****************** addRoundkey *************************
		i=0;
		do
		{
			state[i] = state[i] ^ key[i+2];
			i++;
		}
		while(i<=7);
		//	****************** sBox ********************************
		do
		{
			i--;
			state[i] = sBox4[state[i]>>4]<<4 | sBox4[state[i] & 0xF];
		}
		while(i>0);
		//	****************** pLayer ******************************
		for(i=0;i<8;i++)
		{
			temp_pLayer[i] = 0;
		}
		for(i=0;i<64;i++)
		{
			position = (16*i) % 63;						//Artithmetic calculation of the pLayer
			if(i == 63)									//exception for bit 63
				position = 63;
			element_source		= i / 8;
			bit_source 			= i % 8;
			element_destination	= position / 8;
			bit_destination 	= position % 8;
			temp_pLayer[element_destination] |= ((state[element_source]>>bit_source) & 0x1) << bit_destination;
		}
		for(i=0;i<=7;i++)
		{
			state[i] = temp_pLayer[i];
		}
		//	****************** End pLayer **************************
		//	****************** Key Scheduling **********************
		save1  = key[0];
		save2  = key[1];	
		i = 0;
		do
		{
			key[i] = key[i+2];
			i++;
		}
		while(i<8);
		key[8] = save1;
		key[9] = save2;
		i = 0;
		save1 = key[0] & 7;								//61-bit left shift
		do
		{
			key[i] = key[i] >> 3 | key[i+1] << 5;			
			i++;
		}
		while(i<9);
		key[9] = key[9] >> 3 | save1 << 5;

		key[9] = sBox4[key[9]>>4]<<4 | (key[9] & 0xF);	//S-Box application

		if((round+1) % 2 == 1)							//round counter addition
			key[1] ^= 128;
		key[2] = ((((round+1)>>1) ^ (key[2] & 15)) | (key[2] & 240));
		//	****************** End Key Scheduling ******************
		round++;
	}
	while(round<31);
	//	****************** addRoundkey *************************
	i = 0;
	do										//final key XOR
	{
		state[i] = state[i] ^ key[i+2];
		i++;
	}
	while(i<=7);
	return 0;		
	//	****************** End addRoundkey *********************
	//	****************** End Encryption  **********************
}
