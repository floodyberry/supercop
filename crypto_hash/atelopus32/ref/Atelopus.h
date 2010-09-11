// Atelopus.h
#ifndef __ATELOPUS_H__
#define __ATELOPUS_H__

#include <stdexcept>
#include <cstring>
#include <string>
#include <fstream>

using namespace std;

#define BYTE unsigned char
#define UINT unsigned int

class Atelopus
{
//****************************************************************************
//
// The ATELOPUS hashing method, Version 2.0.0 (28 August 2010)
// Copyright (C) 2009-2010, George Anescu, www.sc-gen.com
// All right reserved.
//
// This is the C++ implementation of a new cryptographic hashing method called ATELOPUS,
// which can be considered an universal hashing method. It can work with dynamic sizes of
// the input data blocks (at word granularity) and is capable to generate hash outputs
// covering a practical domain of sizes (at word granularity).
//
// COPYRIGHT PROTECTION: The ATELOPUS hashing method is still under development and
// testing and for this reason the code is freely distributed only for TESTING AND
// RESEARCH PURPOSES. The author is reserving for himself the rights to MODIFY AND
// MAINTAIN the code, but any ideas about improving the code are welcomed and will be
// recognized if implemented.
//
// If you are interested in testing the code, in research collaborations for possible
// security holes in the method, or in any other information please contact the author
// at <george.anescu@sc-gen.com>.
//
// For C++ portability testing please use the Test Samples. The test code is given in readme.txt.
// Test Samples:
//
// hashsize=32, iter=3, max blocksize=128
//
// 1)
// data=""
// hexresult="51CA7440E9F7E6A1E77B32CD653C1131571D690D939ADF3185D1977DC91369B2"
//
// 2)
// data="AABB"
// hexresult="09A007AB91986399D047E55399D76C542A700712D3947FA2A21ED0CE8B28BE3E"
//
// 3)
// data="AAAABBBBAAAABBBB"
// hexresult="E940F40E8502154A20047DB7F924B6FE87ACC46ABDC65673C38C8B99AD4062A5"
//
// 4)
// data="AAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBB"
// hexresult="B60F0B3F3CD0033B07A1FEF9D22269CC6C277928A03B17C6C130055BE941C4BA"
//
// 5)
// data="YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
// hexresult="80ED1BE8212BE95921A32A659DB990E12C5FE593546038A9EDCA5D526806172D"
//
// 6)
// data="XYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
// hexresult="C4C05D1900083254358672292175E7945174E5100F29811E71706BC514068588"
//
// 7)
// data="YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
// hexresult="517F51D71165CEEF657DC90408F595F58C030AC9071EFE5A372FE18E1BD2982E"
//
// hashsize=64, iter=3, max blocksize=256
//
// 1)
// data=""
// hexresult="AC157DEAB310A3A6DF0D523877C4600FFF0F007E51EC30897E3AA9858F291569F3A67CAFCD9C563D1C1374C045867E0064AF01EDAA72314001F1E1865208BA8B"
//
// 2)
// data="AABB"
// hexresult="70329BCD6498ECB1EA1FC67DA0858E57330CF693E93AD1C6B94F026D9457C9965C9D2E9EE6E138D35993CEABA4345EAA33338D0D37AEFC89DD948C38FA597B05"
//
// 3)
// data="AAAABBBBAAAABBBB"
// hexresult="42BD9F90B17405CD764993EED3AF2C1BFDECFD5DAAC64A85A2CC65D71B5A075E6BCF0151CEA2193CCFBD81FF0BDF8E7F8976A1D47E15E9D0A15732F4EDAECFB6"
//
// 4)
// data="AAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBB"
// hexresult="36A8997FFC2AACBA9CAE792B0D4A480B4E9AC0F1DBA568EF433C95697D04A6B0A6CC475F566E30EA6D7541CEF1FF1C5880AD84AFF8EB851A685AB73D6442767D"
//
// 5)
// data="YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
// hexresult="835BF9E8F46EDC871B4B549F76091E2D6420545D34089807F28A7EE717E90E5DA0A44FB8168EF2A53B77B47969798DFC6C3290619F883AA58056D46DBCFD83D2"
//
// 6)
// data="XYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
// hexresult="F24E79788C3FFE72159F60E969BC81DE08A33BFFF2EE21807A76AAED44434DE1CFDE7FCE2C4BDF87BC9FC18F4D8C04773054039B8C52D259578330AAD2B03206"
//
// 7)
// data="YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
// hexresult="3A206A178B8E206BDF927B335D2BDF54A5E5845276AA13C46A67FAF9A5F8AD5E79DAD7F2CC27A464CDC072410D4D717EBB25428718B1528EE7A890461C91E4ED"
//
//****************************************************************************
public:
    //Block Sizes in bytes
    //BlockSize16   - variable between 9 and 16
    //BlockSize32   - variable between 17 and 32
    //BlockSize64   - variable between 33 and 64
    //BlockSize128  - variable between 65 and 128
    //BlockSize256  - variable between 129 and 256
    //BlockSize512  - variable between 257 and 512
    //BlockSize1024 - variable between 513 and 1024
    enum AtelopusBlockSize
    {
        BlockSize16 = 16, BlockSize32 = 32, BlockSize64 = 64, BlockSize128 = 128,
        BlockSize256 = 256, BlockSize512 = 512, BlockSize1024 = 1024
    };

