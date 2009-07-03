//# Algorithm Name: MCSSHA-6
//# Principal Submitter: Mikhail Maslennikov
//# Revision: 08.06.2009 

#ifndef HEADER_MCSSHA6_H
#define HEADER_MCSSHA6_H


typedef unsigned char BitSequence;
typedef unsigned long long DataLength;
typedef enum { SUCCESS = 0, FAIL = 1, BAD_HASHBITLEN = 2 } HashReturn;

#define MCSSHA6_MBLOCK       	64
#define MCSSHA6_LBLOCK       	128

typedef struct MCSSHA6state_st
	{
	DataLength hashbitlen;
	BitSequence x[6];
	BitSequence data[MCSSHA6_LBLOCK];
	BitSequence delay;
	} MCSSHA6_CTX,hashState;


HashReturn Init(hashState *c,DataLength hashbitlen);
HashReturn Update(hashState *c, const BitSequence *data, DataLength databitlen);
HashReturn Final(hashState *c, BitSequence *md);
HashReturn Hash(DataLength hashbitlen,
					   const BitSequence *data,
					   DataLength databitlen,
					   BitSequence *hashval);

#endif	

