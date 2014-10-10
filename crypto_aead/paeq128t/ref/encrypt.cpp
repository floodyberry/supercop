/* PAEQ128t: reference version*/

#ifndef NO_SUPERCOP
#include "crypto_aead.h"
#endif
#include "api.h"

#include <stdio.h>
#include <stdlib.h>
#include "string.h"
//#include "wmmintrin.h"
//#include <immintrin.h> 

#define D_BYTES 2

#define CRYPTO_MBLOCK (64-D_BYTES-CRYPTO_KEYBYTES)  //46 for 16-byte key
#define CRYPTO_ADBLOCK (64-D_BYTES-2*CRYPTO_KEYBYTES) //30 for 16-byte key
#define CRYPTO_COUNTERBYTES (64-D_BYTES-CRYPTO_KEYBYTES-CRYPTO_NPUBBYTES)  //34 for 16-byte key and 12-byte nonce
#define CRYPTO_LENGTH 12 //Maximal length of plaintext/AD length

#define AES_GROUP_ROUNDS 2
#define AES_GROUPS 10
//#define EXTRANONCE

  //This is the implementation of PPAE instantiated with AESQ permutation
int key_bytes = CRYPTO_KEYBYTES;
int nonce_bytes = CRYPTO_NPUBBYTES;
int tag_bytes = CRYPTO_ABYTES;


//AES S-box
const static unsigned char sbox[256] =   {
		//0     1     2     3     4     5     6     7     8     9     A     B     C     D     E     F
		0x63, 0x7c, 0x77, 0x7b, 0xf2, 0x6b, 0x6f, 0xc5, 0x30, 0x01, 0x67, 0x2b, 0xfe, 0xd7, 0xab, 0x76, //0
		0xca, 0x82, 0xc9, 0x7d, 0xfa, 0x59, 0x47, 0xf0, 0xad, 0xd4, 0xa2, 0xaf, 0x9c, 0xa4, 0x72, 0xc0, //1
		0xb7, 0xfd, 0x93, 0x26, 0x36, 0x3f, 0xf7, 0xcc, 0x34, 0xa5, 0xe5, 0xf1, 0x71, 0xd8, 0x31, 0x15, //2
		0x04, 0xc7, 0x23, 0xc3, 0x18, 0x96, 0x05, 0x9a, 0x07, 0x12, 0x80, 0xe2, 0xeb, 0x27, 0xb2, 0x75, //3
		0x09, 0x83, 0x2c, 0x1a, 0x1b, 0x6e, 0x5a, 0xa0, 0x52, 0x3b, 0xd6, 0xb3, 0x29, 0xe3, 0x2f, 0x84, //4
		0x53, 0xd1, 0x00, 0xed, 0x20, 0xfc, 0xb1, 0x5b, 0x6a, 0xcb, 0xbe, 0x39, 0x4a, 0x4c, 0x58, 0xcf, //5
		0xd0, 0xef, 0xaa, 0xfb, 0x43, 0x4d, 0x33, 0x85, 0x45, 0xf9, 0x02, 0x7f, 0x50, 0x3c, 0x9f, 0xa8, //6
		0x51, 0xa3, 0x40, 0x8f, 0x92, 0x9d, 0x38, 0xf5, 0xbc, 0xb6, 0xda, 0x21, 0x10, 0xff, 0xf3, 0xd2, //7
		0xcd, 0x0c, 0x13, 0xec, 0x5f, 0x97, 0x44, 0x17, 0xc4, 0xa7, 0x7e, 0x3d, 0x64, 0x5d, 0x19, 0x73, //8
		0x60, 0x81, 0x4f, 0xdc, 0x22, 0x2a, 0x90, 0x88, 0x46, 0xee, 0xb8, 0x14, 0xde, 0x5e, 0x0b, 0xdb, //9
		0xe0, 0x32, 0x3a, 0x0a, 0x49, 0x06, 0x24, 0x5c, 0xc2, 0xd3, 0xac, 0x62, 0x91, 0x95, 0xe4, 0x79, //A
		0xe7, 0xc8, 0x37, 0x6d, 0x8d, 0xd5, 0x4e, 0xa9, 0x6c, 0x56, 0xf4, 0xea, 0x65, 0x7a, 0xae, 0x08, //B
		0xba, 0x78, 0x25, 0x2e, 0x1c, 0xa6, 0xb4, 0xc6, 0xe8, 0xdd, 0x74, 0x1f, 0x4b, 0xbd, 0x8b, 0x8a, //C
		0x70, 0x3e, 0xb5, 0x66, 0x48, 0x03, 0xf6, 0x0e, 0x61, 0x35, 0x57, 0xb9, 0x86, 0xc1, 0x1d, 0x9e, //D
		0xe1, 0xf8, 0x98, 0x11, 0x69, 0xd9, 0x8e, 0x94, 0x9b, 0x1e, 0x87, 0xe9, 0xce, 0x55, 0x28, 0xdf, //E
		0x8c, 0xa1, 0x89, 0x0d, 0xbf, 0xe6, 0x42, 0x68, 0x41, 0x99, 0x2d, 0x0f, 0xb0, 0x54, 0xbb, 0x16 };