    //Constructors
    Atelopus(int size4, UINT iter, AtelopusBlockSize bs4=BlockSize16) : _iter(iter),
        _size4(size4), _bs4(bs4)
    {
        _bs = _bs4 >> 2; //block size in words
        _size = _size4 >> 2; //block size in bytes
        if (Atelopus::IsBigEndian())
        {
            Swap = &Atelopus::SwapBE;
            Bytes2Word = Atelopus::Bytes2WordBE;
            Word2Bytes = Atelopus::Word2BytesBE;
        }
        else
        {
            Swap = &Atelopus::SwapLE;
            Bytes2Word = Atelopus::Bytes2WordLE;
            Word2Bytes = Atelopus::Word2BytesLE;
        }
        Reset();
    }

    void Reset()
    {
        memcpy(_kk1, _skk1, 256); 
        BYTE temp[4];
        temp[0] = _kk1[0];
        temp[1] = _kk1[64];
        temp[2] = _kk1[128];
        temp[3] = _kk1[192];
        _val1 = Bytes2Word(temp);
        temp[0] = _kk1[32];
        temp[1] = _kk1[96];
        temp[2] = _kk1[160];
        temp[3] = _kk1[224];
        _val2 = Bytes2Word(temp);
    }

    //Hash Primitive
    void HashPrimitive(UINT const* data, UINT* res, int const& len);

    //Dynamic block size hashing
    void Hash(BYTE const* data, BYTE* res, unsigned long long const& length);

    //Dynamic block size hashing for a file
    void HashFile(string const& filepath, BYTE* res);
		
private:
    UINT KK(UINT const& val)
    {
        return _kk1[(BYTE)val] | (_kk1[(BYTE)(val>>8)]<<8) | (_kk1[(BYTE)(val>>16)]<<16) |
            (_kk1[(BYTE)(val>>24)]<<24);
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
        temp = _kk1[v1]; _kk1[v1] = _kk1[v2]; _kk1[v2] = temp;
        //2
        v1 = *(--p1); v2 = *(--p2);
        if (v1 == v2) v2++;
        temp = _kk1[v1]; _kk1[v1] = _kk1[v2]; _kk1[v2] = temp;
        //3
        v1 = *(--p1); v2 = *(--p2);
        if (v1 == v2) v2++;
        temp = _kk1[v1]; _kk1[v1] = _kk1[v2]; _kk1[v2] = temp;
        //4
        v1 = *(--p1); v2 = *(--p2);
        if (v1 == v2) v2++;
        temp = _kk1[v1]; _kk1[v1] = _kk1[v2]; _kk1[v2] = temp;
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
        temp = _kk1[v1]; _kk1[v1] = _kk1[v2]; _kk1[v2] = temp;
        //2
        v1 = *(++p1); v2 = *(++p2);
        if (v1 == v2) v2++;
        temp = _kk1[v1]; _kk1[v1] = _kk1[v2]; _kk1[v2] = temp;
        //3
        v1 = *(++p1); v2 = *(++p2);
        if (v1 == v2) v2++;
        temp = _kk1[v1]; _kk1[v1] = _kk1[v2]; _kk1[v2] = temp;
        //4
        v1 = *(++p1); v2 = *(++p2);
        if (v1 == v2) v2++;
        temp = _kk1[v1]; _kk1[v1] = _kk1[v2]; _kk1[v2] = temp;
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

    static BYTE H1(UINT const& word)
    {
        return (word ^ (word>>24)) + ((word>>16) ^ (word>>8));
    }

    static BYTE H2(UINT const& word)
    {
        return (word + (word>>16)) ^ ((word>>8) + (word>>24));
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

    //Input File Length
    static unsigned long long FileLength(ifstream& in);

    void Init(UINT* ar, int const& len);

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

    //In place XOR extended
    void XORIPE(UINT* ar1, UINT const* ar2, int const& len)
    {
        for (register int i=0; i<len; i++)
        {
            ar1[i] ^= KK(ar2[i]);
        }
    }

    //In place XOR extended
    void XORIPE(UINT* ar1, UINT const* ar2, int const& len1, int const& len2)
    {
        int max = (len1 > len2) ? len1 : len2;
        for (register int i=0,j=0,k=0; i<max; i++,j++,k++)
        {
            if (j == len1) j = 0;
            if (k == len2) k = 0;
            ar1[j] ^= KK(ar2[k]);
        }
    }

    void (Atelopus::*Swap)(UINT const& val1, UINT const& val2);
    UINT (*Bytes2Word)(BYTE const* bytes);
    void (*Word2Bytes)(UINT word, BYTE* bytes);

    const static BYTE _skk1[256];
    const static short _sarrprimes[256];
    UINT _iter; //hash primitive rounds
    UINT _size; //digest size in words
    UINT _size4; //digest size in bytes
    UINT _bs; //block size in words
    UINT _bs4; //block size in bytes
    UINT _val1, _val2;
    BYTE _kk1[256];	
};

#endif // __ATELOPUS_H__

