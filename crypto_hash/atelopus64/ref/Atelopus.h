// Atelopus.h
#ifndef __ATELOPUS_H__
#define __ATELOPUS_H__

#include <exception>
#include <stdexcept>
#include <string>
#include <string.h>
#include <fstream>

using namespace std;

#define BYTE unsigned char

class Atelopus
{
//****************************************************************************
//
// The ATELOPUS hashing method, Version 1.0.0
// Copyright (C) 2009-2010, George Anescu, www.scgen.com
// All right reserved.
//
// This is the C++ implementation of a new cryptographic hashing method called ATELOPUS, which can be considered an universal
// hashing method. It can work with dynamic sizes of the input data blocks (at byte granularity) and is capable to generate
// hash outputs covering a practical domain of sizes (at byte granularity).
//
// COPYRIGHT PROTECTION: The ATELOPUS hashing method is still under development and testing and for this reason the code is freely
// distributed only for TESTING AND RESEARCH PURPOSES. The author is reserving for himself the rights to MODIFY AND MAINTAIN the
// code, but any ideas about improving the code are welcomed and will be recognized if implemented.
//
// If you are interested in testing the code, in research collaborations for possible security holes in the method, or in any
// other information please contact the author at <george.anescu@scgen.com>.
//
// Test Samples:
//
// hashsize=7, iter=3, blocksize=8
//
// 1)
// data=""
// hexresult="07454442857189"
//
// 2)
// data="AABB"
// hexresult="259C268CE3C240"
//
// 3)
// data="AAAABBBB"
// hexresult="D8F9F5C2E76B0E"
//
// 4)
// data="AAAABBBBAAAABBBB"
// hexresult="E2586CE901D319"
//
// 5)
// data="AAAABBBBAAAABBBBAAAABBBBAAAABBBB"
// hexresult="94FFC8C773CB04"
//
// 6)
// data="AAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBB"
// hexresult="439D22BF339689"
//
// hashsize=16, iter=3, blocksize=16
//
// 7)
// data="YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
// hexresult="B2C7F2A54C2C91D451F6B228F02C0E29"
//
// 8)
// data="XYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
// hexresult="BBF663019801E630223F23D38B16067F"
//
// 9)
// hashsize=10, iter=3, blocksize=16
// data="YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
// hexresult="F45C99BCFE7A6CBE5A252ADFF085E7BFEFDDDDDB"
//
// 10)
// hashsize=32, iter=3, blocksize=128
// data=""
// hexresult="3AA507C2695D0C82F655F1F95DC4455CEE1024661715D3353FB9FF43C7CC5CAB"
//
// 11)
// hashsize=64, iter=3, blocksize=256
// data=""
// hexresult="0D1C34400C8C9DD3D1E6B6D993CFFE6842A9A49D49D406BD71C3ED03366FB49FAD2B77D706EC40D9CB285B9598658E0FA79A0B7697EE67EA9659A584041AD66A"
//
//****************************************************************************
public:
	//Sizes
	enum AtelopusBlockSize
	{
		BlockSize4 = 4, BlockSize8 = 8, BlockSize16 = 16, BlockSize32 = 32,
		BlockSize64 = 64, BlockSize128 = 128, BlockSize256 = 256
	};

	//Constructors
	Atelopus(int size, int iter) : _size(size), _iter(iter), _bs(BlockSize4)
	{
		if (_size < 1)
		{
			throw runtime_error("Atelopus::Atelopus(), size should be at least 1.");
		}
		Reset();
	}

	//It is recommended that size <= bs/4
	Atelopus(int size, int iter, AtelopusBlockSize bs) : _size(size), _iter(iter), _bs(bs)
	{
		Reset();
	}

	void Reset()
	{
		memcpy(_kk1, _skk1, 256); 
		_val1 = _kk1[0];
		_val2 = _kk1[128];
	}

	//Hash Primitive
	void HashPrimitive(BYTE const* data, BYTE* res, int len);

	//Dynamic block size hashing
	void Hash(BYTE const* data, BYTE* res, long long len);

	//Dynamic block size hashing for a file
	void HashFile(string const& filepath, BYTE* res);
		
private:
	void Init(BYTE* bytes, int len);

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

	//Fast modulo
	static int Mod(int a, int b)
	{
		int s = b;
		while (s <= a)
		{ 
			s <<= 1; 
		} 
		int r = a; 
		while (r >= b)
		{ 
			s >>= 1; 
			if (s <= r)
			{     
				r -= s;
			}
		}
		return r;
	}

	//Input File Length
	static long long FileLength(ifstream& in);

	//In place XOR extended
	void XORIPE(BYTE* ar1, BYTE const* ar2, int len1, int len2)
	{
		int k = 0;
		for (int i=0; i < len1; i++)
		{
			ar1[i] = _kk1[ar1[i]] ^ ar2[k];
			k++;
			if (k >= len2)
			{
				k = 0;
			}
		}
	}

	const static BYTE _skk1[256];
	const static short _sarrprimes[256];

	const int _size;
	const int _iter;
	const AtelopusBlockSize _bs;
	BYTE _val1;
	BYTE _val2;
	BYTE _kk1[256];
};

#endif // __ATELOPUS_H__

