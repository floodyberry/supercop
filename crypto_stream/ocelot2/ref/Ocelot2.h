// Ocelot2.h
#ifndef __OCELOT2_H__
#define __OCELOT2_H__

#include "Counter.h"

#include <cstring>

using namespace std;

#define BYTE unsigned char

class Ocelot2
{
//****************************************************************************
//
// The OCELOT2 stream ciphering method, Version 2.1.0 (09 December 2010)
// Copyright (C) 2009-2010, George Anescu, www.sc-gen.com
// All right reserved.
//
// This is the C++ implementation of a new stream ciphering method called OCELOT2. It is accepting any practical key size and can
// be set to any practical state size.
//
// COPYRIGHT PROTECTION: The OCELOT2 stream ciphering method is still under development and testing and for this reason the code is
// freely distributed only for TESTING AND RESEARCH PURPOSES. The author is reserving for himself the rights to MODIFY AND MAINTAIN the
// code, but any ideas about improving the code are welcomed and will be recognized if implemented.
//
// If you are interested in testing the code, in research collaborations for possible security holes in the method, or in any
// other information please contact the author at <george.anescu@scgen.com>.
//
// Updates for Version 2.0.0 (31 July 2010):
// - Adaptation from arrays of bytes to arays of words for increased performance
//
// Updates for Version 2.1.0 (09 December 2010):
// - Changes for efficiency and security improvements
//
// For C++ portability testing please use the Test Samples. The test code is given in readme.txt.
// Test Samples:
//
// 1)
// statesize=16, key="XXXXXXX"
// hexresult="0B75CA30 81F74147 D0A063FD C267AC5E 5F55E524 B1776B36 1B4A95FC AD5BBD67 3D311A37 F52B4FFA 0DF369EE 606BF010 02CD6F5E EC2EAEF3 C1755375 CD6ABE42 F5E479E5 9A0DC29D F4157CB0 2BFC2B05 45722A93 588D2967 3C2F49C5 "...
// hexresult=..."CF060F7B DA6EAA68 64318269 2DE23173 7A6EFFF9 E30D8C0E F9318214 63D2AF90 3646C1CA AF1B793D 50BA7B45 3BB0E500 62AB5AC2 D9BC91B7 69B11BF6 F8E9C0AC CC5BCCC7 EB4F7C4E 0429EC98 F53DD3EB 981745B2 F324B17F 13C36ADC "
//
// 2)
// statesize=16, key="YXXXXXX"
// hexresult="CCF0DCEC 508D2868 124AC94E 7980FB6F 04693241 82F690DF 8592046D 1DFCF3FC 6028E415 2E130B06 9B22DA6D 6D002D96 441739D8 E8F7970E 111D3D83 AB306AF8 893CACBE 7C54D9E0 4CBDBC80 2B0B2B4D F1FC1C81 295ACFF6 8677A96E 860A0C90 AFA6627C "...
//
// 3)
// statesize=16, key="\0\0\0\0"
// hexresult="65E58C8D 4C08FADB A5E313B1 183A2393 BB192EAF DDE83455 0964B3F1 EBE6DFA9 5C5EBF7F B35732F5 8005FB10 4A11FEB2 4530AFB5 A77BF14E 9B8E3767 8F2FC326 3DFC0D0B C2A37726 55ACE2D9 24686C66 9C650713 E94E1D68 E41102AD "...
//
//****************************************************************************
public:
    //Sizes
    enum OCELOTSize
    {
        OCELOTSize16 = 16, OCELOTSize32 = 32, OCELOTSize64 = 64, OCELOTSize128 = 128,
        OCELOTSize256 = 256
    };

    //Constructors
    Ocelot2()
    {
        if (Ocelot2::IsBigEndian())
        {
            Swap = &Ocelot2::SwapBE;
            Bytes2Word = Ocelot2::Bytes2WordBE;
            Word2Bytes = Ocelot2::Word2BytesBE;
        }
        else
        {
            Swap = &Ocelot2::SwapLE;
            Bytes2Word = Ocelot2::Bytes2WordLE;
            Word2Bytes = Ocelot2::Word2BytesLE;
        }
    }

    Ocelot2(BYTE const* key, int keysize, OCELOTSize size4=OCELOTSize16)
    {
        if (Ocelot2::IsBigEndian())
        {
            Swap = &Ocelot2::SwapBE;
            Bytes2Word = Ocelot2::Bytes2WordBE;
            Word2Bytes = Ocelot2::Word2BytesBE;
        }
        else
        {
            Swap = &Ocelot2::SwapLE;
            Bytes2Word = Ocelot2::Bytes2WordLE;
            Word2Bytes = Ocelot2::Word2BytesLE;
        }
        Initialize(size4, key, keysize);
    }
	
    void Initialize(OCELOTSize size4, BYTE const* key, int keysize);

    void Initialize(OCELOTSize size4, UINT const* data, BYTE const* ss);

    void Reset()
    {
        _bcnt = 0;
        memcpy(_data, _data0, _size4);
        _val = _data0[_size];
        memcpy(_ss, _ss0, 256);            
        _cnt.Reset();
        _ix = _ix0;
        _ix1 = _ix1_0;
        _incr = _incr0;
    }

    void GetNextWord(UINT& rnd);

    void GetNextByte(BYTE& rnd);

    void GetWords(UINT* words, int n)
    {
        for (register int i = 0; i < n; i++)
        {
            GetNextWord(words[i]);
        }
    }

