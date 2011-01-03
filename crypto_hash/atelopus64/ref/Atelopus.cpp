
// Atelopus.cpp
#include "Atelopus.h"

//****************************************************************************
//
// The ATELOPUS hashing method, Version 2.1.0 (09 December 2010)
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

void Atelopus::HashPrimitive(UINT const* data, UINT* res)
{
    // Copy in work buffer
    UINT ar[BlockSize256];
    memcpy(ar, data, _bs4);
    // 1) Propagate differences
    register UINT temp1, temp2;
    register int i, k, ix, ix1, pos1, pos2, incr1, incr2;
    for (k = 0; k < (int)_iter; k++)
    {
        if (k == 1)
        {
            // Introduce a data difference based on _size
            ar[0] ^= KK(_size);
        }
        ix = H1(Atelopus::F1(_val1) ^ KK(_val2)) & _bs1;
        ix1 = (ix + _bs2) & _bs1;
        incr1 = H1(KK(_val1) ^ _val2) & _bs1;
        incr2 = H2(_val1 + KK(_val2)) & _bs1;
        pos1 = H1(_val1) & _bs1;
        pos2 = H2(Atelopus::F2(_val2)) & _bs1;
        if ((incr1 == incr2) && (pos1 == pos2))
        {
            pos2++;
            pos2 &= _bs1;
        }
        for (i=0; i<(int)_bs; i++)
        {
            if (pos1 == pos2)
            {
                temp1 = ar[pos1];
                _val1 ^= KK(temp1);
                _val1 += ar[ix];
                _val2 ^= Atelopus::F1(_val1);
                _val2 += temp1;
                _val2 ^= ar[ix1];
                temp1 ^= KK(_val1);
                ar[pos1] = temp1 + KK(_val2);
                (this->*Swap)(temp1, _val2);
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
                ar[pos2] = temp2 + KK(_val2);
                (this->*Swap)((ar[pos1] = temp1 ^ KK(_val1)), _val2);
            }
            if (i < (int)_bs1)
            {
                ix++;
                ix &= _bs1;
                ix1++;
                ix1 &= _bs1;
                pos1 += incr1;
                pos1 &= _bs1;
                pos2 += incr2;
                pos2 &= _bs1;
            }
        }
    }
    // 2) Contracting (assuming _size < len, but it can also expand)
    incr1 = H1(KK(_val1) ^ _val2) & _bs1;
    incr2 = H2(_val1 + KK(_val2)) & _bs1;
    pos1 = H1(_val1) & _bs1;
    pos2 = H2(Atelopus::F2(_val2)) & _bs1;
    if ((incr1 == incr2) && (pos1 == pos2))
    {
        pos2++;
        pos2 &= _bs1;
    }
    int ik, pk;
    ik = H1(KK(Atelopus::F1(_val1)) + _val2) & _size1;
    pk = H1(Atelopus::F1(_val1) ^ KK(_val2)) & _size1;
    int max = (_bs2 < _size) ? _size : (_bs2+1);
    register bool over = false;
    int sz = _size - _bs;
    i=0; k=pk; ix=_bs2;
    for (ix1=0; ix1<max; ix1++)
    {
        temp1 = ar[pos1];
        _val1 ^= KK(temp1);
        _val1 += ar[i];
        _val2 ^= Atelopus::F2(_val1);
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
        if (sz > 0)
        {
            // Only for expansion
            ar[i] ^= KK(_val2);
            ar[ix] += Atelopus::F1(_val1);
        }
        (this->*Swap)(temp1 ^ KK(_val1), _val2);
        i++;
        i &= _bs1;
        if (i == 0)
        {
            sz -= _bs;
        }
        k += ik;
        k &= _size1;
        if (k == pk)
        {
            over = true;
        }
        ix++,
        ix &= _bs1;
        pos1+=incr1;
        pos1 &= _bs1;
        pos2+=incr2;
        pos2 &= _bs1;
    }
    // 3) Combining with the original
    incr1 = H1(KK(_val1)) & _bs1;
    incr2 = H2(KK(_val2)) & _size1;
    i = H1(Atelopus::F1(_val1)) & _bs1;
    k = H2(_val2) & _size1;
    max = (_bs < _size) ? _size : _bs;
    for (ix = 0; ix < max; ix++)
    {
        temp1 = data[i];
        _val1 += KK(temp1);
        _val2 ^= Atelopus::F1(_val1 + temp1);
        res[k] ^= _val2;
        i += incr1;
        i &= _bs1;
        k += incr2;
        k &= _size1;
    }
}

