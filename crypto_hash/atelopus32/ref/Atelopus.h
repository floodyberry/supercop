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
#define ULONG unsigned long long

class Atelopus
{
//****************************************************************************
//
// The ATELOPUS hashing method, Version 2.1.0 (09 December 2010)
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
// Updates for Version 2.1.0 (09 December 2010):
// - The block size is fixed during the hashing and a power of 2.
// - The digest size is also restricted to powers of 2.
// - There is a padding involved for the last block. The last block is filled to the block size with the
//   consecutive elements of the permutation array _kk1. If the padding size is greater than 256 bytes,
//   the index in the permutation array _kk1 is reset to 0 each time it attains 256.
// - All the division modulo operations were eliminated, since they were considered too expensive from the
//   efficiency perspective. The two indexes that were determined in a pseudo-random manner based on the array
//   of prime numbers _sarrprimes[256], as it was explained in 2.7.1, are now still determined in a pseudo-random
//   manner as odd numbers, since all odd numbers less than the data block length posses the full coverage
//   property for data block lengths which are powers of 2.
//
// If you are interested in testing the code, in research collaborations for possible
// security holes in the method, or in any other information please contact the author
// at <george.anescu@sc-gen.com>.
//
// For C++ portability testing please use the Test Samples. The test code is given in readme.txt.
// Test Samples:
//
// hashsize=32, iter=2, blocksize=128
//
// 1)
// data=""
// hexresult="2E4776EE7B35B93732D0864E759B3DD5B65ED8801335100218CED7F6B77F751B"
//
// 2)
// data="AABB"
// hexresult="4E73D73D330BA15B3E1A074C4CB4ED1E7D10EB7AA88B6BF731C23501E8322462"
//
// 3)
// data="AAAABBBBAAAABBBB"
// hexresult="0A3AAA673CEF797B682A406D9803BD28B062A49173BC7691EFB8CD51E1DCDE88"
//
// 4)
// data="AAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBB"
// hexresult="F908A2A52F10F7A505181C9E372B25908274BCED1A96841351C0A3C71A959DBA"
//
// 5)
// data="YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
// hexresult="9A474D9C7C1C88A50E8E5E95B3AE9A6854D3F593F25C87877FDBF7A08DEEEC5B"
//
// 6)
// data="XYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
// hexresult="D70A5568606EA12A683CAD64C28576FBAFA78B8E265B5EB8F63F19F1E6FBBB8B"
//
// 7)
// data="YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
// hexresult="C03B2392B00D6A46FF5955FF272E2C4A012A793EFDE54C53118C047933E0AD49"
//
// hashsize=64, iter=2, blocksize=256
//
// 1)
// data=""
// hexresult="2A88E18E908DB0901D3704875D55F9C9FD2EA64871453A55F4FD68B9EC272A04BA87D1E594610C0FD9875593A322BF773EEBEBAA94581BDD6E886A773F134CEF"
//
// 2)
// data="AABB"
// hexresult="C52898B8455E479D1C3EC25577C70A5C320E03C91C795D170AF23C2E093E9B75FC328745C6AE5F09E2C8AA2B9FDCA28C15F90840C0F676A393B5067F1B11784A"
//
// 3)
// data="AAAABBBBAAAABBBB"
// hexresult="4E1BE6709B15387CEC69436BA6001CD725D5621BB1B51D8E35AC9EFE7EE9D4D908D58DCCA2AEF750FB278A2D92BA24D77ED5FC9CEDD6E036D769F45BB47B1268"
//
// 4)
// data="AAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBB"
// hexresult="E16547026C567EEC8B0FBCECD9FE7DAEFF6232154EFDE1D6D378744F3338D6FB081462A700EC17DC0D16DC35FC5464EFC9FB72A9188B6D1D723C3CD31BEB7756"
//
// 5)
// data="YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
// hexresult="97261287740E02918982BFDEFAF6C7EC3513C25D5620543934A4F1789DCD9C6BE433642D97E40A7E098D5EB0E3F5FE25C5583AD13895EE27F05EB1BDD84DC513"
//
// 6)
// data="XYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
// hexresult="6C2D56F01A62537B84F1C860F7EAE5681E43C0E46889C64DA677CF7E1213D7F4BE03AE87D4AA4B167259E05715B398C7255EC5831E162CE1835BF1076E4C25BF"
//
// 7)
// data="YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
// hexresult="426E86EEC5D6D896EAA64774EA6C7FCBD90204A59A5B69430F39771AF8FC75F5DFB807F8BD57AC8B519587A54E394DD703B24B9179BF35E928F47CEC74F9405C"
//
//****************************************************************************
public:
    // Block Sizes in bytes
    enum AtelopusBlockSize
    {
        BlockSize16 = 16, BlockSize32 = 32, BlockSize64 = 64, BlockSize128 = 128,
        BlockSize256 = 256, BlockSize512 = 512, BlockSize1024 = 1024,
    };

