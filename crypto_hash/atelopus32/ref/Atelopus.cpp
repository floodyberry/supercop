// Atelopus.cpp
#include "Atelopus.h"

//****************************************************************************
//
// The ATELOPUS hashing method, Version 1.1.0 (29 April 2010)
// Copyright (C) 2009-2010, George Anescu, www.sc-gen.com
// All right reserved.
//
//****************************************************************************

const BYTE Atelopus::_skk1[256] = {
	217, 40, 106, 12, 2, 114, 98, 19, 41, 147, 220, 97, 194, 35, 171, 105, 10, 235, 80, 56, 178, 253, 21, 39, 187,
	26, 11, 207, 27, 228, 101, 219, 176, 36, 188, 125, 121, 45, 49, 237, 202, 109, 133, 5, 70, 108, 65, 195, 138, 72,
	58, 168, 60, 37, 161, 151, 110, 96, 198, 66, 174, 126, 118, 13, 173, 192, 137, 139, 9, 95, 4, 212, 77, 100, 146,
	191, 50, 25, 59, 117, 233, 0, 34, 99, 208, 243, 71, 90, 53, 8, 160, 222, 143, 177, 119, 230, 123, 46, 145, 136,
	24, 166, 47, 135, 244, 140, 196, 149, 134, 63, 61, 87, 29, 214, 193, 6, 130, 184, 42, 190, 242, 129, 52, 206, 33,
	250, 247, 155, 86, 84, 23, 165, 88, 180, 239, 81, 16, 162, 223, 18, 83, 236, 153, 186, 234, 200, 32, 91, 216,
	115, 132, 43, 218, 215, 107, 3, 248, 251, 44, 51, 211, 226, 15, 201, 62, 20, 240, 22, 163, 231, 57, 246, 255, 1,
	183, 227, 245, 76, 30, 154, 189, 144, 113, 164, 209, 131, 104, 122, 156, 142, 152, 224, 54, 67, 124, 78, 127, 94,
	175, 68, 167, 103, 48, 221, 205, 148, 150, 79, 7, 181, 225, 204, 241, 179, 75, 158, 229, 157, 210, 232, 169, 141,
	102, 128, 249, 238, 213, 120, 111, 64, 170, 93, 85, 82, 28, 252, 116, 112, 203, 17, 197, 254, 14, 185, 73, 92, 31,
	38, 199, 159, 55, 89, 69, 74, 182, 172,
};

