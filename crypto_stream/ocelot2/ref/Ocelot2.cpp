// Ocelot2.cpp
#include "Ocelot2.h"

//****************************************************************************
//
// The OCELOT2 stream ciphering method, Version 1.0.0
// Copyright (C) 2009-2010, George Anescu, www.scgen.com
// All right reserved.
//
//****************************************************************************

const BYTE Ocelot2::_sss[256] = {
	246, 79, 28, 40, 39, 27, 4, 148, 153, 149, 22, 75, 31, 38, 222, 233, 110, 147, 102, 189, 144, 143, 11, 215, 249, 70,
	112, 207, 195, 192, 35, 124, 133, 66, 127, 188, 62, 104, 180, 211, 19, 213, 68, 128, 82, 6, 203, 95, 156, 204, 119, 239,
	220, 43, 247, 221, 109, 238, 7, 118, 9, 15, 163, 101, 52, 94, 64, 0, 197, 138, 85, 235, 176, 65, 25, 45, 24, 241, 21, 2,
	51, 255, 125, 140, 10, 13, 61, 228, 33, 14, 161, 115, 202, 114, 191, 205, 83, 30, 67, 54, 186, 5, 169, 226, 165, 132, 69,
	23, 200, 20, 146, 183, 193, 48, 253, 56, 72, 126, 59, 209, 16, 103, 81, 113, 60, 47, 73, 229, 208, 80, 106, 34, 50, 243,
	3, 178, 107, 108, 242, 100, 162, 217, 181, 129, 87, 250, 219, 150, 167, 78, 29, 1, 168, 199, 12, 201, 155, 231, 91, 46,
	177, 53, 214, 92, 121, 136, 71, 17, 42, 36, 49, 158, 175, 254, 137, 170, 173, 26, 252, 120, 88, 174, 139, 122, 58, 18,
	141, 184, 84, 37, 166, 230, 32, 160, 152, 117, 159, 240, 164, 44, 245, 99, 232, 74, 135, 223, 55, 96, 63, 131, 134, 182,
	218, 130, 77, 142, 111, 244, 187, 248, 76, 57, 157, 97, 145, 172, 171, 86, 41, 236, 151, 206, 198, 194, 227, 105, 8, 116,
	225, 210, 93, 212, 89, 154, 234, 237, 123, 196, 251, 224, 90, 216, 190, 185, 98,179,
};

void Ocelot2::Initialize(int size, BYTE const* key, int keysize)
{
	//size should be a power of 2
	_size = size;
	_sizem1 = (int)(_size - 1);
	_sized2 = ((int)_size >> 1);
	_ssix = 0;
	//Initialization, 256 cycles
	memcpy(_ss, _sss, 256);
	Expansion(key, keysize, _data0, size+1, 3, false);
	BYTE bytes[512];
	Expansion(key, keysize, bytes, size<<1, 3, true);
	_cnt.Initialize(bytes, _size);
	memcpy(_data, _data0, _size);
	_val = _data0[size];
	BYTE rnd, temp;
	_ix = -1;
	for (; _ssix < 256; _ssix++)
	{
		_ix = (_ix + 1) & _sizem1;
		if (_ix == 0)
		{
			_cnt.Increment();
		}
		int ix1 = (_ix + _sized2) & _sizem1;
		_val ^= _data[_ix];
		_val += Ocelot2::F1(_cnt[_ix]);
		temp = _val;
		_val ^= _data[ix1];
		_val += Ocelot2::G1(_cnt[ix1]);
		rnd = _ss[(BYTE)((_data[_ix] = _ss[Ocelot2::F2(temp)]) + (_data[ix1] = Ocelot2::G2(_val))) ^ Ocelot2::F1(temp)];
		Ocelot2::Swap(_ss, _ssix, rnd);
	}
	//Create initial state
	memcpy(_ss0, _ss, 256);
	memcpy(_data0, _data, size);
	_data0[_size] = _val;
	_cnt.SaveState();
	_ix0 = _ix;
}

