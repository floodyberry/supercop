
// Ocelot1.cpp
#include "Ocelot1.h"

//****************************************************************************
//
// The OCELOT1 stream ciphering method, Version 2.1.0 (09 December 2010)
// Copyright (C) 2009-2010, George Anescu, www.sc-gen.com
// All right reserved.
//
//****************************************************************************

const BYTE Ocelot1::_sss[256] = {
    246, 79, 28, 40, 39, 27, 4, 148, 153, 149, 22, 75, 31, 38,
    222, 233, 110, 147, 102, 189, 144, 143, 11, 215, 249, 70,
    112, 207, 195, 192, 35, 124, 133, 66, 127, 188, 62, 104, 180,
    211, 19, 213, 68, 128, 82, 6, 203, 95, 156, 204, 119, 239,
    220, 43, 247, 221, 109, 238, 7, 118, 9, 15, 163, 101, 52, 94,
    64, 0, 197, 138, 85, 235, 176, 65, 25, 45, 24, 241, 21, 2,
    51, 255, 125, 140, 10, 13, 61, 228, 33, 14, 161, 115, 202,
    114, 191, 205, 83, 30, 67, 54, 186, 5, 169, 226, 165, 132, 69,
    23, 200, 20, 146, 183, 193, 48, 253, 56, 72, 126, 59, 209, 16,
    103, 81, 113, 60, 47, 73, 229, 208, 80, 106, 34, 50, 243,
    3, 178, 107, 108, 242, 100, 162, 217, 181, 129, 87, 250, 219,
    150, 167, 78, 29, 1, 168, 199, 12, 201, 155, 231, 91, 46,
    177, 53, 214, 92, 121, 136, 71, 17, 42, 36, 49, 158, 175, 254,
    137, 170, 173, 26, 252, 120, 88, 174, 139, 122, 58, 18,
    141, 184, 84, 37, 166, 230, 32, 160, 152, 117, 159, 240, 164,
    44, 245, 99, 232, 74, 135, 223, 55, 96, 63, 131, 134, 182,
    218, 130, 77, 142, 111, 244, 187, 248, 76, 57, 157, 97, 145,
    172, 171, 86, 41, 236, 151, 206, 198, 194, 227, 105, 8, 116,
    225, 210, 93, 212, 89, 154, 234, 237, 123, 196, 251, 224, 90,
    216, 190, 185, 98,179,
};

void Ocelot1::Initialize(OCELOTSize size4, BYTE const* key, int keysize)
{
    _bcnt = 0;
    _size4 = size4; //size in bytes
    _size = _size4 >> 2; //size in words
    _size1 = _size - 1;
    _ssix = 0;
    //Initialization, 256 cycles
    memcpy(_ss, _sss, 256);
    UINT kwords[64];
    int keysizew = keysize >> 2;
    if (keysize & 3)
    {
        kwords[keysizew] = 0;
        keysizew++;
    }
    memcpy(kwords, key, keysize); 
    Bytes2Words(kwords, kwords, keysizew);
    Expansion(kwords, keysizew, _data0, _size+1, 3, false);
    UINT words[128];
    Expansion(kwords, keysizew, words, _size << 1, 3, true);	
    _cnt.Initialize(words, _size);
    memcpy(_data, _data0, _size4);
    _val = _data0[_size];
    BYTE temp[4], by;
    UINT rnd, temp1;
    _incr = (_ss[_val & 0xFF] & _size1) | 1;
    _ix = -1;
    _ix1 = _incr;
    while (_ssix < 256)
    {
        _ix++;
        if (_ix == _size)
        {
            _ix = 0;
            _cnt.Increment();
            _ix1 += _incr;
            _ix1 &= _size1;
            _incr = (_ss[_val & 0xFF] & _size1) | 1;
        }
        _ix1 += _incr;
        _ix1 &= _size1;
        by = _data[_ix];
        _val ^= Ocelot1::F1(by);
        _val += _cnt[_ix];
        _data[_ix1] ^= SS(_val);
        rnd = SS((_cnt[_ix1] + by) ^ _val);
        temp[0] = (BYTE)_ssix++;
        temp[1] = (BYTE)_ssix++;
        temp[2] = (BYTE)_ssix++;
        temp[3] = (BYTE)_ssix++;
        temp1 = Bytes2Word(temp);
        (this->*Swap)(temp1, rnd);
    }
    //Create initial state
    memcpy(_ss0, _ss, 256);
    memcpy(_data0, _data, _size4);
    _data0[_size] = _val;
    _cnt.SaveState();
    _ix0 = _ix;
    _ix1_0 = _ix1;
    _incr0 = _incr;
}

//Initializaation from precalculated data (_size + 1) + 2*_size
void Ocelot1::Initialize(OCELOTSize size4, UINT const* data, BYTE const* ss)
{
    _bcnt = 0;
    _size4 = size4; //size in bytes
    _size = _size4 >> 2; //size in words
    _size1 = _size - 1;
    memcpy(_ss, ss, 256);
    memcpy(_data0, data, _size4+4);
    Bytes2Words(_data0, _data0, _size+1);
    memcpy(_data, _data0, _size4);
    _val = _data0[_size];
    UINT words[128];
    memcpy(words, data+_size+1, _size4 << 1);
    Bytes2Words(words, words, _size << 1);
    _cnt.Initialize(words, _size);
    _incr = (_ss[_val & 0xFF] & _size1) | 1;
    _ix = -1;
    _ix1 = _incr;
    //Create initial state
    memcpy(_ss0, _ss, 256);
    _cnt.SaveState();
    _ix0 = _ix;
    _ix1_0 = _ix1;
    _incr0 = _incr;
}

