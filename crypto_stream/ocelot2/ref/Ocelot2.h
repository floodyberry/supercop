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
// The OCELOT2 stream ciphering method, Version 2.0.0 (30 September 2010)
// Copyright (C) 2009-2010, George Anescu, www.scgen.com
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
// For C++ portability testing please use the Test Samples. The test code is given in readme.txt.
// Test Samples:
//
// 1)
// statesize=16, key="XXXXXXX"
// hexresult="CE3378AA 48D770E5 6DA1BB12 BA9F3736 B2B8FE27 A46FB15A F51E0277 8BEE79B6 C287C32A 63DAC263 A532C0D5 0A1D8CE6 1A49BDC5 4B7EDD0D 13473499 5658B299 A6312610 0AC959C8 8D1E87EF 547A5669 CB215B63 7F7C03BF B072F7B9 "...
// hexresult=..."2BCF0C49 460FE213 42AC47F3 2D32278C ECFB6312 58D397BA BD49FAF0 513DD14F 2353DC89 BB27BAC0 4E775E66 06180667 E34FBCCF 9C8B29B9 9476DE17 AE08D5A6 7B5F189B 1EFF1CDB DE1313E2 CDFEC7E1 24FBA7C8 102BD293 FBC69792 "
//
// 2)
// statesize=16, key="YXXXXXX"
// hexresult="0AD072BD 2E78D792 F1D792AF 0562D51F ABDE2E16 97FDBE7D 07782041 DF397F1F DE918672 F0B7D58F 9E366284 C2D616E9 6CA04587 19FE8009 2D6B011A A72A4B6F D11E3211 5571DE7C 2A4FBA9E A60B7FFA 6595644A 8D45C422 38EAE54A 583E8778 425D66B4 "...
//
// 3)
// statesize=16, key="\0\0\0\0"
// hexresult="1309961D 00C1023A 0689822E 89C3AF1B F1FE3048 9BD381FE 56EA59B2 22E13A58 72C073F8 A53015EB 072009C5 8D7F74FF B0F1D38B E37B213F CB5BDFF7 F2B2D2E5 6989B70A B87868D8 2F3E3B24 C27F4A8E DA67AB8C B1B70A2E 645FCF37 "...
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
        if (v1 == v2) v2++;
        temp = _ss[v1]; _ss[v1] = _ss[v2]; _ss[v2] = temp;
        //2
        v1 = *(--p1); v2 = *(--p2);
        if (v1 == v2) v2++;
        temp = _ss[v1]; _ss[v1] = _ss[v2]; _ss[v2] = temp;
        //3
        v1 = *(--p1); v2 = *(--p2);
        if (v1 == v2) v2++;
        temp = _ss[v1]; _ss[v1] = _ss[v2]; _ss[v2] = temp;
        //4
        v1 = *(--p1); v2 = *(--p2);
        if (v1 == v2) v2++;
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
        if (v1 == v2) v2++;
        temp = _ss[v1]; _ss[v1] = _ss[v2]; _ss[v2] = temp;
        //2
        v1 = *(++p1); v2 = *(++p2);
        if (v1 == v2) v2++;
        temp = _ss[v1]; _ss[v1] = _ss[v2]; _ss[v2] = temp;
        //3
        v1 = *(++p1); v2 = *(++p2);
        if (v1 == v2) v2++;
        temp = _ss[v1]; _ss[v1] = _ss[v2]; _ss[v2] = temp;
        //4
        v1 = *(++p1); v2 = *(++p2);
        if (v1 == v2) v2++;
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

