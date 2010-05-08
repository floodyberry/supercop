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
// The ATELOPUS hashing method, Version 1.1.0 (29 April 2010)
// Copyright (C) 2009-2010, George Anescu, www.sc-gen.com
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
// other information please contact the author at <george.anescu@sc-gen.com>.
//
// Test Samples:
//
// hashsize=7, iter=3, blocksize=8
//
// 1)
// data=""
// hexresult="1772623E426DFF"
//
// 2)
// data="AABB"
// hexresult="7AFBA04E669206"
//
// 3)
// data="AAAABBBB"
// hexresult="4528CA1A80938B"
//
// 4)
// data="AAAABBBBAAAABBBB"
// hexresult="812D97F0AFAEC6"
//
// 5)
// data="AAAABBBBAAAABBBBAAAABBBBAAAABBBB"
// hexresult="57EE34A21740E4"
//
// 6)
// data="AAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBB"
// hexresult="7732F9F5564FB7"
//
// hashsize=16, iter=3, blocksize=16
//
// 7)
// data="YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
// hexresult="A44FC28053B7F8C2C26626EE1D1489D5"
//
// 8)
// data="XYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
// hexresult="9222BC4180F94DA932BCCA977F5FC091"
//
// 9)
// hashsize=20, iter=3, blocksize=16
// data="YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
// hexresult="F59E193F9CED8E4871C85003B5E6EE4CDC03E983"
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

