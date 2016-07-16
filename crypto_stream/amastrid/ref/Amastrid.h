
// Amastrid.h
#ifndef __AMASTRID_H__
#define __AMASTRID_H__

#include <stdexcept>
#include <cstring>
#include <string>
#include <fstream>

using namespace std;

#define BYTE unsigned char
#define UINT unsigned int
#define ULONG unsigned long long

class Amastrid
{
//****************************************************************************
//
// The AMASTRID block ciphering method (Fast Version), Version 1.1.0 (10 Juky 2011)
// Copyright (C) 2009-2011, George Anescu, www.sc-gen.com
// All right reserved.
//
// This is the C++ implementation of a new block ciphering method called AMASTRID.
// Similar to Version 1.0.0, Version 1.1.0 works with keys of any practical size, but for
// increased efficiency it works with fixed block size.
//
// COPYRIGHT PROTECTION: The AMASTRID block ciphering method is still under development and
// testing and for this reason the code is freely distributed only for TESTING AND RESEARCH
// PURPOSES. The author is reserving for himself the rights to MODIFY AND MAINTAIN the code,
// but any ideas about improving the code are welcomed and will be recognized if implemented.
//
// If you are interested in testing the code, in research collaborations for possible security
// holes in the method, or in any other information please contact the author at
// <george.anescu@sc-gen.com>.
//
// For C++ portability testing please use the Test Samples. The test code is given in readme.txt.
//
// Counter Mode Test Samples:
//
// 1)
// blocksize=32, iterations=3, key="XXXXXXX"
// hexresult="7DB03792 AD423B17 1A3A1540 FF3C1B35 488E5A9D BB065227 FEAE9B95 9F88C930 7C07A4A6 3A317F55 7457388D 9F3213E8 DD6A64BE B0E585C2 96B6C34F 31B9A85A 064C2941 F9AC6C9A B4735061 E8752166 94EA76A6 2E493EF4 8A13D898 3E9FAC31 3096F7A1 61C5536F 8B5847D9 DEB91F21 10BB1100 AB014A8A A5338A57 300239B3 "...
// hexresult=..."0215E27B A007C188 A02E8A6F 2303F3EA 43D7BE0A 862EAC74 C736D389 B9594C27 ECF7A554 60E6EAFD 6EE5D87A A0A820E3 8F725469 EEDFE4C7 66D2AA90 B06C8C27 FEA3FB02 018B6E5E CC398D7B EE8372FD 3E351166 AC5C87C5 D0ED057D A80FB994 DD098271 7D31C80F C84EC5AA DA72273B D91CF542 5B64E023 3C9CA8C3 7ABE8825 "
//
// 2)
// blocksize=32, iterations=3, key="YXXXXXX"
// hexresult="5600BDC7 4F6E92E0 098C9B87 AF17A21D 7BA8E21B F27A2AC6 52FC85B5 92D6C34C D7D0C2C9 CBFFF5E0 FBCC6A7C EAF40C96 27931610 5DEDECAB 6C434D35 C411998F 3693ECE8 B3AA7DA3 F4FC5478 A6719B79 E27E6D5F 499769DA FFB653D0 7E18F78E 4AC80BC6 7941DDC8 2D6155F3 DA2981F2 5212BB06 E685FB43 09137C68 1615A766 "...
//
// 3)
// blocksize=32, iterations=3, key="\0\0\0\0"
// hexresult="592D0D22 C02FE2D0 836CF58B C70D8100 3805E974 50FF7B41 8DC4DC83 9644FC5F BD5D171F C0633720 D438CDAB B55AE1BD BE279C5A CC74B585 32810DCC A5B265FE DB809BEA 671D77F1 ABDEAC4C 6A5AF5BF D0D125BB 0279F627 01ADF88D 18ED2E10 604628AD 3BA08042 BF103F3A 95A14BAB 441E83D6 F5FDD213 8A58751B 458D46E3 "...
//
//****************************************************************************
public:
    //Sizes in bytes
    enum BlockSize
    {
        BlockSize16 = 16, BlockSize32 = 32, BlockSize64 = 64, BlockSize128 = 128,
        BlockSize256 = 256, BlockSize512 = 512, BlockSize1024 = 1024,
    };

    enum EncryptionMode
    {
        ECB = 0, CBC = 1,
    };

