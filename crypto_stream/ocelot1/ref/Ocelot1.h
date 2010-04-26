// Ocelot1.h
#ifndef __OCELOT1_H__
#define __OCELOT1_H__

#include "Counter.h"

#include <cstring>
#include <string.h>

using namespace std;

#define BYTE unsigned char

class Ocelot1
{
//****************************************************************************
//
// The OCELOT1 stream ciphering method method, Version 1.0.0
// Copyright (C) 2009-2010, George Anescu, www.scgen.com
// All right reserved.
//
// This is the C++ implementation of a new stream ciphering method called OCELOT1. It is accepting any practical key size and can
// be set to any practical state size.
//
// COPYRIGHT PROTECTION: The OCELOT1 stream ciphering method is still under development and testing and for this reason the code is
// freely distributed only for TESTING AND RESEARCH PURPOSES. The author is reserving for himself the rights to MODIFY AND MAINTAIN the
// code, but any ideas about improving the code are welcomed and will be recognized if implemented.
//
// If you are interested in testing the code, in research collaborations for possible security holes in the method, or in any
// other information please contact the author at <george.anescu@scgen.com>.
//
// Test Samples:
//
// 1)
// statesize=4, key="XXXXXXX"
// hexresult="CD65720C9646545824ED2B21F97CA7B56B7C912073E9D6..."
// hexresult="...AC51A904D073429309AAA69DCDBF6EAD1FA24E7DF0FC78"
//
// 2)
// statesize=4, key="YXXXXXX"
// hexresult="6F52278BC3BC76AF7EF9486094510C13EF4B8C5343CEFA40C814D9E53C6A75FEE0F39B5D8893856001C0B91654DB75B2C6A1..."
//
// 3)
// statesize=4, key="\0\0\0\0"
// hexresult="B672627E5DAEABA9A2F7DEDB7A14F82B75D0ABDB5541DC..."
//
//****************************************************************************
public:
	//Constructors
	Ocelot1() {}

	Ocelot1(int size, BYTE const* key, int keysize)
	{
		Initialize(size, key, keysize);
	}
	
	void Initialize(int size, BYTE const* key, int keysize);

	void Reset()
	{
		memcpy(_data, _data0, _size);
		_val = _data0[_size];
		memcpy(_ss, _ss0, 256);            
		_cnt.Reset();
		_ix = _ix0;
	}

	void GetNextByte(BYTE& rnd);

	void GetBytes(BYTE* bytes, int n)
	{
		for (int i = 0; i < n; i++)
		{
			GetNextByte(bytes[i]);
		}
	}

private:
	void Expansion(BYTE const* key, int keysize, BYTE* res, int dim, short iter, bool compl);

	//F1 function - switches even bits
	static BYTE F1(BYTE val)
	{
		return (val & 0x55) | (~val & 0xAA);
	}

	//F2 function - switches odd bits
	static BYTE F2(BYTE val)
	{
		return (val & 0xAA) | (~val & 0x55);
	}

	//G1 function - shift left rotating
	static BYTE G1(BYTE val)
	{
		//take last 3 bits, shift left 3 positions and make last 3 bits first
		return (val << 3) | ((val & 0xE0) >> 5);
	}

	//G2 function - shift right rotating
	static BYTE G2(BYTE val)
	{
		//take first 3 bits, shift right 3 positions and make first 3 bits last
		return (val >> 3) | ((val & 0x07) << 5);
	}

	//Fast swap
	static void Swap(BYTE* kk, BYTE val1, BYTE val2)
	{
		if (val1 != val2)
		{
			kk[val1] ^= (kk[val2] ^= (kk[val1] ^= kk[val2]));
		}
	}

	const static BYTE _sss[256];

	Counter _cnt;
	BYTE _data0[256];
	BYTE _data[256];
	BYTE _ss0[256];
	BYTE _ss[256];
	BYTE _val;
	int _ssix;
	int _ix;
	int _ix0;
	int _size; //should be a power of 2
	int _sizem1;
	int _sized2;
};

#endif // __OCELOT1_H__

