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
// The OCELOT1 stream ciphering method method, Version 2.0.0 (30 September 2010)
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
// For C++ portability testing please use the Test Samples. The test code is given in readme.txt.
// Test Samples:
//
// 1)
// statesize=16, key="XXXXXXX"
// hexresult="F1018898 3A9FD7BA 0C462708 43474612 45474EBC 08BE4FCB 908DB206 FC55FFFE 09670415 C64E1947 70E3CE8C A56A9FBB E9C371E6 386883EA 6545A712 75283568 8DCA805A B56B0311 C37C287D DFF62B09 6DD2A4D0 953B857A DFA68A26 "...
// hexresult=..."ADA6AC7D CC43121D 7869F8F1 64749F2F 436866F3 DBBA98C0 064E2F3B 1BB2DBFF E17281A3 6E1843AA F67E74CD F38E6AA5 18858985 D2F3BD2D 030601DD 650E159E 84D00DFF 351CBE28 14D2086A F8CA1D98 C8E709AA 3006CBBB A50C7A5F "
//
// 2)
// statesize=16, key="YXXXXXX"
// hexresult="D824AE10 B563163F 397241B5 797A5BBC F6BF88B8 C50F03EC 5B13A52C E047DE28 22476357 D75FDC15 335CE1D6 59335D2E 56927318 99DBF457 14F3D97E 53BC436D 62E720CE B6FA197D 81A54614 6B33D5C7 4F7C0F43 A757411B 256C4942 768B887E 98CAB9F9 "...
//
// 3)
// statesize=16, key="\0\0\0\0"
// hexresult="FF30B446 4D95ED43 ADEE177C 1E29995A 439B68D4 86F02BB0 9896731C CE647511 F68E8EC5 B343251C B5DC8A32 4540E9BE 1EE3A382 CBECFFFB A7B6966D C89AC83C E153A3FF CC511D59 889BCA2F DE62FE7B CE9DEE1F B67C2C77 89278E62 "...
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

