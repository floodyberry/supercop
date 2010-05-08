// Ocelot1.cpp
#include "Ocelot1.h"

//****************************************************************************
//
// The OCELOT1 stream ciphering method, Version 1.1.0 (01 May 2010)
// Copyright (C) 2009-2010, George Anescu, www.sc-gen.com
// All right reserved.
//
//****************************************************************************

const BYTE Ocelot1::_sss[256] = {
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

const short Ocelot1::_sarrprimes[256] = {
	719, 1229, 1759, 467, 971, 1489, 2053, 709, 1223, 1753, 
	463, 967, 1487, 2039, 701, 1217, 1747, 461, 953, 1483,
	2029, 691, 1213, 1741, 457, 947, 1481, 2027, 683, 1201, 
	1733, 449, 941, 1471, 2017, 677, 1193, 1723, 443, 937, 
	1459, 2011, 673, 1187, 1721, 439, 929, 1453, 2003, 661, 
	1181, 1709, 433, 919, 1451, 1999, 659, 1171, 1699, 431, 
	911, 1447, 1997, 653, 1163, 1697, 421, 907, 1439, 1993, 
	647, 1153, 1693, 419, 887, 1433, 1987, 643, 1151, 1669, 
	409, 883, 1429, 1979, 641, 1129, 1667, 401, 881, 1427, 
	1973, 631, 1123, 1663, 397, 877, 1423, 1951, 619, 1117, 
	1657, 389, 863, 1409, 1949, 617, 1109, 1637, 383, 859, 
	1399, 1933, 613, 1103, 1627, 379, 857, 1381, 1931, 607, 
	1097, 1621, 373, 853, 1373, 1913, 601, 1093, 1619, 367, 
	839, 1367, 1907, 599, 1091, 1613, 359, 829, 1361, 1901, 
	593, 1087, 1609, 353, 827, 1327, 1889, 587, 1069, 1607, 
	349, 823, 1321, 1879, 577, 1063, 1601, 347, 821, 1319, 
	1877, 571, 1061, 1597, 337, 811, 1307, 1873, 569, 1051, 
	1583, 331, 809, 1303, 1871, 563, 1049, 1579, 317, 797, 
	1301, 1867, 557, 1039, 1571, 313, 787, 1297, 1861, 547, 
	1033, 1567, 311, 773, 1291, 1847, 541, 1031, 1559, 307, 
	769, 1289, 1831, 523, 1021, 1553, 293, 761, 1283, 1823, 
	521, 1019, 1549, 283, 757, 1279, 1811, 509, 1013, 1543, 
	281, 751, 1277, 1801, 503, 1009, 1531, 277, 743, 1259, 
	1789, 499, 997, 1523, 271, 739, 1249, 1787, 491, 991, 
	1511, 269, 733, 1237, 1783, 487, 983, 1499, 263, 727, 
	1231, 1777, 479, 977, 1493, 257, 
};

void Ocelot1::Initialize(int size, BYTE const* key, int keysize)
{
	_size = size;
	_ssix = 0;
	//Initialization, 256 cycles
	memcpy(_ss, _sss, 256);
	Expansion(key, keysize, _data0, size+1, 3, false);
	BYTE bytes[512];
	Expansion(key, keysize, bytes, size<<1, 3, true);
	_cnt.Initialize(bytes, _size);
	memcpy(_data, _data0, _size);
	_val = _data0[size];
	BYTE rnd=0;
	_ix = -1;
	_ix1 = _ix + (_size >> 1);
	_incr = 1;
	_cnt.Increment();
	for (; _ssix < 256; _ssix++)
	{
		_ix++;
		if (_ix >= _size)
		{
			_ix = 0;
			_cnt.Increment();
			_incr = _sarrprimes[_val];
			_incr = Ocelot1::Mod(_incr, _size);
		}
		_ix1 += _incr;
		if (_ix1 >= _size) _ix1 -= _size;
		_val ^= _data[_ix];
		_val += Ocelot1::F1(_cnt[_ix]);
		_data[_ix] = _ss[Ocelot1::F2(_val)];
		rnd = _ss[Ocelot1::G1(_cnt[_ix1]) ^ (BYTE)(_data[_ix1] + Ocelot1::G2(_val))];
		Ocelot1::Swap(_ss, _ssix, rnd);
	}            
	//Create initial state
	memcpy(_ss0, _ss, 256);
	memcpy(_data0, _data, size);
	_data0[_size] = _val;
	_cnt.SaveState();
	_ix0 = _ix;
	_ix1_0 = _ix1;
	_incr0 = _incr;
}

void Ocelot1::Expansion(BYTE const* data, int size, BYTE* res, int dim, short iter, bool compl)
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
				val2 += Ocelot1::F1(val1);
				val2 ^= _ss[temp2];
				val2 += temp1;
				bytes[i] = (temp1 = Ocelot1::G1(temp1) + _ss[val1]);
				bytes[ix] = Ocelot1::F2(temp2) ^ _ss[val2];
			}
			else
			{
				val1 ^= _ss[temp1];
				val1 += temp2;
				val2 ^= Ocelot1::F1(val1);
				val2 += _ss[temp2];
				val2 ^= temp1;
				bytes[i] = (temp1 = Ocelot1::G1(temp1) ^ _ss[val1]);
				bytes[ix] = Ocelot1::F2(temp2) + _ss[val2];
			}
			Ocelot1::Swap(_ss, _ssix, val2);
			_ssix++;
		}
	}
	//Expanding
	i = 0;
	ix = lend2;
	int max = dim - lend2;
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
			val2 ^= Ocelot1::G1(val1);
			res[k] = Ocelot1::F2(val2) + _ss[data[j]];
			val2 += _ss[temp2];
			val2 ^= temp1;
			if (k < max)
			{
				bytes[i] = Ocelot1::G2(temp1) ^ _ss[val1];
				bytes[ix] = Ocelot1::F1(temp2) + _ss[val2];
			}
		}
		else
		{
			val1 += _ss[temp1];
			val1 ^= temp2;
			val2 += Ocelot1::G1(val1);
			res[k] = Ocelot1::F2(val2) ^ _ss[data[j]];
			val2 ^= _ss[temp2];
			val2 += temp1;
			if (k < max)
			{
				bytes[i] = Ocelot1::G2(temp1) + _ss[val1];
				bytes[ix] = Ocelot1::F1(temp2) ^ _ss[val2];
			}
		}
		Ocelot1::Swap(_ss, _ssix, val2);
		_ssix++;
		j++;
		if (j >= len)
		{
			j = 0;
		}
	}
}

void Ocelot1::GetNextByte(BYTE& rnd)
{
	_ix++;
	if (_ix >= _size)
	{
		_ix = 0;
		_cnt.Increment();
		_incr = _sarrprimes[_val];
		_incr = Ocelot1::Mod(_incr, _size);
	}
	_ix1 += _incr;
	if (_ix1 >= _size) _ix1 -= _size;
	BYTE temp = _data[_ix];
	_val ^= temp;
	_val += Ocelot1::F1(_cnt[_ix]);
	_data[_ix] = _ss[Ocelot1::F2(_val)];
	rnd = _ss[Ocelot1::G1(_cnt[_ix1]) ^ (BYTE)(_data[_ix1] + Ocelot1::G2(_val))];
	Ocelot1::Swap(_ss, _val, temp);
}