    // Digest Sizes in bytes
    enum AtelopusDigestSize
    {
        DigestSize8 = 8, DigestSize16 = 16, DigestSize32 = 32, DigestSize64 = 64,
        DigestSize128 = 128, DigestSize256 = 256, DigestSize512 = 512,
    };

    // Constructors
    Atelopus(UINT iter, AtelopusDigestSize ds4=DigestSize8, AtelopusBlockSize bs4=BlockSize16) : _iter(iter),
        _size4(ds4), _bs4(bs4)
    {
        _bs41 = _bs4 - 1;
        _bs = _bs4 >> 2; // block size in words
        _bs1 = _bs - 1;
        _bs2 = _bs >> 1;
        _size = ds4 >> 2; //digest size in words
        _size1 = _size - 1;
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

    // Hash Primitive
    void HashPrimitive(UINT const* data, UINT* res);

    // Hashing a large array
    void Hash(BYTE const* data, BYTE* res, ULONG const& length);

    // Hashing a file
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
        temp = _kk1[v1]; _kk1[v1] = _kk1[v2]; _kk1[v2] = temp;
        //2
        v1 = *(--p1); v2 = *(--p2);
        temp = _kk1[v1]; _kk1[v1] = _kk1[v2]; _kk1[v2] = temp;
        //3
        v1 = *(--p1); v2 = *(--p2);
        temp = _kk1[v1]; _kk1[v1] = _kk1[v2]; _kk1[v2] = temp;
        //4
        v1 = *(--p1); v2 = *(--p2);
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
        temp = _kk1[v1]; _kk1[v1] = _kk1[v2]; _kk1[v2] = temp;
        //2
        v1 = *(++p1); v2 = *(++p2);
        temp = _kk1[v1]; _kk1[v1] = _kk1[v2]; _kk1[v2] = temp;
        //3
        v1 = *(++p1); v2 = *(++p2);
        temp = _kk1[v1]; _kk1[v1] = _kk1[v2]; _kk1[v2] = temp;
        //4
        v1 = *(++p1); v2 = *(++p2);
        temp = _kk1[v1]; _kk1[v1] = _kk1[v2]; _kk1[v2] = temp;
    }

    static bool IsBigEndian()
    { 
        static UINT ui = 1; 
        // Executed only at first call
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

    // F1 function
    static UINT F1(UINT const& val)
    {
        return (val & 0x55AA55AA) | (~val & 0xAA55AA55);
    }

    // F2 function
    static UINT F2(UINT const& val)
    {
        return (val & 0xAA55AA55) | (~val & 0x55AA55AA);
    }

    // G1 function - shift left rotating
    static UINT G1(UINT const& val)
    {
        // take last 5 bits, shift left 5 positions and make last 5 bits first
        return (val << 5) | ((val & 0xF8000000) >> 27);
    }

    // G2 function - shift right rotating
    static UINT G2(UINT const& val)
    {
        // take first 5 bits, shift right 5 positions and make first 5 bits last
        return (val >> 5) | ((val & 0x000001F) << 27);
    }

    static BYTE H1(UINT const& word)
    {
        return (word ^ (word>>24)) + ((word>>16) ^ (word>>8));
    }

    static BYTE H2(UINT const& word)
    {
        return (word + (word>>16)) ^ ((word>>8) + (word>>24));
    }

    // Input File Length
    static ULONG FileLength(ifstream& in);

    void Init(UINT* ar);

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

    // In place XOR extended
    void XORIPE(UINT* ar1, UINT const* ar2, int const& len)
    {
        for (register int i=0; i<len; i++)
        {
            ar1[i] ^= KK(ar2[i]);
        }
    }

    // In place XOR extended
    void XORIPE(UINT* ar1, UINT const* ar2, int const& len1, int const& len2)
    {
        if (len1 > len2)
        {
            int len21 = len2 - 1;
            for (register int i=0; i<len1; i++)
            {
                ar1[i] ^= KK(ar2[i & len21]);
            }
        }
        else // len1 <= len2
        {
            int len11 = len1 - 1;
            for (register int i=0; i<len2; i++)
            {
                ar1[i & len11] ^= KK(ar2[i]);
            }
        }
    }

    void (Atelopus::*Swap)(UINT const& val1, UINT const& val2);
    UINT (*Bytes2Word)(BYTE const* bytes);
    void (*Word2Bytes)(UINT word, BYTE* bytes);

    const static BYTE _skk1[256];
    UINT _iter; // hash primitive rounds
    UINT _size; // digest size in words
    UINT _size1; 
    UINT _size4; // digest size in bytes
    UINT _bs; // block size in words
    UINT _bs1;
    UINT _bs2;
    UINT _bs4; // block size in bytes
    UINT _bs41;
    UINT _val1, _val2;
    BYTE _kk1[256];	
};

#endif // __ATELOPUS_H__