void Atelopus::Init(UINT* ar)
{
    register int pos1 = 0;
    register int pos2 = _bs >> 2;
    register int pos3 = _bs >> 1;
    register int pos4 = pos2 + pos3;
    register UINT val1 = _val1 ^ _bs;
    register UINT val2 = _val2 + Atelopus::F1((BYTE)_bs);
    BYTE temp[4];
    temp[0] = _kk1[16]; temp[1] = _kk1[80]; temp[2] = _kk1[144]; temp[3] = _kk1[208];
    register UINT val3;
    val3 = Bytes2Word(temp);
    val3 ^= Atelopus::F2((BYTE)_bs);
    temp[0] = _kk1[48]; temp[1] = _kk1[112]; temp[2] = _kk1[176]; temp[3] = _kk1[240];
    register UINT val4;
    val4 = Bytes2Word(temp);
    val4 += (BYTE)_bs;
    UINT *pui1, *pui2, *pui3, *pui4, temp1;
    // At least 2 rounds
    int len2 = _bs<<1;
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
        (this->*Swap)(temp1, Atelopus::G1(val1 + val2)^Atelopus::G1(val3 + val4));
        pos1++;
        pos1 &= _bs1;
        pos2++;
        pos2 &= _bs1;
        pos3++;
        pos3 &= _bs1;
        pos4++;
        pos4 &= _bs1;
    }
    _val1 = val1 ^ val2; _val1 += val3;
    _val2 = val2 + val3; _val2 ^= val4;
}

// Hashing a large array
void Atelopus::Hash(BYTE const* data, BYTE* res, ULONG const& length)
{
    // Work buffers
    UINT ar[BlockSize256];
    UINT ar1[BlockSize256];
    register int i;
    BYTE* pbytes;
    if (length <= _bs4)
    {
        // Just one block
        // Padding
        pbytes = (BYTE*)ar + (int)length;
        for (i = 0; i < (int)(_bs4-(int)length); i++, pbytes++)
        {
            *pbytes = _kk1[i];
        }
        memcpy(ar, data, (size_t)length);
        memcpy(ar1, ar, _bs4);
        // XOR with the length (no more than 2 bytes)
        int temp = (int)length;
        pbytes = (BYTE*)ar1;
        *pbytes ^= (BYTE)temp;
        temp >>= 8;
        *(++pbytes) ^= (BYTE)temp;
        Bytes2Words(ar, ar, _bs);
        Bytes2Words(ar1, ar1, _bs);
        Init(ar1);
        HashPrimitive(ar, (UINT*)res);
        XORIPE((UINT*)res, ar1, _size, _bs);
        // Result in bytes
        Words2Bytes((UINT*)res, res, _size);
        return;
    }
    ULONG pos = 0;
    ULONG lblocks = length / _bs4;
    register bool init = false;
    for (ULONG j=0; j<lblocks; j++, pos += _bs4)
    {
        if (!init)
        {
            memcpy(ar1, data, (size_t)_bs4);
            // XOR with the length
            ULONG temp = length;
            pbytes = (BYTE*)ar1;
            *pbytes ^= (BYTE)temp;
            for (i = 1; i < 8; i++)
            {
                temp >>= 8;
                *(++pbytes) ^= (BYTE)temp;
            }
            Bytes2Words(ar1, ar1, _bs);
            Init(ar1);
        }
        memcpy(ar, data+pos, (size_t)_bs4);
        Bytes2Words(ar, ar, _bs);
        HashPrimitive(ar, (UINT*)res);
        if (!init)
        {
            XORIPE((UINT*)res, ar1, _size, _bs);
            init = true;
        }
        else
        {
            XORIPE((UINT*)res, ar1, _size);
        }
        memcpy(ar1, res, (size_t)_size4);
    }
    int r = length & _bs41;
    if (r > 0)
    {
        // Possible last block
        // Padding
        pbytes = (BYTE*)ar + r;
        for (i = 0; i < (int)(_bs4-r); i++, pbytes++)
        {
            *pbytes = _kk1[i];
        }
        memcpy(ar, data, r);
        Bytes2Words(ar, ar, _bs);
        HashPrimitive(ar, (UINT*)res);
        XORIPE((UINT*)res, ar1, _size);
    }
    // Result in bytes
    Words2Bytes((UINT*)res, res, _size);
}

