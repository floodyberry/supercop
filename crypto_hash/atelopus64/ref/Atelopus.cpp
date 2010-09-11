// Atelopus.cpp
#include "Atelopus.h"

//****************************************************************************
//
// The ATELOPUS hashing method, Version 2.0.0 (28 August 2010)
// Copyright (C) 2009-2010, George Anescu, www.sc-gen.com
// All right reserved.
//
//****************************************************************************

const BYTE Atelopus::_skk1[256] = {
    217, 40, 106, 12, 2, 114, 98, 19, 41, 147, 220, 97, 194,
    35, 171, 105, 10, 235, 80, 56, 178, 253, 21, 39, 187,
    26, 11, 207, 27, 228, 101, 219, 176, 36, 188, 125, 121,
    45, 49, 237, 202, 109, 133, 5, 70, 108, 65, 195, 138, 72,
    58, 168, 60, 37, 161, 151, 110, 96, 198, 66, 174, 126, 118,
    13, 173, 192, 137, 139, 9, 95, 4, 212, 77, 100, 146,
    191, 50, 25, 59, 117, 233, 0, 34, 99, 208, 243, 71, 90, 53,
    8, 160, 222, 143, 177, 119, 230, 123, 46, 145, 136,
    24, 166, 47, 135, 244, 140, 196, 149, 134, 63, 61, 87, 29,
    214, 193, 6, 130, 184, 42, 190, 242, 129, 52, 206, 33,
    250, 247, 155, 86, 84, 23, 165, 88, 180, 239, 81, 16, 162,
    223, 18, 83, 236, 153, 186, 234, 200, 32, 91, 216,
    115, 132, 43, 218, 215, 107, 3, 248, 251, 44, 51, 211, 226,
    15, 201, 62, 20, 240, 22, 163, 231, 57, 246, 255, 1,
    183, 227, 245, 76, 30, 154, 189, 144, 113, 164, 209, 131,
    104, 122, 156, 142, 152, 224, 54, 67, 124, 78, 127, 94,
    175, 68, 167, 103, 48, 221, 205, 148, 150, 79, 7, 181, 225,
    204, 241, 179, 75, 158, 229, 157, 210, 232, 169, 141,
    102, 128, 249, 238, 213, 120, 111, 64, 170, 93, 85, 82, 28,
    252, 116, 112, 203, 17, 197, 254, 14, 185, 73, 92, 31,
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

void Atelopus::HashPrimitive(UINT const* data, UINT* res, int const& len)
{
    //Copy in work buffer
    UINT ar[BlockSize256];
    memcpy(ar, data, len<<2);
    int len1 = len - 1;
    int lend2 = len >> 1;
    //1) Propagate differences
    register UINT temp1, temp2;
    register int i, k, ix, ix1, pos1, pos2, incr1, incr2;
    for (k = 0; k < (int)_iter; k++)
    {
        if (k == 1)
        {
            //Introduce a data difference based on _size
            ar[0] ^= KK(_size);
        }
        ix = H1(Atelopus::F1(_val1) ^ KK(_val2)) % len;
        ix1 = ix + lend2;
        if (ix1 >= len) ix1 -= len;
        incr1 = _sarrprimes[H1(KK(_val1) ^ _val2)];
        incr2 = _sarrprimes[H2(_val1 + KK(_val2))];
        incr1 %= len;
        incr2 %= len;
        pos1 = H1(Atelopus::G2(_val1)) % len;
        pos2 = H2(Atelopus::F2(_val2)) % len;
        if ((incr1 == incr2) && (pos1 == pos2))
        {
            pos2++;
            if (pos2 == len) pos2 = 0;
        }
        for (i=0; i<len; i++)
        {
            if (pos1 == pos2)
            {
                temp1 = ar[pos1];
                _val1 ^= KK(temp1);
                _val1 += ar[ix];
                _val2 ^= Atelopus::F1(_val1);
                _val2 += temp1;
                _val2 ^= ar[ix1];
                (this->*Swap)((temp1 = Atelopus::G1(temp1) ^ _val1), KK(_val2));
                ar[pos1] = Atelopus::F2(KK(temp1)) + _val2;
            }
            else
            {
                temp1 = ar[pos1];
                temp2 = ar[pos2];
                _val1 ^= KK(temp1);
                _val1 += ar[ix];
                _val2 ^= Atelopus::F1(_val1);
                _val2 += temp2;
                _val2 ^= ar[ix1];
                (this->*Swap)((ar[pos1] = Atelopus::G1(temp1) ^ _val1), KK(_val2));
                ar[pos2] = Atelopus::F2(KK(temp2)) + _val2;
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
    //2) Contracting (assuming _size < len, but it can also expand)
    incr1 = _sarrprimes[H1(KK(_val1) ^ _val2)];
    incr2 = _sarrprimes[H2(_val1 + KK(_val2))];
    incr1 %= len;
    incr2 %= len;
    pos1 = H1(Atelopus::G2(_val1)) % len;
    pos2 = H2(Atelopus::F2(_val2)) % len;
    if ((incr1 == incr2) && (pos1 == pos2))
    {
        pos2++;
        if (pos2 == len) pos2 = 0;
    }
    int ik, pk;
    ik = _sarrprimes[H1(KK(Atelopus::F1(_val1)) + _val2)] % _size;
    pk = H1(Atelopus::F1(_val1) ^ KK(_val2)) % _size;
    int max = (lend2 < (int)_size) ? _size : (lend2+1);
    register bool over = false;
    int size1 = _size - len;
    for (i=0,k=pk,ix=lend2,ix1=0; ix1<max; i++,k+=ik,ix++,ix1++,pos1+=incr1,pos2+=incr2)
    {
        if (i == len)
        {
            i = 0;
            size1 -= len;
        }
        if (k >= (int)_size)
        {
            k -= _size;
            if (k == pk) over = true;
        }
        if (ix == len) ix = 0;
        if (pos1 >= len) pos1 -= len;
        if (pos2 >= len) pos2 -= len;
        temp1 = ar[pos1];
        _val1 ^= KK(temp1);
        _val1 += ar[i];
        _val2 ^= Atelopus::F1(_val1);
        if (over)
        {
            res[k] += _val2;
        }
        else
        {
            res[k] = _val2;
        }
        _val2 += ar[pos2];
        _val2 ^= ar[ix];
        if (size1 > 0)
        {
            //only for expansion
            ar[i] ^= KK(_val2);
            ar[ix] += Atelopus::F2(_val1);
        }
        (this->*Swap)(Atelopus::G2(temp1) ^ KK(_val1), _val2); 
    }
    //3) Combining with the original
    incr1 = _sarrprimes[H1(KK(_val1))] % len;
    incr2 = _sarrprimes[H2(KK(_val2))] % _size;
    i = H1(Atelopus::F1(_val1)) % len;
    k = H2(Atelopus::G2(_val2)) % _size;
    max = (len < (int)_size) ? _size : len;
    for (ix = 0; ix < max; ix++)
    {
        temp1 = data[i];
        _val1 += Atelopus::F1(KK(temp1));
        _val2 ^= _val1 + temp1;
        res[k] ^= _val2;
        i += incr1;
        if (i >= len) i -= len;
        k += incr2;
        if (k >= (int)_size) k -= _size;
    }
}

void Atelopus::Init(UINT* ar, int const& len)
{
    register int pos1 = 0;
    register int pos2 = (len >> 2);
    register int pos3 = (len >> 1);
    register int pos4 = pos2 + pos3;
    if ((len & 0x3) == 3) //4k+3
    {
        pos2++;
        pos3++;
        pos4++;
    }
    register UINT val1 = _val1 ^ len;
    register UINT val2 = _val2 + Atelopus::F1((BYTE)len);
    BYTE temp[4];
    temp[0] = _kk1[16]; temp[1] = _kk1[80]; temp[2] = _kk1[144]; temp[3] = _kk1[208];
    register UINT val3;
    val3 = Bytes2Word(temp);
    val3 ^= Atelopus::F2((BYTE)len);
    temp[0] = _kk1[48]; temp[1] = _kk1[112]; temp[2] = _kk1[176]; temp[3] = _kk1[240];
    register UINT val4;
    val4 = Bytes2Word(temp);
    val4 += (BYTE)len;
    UINT *pui1, *pui2, *pui3, *pui4, temp1;
    //at least 2 rounds
    int len2 = len<<1;
    int max = (len2 > 256) ? len2 : 256;
    for (register int i = 0; i < max; i += 4)
    {
        pui1 = &ar[pos1]; *pui1 ^= val1; *pui1 += KK(val2);
        pui2 = &ar[pos2]; *pui2 ^= val2; *pui2 += KK(val3);
        pui3 = &ar[pos3]; *pui3 ^= val3; *pui3 += KK(val4);
        pui4 = &ar[pos4]; *pui4 ^= val4; *pui4 += KK(val1);
        val1 ^= *pui1; val1 += Atelopus::F1(*pui2); val1 ^= KK(*pui3);
        val2 ^= *pui2; val2 += Atelopus::F2(*pui3); val2 ^= KK(*pui4);
        val3 ^= *pui3; val3 += Atelopus::F1(*pui4); val3 ^= KK(*pui1);
        val4 ^= *pui4; val4 += Atelopus::F2(*pui1); val4 ^= KK(*pui2);
        temp[0] = (BYTE)i; temp[1] = (BYTE)(i+1); temp[2] = (BYTE)(i+2); temp[3] = (BYTE)(i+3);
        temp1 = Bytes2Word(temp);
        (this->*Swap)(temp1, Atelopus::G1((val1 + val2)^(val3 + val4)));
        pos1++;
        if (pos1 == len) pos1 = 0;
        pos2++;
        if (pos2 == len) pos2 = 0;
        pos3++;
        if (pos3 == len) pos3 = 0;
        pos4++;
        if (pos4 == len) pos4 = 0;
    }
    _val1 = val1 ^ val2; _val1 += val3;
    _val2 = val2 + val3; _val2 ^= val4;
}

//Dynamic block size hashing (it is not using padding, excepting messages with length less
//than the maximum block size)
void Atelopus::Hash(BYTE const* data, BYTE* res, unsigned long long const& length)
{
    //calculate min, max, double max
    int max = _bs4;
    int maxw = max >> 2;
    int min = max >> 1;
    int max2 = max << 1;
    //work buffers
    UINT ar[BlockSize256];
    UINT ar1[BlockSize256];
    register int i, blocksize, blocksize4;
    BYTE* pbytes;
    if (length <= (unsigned long long)max)
    {
        //Just one block
        blocksize4 = max;
        blocksize = max >> 2;
        //Padding
        pbytes = (BYTE*)ar + (int)length;
        for (i = 0; i < blocksize4-(int)length; i++,pbytes++)
        {
            *pbytes = (BYTE)i;
        }
        memcpy(ar, data, (size_t)length);
        memcpy(ar1, ar, blocksize4);
        //XOR with the length (no more than 2 bytes)
        int temp = (int)length;
        pbytes = (BYTE*)ar1;
        *pbytes ^= (BYTE)temp;
        temp >>= 8;
        *(++pbytes) ^= (BYTE)temp;
        Bytes2Words(ar, ar, blocksize);
        Bytes2Words(ar1, ar1, blocksize);
        Init(ar1, blocksize);
        HashPrimitive(ar, (UINT*)res, blocksize);
        XORIPE((UINT*)res, ar1, _size, blocksize);
        //Result in bytes
        Words2Bytes((UINT*)res, res, _size);
        return;
    }
    int min1 = min - 1;
    unsigned long long pos = 0;
    unsigned long long len1;
    register bool init = false;
    while (true)
    {
        len1 = length - pos; //remaining bytes
        if (len1 <= (unsigned long long)max2)
        {
            //Second to last block
            blocksize4 = (int)len1;
            blocksize4 >>= 1;
            blocksize = blocksize4 >> 2;
            blocksize4 = blocksize << 2;
            memcpy(ar, data+pos, (size_t)blocksize4);
            if (!init)
            {
                memcpy(ar1, data, (size_t)max);
                //XOR with the length (no more than 2 bytes)
                unsigned long long temp = length;
                pbytes = (BYTE*)ar1;
                *pbytes ^= (BYTE)temp;
                temp >>= 8;
                *(++pbytes) ^= (BYTE)temp;
                Bytes2Words(ar1, ar1, maxw);
                Init(ar1, maxw);
                Bytes2Words(ar, ar, blocksize);
                HashPrimitive(ar, (UINT*)res, blocksize);
                XORIPE((UINT*)res, ar1, _size, maxw);
            }
            else
            {
                HashPrimitive(ar, (UINT*)res, blocksize);
                XORIPE((UINT*)res, ar1, _size);
            }
            memcpy(ar1, res, (size_t)_size4);
            //Last block
            pos += blocksize4;
            blocksize4 = (int)(len1 - blocksize4);
            blocksize = blocksize4 >> 2;
            if ((blocksize4 & 3) != 0)
            {
                ar[blocksize] = 0;
                blocksize++;
            }
            memcpy(ar, data+pos, (size_t)blocksize4);
            Bytes2Words(ar, ar, blocksize);
            HashPrimitive(ar, (UINT*)res, blocksize);
            XORIPE((UINT*)res, ar1, _size);
            //Result in bytes
            Words2Bytes((UINT*)res, res, _size);
            return;
        }
        else
        {
            if (!init)
            {
                memcpy(ar1, data, (size_t)max);
                //XOR with the length
                unsigned long long temp = length;
                pbytes = (BYTE*)ar1;
                *pbytes ^= (BYTE)temp;
                for (i = 1; i < 8; i++)
                {
                    temp >>= 8;
                    *(++pbytes) ^= (BYTE)temp;
                }
                Bytes2Words(ar1, ar1, maxw);
                Init(ar1, maxw);
            }
            blocksize4 = _val1 + _val2;
            blocksize4 &= min1;
            blocksize4 |= min;
            ++blocksize4;
            blocksize = blocksize4 >> 2;
            blocksize4 = blocksize << 2;
            memcpy(ar, data+pos, (size_t)blocksize4);
            Bytes2Words(ar, ar, blocksize);
            HashPrimitive(ar, (UINT*)res, blocksize);
            if (!init)
            {
                XORIPE((UINT*)res, ar1, _size, maxw);
                init = true;
            }
            else
            {
                XORIPE((UINT*)res, ar1, _size);
            }
            memcpy(ar1, res, (size_t)_size4);
            pos += blocksize4;
        }
    }
}

//Input File Length
unsigned long long Atelopus::FileLength(ifstream& in)
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
    return (unsigned long long)endpos;
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
        //calculate min, max, double max
        int max = _bs4;
        int maxw = max >> 2;
        int min = max >> 1;
        int max2 = max << 1;
        ifstream fs(filepath.c_str());
        if(!fs)
        {
            throw runtime_error("Atelopus::HashFile(), cannot open file.");
        }
        unsigned long long length = FileLength(fs);
        //work buffers
        UINT ar[BlockSize256];
        UINT ar1[BlockSize256];
        register int i, blocksize, blocksize4;
        BYTE* pbytes;
        if (length <= (unsigned long long)max)
        {
            //Just one block
            blocksize4 = max;
            blocksize = max >> 2;
            //Padding
            pbytes = (BYTE*)ar + (int)length;
            for (i = 0; i < blocksize4-(int)length; i++,pbytes++)
            {
                *pbytes = (BYTE)i;
            }
            if (length > 0)
            {
                fs.read((char*)ar, (streamsize)length);
            }
            memcpy(ar1, ar, blocksize4);
            //XOR with the length (no more than 2 bytes)
            int temp = (int)length;
            pbytes = (BYTE*)ar1;
            *pbytes ^= (BYTE)temp;			
            temp >>= 8;
            *(++pbytes) ^= (BYTE)temp;
            Bytes2Words(ar, ar, blocksize);
            Bytes2Words(ar1, ar1, blocksize);
            Init(ar1, blocksize);
            HashPrimitive(ar, (UINT*)res, blocksize);
            XORIPE((UINT*)res, ar1, _size, blocksize);
            //Result in bytes
            Words2Bytes((UINT*)res, res, _size);
            fs.close();
            return;
        }
        int min1 = min - 1;
        unsigned long long pos = 0;
        unsigned long long len1;
        register bool init = false;
        while (true)
        {
            len1 = length - pos; //remaining bytes
            if (len1 <= (unsigned long long)max2)
            {
                //Second to last block
                blocksize4 = (int)len1;
                blocksize4 >>= 1;
                blocksize = blocksize4 >> 2;
                blocksize4 = blocksize << 2;
                if (!init)
                {
                    fs.read((char*)ar1, (streamsize)max);
                    //Reset file position
                    fs.seekg(0, ios::beg);
                    //XOR with the length (no more than 2 bytes)
                    unsigned long long temp = length;
                    pbytes = (BYTE*)ar1;
                    *pbytes ^= (BYTE)temp;
                    temp >>= 8;
                    *(++pbytes) ^= (BYTE)temp;
                    Bytes2Words(ar1, ar1, maxw);
                    Init(ar1, maxw);
                    fs.read((char*)ar, (streamsize)blocksize4);
                    Bytes2Words(ar, ar, blocksize);
                    HashPrimitive(ar, (UINT*)res, blocksize);
                    XORIPE((UINT*)res, ar1, _size, maxw);
                }
                else
                {
                    fs.read((char*)ar, (streamsize)blocksize4);
                    HashPrimitive(ar, (UINT*)res, blocksize);
                    XORIPE((UINT*)res, ar1, _size);
                }
                memcpy(ar1, res, (size_t)_size4);
                //Last block
                pos += blocksize4;
                blocksize4 = (int)(len1 - blocksize4);
                blocksize = blocksize4 >> 2;
                if ((blocksize4 & 3) != 0)
                {
                    ar[blocksize] = 0;
                    blocksize++;
                }
                fs.read((char*)ar, (streamsize)blocksize4);
                Bytes2Words(ar, ar, blocksize);
                HashPrimitive(ar, (UINT*)res, blocksize);
                XORIPE((UINT*)res, ar1, _size);
                //Result in bytes
                Words2Bytes((UINT*)res, res, _size);
                fs.close();
                return;
            }
            else
            {
                if (!init)
                {
                    fs.read((char*)ar1, (streamsize)max);
                    //Reset file position
                    fs.seekg(0, ios::beg);
                    //XOR with the length
                    unsigned long long temp = length;
                    pbytes = (BYTE*)ar1;
                    *pbytes ^= (BYTE)temp;
                    for (i = 1; i < 8; i++)
                    {
                        temp >>= 8;
                        *(++pbytes) ^= (BYTE)temp;
                    }
                    Bytes2Words(ar1, ar1, maxw);
                    Init(ar1, maxw);
                }
                blocksize4 = _val1 + _val2;
                blocksize4 &= min1;
                blocksize4 |= min;
                ++blocksize4;
                blocksize = blocksize4 >> 2;
                blocksize4 = blocksize << 2;
                fs.read((char*)ar, (streamsize)blocksize4);
                Bytes2Words(ar, ar, blocksize);
                HashPrimitive(ar, (UINT*)res, blocksize);
                if (!init)
                {
                    XORIPE((UINT*)res, ar1, _size, maxw);
                    init = true;
                }
                else
                {
                    XORIPE((UINT*)res, ar1, _size);
                }
                memcpy(ar1, res, (size_t)_size4);
                pos += blocksize4;
            }
        }
    }
    catch (exception const& ex)
    {
        throw runtime_error("Atelopus::HashFile(), file read error: " + string(ex.what()));
    }
}