const short Atelopus::_sarrprimes[256] = {
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

void Atelopus::HashPrimitive(BYTE const* data, BYTE* res, int len)
{
	//Copy in work buffer
	BYTE bytes[BlockSize256], temp1, temp2;
	memcpy(bytes, data, len);
	int len1 = len - 1;
	int lend2 = len >> 1;
	//Introduce a data difference based on _size
	bytes[0] ^= _kk1[(BYTE)_size];
	//1) Propagate differences
	int pos1 = 0, pos2 = 0;
	int incr1 = 0, incr2 = 0;
	int i, k, ix, ix1;
	for (k = 0; k < _iter; k++)
	{
		ix = Atelopus::Mod(_kk1[_val1 ^ _val2], len);
		ix1 = ix + lend2;
		if (ix1 >= len) ix1 = 0;
		temp1 = _kk1[_val1] ^ _val2;
		temp2 = _val1 + _kk1[_val2];
		if (temp2 == temp1)
		{
			temp2++;
		}
		incr1 = _sarrprimes[temp1];
		incr2 = _sarrprimes[temp2];
		incr1 = Atelopus::Mod(incr1, len);
		incr2 = Atelopus::Mod(incr2, len);
		pos1 = Atelopus::Mod(_val1, len);
		pos2 = Atelopus::Mod(_val2, len);
		if ((incr1 == incr2) && (pos1 == pos2))
		{
			pos2++;
			if (pos2 >= len) pos2 = 0;
		}
		for (i = 0; i < len; i++)
		{
			if (pos1 == pos2)
			{
				temp1 = bytes[pos1];
				_val1 ^= _kk1[temp1];
				_val1 += bytes[ix];
				_val2 ^= Atelopus::F1(_val1);
				_val2 += _kk1[temp1];
				_val2 ^= bytes[ix1];
				Atelopus::Swap(_kk1, (temp1 = Atelopus::G1(temp1) ^ _kk1[_val1]), _val2);
				bytes[pos1] = Atelopus::F2(temp1) + _kk1[_val2];
			}
			else
			{
				temp1 = bytes[pos1];
				temp2 = bytes[pos2];
				_val1 ^= _kk1[temp1];
				_val1 += bytes[ix];
				_val2 ^= Atelopus::F1(_val1);
				_val2 += _kk1[temp2];
				_val2 ^= bytes[ix1];
				Atelopus::Swap(_kk1, (bytes[pos1] = Atelopus::G1(temp1) ^ _kk1[_val1]), _val2);
				bytes[pos2] = Atelopus::F2(temp2) + _kk1[_val2];
			}
			if (i < len1)
			{
				ix++;
				if (ix == len) ix = 0;
				ix1++;
				if (ix1 == len) ix1 = 0;
				pos1 += incr1;
				if (pos1 >= len) pos1 -= len;
				pos2 += incr2;
				if (pos2 >= len) pos2 -= len;
			}
		}
	}
	//2) Contracting
	i = 0;
	ix = lend2;
	int max = _size - lend2;
	temp1 = _kk1[_val1] ^ _val2;
	temp2 = _val1 + _kk1[_val2];
	if (temp2 == temp1)
	{
		temp2++;
	}
	incr1 = _sarrprimes[temp1];
	incr2 = _sarrprimes[temp2];
	incr1 = Atelopus::Mod(incr1, len);
	incr2 = Atelopus::Mod(incr2, len);
	pos1 = Atelopus::Mod(_val1, len);
	pos2 = Atelopus::Mod(_val2, len);
	if ((incr1 == incr2) && (pos1 == pos2))
	{
		pos2++;
		if (pos2 >= len) pos2 = 0;
	}
	for (k = 0; k < _size; k++, i++, ix++)
	{
		if (i == len) i = 0;
		if (ix == len) ix = 0;
		temp1 = bytes[pos1];
		_val1 ^= _kk1[temp1];
		_val1 += bytes[i];
		res[k] = (_val2 ^= Atelopus::F1(_val1));
		_val2 += _kk1[bytes[pos2]];
		_val2 ^= bytes[ix];
		Atelopus::Swap(_kk1, Atelopus::G1(temp1) ^ _kk1[_val1], _val2);
		pos1 += incr1;
		if (pos1 >= len) pos1 -= len;
		pos2 += incr2;
		if (pos2 >= len) pos2 -= len;
	}
	//3) Combining with the original
	max = (len < _size) ? _size : len;
	//1
	incr1 = _sarrprimes[(BYTE)(_kk1[_val1] ^ _val2)];
	incr2 = _sarrprimes[(BYTE)(_kk1[_val2] + _val1)];
	incr1 = Atelopus::Mod(incr1, len);
	incr2 = Atelopus::Mod(incr2, _size);
	i = Atelopus::Mod(_val1, len);
    k = Atelopus::Mod(_val2, _size);
	for (ix = 0; ix < max; ix++)
	{
		temp1 = data[i];
		temp2 = _kk1[temp1];
		_val1 += Atelopus::F1(temp1);
		_val1 ^= temp2;		
		res[k] += _val1;
		Atelopus::Swap(_kk1, _val1, temp2);		
		i += incr1;
		if (i >= len) i -= len;
		k += incr2;
		if (k >= _size) k -= _size;
	}
	//2
	incr1 = _sarrprimes[(BYTE)(_kk1[_val2] ^ _val1)];
	incr2 = _sarrprimes[(BYTE)(_kk1[_val1] + _val2)];
	incr1 = Atelopus::Mod(incr1, len);
	incr2 = Atelopus::Mod(incr2, _size);
	for (ix = 0; ix < max; ix++)
	{
		temp1 = data[i];
		temp2 = _kk1[temp1];
		_val2 ^= Atelopus::F2(temp1);
		_val2 += temp2;		
		res[k] ^= _val2;
		Atelopus::Swap(_kk1, _val2, temp2);
		i += incr1;
		if (i >= len) i -= len;
		k += incr2;
		if (k >= _size) k -= _size;
	}
}

void Atelopus::Init(BYTE* bytes, int len)
{
	int pos1 = 0;
	int pos2 = (len >> 2);
	int pos3 = (len >> 1);
	int pos4 = pos3 + pos2;
	if ((len & 0x3) == 3) //4k+3
	{
		pos2++;
		pos3++;
		pos4++;
	}
	BYTE val1 = _val1 ^ len;
	BYTE val2 = _val2 + Atelopus::F1((BYTE)len);
	BYTE val3 = _kk1[64] ^ Atelopus::F2((BYTE)len);
	BYTE val4 = _kk1[192] + (BYTE)len;
	BYTE byte1, byte2, byte3, byte4;
	for (int i = 0; i < 256; i++)
	{
		byte1 = bytes[pos1];
		byte1 ^= val1;
		byte1 += _kk1[val2];
		bytes[pos1] = byte1;
		byte2 = bytes[pos2];
		byte2 ^= val2;
		byte2 += _kk1[val3];
		bytes[pos2] = byte2;
		byte3 = bytes[pos3];
		byte3 ^= val3;
		byte3 += _kk1[val4];
		bytes[pos3] = byte3;
		byte4 = bytes[pos4];
		byte4 ^= val4;
		byte4 += _kk1[val1];
		bytes[pos4] = byte4;
		val1 ^= byte1;
		val1 += Atelopus::F1(byte2);
		val1 ^= _kk1[byte3];
		val2 ^= byte2;
		val2 += Atelopus::F2(byte3);
		val2 ^= _kk1[byte4];
		val3 ^= byte3;
		val3 += Atelopus::F1(byte4);
		val3 ^= _kk1[byte1];
		val4 ^= byte4;
		val4 += Atelopus::F2(byte1);
		val4 ^= _kk1[byte2];
		byte1 = val1 + val2;
		byte1 ^= val3;
		Atelopus::Swap(_kk1, (BYTE)i, byte1 + val4);
		pos1++;
		if (pos1 >= len) pos1 = 0;
		pos2++;
		if (pos2 >= len) pos2 = 0;
		pos3++;
		if (pos3 >= len) pos3 = 0;
		pos4++;
		if (pos4 >= len) pos4 = 0;
	}
    _val1 = val1 ^ val2;
    _val1 += val3;
    _val2 = val2 + val3;
    _val2 ^= val4;
}

//Dynamic block size hashing
void Atelopus::Hash(BYTE const* data, BYTE* res, long long len)
{
	if (len < 0)
	{
		throw runtime_error("Atelopus::Hash(), negative data length.");
	}
	//calculate min, max
	int max = _bs;
	int min = max >> 1;
	int max2 = max << 1;
	//Append at least 8 bytes representing the data length
	//(something similar to Merkle-Damgård construction)
	int lenapp = 8;
	if (len + 8 < min)
	{
		lenapp = (int)(min - len);
	}
	long long lenorig = len;
	len = lenorig + lenapp; //taking appended bytes into account
	//work buffers
	BYTE bytes[BlockSize256];
	BYTE bytes1[BlockSize256];
	if (len <= max)
	{
		//Just one block
		memcpy(bytes, data, (size_t)lenorig);
		//appending
		bytes[lenorig] = (BYTE)(lenorig);
		int i;
		int lenorig1 = (int)lenorig;
		for (i = 1; i < 8; i++)
		{
			lenorig1 >>= 8;
			bytes[lenorig+i] = (BYTE)((lenorig1 & 0xFF) + i);
		}
		for (i = 8; i < lenapp; i++)
		{
			bytes[lenorig+i] = (BYTE)i;
		}
		memcpy(bytes1, bytes, (size_t)len);
		Init(bytes1, (int)len);
		XORIPE(bytes, bytes1, (int)len, (int)len);
		HashPrimitive(bytes, res, (int)len);
		return;
	}
	int blocksize = 0;
	long long pos = 0;
	long long len1;
	bool init = false;
	while (true)
	{
		len1 = len - pos; //remaining bytes
		if (len1 <= max2)
		{
			//Second to last block
			BYTE bytes2[BlockSize256];
			//Copy all
			blocksize = (int)(lenorig - pos);
			memcpy(bytes2, data+pos, blocksize);
			//Appending
			pos = blocksize;
			bytes2[pos] = (BYTE)(lenorig);
			int i;
			for (i = 1; i < 8; i++)
			{
				lenorig >>= 8;
				bytes2[pos+i] = (BYTE)((lenorig & 0xFF) + i);
			}
			for (i = 8; i < lenapp; i++)
			{
				bytes2[pos+i] = (BYTE)i;
			}
			blocksize = (int)(len1 >> 1);
			memcpy(bytes, bytes2, blocksize);
			if (!init)
			{
				memcpy(bytes1, bytes, blocksize);
				Init(bytes1, blocksize);
				XORIPE(bytes, bytes1, blocksize, blocksize);
			}
			else
			{
				XORIPE(bytes, res, blocksize, _size);
			}
			HashPrimitive(bytes, res, blocksize);			
			//Last block
			pos = blocksize;
			blocksize = (int)(len1 - blocksize);
			memcpy(bytes, bytes2+pos, blocksize);
			XORIPE(bytes, res, blocksize, _size);
			HashPrimitive(bytes, res, blocksize);
			return;
		}
		else
		{
			if (!init)
			{
				memcpy(bytes1, data, (size_t)min);
				Init(bytes1, min);
			}
			blocksize = _val1 + _val2;
			blocksize &= (BYTE)(min - 1);
			blocksize |= (BYTE)(min);
			++blocksize;
			memcpy(bytes, data+pos, (size_t)blocksize);
			if (!init)
			{
				XORIPE(bytes, bytes1, blocksize, min);
				init = true;
			}
			else
			{
				XORIPE(bytes, res, blocksize, _size);
			}
			HashPrimitive(bytes, res, blocksize);
			pos += blocksize;
		}
	}
}

//Input File Length
long long Atelopus::FileLength(ifstream& in)
{
	//Check first the file's state
	if(!in.is_open() || in.bad())
	{
		throw runtime_error("FileLength(), file not opened or in bad state.");
	}
	//Get current position
	streampos currpos = in.tellg();
	//Move to the end
	in.seekg(0, ios::end);
	streampos endpos = in.tellg();
	//Go Back
	in.seekg(currpos, ios::beg);
	return (long long)endpos;
}

//Dynamic block size hashing for a file
void Atelopus::HashFile(string const& filepath, BYTE* res)
{
	if (filepath.empty())
	{
		throw runtime_error("Atelopus::HashFile(), empty file path.");
	}
	try
	{
		//calculate min, max
		int max = _bs;
		int min = max >> 1;
		int max2 = max << 1;
		ifstream fs(filepath.c_str());
		if(!fs)
		{
			throw runtime_error("Atelopus::HashFile(), cannot open file.");
		}
		long long len = FileLength(fs);
		//Append at least 8 bytes representing the data length
		//(something similar to Merkle-Damgård construction)
		int lenapp = 8;
		if (len + 8 < min)
		{
			lenapp = (int)(min - len);
		}
		long long lenorig = len;
		len = lenorig + lenapp; //taking appended bytes into account
		//work buffers
		BYTE bytes[BlockSize256];
		BYTE bytes1[BlockSize256];
		if (len <= max)
		{
			//Just one block
			if (lenorig > 0)
			{
				fs.read((char*)bytes, (streamsize)lenorig);
			}
			//appending
			bytes[lenorig] = (BYTE)lenorig;
			int i;
			int lenorig1 = (int)lenorig;
			for (i = 1; i < 8; i++)
			{
				lenorig1 >>= 8;
				bytes[lenorig + i] = (BYTE)((lenorig1 & 0xFF) + i);
			}
			for (i = 8; i < lenapp; i++)
			{
				bytes[lenorig + i] = (BYTE)i;
			}
			memcpy(bytes1, bytes, (size_t)len);			
			Init(bytes1, (int)len);
			XORIPE(bytes, bytes1, (int)len, (int)len);
			HashPrimitive(bytes, res, (int)len);
			fs.close();
			return;
		}
		int blocksize = 0;
		long long pos = 0;
		long long len1;
		bool init = false;
		while (true)
		{
			len1 = len - pos; //remaining bytes
			if (len1 <= max2)
			{
				//Second to last block
				BYTE bytes2[BlockSize256];
				//Copy all
				pos = lenorig - pos;
				fs.read((char*)bytes2, (streamsize)pos);
				//Appending
				bytes2[pos] = (BYTE)lenorig;
				int i;
				for (i = 1; i < 8; i++)
				{
					lenorig >>= 8;
					bytes2[pos + i] = (BYTE)((lenorig & 0xFF) + i);
				}
				for (i = 8; i < lenapp; i++)
				{
					bytes2[pos + i] = (BYTE)i;
				}
				blocksize = (int)(len1 >> 1);
				memcpy(bytes, bytes2, blocksize);
				if (!init)
				{
					memcpy(bytes1, bytes, blocksize);
					Init(bytes1, blocksize);
					XORIPE(bytes, bytes1, blocksize, blocksize);
				}
				else
				{
					XORIPE(bytes, res, blocksize, _size);
				}
				HashPrimitive(bytes, res, blocksize);
				//Last block
				pos = blocksize;
				blocksize = (int)(len1 - blocksize);
				memcpy(bytes, bytes2+pos, blocksize);
				XORIPE(bytes, res, blocksize, _size);
				HashPrimitive(bytes, res, blocksize);				
				fs.close();
				return;                
			}
			else
			{
				if (!init)
				{
					fs.read((char*)bytes1, min);
					//Reset file position
					fs.seekg(0, ios::beg);
					Init(bytes1, min);
				}
				blocksize = _val1 + _val2;
				blocksize &= (BYTE)(min - 1);
				blocksize |= (BYTE)(min);
				++blocksize;
				fs.read((char*)bytes, blocksize);
				if (!init)
				{
					XORIPE(bytes, bytes1, blocksize, min);
					init = true;
				}
				else
				{
					XORIPE(bytes, res, blocksize, _size);
				}
				HashPrimitive(bytes, res, blocksize);
				pos += blocksize;
			}
		}
	}
	catch (exception const& ex)
	{
		throw runtime_error("Atelopus::HashFile(), file read error: " + string(ex.what()));
	}
}

