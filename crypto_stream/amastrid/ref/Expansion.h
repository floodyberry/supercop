
// Expansion.h
#ifndef __EXPANSION_H__
#define __EXPANSION_H__

#include <cstring>

using namespace std;

#define BYTE unsigned char
#define UINT unsigned int

class Expansion
{
public:
    //Constructor
    Expansion(UINT const& iter=3) : _iter(iter)
    {
        if (Expansion::IsBigEndian())
        {
            Swap = &Expansion::SwapBE;
            Bytes2Word = Expansion::Bytes2WordBE;
            Word2Bytes = Expansion::Word2BytesBE;
        }
        else
        {
            Swap = &Expansion::SwapLE;
            Bytes2Word = Expansion::Bytes2WordLE;
            Word2Bytes = Expansion::Word2BytesLE;
        }
        Reset();
    }

    void Reset()
    {
		memcpy(_kk1, _skk1, 256);
    }

    //Expansion
    void Expand(UINT const* data, UINT const& len, BYTE* res);

    void GetKK1(BYTE* kk1)
    {
        memcpy(kk1, _kk1, 256);
    }
		
private:
    UINT KK1(UINT const& val)
    {
        return _kk1[(BYTE)val] | _kk1[(BYTE)(val>>8)]<<8 | _kk1[(BYTE)(val>>16)]<<16 | _kk1[(BYTE)(val>>24)]<<24;
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

    void (Expansion::*Swap)(UINT const& val1, UINT const& val2);
    UINT (*Bytes2Word)(BYTE const* bytes);
    void (*Word2Bytes)(UINT word, BYTE* bytes);

    const static BYTE _skk1[256];
	
    UINT _iter;
    BYTE _kk1[256];
};

#endif // __EXPANSION_H__