void Ocelot2::Expansion(BYTE const* data, int size, BYTE* res, int dim, short iter, bool compl)
{
	BYTE bytes[256];
	memcpy(bytes, data, size);
	int len = size;
	int lend2 = size >> 1;
	//Combining with dim
	if (compl)
	{
		bytes[0] += _ss[(BYTE)dim];
	}
	else
	{
		bytes[0] ^= _ss[(BYTE)dim];
	}
	//Propagate differences
	BYTE val1 = _ss[0], val2 = _ss[0], temp1, temp2;
	int k, i, ix = lend2;
	for (k = 0; k < iter; k++)
	{
		for (i = 0; i < len; i++, ix++)
		{
			if (ix == len) ix = 0;
			temp1 = bytes[i];
			temp2 = bytes[ix];
			if (compl)
			{
				val1 += _ss[temp1];
				val1 ^= temp2;
				val2 += Ocelot2::F1(val1);
				val2 ^= _ss[temp2];
				val2 += temp1;
				bytes[i] = (temp1 = Ocelot2::G1(temp1) + _ss[val1]);
				bytes[ix] = Ocelot2::F2(temp2) ^ _ss[val2];
			}
			else
			{
				val1 ^= _ss[temp1];
				val1 += temp2;
				val2 ^= Ocelot2::F1(val1);
				val2 += _ss[temp2];
				val2 ^= temp1;
				bytes[i] = (temp1 = Ocelot2::G1(temp1) ^ _ss[val1]);
				bytes[ix] = Ocelot2::F2(temp2) + _ss[val2];
			}
			Ocelot2::Swap(_ss, _ssix, val2);
			_ssix++;
		}
	}
	//Expanding
	i = 0;
	ix = lend2;
	int max = (int)dim - lend2;
	int j = 0;
	for (k = 0; k < dim; k++, i++, ix++)
	{
		if (i == len) i = 0;
		if (ix == len) ix = 0;
		temp1 = bytes[i];
		temp2 = bytes[ix];
		if (compl)
		{
			val1 ^= _ss[temp1];
			val1 += temp2;
			val2 ^= Ocelot2::G1(val1);
			res[k] = Ocelot2::F2(val2) + _ss[data[j]];
			val2 += _ss[temp2];
			val2 ^= temp1;
			if (k < max)
			{
				bytes[i] = Ocelot2::G2(temp1) ^ _ss[val1];
				bytes[ix] = Ocelot2::F1(temp2) + _ss[val2];
			}
		}
		else
		{
			val1 += _ss[temp1];
			val1 ^= temp2;
			val2 += Ocelot2::G1(val1);
			res[k] = Ocelot2::F2(val2) ^ _ss[data[j]];
			val2 ^= _ss[temp2];
			val2 += temp1;
			if (k < max)
			{
				bytes[i] = Ocelot2::G2(temp1) + _ss[val1];
				bytes[ix] = Ocelot2::F1(temp2) ^ _ss[val2];
			}
		}
		Ocelot2::Swap(_ss, _ssix, val2);
		_ssix++;
		j++;
		if (j >= len)
		{
			j = 0;
		}
	}
}

void Ocelot2::GetNextByte(BYTE& rnd)
{
	_ix = (_ix + 1) & _sizem1;
	if (_ix == 0) _cnt.Increment();
	int ix1 = (_ix + _sized2) & _sizem1;
	_val ^= _data[_ix];
	_val += Ocelot2::F1(_cnt[_ix]);
	BYTE temp = _val;
	_val ^= _data[ix1];
	_val += Ocelot2::G1(_cnt[ix1]);
	rnd = _ss[(BYTE)((_data[_ix] = _ss[Ocelot2::F2(temp)]) + (_data[ix1] = Ocelot2::G2(_val))) ^ Ocelot2::F1(temp)];
	Ocelot2::Swap(_ss, _val, temp);
}