    //Constructors
    Amastrid(BlockSize bs4 = BlockSize16, UINT const& iter=3) : _size4(bs4), _iter(iter)
    {
        if (Amastrid::IsBigEndian())
        {
            Bytes2Word = Amastrid::Bytes2WordBE;
            Word2Bytes = Amastrid::Word2BytesBE;
        }
        else
        {
            Bytes2Word = Amastrid::Bytes2WordLE;
            Word2Bytes = Amastrid::Word2BytesLE;
        }
        _size41 = _size4 - 1;
        _size = _size4 >> 2; //size in words
        _size1 = _size - 1;
        //defaults
        memcpy(_kk1, _skk1, 256);
        memcpy(_kk2, _skk2, 256);
    }

    Amastrid(BYTE const* keydata, UINT const& keysize, BlockSize bs4 = BlockSize16,
        int const& iter=3) : _size4(bs4), _iter(iter)
    {
        if (Amastrid::IsBigEndian())
        {
            Bytes2Word = Amastrid::Bytes2WordBE;
            Word2Bytes = Amastrid::Word2BytesBE;
        }
        else
        {
            Bytes2Word = Amastrid::Bytes2WordLE;
            Word2Bytes = Amastrid::Word2BytesLE;
        }
        _size41 = _size4 - 1;
        _size = _size4 >> 2; //size in words
        _size1 = _size - 1;
        Initialize(keydata, keysize);
    }

    void Initialize(BYTE const* keydata, UINT const& keysize);

    //Generate Initialization Vector
    void GenerateIV(UINT* iv);

    //Encrypt Primitive
    void Encrypt(UINT* ar);

    //Decrypt Primitive
    void Decrypt(UINT* ar);

    //Variable block size encryption
    void Encrypt(BYTE const* data, BYTE* res, ULONG const& length, int em);

    //Variable block size decryption
    void Decrypt(BYTE const* data, BYTE* res, ULONG const& length, int em);

    //Encrypt File
    void EncryptFile(string const& infilepath, string const& outfilepath, int em);

    //Decrypt File
    void DecryptFile(string const& infilepath, string const& outfilepath,
        ULONG const& length, int em);

private:
    UINT KK1(UINT const& val)
    {
        return _kk1[(BYTE)val] | _kk1[(BYTE)(val>>8)]<<8 |
            _kk1[(BYTE)(val>>16)]<<16 | _kk1[(BYTE)(val>>24)]<<24;
    }

    UINT KK2(UINT const& val)
    {
        return _kk2[(BYTE)val] | _kk2[(BYTE)(val>>8)]<<8 |
            _kk2[(BYTE)(val>>16)]<<16 | _kk2[(BYTE)(val>>24)]<<24;
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

    // G1 function - shift left rotating
    static UINT G1(UINT const& val)
    {
        // take last 5 bits, shift left 5 positions and make last 5 bits first
        return (val << 5) | ((val & 0xF8000000) >> 27);
    }

    // G2 function - shift right rotating
    static UINT G2(UINT const& val)
    {
        // Take first 5 bits, shift right 5 positions and make first 5 bits last
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

    //Input File Length
    static ULONG FileLength(ifstream& in);

    static void ShiftLeftRot(UINT* ar, UINT len, UINT shift)
    {
        UINT shift4 = shift << 2;
        UINT ls4 = (len - shift) << 2;
        memcpy(_temp, ar, shift4);
        memmove(ar, (BYTE*)ar+shift4, ls4);
        memcpy((BYTE*)ar+ls4, _temp, shift4);
    }

    static void ShiftRightRot(UINT* ar, UINT len, UINT shift)
    {
        UINT shift4 = shift << 2;
        UINT ls4 = (len - shift) << 2;
        memcpy(_temp, (BYTE*)ar+ls4, shift4);
        memmove((BYTE*)ar+shift4, ar, ls4);
        memcpy(ar, _temp, shift4);
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

    UINT (*Bytes2Word)(BYTE const* bytes);
    void (*Word2Bytes)(UINT word, BYTE* bytes);

    const static BYTE _skk1[256];
    const static BYTE _skk2[256];

    static UINT _temp[256];

    BYTE _kk1[256];
    BYTE _kk2[256];

    UINT _size4; //size in bytes
    UINT _size41;
    UINT _size; //size in words
    UINT _size1;
    UINT _iter;
};

#endif // __AMASTRID_H__

