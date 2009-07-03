//# Algorithm Name: MCSSHA-6
//# Principal Submitter: Mikhail Maslennikov
//# Revision: 08.06.2009 

#include <stdio.h>
#include <string.h>
#include "mcssha6.h"
#include "mcssha6_macros.h"

// logariphmic substitution
static BitSequence S[256]={
	0x30, 0x60, 0x67, 0xB5, 0x43, 0xEA, 0x93, 0x25,
	0x48, 0x0D, 0x18, 0x6F, 0x28, 0x7A, 0xFE, 0xB6,
	0xD5, 0x9C, 0x23, 0x86, 0x52, 0x42, 0xF7, 0xFD,
	0xF6, 0x9B, 0xEE, 0x99, 0x91, 0xBC, 0x2A, 0x63,
	0xA1, 0xA0, 0x57, 0x3C, 0x39, 0xD2, 0xEC, 0x71,
	0x45, 0xCB, 0x41, 0xDC, 0x0B, 0x5B, 0xC2, 0x36,
	0x01, 0x55, 0x7D, 0xFB, 0xED, 0x83, 0x8F, 0x31,
	0xC0, 0x4C, 0x08, 0xE3, 0x9D, 0xC1, 0xD3, 0xE9,
	0xB8, 0xBD, 0xAE, 0x0F, 0xE7, 0x70, 0x5A, 0xEB,
	0x4D, 0x29, 0xF9, 0xA9, 0x3D, 0x26, 0x46, 0x06,
	0xD0, 0x50, 0xA5, 0xBE, 0x66, 0x90, 0xF4, 0x20,
	0xE4, 0x33, 0x27, 0xE2, 0xAB, 0xEF, 0x68, 0x54,
	0x37, 0x6A, 0xDB, 0xBB, 0xD8, 0x7B, 0x69, 0xC4,
	0xF2, 0xBF, 0x85, 0xC7, 0xA6, 0xB4, 0x9A, 0xDD,
	0x72, 0x34, 0xE8, 0xFC, 0xD6, 0x21, 0x98, 0x96,
	0x32, 0xCA, 0x49, 0xB3, 0xF3, 0x97, 0x8E, 0x2F,
	0x00, 0xB0, 0x10, 0x1A, 0x77, 0x38, 0xCF, 0x51,
	0xBA, 0x1F, 0x22, 0xAC, 0x62, 0x89, 0x76, 0xC3,
	0x02, 0x6E, 0x2C, 0x47, 0x3A, 0x5C, 0x1B, 0x56,
	0x8A, 0x5D, 0x03, 0x16, 0x74, 0x58, 0x79, 0x09,
	0xD7, 0xF5, 0x0A, 0x92, 0x4F, 0x87, 0xCD, 0xDA,
	0x8C, 0xC9, 0x9E, 0x3B, 0x12, 0x6B, 0x53, 0xFF,
	0x80, 0xB7, 0xF8, 0xD9, 0xF1, 0x5E, 0xAF, 0xE0,
	0x05, 0xA4, 0x14, 0x2B, 0xA3, 0xCC, 0x6C, 0x7C,
	0x78, 0xAA, 0x95, 0x84, 0x61, 0xA8, 0xCE, 0x13,
	0x88, 0xFA, 0x59, 0x4E, 0xB9, 0xC8, 0x4B, 0x24,
	0xD1, 0x07, 0x94, 0x2E, 0xDF, 0xB1, 0x17, 0xA2,
	0x1D, 0x4A, 0xC6, 0xAD, 0x15, 0x19, 0x35, 0x7F,
	0x81, 0x44, 0x0C, 0x9F, 0x75, 0x7E, 0xD4, 0x82,
	0xDE, 0xE6, 0xE1, 0x2D, 0x3E, 0x73, 0x11, 0x8B,
	0xC5, 0xA7, 0xF0, 0x6D, 0x1C, 0x64, 0x0E, 0x04,
	0x40, 0x1E, 0x8D, 0xE5, 0x3F, 0xB2, 0x65, 0x5F,
	};

