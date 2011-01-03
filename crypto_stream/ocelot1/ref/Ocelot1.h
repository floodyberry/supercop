// Ocelot1.h
#ifndef __OCELOT1_H__
#define __OCELOT1_H__

#include "Counter.h"

#include <cstring>

using namespace std;

#define BYTE unsigned char

class Ocelot1
{
//****************************************************************************
//
// The OCELOT1 stream ciphering method method, Version 2.1.0 (09 December 2010)
// Copyright (C) 2009-2010, George Anescu, www.sc-gen.com
// All right reserved.
//
// This is the C++ implementation of a new stream ciphering method called OCELOT1. It is accepting any practical key size and can
// be set to any practical state size.
//
// COPYRIGHT PROTECTION: The OCELOT1 stream ciphering method is still under development and testing and for this reason the code is
// freely distributed only for TESTING AND RESEARCH PURPOSES. The author is reserving for himself the rights to MODIFY AND MAINTAIN the
// code, but any ideas about improving the code are welcomed and will be recognized if implemented.
//
// If you are interested in testing the code, in research collaborations for possible security holes in the method, or in any
// other information please contact the author at <george.anescu@sc-gen.com>.
//
// Updates for Version 2.0.0 (30 September 2010):
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
// hexresult="85815117 AC8FDE76 B322240B 5FD687F5 9CE2702B ED5D1777 3257698A 832B4BE7 A0811520 2E0D7F29 A675853B 563655E6 5063716D 05FBA749 3A37BD59 CB6C3415 754C64FE 5C77352F B3DC188B B4172E84 46709D74 671A8C0A A4DDB042 "...
// hexresult=..."FE797E42 095BCE1A 28616AFE 8AF1AAFF 904C0AEB CC2CA0B9 6604DC8E 1696CFB2 4A0D84AC E3344F80 B6EACB1B 5821BDA0 73BF9945 6F2D8C12 73A5A787 AD205816 D0B7B83C 82D3684B 53973504 BD2469AF 6B7B53F3 4B5A8CAF 56AFB44A "
//
// 2)
// statesize=16, key="YXXXXXX"
// hexresult="BB53781D 00E53372 C30DA673 13033AB2 0234D468 9A010A9B B1C0A0BE 0B40BF0C BF6584CA 2F26079E 5EA11379 2B259F47 56AEFD90 B7243AEF FBFC242A A3187B68 957062A2 0EFF2AC9 E23C2988 F95A7D9D 6E50DDBE B3F5E4BD B5767CE3 C8467B96 A4891FCA "...
//
// 3)
// statesize=16, key="\0\0\0\0"
// hexresult="93912BB7 3814C2D9 6B8D4CC4 CE160707 286C80FE AEA22044 021261BD 37A7310E 99CDD9E5 4780651C 5441AA6D DCCB8235 8B9B1184 7F489A0C 03AC5612 92849891 195078AE F0DBC3BD EE50179D 1804EC33 9D210FE0 17A81801 A0C8C1E7 "...
//
//****************************************************************************
public:
    //Sizes in bytes
    enum OCELOTSize
    {
        OCELOTSize16 = 16, OCELOTSize32 = 32, OCELOTSize64 = 64, OCELOTSize128 = 128,
        OCELOTSize256 = 256
    };

    //Constructors
    Ocelot1()
    {
        if (Ocelot1::IsBigEndian())
        {
            Swap = &Ocelot1::SwapBE;
            Bytes2Word = Ocelot1::Bytes2WordBE;
            Word2Bytes = Ocelot1::Word2BytesBE;
        }
        else
        {
            Swap = &Ocelot1::SwapLE;
            Bytes2Word = Ocelot1::Bytes2WordLE;
            Word2Bytes = Ocelot1::Word2BytesLE;
        }
    }

    Ocelot1(BYTE const* key, int keysize, OCELOTSize size4=OCELOTSize16)
    {
        if (Ocelot1::IsBigEndian())
        {
            Swap = &Ocelot1::SwapBE;
            Bytes2Word = Ocelot1::Bytes2WordBE;
            Word2Bytes = Ocelot1::Word2BytesBE;
        }
        else
        {
            Swap = &Ocelot1::SwapLE;
            Bytes2Word = Ocelot1::Bytes2WordLE;
            Word2Bytes = Ocelot1::Word2BytesLE;
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

    void (Ocelot1::*Swap)(UINT const& val1, UINT const& val2);
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

#endif // __OCELOT1_H__

