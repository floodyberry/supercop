//# Algorithm Name: MCSSHA-5
//# Principal Submitter: Mikhail Maslennikov
//# Revision: 04.06.2009 

#ifndef HEADER_MCSSHA5_H
#define HEADER_MCSSHA5_H

typedef unsigned char BitSequence;
typedef unsigned long long DataLength;
typedef enum { SUCCESS = 0, FAIL = 1, BAD_HASHBITLEN = 2 } HashReturn;

#define MCSSHA5_MBLOCK       	64
#define MCSSHA5_LBLOCK       	128
#define MCSSHA5_2LBLOCK       	256

typedef struct MCSSHA5state_st
	{
	DataLength hashbitlen;
	BitSequence x[6];
	BitSequence data[MCSSHA5_LBLOCK];
	BitSequence delay;
	} MCSSHA5_CTX,hashState;


HashReturn Init(hashState *c,DataLength hashbitlen);
HashReturn Update(hashState *c, const BitSequence *data, DataLength databitlen);
HashReturn Final(hashState *c, BitSequence *md);
HashReturn Hash(DataLength hashbitlen,
					   const BitSequence *data,
					   DataLength databitlen,
					   BitSequence *hashval);


#endif	