    void GetBytes(BYTE* bytes, int n)
    {
        for (register int i = 0; i < n; i++)
        {
            GetNextByte(bytes[i]);
        }
    }

private:
    void Expansion(UINT const* data, int size, UINT* res, int dim, short iter, bool cpl);

    UINT SS(UINT const& val)
    {
        return _ss[(BYTE)val] | _ss[(BYTE)(val>>8)]<<8 | _ss[(BYTE)(val>>16)]<<16 |
               _ss[(BYTE)(val>>24)]<<24;
    }

    void SwapLE(UINT const& val1, UINT const& val2)
    {
        register BYTE *p1, *p2;
        register BYTE temp, v1, v2;
        p1 = (BYTE*)(&val1) + 3;
        p2 = (BYTE*)(&val2) + 3;
        //1
        v1 = *p1; v2 = *p2;
        temp = _ss[v1]; _ss[v1] = _ss[v2]; _ss[v2] = temp;
        //2
        v1 = *(--p1); v2 = *(--p2);
        temp = _ss[v1]; _ss[v1] = _ss[v2]; _ss[v2] = temp;
        //3
        v1 = *(--p1); v2 = *(--p2);
        temp = _ss[v1]; _ss[v1] = _ss[v2]; _ss[v2] = temp;
        //4
        v1 = *(--p1); v2 = *(--p2);
        temp = _ss[v1]; _ss[v1] = _ss[v2]; _ss[v2] = temp;
    }

    void SwapBE(UINT const& val1, UINT const& val2)
    {
        register BYTE *p1, *p2;
        register BYTE temp, v1, v2;
        p1 = (BYTE*)&val1;
        p2 = (BYTE*)&val2;
        //1
        v1 = *p1; v2 = *p2;
        temp = _ss[v1]; _ss[v1] = _ss[v2]; _ss[v2] = temp;
        //2
        v1 = *(++p1); v2 = *(++p2);
        temp = _ss[v1]; _ss[v1] = _ss[v2]; _ss[v2] = temp;
        //3
        v1 = *(++p1); v2 = *(++p2);
        temp = _ss[v1]; _ss[v1] = _ss[v2]; _ss[v2] = temp;
        //4
        v1 = *(++p1); v2 = *(++p2);
        temp = _ss[v1]; _ss[v1] = _ss[v2]; _ss[v2] = temp;
    }

    static bool IsBigEndian()
    { 
        static UINT ui = 1; 
        //Executed only at first call
        static bool result(reinterpret_cast<BYTE*>(&ui)[0] == 0); 
        return result; 
    }

    static UINT Bytes2WordLE(BYTE const* bytes)
    {
        return (UINT)(*(bytes+3)) | (UINT)(*(bytes+2)<<8) |
               (UINT)(*(bytes+1)<<16) | (UINT)(*bytes<<24);
    }

    static UINT Bytes2WordBE(BYTE const* bytes)
    {
        return *(UINT*)bytes;
    }

    static void Word2BytesLE(UINT word, BYTE* bytes)
    {
        bytes += 3;
        *bytes = (BYTE)word;
        *(--bytes) = (BYTE)(word>>8);
        *(--bytes) = (BYTE)(word>>16);
        *(--bytes) = (BYTE)(word>>24);
    }

    static void Word2BytesBE(UINT word, BYTE* bytes)
    {
        *bytes = (BYTE)word;
        *(++bytes) = (BYTE)(word>>8);
        *(++bytes) = (BYTE)(word>>16);
        *(++bytes) = (BYTE)(word>>24);
    }

    //F1 function
    static UINT F1(UINT const& val)
    {
        return (val & 0x55AA55AA) | (~val & 0xAA55AA55);
    }

    //F2 function
    static UINT F2(UINT const& val)
    {
        return (val & 0xAA55AA55) | (~val & 0x55AA55AA);
    }

    //G1 function - shift left rotating
    static UINT G1(UINT const& val)
    {
        //take last 5 bits, shift left 5 positions and make last 5 bits first
        return (val << 5) | ((val & 0xF8000000) >> 27);
    }

    //G2 function - shift right rotating
    static UINT G2(UINT const& val)
    {
        //take first 5 bits, shift right 5 positions and make first 5 bits last
        return (val >> 5) | ((val & 0x000001F) << 27);
    }

    void Bytes2Words(UINT* ar1, UINT* ar2, int const& len)
    {
        for(register int i=0; i<len; i++)
        {
            ar2[i] = Bytes2Word((BYTE*)&ar1[i]);
        }
    }

    void Words2Bytes(UINT* ar1, BYTE* ar2, int const& len)
    {
        BYTE* pbytes = ar2;
        for(register int i=0; i<len; i++,pbytes+=4)
        {
            Word2Bytes(ar1[i], pbytes);
        }
    }

    void (Ocelot2::*Swap)(UINT const& val1, UINT const& val2);
    UINT (*Bytes2Word)(BYTE const* bytes);
    void (*Word2Bytes)(UINT word, BYTE* bytes);

    const static BYTE _sss[256];
    Counter _cnt;
    UINT _data0[65];
    UINT _data[64];
    BYTE _ss0[256];
    BYTE _ss[256];
    UINT _val;
    UINT _bcnt;
    int _ssix;
    int _ix;
    int _ix1;
    int _incr;
    int _ix0;
    int _ix1_0;
    int _incr0;
    int _size4; //size in bytes
    int _size; //size in words
    int _size1;
};

#endif // __OCELOT2_H__