unsigned char mul[256][256]; //GF(256) multiplication table, initialized in Init().

unsigned char Shuffle[16] = {3,15,10,6, 1,13,8,4, 2,14,11,7, 0,12,9,5};

void AES_Round(unsigned char* state)  //SubBytes-ShiftRows-MixColumns
{
	unsigned char tmp[4][4];

	for(unsigned i=0; i<4; ++i)
	{
		for(unsigned j=0; j<4; ++j)
			tmp[j][i] = state[4*i+j];//AES state conversion
	}
	for(unsigned i=0; i<4; ++i)//Columnwise loop
	 {
	 	state[4*i] = mul[sbox[tmp[0][i]]][2] ^ mul[sbox[tmp[3][(i+3)%4]]][1] ^
						mul[sbox[tmp[2][(i+2)%4]]][1] ^ mul[sbox[tmp[1][(i+1)%4]]][3];
		state[4*i+1] = mul[sbox[tmp[1][(i+1)%4]]][2] ^ mul[sbox[tmp[0][i]]][1] ^
					mul[sbox[tmp[3][(i+3)%4]]][1] ^ mul[sbox[tmp[2][(i+2)%4]]][3];
		state[4*i+2] = mul[sbox[tmp[2][(i+2)%4]]][2] ^ mul[sbox[tmp[1][(i+1)%4]]][1] ^
					mul[sbox[tmp[0][i]]][1] ^ mul[sbox[tmp[3][(i+3)%4]]][3];
		state[4*i+3] = mul[sbox[tmp[3][(i+3)%4]]][2] ^ mul[sbox[tmp[2][(i+2)%4]]][1] ^
					mul[sbox[tmp[1][(i+1)%4]]][1] ^ mul[sbox[tmp[0][i]]][3];
	 }

}