// Input File Length
ULONG Atelopus::FileLength(ifstream& in)
{
    // Check first the file's state
    if(!in.is_open() || in.bad())
    {
        throw runtime_error("FileLength(), file not opened or in bad state.");
    }
    // Get current position
    streampos currpos = in.tellg();
    // Move to the end
    in.seekg(0, ios::end);
    streampos endpos = in.tellg();
    // Go Back
    in.seekg(currpos, ios::beg);
    return (ULONG)endpos;
}

// Hashing a file
void Atelopus::HashFile(string const& filepath, BYTE* res)
{
    if (filepath.empty())
    {
        throw runtime_error("Atelopus::HashFile(), empty file path.");
    }
    try
    {
        ifstream fs(filepath.c_str());
        if(!fs)
        {
            throw runtime_error("Atelopus::HashFile(), cannot open file.");
        }
        ULONG length = FileLength(fs);
        // Work buffers
        UINT ar[BlockSize256];
        UINT ar1[BlockSize256];
        register int i;
        BYTE* pbytes;
        if (length <= _bs4)
        {
            // Just one block
            // Padding
            pbytes = (BYTE*)ar + (int)length;
            for (i = 0; i < (int)(_bs4-(int)length); i++, pbytes++)
            {
                *pbytes = _kk1[i];
            }
            fs.read((char*)ar, (streamsize)length);
            memcpy(ar1, ar, _bs4);
            // XOR with the length (no more than 2 bytes)
            int temp = (int)length;
            pbytes = (BYTE*)ar1;
            *pbytes ^= (BYTE)temp;
            temp >>= 8;
            *(++pbytes) ^= (BYTE)temp;
            Bytes2Words(ar, ar, _bs);
            Bytes2Words(ar1, ar1, _bs);
            Init(ar1);
            HashPrimitive(ar, (UINT*)res);
            XORIPE((UINT*)res, ar1, _size, _bs);
            // Result in bytes
            Words2Bytes((UINT*)res, res, _size);
            fs.close();
            return;
        }
        ULONG pos = 0;
        ULONG lblocks = length / _bs4;
        register bool init = false;
        for (ULONG j=0; j<lblocks; j++, pos+=_bs4)
        {
            if (!init)
            {
                fs.read((char*)ar1, (size_t)_bs4);
                // Reset file position
                fs.seekg(0, ios::beg);
                // XOR with the length
                ULONG temp = length;
                pbytes = (BYTE*)ar1;
                *pbytes ^= (BYTE)temp;
                for (i = 1; i < 8; i++)
                {
                    temp >>= 8;
                    *(++pbytes) ^= (BYTE)temp;
                }
                Bytes2Words(ar1, ar1, _bs);
                Init(ar1);
            }
            fs.read((char*)ar, (streamsize)_bs4);
            Bytes2Words(ar, ar, _bs);
            HashPrimitive(ar, (UINT*)res);
            if (!init)
            {
                XORIPE((UINT*)res, ar1, _size, _bs);
                init = true;
            }
            else
            {
                XORIPE((UINT*)res, ar1, _size);
            }
            memcpy(ar1, res, (size_t)_size4);
        }
        int r = length & _bs41;
        if (r > 0)
        {
            // Possible last block
            // Padding
            pbytes = (BYTE*)ar + r;
            for (i = 0; i < (int)(_bs4-r); i++, pbytes++)
            {
                *pbytes = _kk1[i];
            }
            fs.read((char*)ar, (streamsize)r);
            Bytes2Words(ar, ar, _bs);
            HashPrimitive(ar, (UINT*)res);
            XORIPE((UINT*)res, ar1, _size);
        }
        // Result in bytes
        Words2Bytes((UINT*)res, res, _size);
        fs.close();
    }
    catch (exception const& ex)
    {
        throw runtime_error("Atelopus::HashFile(), file read error: " + string(ex.what()));
    }
}