// Hash Init
// Similar like MCSSHA-3
// MCSSHA6_MBLOCK = 64
// MCSSHA6_LBLOCK = 128
// SR length for h = 224 and 256 is MCSSHA6_MBLOCK (64 bytes)
// SR length for h = 384 and 512 is MCSSHA6_LBLOCK (128 bytes)
HashReturn Init(hashState *c,DataLength hashbitlen)
	{
		char filename[128];
		BitSequence i;
		if(hashbitlen != 224 && hashbitlen != 256 && hashbitlen != 384 && hashbitlen != 512)return(BAD_HASHBITLEN);
		c->hashbitlen = hashbitlen;
		c->x[0] = 0;
		c->x[1] = 1;
        if(hashbitlen == 224 | hashbitlen == 256)
		{
		    c->x[2] = MCSSHA6_MBLOCK - 4;
		    c->x[3] = MCSSHA6_MBLOCK - 1;
		    for(i=0;i<MCSSHA6_MBLOCK;i++)c->data[i] = i;
		}
		else
		{
		    c->x[2] = MCSSHA6_LBLOCK - 4;
		    c->x[3] = MCSSHA6_LBLOCK - 1;
		    for(i=0;i<MCSSHA6_LBLOCK;i++)c->data[i] = i;
		}
// Two parameters for DataLength != 8*k bits
// last - last bits value
		c->x[5] = 0;
// bits - number of the last bits, i.e. DataLength - 8*k
		c->x[4] = 0;
// Additional parameter delay.
// Default value is 3, 
// it's possible to increase delay during hash calculation
		c->delay = 3;
		return(SUCCESS);
	}

//-------------------------------------------------------------------

// Pre-hash computation.
// SR length for h = 224 and 256 is 64 bytes (MCSSHA6_MBLOCK)
// SR length for h = 384 and 512 is 128 bytes (MCSSHA6_LBLOCK)

HashReturn Update(hashState *c, const BitSequence *data, DataLength databitlen)
	{
		DataLength len = databitlen>>3;
		register unsigned long x1,x2,x3,x4,i,len1,k;
		BitSequence empty,bits,last;


		if(c->hashbitlen != 224 && c->hashbitlen != 256 && c->hashbitlen != 384 && c->hashbitlen != 512)return(BAD_HASHBITLEN);
        if(data == NULL & databitlen == 0)return(SUCCESS);
		if(data == NULL & databitlen != 0)return(BAD_HASHBITLEN);
// For use fast register memory
		x1 = c->x[0];
		x2 = c->x[1];
		x3 = c->x[2];
		x4 = c->x[3];
		bits = c->x[4];
		last = c->x[5];

		i = 0;
		len1 = (databitlen + bits)>>3;

		if(bits != 0)
		{
           if(c->hashbitlen == 224 | c->hashbitlen == 256)
		   {
		       while(i < len1)
		       {
// Calculate one byte from remain bits
				   REMAIN_BITS;

// SR transformation
				   SUBSTITUTION_M(empty);

// Increasing SR points
				   INCREASE_POINTS64; 

// delay
				   for(k=0; k < c->delay; k++){DELAY_64;}

// next byte pre-hash computation
			       i++;
		       }
		   }

// For hashbitlen = 384 or 512
           else
		   {
		       while(i < len1)
		       {
// See same comments above
				   REMAIN_BITS;
                   SUBSTITUTION_M(empty);
                   INCREASE_POINTS128; 
				   for(k=0; k < c->delay; k++){DELAY_128;}
			       i++;
		       }
		   }

// Calculate remain bits and remain bits length for next step
		   c->x[4] = databitlen + bits - (i<<3);
		   if(i != 0)c->x[5] = (last>>(8-c->x[4]))<<(8-c->x[4]);
		   else c->x[5] = ((last ^ (data[i]>>bits))>>(8-c->x[4]))<<(8-c->x[4]);

		}// bits != 0

// Remain bits absent
		// bits == 0
		else
		{
           if(c->hashbitlen == 224 | c->hashbitlen == 256)
		   {
		       while(i < len1)
		       {
// Calculate SR transformation
				    SUBSTITUTION_M(data[i]);

// Increasing SR points
                    INCREASE_POINTS64; 

					for(k=0; k < c->delay; k++){DELAY_64;}

// Next byte of the message
			        i++;
		       }
		   }

// Hashbitlen = 384 or 512 and remain bits absent
		   else
		   {
		       while(i < len1)
		       {
// Same comments like for cases 224 and 256
				    SUBSTITUTION_M(data[i]);
                    INCREASE_POINTS128; 
					for(k=0; k < c->delay; k++){DELAY_128;}
			        i++;
		       }
		   }

// Prepare remain bits and remain bits length
		   c->x[4] = databitlen  - (len<<3);
		   c->x[5] = (data[i]>>(8-c->x[4]))<<(8-c->x[4]);

		} // bits ==0
		
		


// Restore hash structure
		c->x[0]=x1;
		c->x[1]=x2;
		c->x[2]=x3;
		c->x[3]=x4;

		return(SUCCESS);
	}