void FPerm(const unsigned char* input, unsigned char* output)//AESQ permutation
{

	unsigned char Registers[4][16];  //AES state registers
	unsigned char Registers_tmp[4][16];  //AES state registers

	for(unsigned i=0; i<4; ++i)//Filling registers
	{
		for(unsigned j=0; j<16; ++j)
			Registers[i][j] = input[16*i+j];
	}

	//Main permutation
	for(unsigned i=0; i<AES_GROUPS; ++i)//Group loop
	{
		//AES rounds
		for(unsigned r=0; r<4; ++r)//Register loop
		{
			for(unsigned j=0; j<AES_GROUP_ROUNDS; ++j)//Middle rounds
			{
				AES_Round(Registers[r]); //SB-SR-MC
				for(unsigned k=0; k<4;++k)  //Round constants
				{
					Registers[r][4*k] ^= 8*i+4*j+r+1;
					//printf("Constant for acc%d: %d\n",r,8*i+4*j+r+1);
				}
			}
		}
		//Permutation
		for(unsigned r=0; r<4; ++r)//Register loop
			for(unsigned j=0; j<16; ++j)
				Registers_tmp[r][j] = Registers[r][j];
			
		for(unsigned r=0; r<4; ++r)//Register loop
		{
			for(unsigned i=0; i<4; ++i)//Column loop
			{
				unsigned char r_out = Shuffle[4*r+i]/4;  //Register index
				unsigned char c_out = Shuffle[4*r+i]%4;  //Column index
				for(unsigned j=0; j<4; ++j)
					Registers[r_out][4*c_out+j] = Registers_tmp[r][4*i+j];
			}
		}
		
		
	}
	for(unsigned i=0; i<4; ++i)//Filling registers
	{
		for(unsigned j=0; j<16; ++j)
			output[16*i+j] = Registers[i][j];
	}

}

//GF(256) multiplication

unsigned char gmul_o(unsigned char a, unsigned char b) {
	unsigned char p = 0;
	unsigned char counter;
	unsigned char hi_bit_set;
	for(counter = 0; counter < 8; counter++) {
		if((b & 1) == 1) 
			p ^= a;
		hi_bit_set = (a & 0x80);
		a <<= 1;
		if(hi_bit_set == 0x80) 
			a ^= 0x1b;		
		b >>= 1;
	}
	return p;
}

void Init()
{
	for(unsigned i=0; i<256; ++i)
		{
			for(unsigned j=0; j<256; ++j)
				mul[i][j] = gmul_o(i,j);
		}
}


/*Error values: 1 - Invalid clen pointer
				2 - Invalid key or ciphertext pointer
				3 - Invalid plaintext pointer
				4 - Invalid associated data pointer

*/




