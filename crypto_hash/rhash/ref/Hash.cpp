#include "crypto_hash.h"
#include "crypto_uint32.h"
#include "crypto_uint64.h"

typedef unsigned long ulong;
typedef unsigned long long ulong64;


#include "Hash.h"


int crypto_hash(unsigned char *out, const unsigned char *in, unsigned long long inlen)
{
	const ulong hashIV[8] = {0x243f6a88, 0x85a308d3, 0x13198a2e, 0x03707344, 0xa4093822, 0x299f31d0, 0x082efa98, 0xec4e6c89};
	ulong64 blkcount = 0;
	short blksize = 0, i;
	ulong64 Counter = 1;
	ulong Msg_Blk[16], ChainVar[8];

	for (i=0; i<8; i++)
		ChainVar[i] = hashIV[i];

	ulong64 blks = inlen/64;
	for (blkcount=0; blkcount<blks; blkcount++)
	{
		strncpy((char*)Msg_Blk, (const char*)(in + blkcount*64), 64);
		Hash_Blk(Counter, Msg_Blk, ChainVar);
		Counter++;
	}

	strncpy((char*)Msg_Blk, (const char*)(in + blks*64), 64);
	char* ptr = (char*)Msg_Blk;
	if (blkcount == 0xfffffffffffffffe)	
	{
		if (blksize < 55)
		{
			*(ptr + blksize) = (char) 0x80;
			for (i=blksize+1; i<55; i++)
				*(ptr + i) = 0;

			*(ptr + 55) = (char) blksize;
		}
		else
			*(ptr + 55) = (char) 0xb7;

		for (i=56; i<64; i++)
			*(ptr + i) = (char) 0xff;
		
		Hash_Blk(Counter, Msg_Blk, ChainVar);
	}
	else
	{
		blkcount++;
		if (blksize == 55)
			*(ptr + 55) = (char) 0xb7;
		else if (blksize < 55)
		{
			*(ptr + blksize)= (char) 0x80;
			for (i=blksize+1; i<55; i++)
				*(ptr + i) = 0;

			*(ptr + 55) = (char) blksize;
		}
		else
		{
			*(ptr + blksize)= (char) 0x80;
			for (i=blksize+1; i<64; i++)
				*(ptr + i) = 0;

			Hash_Blk(Counter, Msg_Blk, ChainVar);
			Counter++;

			for (i=0; i<55; i++)
				*(ptr + i) = 0;
			*(ptr + 55) = (char) blksize;
			blkcount++;
		}

		Msg_Blk[14] = ulong (blkcount >> 32);
		Msg_Blk[15] = ulong (blkcount & 0xffffffff);
		Hash_Blk(Counter, Msg_Blk, ChainVar);
	}

	for (i=0; i<8; i++)
	{
		*(out + 4*i) = char ((Msg_Blk[i] >> 24) & 0xff);
		*(out + 4*i + 1) = char ((Msg_Blk[i] >> 16) & 0xff);
		*(out + 4*i + 2) = char ((Msg_Blk[i] >> 8) & 0xff);
		*(out + 4*i + 3) = char (Msg_Blk[i] & 0xff);
	}

	return 0;
}