void Ocelot1::Expansion(UINT const* data, int size, UINT* res, int dim, short iter, bool cpl)
{
    UINT words[64];
    memcpy(words, data, size << 2);
    int lend2 = size >> 1;
    //Combining with dim
    if (cpl)
    {
        words[0] += SS(dim);
    }
    else
    {
        words[0] ^= SS(dim);
    }
    //Propagate differences
    BYTE temp[4];
    temp[0] = _ss[0]; temp[1] = _ss[64];
    temp[2] = _ss[128]; temp[3] = _ss[192];
    register UINT val1 = Bytes2Word(temp);
    temp[0] = _ss[32]; temp[1] = _ss[96];
    temp[2] = _ss[160]; temp[3] = _ss[224];
    register UINT val2 = Bytes2Word(temp);
    UINT temp1, temp2;
    register int k, i, ix = lend2;
    for (k = 0; k < iter; k++)
    {
        for (i = 0; i < size; i++, ix++)
        {
            if (ix == size) ix = 0;
            temp1 = words[i];
            temp2 = words[ix];
            if (cpl)
            {
                val1 += SS(temp1);
                val1 ^= temp2;
                val2 += Ocelot1::F1(val1);
                val2 ^= SS(temp2);
                val2 += temp1;
                words[i] = Ocelot1::G1(temp1) + SS(val1);
                words[ix] = Ocelot1::F2(temp2) ^ SS(val2);
            }
            else
            {
                val1 ^= SS(temp1);
                val1 += temp2;
                val2 ^= Ocelot1::F1(val1);
                val2 += SS(temp2);
                val2 ^= temp1;
                words[i] = Ocelot1::G1(temp1) ^ SS(val1);
                words[ix] = Ocelot1::F2(temp2) + SS(val2);
            }
            temp[0] = (BYTE)_ssix; temp[1] = (BYTE)(_ssix+1);
            temp[2] = (BYTE)(_ssix+2); temp[3] = (BYTE)(_ssix+3);
            temp1 = Bytes2Word(temp);
            (this->*Swap)(temp1, val2);
            _ssix+=4;
        }
    }
    //Expanding
    i = 0;
    ix = lend2;
    int max = dim - lend2;
    int j = 0;
    for (k = 0; k < dim; k++, i++, ix++)
    {
        if (i == size) i = 0;
        if (ix == size) ix = 0;
        temp1 = words[i];
        temp2 = words[ix];
        if (cpl)
        {
            val1 ^= SS(temp1);
            val1 += temp2;
            val2 ^= Ocelot1::G1(val1);
            res[k] = Ocelot1::F2(val2) + SS(data[j]);
            val2 += SS(temp2);
            val2 ^= temp1;
            if (k < max)
            {
                words[i] = Ocelot1::G2(temp1) ^ SS(val1);
                words[ix] = Ocelot1::F1(temp2) + SS(val2);
            }
        }
        else
        {
            val1 += SS(temp1);
            val1 ^= temp2;
            val2 += Ocelot1::G1(val1);
            res[k] = Ocelot1::F2(val2) ^ SS(data[j]);
            val2 ^= SS(temp2);
            val2 += temp1;
            if (k < max)
            {
                words[i] = Ocelot1::G2(temp1) + SS(val1);
                words[ix] = Ocelot1::F1(temp2) ^ SS(val2);
            }
        }
        temp[0] = (BYTE)_ssix; temp[1] = (BYTE)(_ssix+1);
        temp[2] = (BYTE)(_ssix+2); temp[3] = (BYTE)(_ssix+3);
        temp1 = Bytes2Word(temp);
        (this->*Swap)(temp1, val2);
        _ssix+=4;
        j++;
        if (j >= size)
        {
            j = 0;
        }
    }
}

void Ocelot1::GetNextWord(UINT& rnd)
{
    static UINT temp;
    _ix++;
    if (_ix == _size)
    {
        _ix = 0;
        _cnt.Increment();
        _ix1 += _incr;
        _ix1 &= _size1;
        _incr = (_ss[_val & 0xFF] & _size1) | 1;
    }
    _ix1 += _incr;
    _ix1 &= _size1;
    temp = _data[_ix];
    _val ^= Ocelot1::F1(temp);
    _val += _cnt[_ix];
    _data[_ix1] ^= SS(_val);
    rnd = SS((_cnt[_ix1] + temp) ^ _val);
    (this->*Swap)(_val, temp);
}

void Ocelot1::GetNextByte(BYTE& rnd)
{
    static UINT word = 0;
    switch (_bcnt)
    {
        case 0:
            GetNextWord(word);
            rnd = (BYTE)word;
            break;

        case 1:
            rnd = (BYTE)(word >> 8);
            break;

        case 2:
            rnd = (BYTE)(word >> 16);
            break;

        case 3:
            rnd = (BYTE)(word >> 24);
            break;
    }
    _bcnt = (_bcnt + 1) & 3;
}