//------------------------------------------------------------------
// Additional function to decrease code size
// Parameters:
// hashState *c - main hash structure
// BitSequence *SR - shift registry state
// BitSequence *data - input data for SR
// DataLength len - input data length
// BitSequence *md - memory for message digest. 
//If md == NULL, this is not last calling of this function => necessary to store SR points and unused bits.
//If md != NULL => this is last calling of this function => not necessary to store SR points and unused bits. 
void CalculateFinalState(hashState *c, BitSequence *SR, BitSequence *data, DataLength len, BitSequence *md)
{
		register unsigned long x1,x2,x3,x4,i;
		BitSequence n = (c->hashbitlen>>3) - 1;
		BitSequence empty,bits,last;

// Initial SR state and points

		x1 = c->x[0];
		x2 = c->x[1];
		x3 = c->x[2];
		x4 = c->x[3];

		bits = c->x[4];
		last = c->x[5];

		i = 0;

// Remain bits present
		if(bits != 0)
		{

			switch(c->hashbitlen)
			{
			case 224:
				{
			        while(i < len)
		            {
			           REMAIN_BITS;
                       SUBSTITUTION_FINAL_M(empty);
				       INCREASE_POINTS28;
			           i++;
			        }
					break;
				}
			case 256:
				{
			        while(i < len)
		            {
			           REMAIN_BITS;
                       SUBSTITUTION_FINAL_M(empty);
				       INCREASE_POINTS32;
			           i++;
			        }
					break;
				}
			case 384:
				{
			        while(i < len)
		            {
			           REMAIN_BITS;
                       SUBSTITUTION_FINAL_M(empty);
				       INCREASE_POINTS48;
			           i++;
			        }
					break;
				}
			case 512:
				{
			        while(i < len)
		            {
			           REMAIN_BITS;
                       SUBSTITUTION_FINAL_M(empty);
				       INCREASE_POINTS64;
			           i++;
			        }
					break;
				}
			}
		    if(!md)c->x[5] = ((last ^ (data[len-1]>>bits))>>(8-c->x[4]))<<(8-c->x[4]);
		}// bits != 0

// Remain bits absent
		// bits == 0
		else
		{
			switch(c->hashbitlen)
			{
			case 224:
				{
			        while(i < len)
		            {
                       SUBSTITUTION_FINAL_M(data[i]);
				       INCREASE_POINTS28;
			           i++;
			        }
					break;
				}
			case 256:
				{
			        while(i < len)
		            {
                       SUBSTITUTION_FINAL_M(data[i]);
				       INCREASE_POINTS32;
			           i++;
			        }
					break;
				}
			case 384:
				{
			        while(i < len)
		            {
                       SUBSTITUTION_FINAL_M(data[i]);
				       INCREASE_POINTS48;
			           i++;
			        }
					break;
				}
			case 512:
				{
			        while(i < len)
		            {
                       SUBSTITUTION_FINAL_M(data[i]);
				       INCREASE_POINTS64;
			           i++;
			        }
					break;
				}
			}
		}// bits == 0

// Save SR point for next step
		if(!md)
		{
			c->x[0] = x1;
			c->x[1] = x2;
			c->x[2] = x3;
			c->x[3] = x4;
		}

// Copy SR state in message digest area
		if(md)memcpy(md,SR,n+1);
}
//----------------------------------------------------------------------------------------------------

