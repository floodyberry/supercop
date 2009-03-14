//# Algorithm Name: MCSSHA-4
//# Principal Submitter: Mikhail Maslennikov
//# Revision: 08.12.2008 

#ifndef HEADER_MCSSHA4_H
#define HEADER_MCSSHA4_H

typedef unsigned char BitSequence;
typedef unsigned long long DataLength;
typedef enum { SUCCESS = 0, FAIL = 1, BAD_HASHBITLEN = 2 } HashReturn;

#define MCSSHA4_MBLOCK       	64
#define MCSSHA4_LBLOCK       	128
#define MCSSHA4_2LBLOCK       	256

typedef struct MCSSHA4state_st
	{
	DataLength hashbitlen;
	BitSequence x[6];
	BitSequence data[MCSSHA4_LBLOCK];
	BitSequence delay;
	} MCSSHA4_CTX,hashState;


HashReturn Init(hashState *c,DataLength hashbitlen);
HashReturn Update(hashState *c, const BitSequence *data, DataLength databitlen);
HashReturn Final(hashState *c, BitSequence *md);
HashReturn Hash(DataLength hashbitlen,
					   const BitSequence *data,
					   DataLength databitlen,
					   BitSequence *hashval);

// Additional function for calculate message digest 
// for delay = 3
HashReturn Hash3(DataLength hashbitlen,
				const BitSequence *data,
				DataLength databitlen,
				BitSequence *hashval);

#endif	