int crypto_aead_encrypt(
       unsigned char *c,unsigned long long *clen,
       const unsigned char *m,unsigned long long mlen,
       const unsigned char *ad,unsigned long long adlen,
       const unsigned char *nsec,
       const unsigned char *npub,
       const unsigned char *k
     )

     {
		 Init();//Initializing GF(256) multiplication table for AES

		 if(clen==NULL)
			 return -1;
		 if((mlen==0) && (adlen==0))
		 {
			 *clen=0;
			 return 0;
		 }

		 //Assume that we do encryption and/or authentication so we need a key and a ciphertext pointer valid
		 if( (k==NULL) || (c==NULL) )
			 return -2;

		 if(npub==NULL)
			 return -7;

		 //Initializing constants
		unsigned char D0[2];
		D0[0] = CRYPTO_NPUBBYTES*8; //nonce length in bits, zero for 256-bit nonce
		D0[1] = CRYPTO_KEYBYTES*8; //key length in bits
		(*clen)=0;
		 
		 //Block variables
		 unsigned char BlockInput[64];  //V1 - input to the first layer call of F
			 unsigned char BlockMiddle[64];  //W1 - output of the first layer call of F
			 unsigned char BlockOutput[64];  //Y1 - output of the second layer call of F
			
		 unsigned char BlockLastInput[64];  //Z1 - input to the last call of F
		 memset(BlockLastInput,0,64);
		 unsigned char Tag[64]; //Tag output
		 
		 unsigned long long encrypted_bytes=0;//Encrypted bytes counter
		 

		 //Encryption part
		 if(mlen!=0)
		 {
			 if(m==NULL)
			 {
				 //Clearing variables
				for(unsigned i=0; i<64; ++i)
					BlockInput[i] = BlockMiddle[i] = BlockOutput[i] = BlockLastInput[i] = 0;
				return -3;
			 }
				 
			 unsigned long long mblock_counter=1;   //Message block counter
			 
			 while((mlen>0))
			 {
				 /* I. First layer */

				 //1. Domain-separation constant
				 BlockInput[1] = D0[1]; 
				 if(mlen>= CRYPTO_MBLOCK)
					 BlockInput[0] = D0[0];
				 else //Last incomplete block
					 BlockInput[0] = D0[0]+1;

				 //2. Counter
				 for(unsigned i=0; i<CRYPTO_COUNTERBYTES; ++i)
				 {
					 BlockInput[i+2] = (i<sizeof(mblock_counter))?(mblock_counter>>(8*i))&0xff :0;//copying counter bytewise
				 }
				 
				 //3. Nonce
				 for(unsigned i=0; i<CRYPTO_NPUBBYTES; ++i) 
				 {
					 BlockInput[i+2+CRYPTO_COUNTERBYTES] = npub[i];
				 }

				 //4. Key
				 for(unsigned i=0; i<CRYPTO_KEYBYTES; ++i) 
				 {
					 BlockInput[i+2+CRYPTO_COUNTERBYTES+CRYPTO_NPUBBYTES] = k[i];
				 }	 

				 //5. Permutation call
				 FPerm(BlockInput, BlockMiddle); //First layer call to F

				

				 /* II. Encryption*/

				 if(mlen>=CRYPTO_MBLOCK)//Full block encryption
				 {
					 for(unsigned i=0; i<CRYPTO_MBLOCK; ++i)
					 {
						 BlockMiddle[i+2] ^= m[encrypted_bytes+i];
						 c[encrypted_bytes+i] = BlockMiddle[i+2];
						 
					 }
					 BlockMiddle[1] =  D0[1];
					 BlockMiddle[0] = D0[0]+2;  //New Di constant

				 }

				 else //Last incomplete block
				 {
					 for(unsigned i=0; i<(unsigned)mlen; ++i)//Incomplete block Encryption
					 {
						 BlockMiddle[i+2] ^= m[encrypted_bytes+i];
						 c[encrypted_bytes+i] = BlockMiddle[i+2];						 
					 }
					 for(unsigned i=(unsigned)mlen; i<CRYPTO_MBLOCK; ++i)
					 {
						 BlockMiddle[i+2] ^=  (unsigned char)mlen;  //Extra Padding: extra bytes filled with the last block length in bytes
					 }

					 BlockMiddle[1] =  D0[1];
					 BlockMiddle[0] = D0[0]+3;  //New Di constant
				 }

				 //III. Second permutation call
				 //1. Call
				 FPerm(BlockMiddle, BlockOutput); //Second layer call to F
				 
				 //2. Buffer update
				 for(unsigned i=0; i<64-2-CRYPTO_KEYBYTES; ++i)//Adding the output to tag preparation buffer
				 {
					 BlockLastInput[i+2] ^= BlockOutput[i+2];
				 }


				 //Counters increment
				 mblock_counter++;
				 if(mlen>=CRYPTO_MBLOCK)
				 {					 
					 encrypted_bytes += CRYPTO_MBLOCK;
					 mlen-=CRYPTO_MBLOCK;
				 }
				 else 
				 {
					 encrypted_bytes += mlen;
					 mlen=0;
				 }
				 (*clen) = encrypted_bytes;
			 }
		 }

		//Associated data part	  
		if(adlen!=0)
		{
			if(ad==NULL)
			{
				//Clearing variables
				for(unsigned i=0; i<64; ++i)
					BlockInput[i] = BlockMiddle[i] = BlockOutput[i] = BlockLastInput[i] = 0;
				return -4;
			}

			 unsigned long long adblock_counter=1;   //AD block counter
			 unsigned long long auth_bytes=0;

			while(adlen>0)
			{
				//1. Constant
				BlockInput[1] = D0[1];
				if(adlen>= CRYPTO_ADBLOCK)
					 BlockInput[0] = D0[0]+4;
				 else //Last incomplete block
					 BlockInput[0] = D0[0]+5;


				//2. Counter
				for(unsigned i=0; i<CRYPTO_KEYBYTES; ++i)
					BlockInput[i+2] =  (i<sizeof(adblock_counter))? (adblock_counter>>(8*i))&0xff:0;//copying counter bytewise

				//3. AD block
				if(adlen >= CRYPTO_ADBLOCK) //Filling AD block
				{
					for(unsigned i=0; i<CRYPTO_ADBLOCK; ++i)
						BlockInput[i+2+CRYPTO_KEYBYTES] = ad[auth_bytes+i];
					
				}
				else //Last incomplete block
				{
					for(unsigned i=0; i<adlen; ++i)
						BlockInput[i+2+CRYPTO_KEYBYTES] = ad[auth_bytes+i];
					for(unsigned i=(unsigned)adlen; i<CRYPTO_ADBLOCK; ++i)
						BlockInput[i+2+CRYPTO_KEYBYTES] = (unsigned char)adlen;
				}

				//4. Key
				for(unsigned i=0; i<CRYPTO_KEYBYTES; ++i) 
				{
					 BlockInput[i+CRYPTO_ADBLOCK+CRYPTO_KEYBYTES+2] = k[i];
				}
				

				//5.Call to the F permutation

				FPerm(BlockInput,BlockOutput);//Call to the F permutation

				 for(unsigned i=0; i<64-2-CRYPTO_KEYBYTES; ++i)//Adding the output to Z
				 {
					 BlockLastInput[i+2] ^= BlockOutput[i+2];
				 }

				//Counters increment
				 adblock_counter++;
				 if(adlen>=CRYPTO_ADBLOCK)
				 {
					 auth_bytes += CRYPTO_ADBLOCK;
					 adlen-=CRYPTO_ADBLOCK;
				 }
				 else 
				 {
					 auth_bytes += adlen;
					 adlen=0;
				 }
			}
		}

		// Tag production 
		for(unsigned i=0; i<CRYPTO_KEYBYTES; ++i) //Key to the Z input
			BlockLastInput[64-CRYPTO_KEYBYTES+i] = k[i];
		 BlockLastInput[0] = D0[0]+6;
		 BlockLastInput[1] = D0[1];

		//1. Permutation call
		FPerm(BlockLastInput,Tag);
		//2. Key injection
		for(unsigned i=0; i<CRYPTO_KEYBYTES; ++i) 
		{
				Tag[64-CRYPTO_KEYBYTES+i] ^= k[i];
		}

		//3. Truncation
		for(unsigned i=0; i<CRYPTO_ABYTES; ++i)
			c[(*clen)+i] = Tag[i];
		*clen += CRYPTO_ABYTES;


		//Clearing variables
		for(unsigned i=0; i<64; ++i)
			BlockInput[i] = BlockMiddle[i] = BlockOutput[i] = BlockLastInput[i] = 0;
		

	   
		return 0;
     }



     int crypto_aead_decrypt(
       unsigned char *m,unsigned long long *mlen,
       unsigned char *nsec,
       const unsigned char *c,unsigned long long clen,
       const unsigned char *ad,unsigned long long adlen,
       const unsigned char *npub,
       const unsigned char *k
     )
     {
       Init();//Initializing GF(256) multiplication table for AES

		 if(mlen==NULL)
			 return -1;
		 if((clen==0) && (adlen==0))
		 {
			 *mlen=0;
			 return 0;
		 }

		 //Here we do decryption and/or authentication so we need a key and a plaintext pointer valid
		 if( (k==NULL) || (m==NULL) )
			 return -2;

		 //Minimum tag length verification
		 if(clen < CRYPTO_ABYTES)
			 return -1;

		 //Initializing constants
		unsigned char D0[2];
		D0[0] = CRYPTO_NPUBBYTES*8; //nonce length in bits
		D0[1] = CRYPTO_KEYBYTES*8; //key length in bits
		(*mlen)=0;
		 
		 //Initializing the last input to F
		 unsigned char BlockLastInput[64];  //Z1 - input to the last call of F
		 memset(BlockLastInput,0,64);
		 unsigned char Tag[64]; //Tag output
		 for(unsigned i=0; i<CRYPTO_KEYBYTES; ++i) //Key to the Z input
			BlockLastInput[64-CRYPTO_KEYBYTES+i] = k[i];
		 BlockLastInput[0] = D0[0]+6;
		 BlockLastInput[1] = D0[1];

		 unsigned long long decrypted_bytes=0;//Encrypted bytes counter
		 

		 //Encryption part
		 if(clen!=CRYPTO_ABYTES) //Ciphertext is more than just a tag
		 {
			 if(c==NULL)
				 return -3;
			 unsigned char BlockInput[64];  //V1 - input to the first layer call of F
			 unsigned char BlockMiddle[64];  //W1 - output of the first layer call of F
			 unsigned char BlockOutput[64];  //Y1 - output of the second layer call of F
			 unsigned long long mblock_counter=1;   //Message block counter
			 
			 while((clen>CRYPTO_ABYTES))
			 {
				 /* I. First layer */

				 //1. Domain-separation constant
				 BlockInput[1] = D0[1]; 
				 if(clen>= (CRYPTO_MBLOCK+CRYPTO_ABYTES))
					 BlockInput[0] = D0[0];
				 else //Last incomplete block
					 BlockInput[0] = D0[0]+1;

				 //2. Counter
				 for(unsigned i=0; i<CRYPTO_COUNTERBYTES; ++i)
				 {
					 BlockInput[i+2] = (i<sizeof(mblock_counter))?(mblock_counter>>(8*i))&0xff :0;//copying counter bytewise
				 }
				 
				 //3. Nonce
				 for(unsigned i=0; i<CRYPTO_NPUBBYTES; ++i) 
				 {
					 BlockInput[i+2+CRYPTO_COUNTERBYTES] = npub[i];
				 }

				 //4. Key
				 for(unsigned i=0; i<CRYPTO_KEYBYTES; ++i) 
				 {
					 BlockInput[i+2+CRYPTO_COUNTERBYTES+CRYPTO_NPUBBYTES] = k[i];
				 }	 

				 //5. Permutation call
				 FPerm(BlockInput, BlockMiddle); //First layer call to F

				 /* II. Encryption*/

				 if(clen>=CRYPTO_MBLOCK+CRYPTO_ABYTES)//Full block encryption
				 {
					 for(unsigned i=0; i<CRYPTO_MBLOCK; ++i)
					 {
						 m[decrypted_bytes] = BlockMiddle[i+2]^c[decrypted_bytes];
						 BlockMiddle[i+2] = c[decrypted_bytes];
						 decrypted_bytes++;
						 
					 }
					 BlockMiddle[1] =  D0[1];
					 BlockMiddle[0] = D0[0]+2;  //New Di constant

				 }

				 else //Last incomplete block
				 {
					 for(unsigned i=0; i<(unsigned)clen-CRYPTO_ABYTES; ++i)//Incomplete block Encryption
					 {
						  m[decrypted_bytes] = BlockMiddle[i+2]^c[decrypted_bytes];
						 BlockMiddle[i+2] = c[decrypted_bytes];
						 decrypted_bytes++;
					 }
					 for(unsigned i=(unsigned)clen-CRYPTO_ABYTES; i<CRYPTO_MBLOCK; ++i)
					 {
						 BlockMiddle[i+2] ^=  (unsigned char)(clen-CRYPTO_ABYTES);  //Extra Padding: extra bytes filled with the last block length in bytes
					 }

					 BlockMiddle[1] =  D0[1];
					 BlockMiddle[0] = D0[0]+3;  //New Di constant
				 }

				 //III. Second permutation call
				 //1. Call
				 FPerm(BlockMiddle, BlockOutput); //Second layer call to F
				 
				 //2. Buffer update
				 for(unsigned i=0; i<64-2-CRYPTO_KEYBYTES; ++i)//Adding the output to tag preparation buffer
				 {
					 BlockLastInput[i+2] ^= BlockOutput[i+2];
				 }


				 //Counters increment
				 mblock_counter++;
				 if(clen>=CRYPTO_MBLOCK+CRYPTO_ABYTES)
					 clen-=CRYPTO_MBLOCK;
				 
				 else 
				 	 clen=CRYPTO_ABYTES;
				 (*mlen) = decrypted_bytes;
			 }
		 }

		//Associated data part	  
		if(adlen!=0)
		{
			if(ad==NULL)
				return -4;

			unsigned char BlockInput[64];  //V1 - input to the first layer call of F
			 unsigned char BlockOutput[64];  //Y1 - output of the second layer call of F
			 unsigned long long adblock_counter=1;   //AD block counter
			 unsigned long long auth_bytes=0;

			while(adlen>0)
			{
				//1. Constant
				BlockInput[1] = D0[1];
				if(adlen>= CRYPTO_ADBLOCK)
					 BlockInput[0] = D0[0]+4;
				 else //Last incomplete block
					 BlockInput[0] = D0[0]+5;


				//2. Counter
				for(unsigned i=0; i<CRYPTO_KEYBYTES; ++i)
					BlockInput[i+2] = (i<sizeof(adblock_counter))? (adblock_counter>>(8*i))&0xff:0;//copying counter bytewise

				//3. AD block
				if(adlen >= CRYPTO_ADBLOCK) //Filling AD block
				{
					for(unsigned i=0; i<CRYPTO_ADBLOCK; ++i)
						BlockInput[i+2+CRYPTO_KEYBYTES] = ad[auth_bytes+i];
					
				}
				else //Last incomplete block
				{
					for(unsigned i=0; i<adlen; ++i)
						BlockInput[i+2+CRYPTO_KEYBYTES] = ad[auth_bytes+i];
					for(unsigned i=(unsigned)adlen; i<CRYPTO_ADBLOCK; ++i)
						BlockInput[i+2+CRYPTO_KEYBYTES] = (unsigned char)adlen;
				}

				//4. Key
				for(unsigned i=0; i<CRYPTO_KEYBYTES; ++i) 
				{
					 BlockInput[i+CRYPTO_ADBLOCK+CRYPTO_KEYBYTES+2] = k[i];
				}
				

				//5.Call to the F permutation

				FPerm(BlockInput,BlockOutput);//Call to the F permutation

				 for(unsigned i=0; i<64-2-CRYPTO_KEYBYTES; ++i)//Adding the output to Z
				 {
					 BlockLastInput[i+2] ^= BlockOutput[i+2];
				 }

				//Counters increment
				 adblock_counter++;
				 if(adlen>=CRYPTO_ADBLOCK)
				 {
					 auth_bytes += CRYPTO_ADBLOCK;
					 adlen-=CRYPTO_ADBLOCK;
				 }
				 else 
				 {
					 auth_bytes += adlen;
					 adlen=0;
				 }
			}
		}

		// Tag production 

		//1. Permutation call
		FPerm(BlockLastInput,Tag);
		//2. Key injection
		for(unsigned i=0; i<CRYPTO_KEYBYTES; ++i) 
		{
				Tag[64-CRYPTO_KEYBYTES+i] ^= k[i];
		}

		//3. Truncation
		if(clen!=CRYPTO_ABYTES)//Incorrect tag length
			return -1;

		for(unsigned i=0; i<CRYPTO_ABYTES; ++i)
		{
			if(c[(*mlen)+i] != Tag[i])
			{
				for(unsigned j=0; j< (*mlen); ++j)//Erasing decryption result
					m[j]=0;
				return -1; //Invalid
			}
		}
       return 0;
     }