// Reverse function
void MCSSHA6Reverse(BitSequence *p, DataLength len)
{
	register unsigned long i=0, j;
		if(len<=1)return;
		j=len-1;

	while(i<j)
	{
		BitSequence temp = p[i];
		p[i]=p[j];
		p[j]=temp;
		i++, j--;
	}
}
//---------------------------------------------------------------------------



// Final hash computation
// SR length is H, where H = hashbitlength/8
HashReturn Final(hashState *c, BitSequence *md)
{
		BitSequence data[128],SR[64];
		register unsigned long x1,x2,x3,x4,i;
		BitSequence n = (c->hashbitlen>>3) - 1;
		BitSequence empty,bits,last;

		if(c->hashbitlen != 224 && c->hashbitlen != 256 && c->hashbitlen != 384 && c->hashbitlen != 512)return(BAD_HASHBITLEN);

// Initial SR state
		for(i=0;i<n+1;i++)SR[i] = i;

// Initial SR points
		c->x[0] = 0;
		c->x[1] = 1;
		c->x[2] = n-3;
		c->x[3] = n;

		switch(c->hashbitlen)
		{
		case 224:
			{
// Stage 1.
// SR state - initial
// Input sequence - SR state from pre-hash computation
// Input sequence length - SR length from pre-hash (64 - for 224 and 256, 128 - for 384 and 512) 
				memcpy(data,c->data,MCSSHA6_MBLOCK);
// Calculate SR state (length 28) using pre-hash only one time
				CalculateFinalState(c, SR, data, MCSSHA6_MBLOCK, NULL);

// Stage 2.
// Calculate final message digest using input sequence, that is double reversed SR state, i.e.
//	Stage 2.1.
//  Calculate SR state using reversed SR state as input sequence
				memcpy(data,SR + 8, 20);
				memcpy(data + 20, SR, 8);
				MCSSHA6Reverse(data,28);
				CalculateFinalState(c, SR, data, 28, NULL);
// Stage 2.2.
// Starting SR state - from final stage 2.1 state, input sequence - same like for stage 2.1.
				CalculateFinalState(c, SR, data, 28, md);
				break;
			}
		case 256:
			{
				memcpy(data,c->data,MCSSHA6_MBLOCK);
				CalculateFinalState(c, SR, data, MCSSHA6_MBLOCK, NULL);
				memcpy(data,SR, 32);
				MCSSHA6Reverse(data,32);
				CalculateFinalState(c, SR, data, 32, NULL);
				CalculateFinalState(c, SR, data, 32, md);
				break;
			}
		case 384:
			{
				memcpy(data,c->data,MCSSHA6_LBLOCK);
				CalculateFinalState(c, SR, data, MCSSHA6_LBLOCK, NULL);
				memcpy(data,SR + 32, 16);
				memcpy(data + 16, SR, 32);
				MCSSHA6Reverse(data,48);
				CalculateFinalState(c, SR, data, 48, NULL);
				CalculateFinalState(c, SR, data, 48, md);
				break;
			}
		case 512:
			{
				memcpy(data,c->data,MCSSHA6_LBLOCK);
				CalculateFinalState(c, SR, data, MCSSHA6_LBLOCK, NULL);
				memcpy(data,SR, 64);
				MCSSHA6Reverse(data,64);
				CalculateFinalState(c, SR, data, 64, NULL);
				CalculateFinalState(c, SR, data, 64, md);
				break;
			}
		}
return (SUCCESS);
}


//------------------------------------------------------------------

HashReturn Hash(DataLength hashbitlen,
				const BitSequence *data,
				DataLength databitlen,
				BitSequence *hashval)
{
	  HashReturn ret;
	  hashState c;
	  ret = Init(&c,hashbitlen);
	  if(ret != SUCCESS)return(ret);
	  ret = Update(&c,data,databitlen);
	  if(ret != SUCCESS)return(ret);
	  return(Final(&c,hashval));
}

//------------------------------------------------------------------



