
// Amastrid.cpp
#include "Amastrid.h"
#include "Expansion.h"

//****************************************************************************
//
// The Amastrid block ciphering method (Fast Version), Version 1.1.0 (10 July 2011)
// Copyright (C) 2009-2011, George Anescu, www.sc-gen.com
// All right reserved.
//
//****************************************************************************

const BYTE Amastrid::_skk1[256] = {
    99, 23, 136, 230, 240, 243, 115, 247, 6, 13, 48, 154, 119,
    174, 93, 185, 159, 221, 8, 67, 129, 189, 62, 222, 31, 152,
    139, 82, 101, 65, 109, 211, 187, 186, 151, 76, 0, 116, 103,
    7, 11, 34, 144, 209, 80, 137, 236, 232, 94, 225, 21, 194,
    254, 60, 179, 14, 17, 46, 125, 4, 251, 85, 18, 155, 206, 104,
    195, 237, 56, 22, 181, 73, 63, 213, 38,  3, 203, 89, 190,
    123, 239, 193, 164, 51, 1, 150, 19, 147, 92, 72, 35, 117,
    173, 50, 15, 248, 79, 69, 217, 16, 227, 9, 39, 96, 77, 30, 64,
    57, 255, 78, 169, 199, 54, 111, 176, 242, 58, 106, 5, 220, 45,
    107, 235, 105, 145, 202, 229, 128, 29, 118, 100, 74, 163,
    83, 24, 182, 216, 200, 12, 26, 98, 146, 110, 201, 126, 20, 86,
    143, 55, 175, 167, 233, 166, 122, 158, 183, 204, 141, 215,
    68, 142, 241, 2, 124, 102, 52, 191, 218, 244, 49, 28, 59, 36,
    178, 131, 130, 245, 42, 196, 10, 250, 197, 112, 228, 135,
    168, 108, 75, 40, 210, 44, 88, 160, 171, 223, 249, 91, 43,
    165, 188, 97, 95, 25, 138, 231, 192, 113, 87, 214, 47, 32,
    207, 226, 71, 81, 53, 61, 90, 180, 132, 114, 127, 156, 234,
    133, 120, 41, 27, 121, 148, 238, 184, 212, 149, 66, 134, 246,
    33, 205, 162, 84, 198, 37, 161, 153, 157, 172, 252, 208, 140,
    170, 219, 224, 70, 253, 177,
};

const BYTE Amastrid::_skk2[256] = {
    198, 166, 58, 28, 230, 148, 233, 35, 6, 113, 232, 150, 42, 186,
    92, 103, 50, 171, 188, 14, 246, 139, 201, 202, 9, 217, 193,
    253, 56, 130, 154, 165, 26, 254, 170, 65, 138, 80, 95, 43, 229,
    168, 143, 39, 66, 108, 102, 99, 153, 116, 192, 91, 234,
    238, 132, 12, 97, 177, 209, 55, 207, 23, 68, 86, 62, 147, 3,
    163, 199, 178, 18, 181, 105, 69, 29, 160, 211, 1, 22, 60, 15,
    8, 204, 224, 180, 34, 237, 54, 226, 115, 32, 222, 247, 25, 145,
    81, 183, 21, 94, 44, 215, 109, 175, 243, 106, 210, 31, 83,
    127, 197, 96, 104, 218, 189, 67, 212, 219, 158, 98, 241, 100,
    37, 38, 195, 200, 244, 242, 76, 47, 4, 214, 78, 20, 162, 164,
    252, 190, 194, 134, 112, 129, 172, 16, 72, 221, 119, 52, 84,
    10, 121, 33, 51, 40, 5, 36, 213, 151, 74, 87, 64, 191, 250,
    120, 85, 140, 61, 245, 2, 135, 235, 30, 90, 220, 88, 146, 79,
    227, 137, 216, 48, 123, 208, 110, 73, 184, 239, 159, 53, 71,
    17, 27, 93, 136, 251, 77, 144, 223, 11, 182, 57, 107, 185, 75,
    63, 187, 205, 59, 169, 142, 13, 255, 114, 82, 248, 149, 176,
    89, 70, 167, 173, 152, 133, 122, 126, 101, 249, 131, 49, 0, 228,
    19, 111, 45, 161, 41, 128, 124, 196, 203, 117, 206, 141,
    157, 179, 118, 125, 240, 24, 236, 7, 174, 231, 155, 156, 46, 225,
};

UINT Amastrid::_temp[256];

void Amastrid::Initialize(BYTE const* keydata, UINT const& keysize)
{
    UINT kwords[64];
    int keysizew = keysize >> 2;
    if (keysize & 3) keysizew++;
    kwords[keysizew-1] = 0;
    memcpy(kwords, keydata, keysize); 
    Bytes2Words(kwords, kwords, keysizew);
    Expansion exp;
    exp.Expand(kwords, keysizew, _kk2);
    exp.GetKK1(_kk1);
}

//Generate Initialization Vector
void Amastrid::GenerateIV(UINT* iv)
{
    BYTE temp[4];
    temp[0] = _kk1[(BYTE)_size1]; temp[1] = _kk2[temp[0]];
    temp[2] = _kk1[temp[1]]; temp[3] = _kk2[temp[2]];
    UINT v = Bytes2Word(temp);
    v = KK1(v) ^ KK2(v);
    for (int i = 0; i < (int)_size; i++)
    {
        iv[i] = (v += KK1(KK2(v)));
    }
    Encrypt(iv);
}

 //Encrypt Primitive
void Amastrid::Encrypt(UINT* ar)
{
    UINT c1, c2, c1o, c2o;
    int kpos1, kinc1, kpos2, kinc2;
    int pos1, pos2, pos1o, pos2o, inc1, inc2;
    BYTE temp[4];
    temp[0] = _kk1[(BYTE)_size1]; temp[1] = _kk2[temp[0]];
    temp[2] = _kk1[temp[1]]; temp[3] = _kk2[temp[2]];
    UINT kk1 = KK2(Bytes2Word(temp));
    temp[0] = _kk2[(BYTE)_size1]; temp[1] = _kk1[temp[0]];
    temp[2] = _kk2[temp[1]]; temp[3] = _kk1[temp[2]];
    UINT kk2 = KK1(Bytes2Word(temp));
    int i, k;
    for (k = 0; k < (int)_iter; k++)
    {
        kpos1 = KK1(kk1);
        kinc1 = Amastrid::F1(KK2(kk2));
        kpos2 = KK2(kk1);
        kinc2 = KK1(Amastrid::F2(kk2));
        kk1 = KK2(kpos1);
        kk2 = KK1(kinc1);
        inc1 = (H1(kinc1) | 1) & _size1;
        inc2 = (H2(kinc2) | 1) & _size1;
        pos1 = kpos1 & _size1;
        if (k > 0)
        {
            if (pos1 != pos2)
            {
                ar[pos1] = Amastrid::F1(ar[pos1]);
                ar[pos2] = Amastrid::G1(ar[pos2]);
                if (pos1 > pos2)
                {
                    Amastrid::ShiftRightRot(ar, _size, pos1 - pos2);
                }
                else
                {
                    Amastrid::ShiftLeftRot(ar, _size, pos2 - pos1);
                }
            }
        }
        pos2 = kpos2 & _size1;
        if ((inc1 == inc2) && (pos1 == pos2))
        {
            pos2++;
            pos2 &= _size1;
        }
        pos1o = -1;
        pos2o = -1;
        c1o = kk1;
        c2o = kk2;
        for (i = 0; i < (int)_size; i++)
        {
            c1 = ar[pos1];
            c2 = ar[pos2];
            if (pos1 == pos2)
            {
                c1 ^= KK1(c1o);
                c1 += Amastrid::F1(c2o);
                c1 ^= Amastrid::F2(KK2(c2o));
                c1 += Amastrid::G1(c1o);
                c2 = c1;
            }
            else if (pos1 == pos2o)
            {
                if (pos2 == pos1o)
                {
                    c1 += Amastrid::F2(c2);
                    c1 ^= KK2(c2);
                    c2 ^= Amastrid::F1(c1);
                    c2 += Amastrid::G2(KK1(c1));
                }
                else
                {
                    c1 ^= Amastrid::F1(KK2(c1o));
                    c1 += Amastrid::F2(c2);
                    c2 ^= KK1(c1);
                    c2 += Amastrid::G2(c1o);
                }
            }
            else if (pos2 == pos1o)
            {
                c1 += KK1(c2);
                c1 ^= Amastrid::G2(c2o);
				c2 += Amastrid::F1(KK2(c2o));
                c2 ^= Amastrid::F2(c1);
            }
            else
            {
                c1 ^= KK1(c1o);
                c1 += Amastrid::F2(c2);
                c1 ^= Amastrid::G1(c2o);
                c2 += KK2(c2o);
                c2 ^= Amastrid::F1(c1);
                c2 += c1o;
            }
            ar[pos1] = c1;
            ar[pos2] = c2;
            if (i < (int)_size1)
            {
                c1o = c1;
                c2o = c2;
                pos1o = pos1;
                pos2o = pos2;
                pos1 += inc1;
                pos1 &= _size1;
                pos2 += inc2;
                pos2 &= _size1;
            }
        }
    }
}

 //Decrypt Primitive
void Amastrid::Decrypt(UINT* ar)
{
    static UINT kk1[10];
    static UINT kk2[10];
    static int kpos1[10];
    static int kinc1[10];
    static int kpos2[10];
    static int kinc2[10];
    UINT c1, c2, c1o, c2o;
    int pos1, pos2, pos1o, pos2o, pos1temp, inc1, inc2;
    BYTE temp[4];
    temp[0] = _kk1[(BYTE)_size1]; temp[1] = _kk2[temp[0]];
    temp[2] = _kk1[temp[1]]; temp[3] = _kk2[temp[2]];
    UINT var1 = KK2(Bytes2Word(temp));
    temp[0] = _kk2[(BYTE)_size1]; temp[1] = _kk1[temp[0]];
    temp[2] = _kk2[temp[1]]; temp[3] = _kk1[temp[2]];
    UINT var2 = KK1(Bytes2Word(temp));    
    int i, k;
    for (i = 0; i < (int)_iter; i++)
    {
        kpos1[i] = KK1(var1);
        kinc1[i] = Amastrid::F1(KK2(var2));
        kpos2[i] = KK2(var1);
        kinc2[i] = KK1(Amastrid::F2(var2));
        kk1[i] = (var1 = KK2(kpos1[i]));
        kk2[i] = (var2 = KK1(kinc1[i]));
    }
    for (k = _iter - 1; k >= 0; k--)
    {
        inc1 = _size - ((H1(kinc1[k]) | 1) & _size1);
        inc2 = _size - ((H2(kinc2[k]) | 1) & _size1);
        if (k < (int)_iter - 1)
        {
            pos1temp = pos1;
        }
        pos1 = kpos1[k] & _size1;
        pos2 = kpos2[k] & _size1;
        if ((inc1 == inc2) && (pos1 == pos2))
        {
            pos2++;
            pos2 &= _size1;
        }
        pos1 += inc1;
        pos1 &= _size1;
        pos2 += inc2;
        pos2 &= _size1;        
        if (k < (int)_iter - 1)
        {
            if (pos1temp != pos2)
            {
                if (pos1temp > pos2)
                {
                    Amastrid::ShiftLeftRot(ar, _size, pos1temp - pos2);
                }
                else
                {
                    Amastrid::ShiftRightRot(ar, _size, pos2 - pos1temp);
                }
                ar[pos1temp] = Amastrid::F1(ar[pos1temp]);
                ar[pos2] = Amastrid::G2(ar[pos2]);
            }
        }
        for (i = _size1; i >= 0; i--)
        {
            if (i > 0)
            {
                pos1o = (pos1 + inc1) & _size1;
                pos2o = (pos2 + inc2) & _size1;
                c1o = ar[pos1o];
                c2o = ar[pos2o];
            }
            else //i == 0
            {
                c1o = kk1[k];
                c2o = kk2[k];
            }
            c1 = ar[pos1];
            c2 = ar[pos2];
            if (pos1 == pos2)
            {
                c1 -= Amastrid::G1(c1o);
                c1 ^= Amastrid::F2(KK2(c2o));
                c1 -= Amastrid::F1(c2o);
                c1 ^= KK1(c1o);
                c2 = c1;
            }
            else if (pos1 == pos2o)
            {
                if (pos2 == pos1o)
                {
                    c2 -= Amastrid::G2(KK1(c1));
                    c2 ^= Amastrid::F1(c1);
                    c1 ^= KK2(c2);
                    c1 -= Amastrid::F2(c2);
                }
                else
                {
                    c2 -= Amastrid::G2(c1o);
                    c2 ^= KK1(c1);
                    c1 -= Amastrid::F2(c2);
                    c1 ^= Amastrid::F1(KK2(c1o));
                    c2o = c1;
                }
            }
            else if (pos2 == pos1o)
            {
                c2 ^= Amastrid::F2(c1);
                c2 -= Amastrid::F1(KK2(c2o));
                c1 ^= Amastrid::G2(c2o);
                c1 -= KK1(c2);
                c1o = c2;
            }
            else
            {
                c2 -= c1o;
                c2 ^= Amastrid::F1(c1);
                c2 -= KK2(c2o);
                c1 ^= Amastrid::G1(c2o);
                c1 -= Amastrid::F2(c2);
                c1 ^= KK1(c1o);    
            }
            ar[pos1] = c1;
            ar[pos2] = c2;
            if (i > 0)
            {
                pos1 = pos1o;
                pos2 = pos2o;
                c1 = c1o;
                c2 = c2o;
            }
        }
    }
}

//Variable block size encryption
void Amastrid::Encrypt(BYTE const* data, BYTE* res, ULONG const& length, int em)
{
    UINT i;
    ULONG lblocks = length / _size4;
    UINT words[BlockSize256];
    UINT words1[BlockSize256];
    if (em == CBC)
    {
        GenerateIV(words1);
    }
    ULONG pos = 0; //current position
    for (ULONG ui=0; ui<lblocks; ui++, pos+=_size4)
    {
        memcpy(words, data+pos, _size4);
        Bytes2Words(words, words, _size);
        if (em == CBC)
        {
            for (i=0; i<_size; i++)
            {
                words[i] ^= words1[i];
            }
        }
        Encrypt(words);
        if (em == CBC)
        {
            memcpy(words1, words, _size4);
        }
        Words2Bytes(words, res + pos, _size);
    }
    int r = length % _size4;
    if (r > 0)
    {
        memcpy(words, data+pos, r);
        //padding
        BYTE* pb = ((BYTE*)words) + r;
        BYTE v = (BYTE)_size1;
        for (i=0; i<_size4-r; i++, pb++)
        {
            *pb = (v = _kk1[v] + _kk2[(BYTE)i]);
        }
        Bytes2Words(words, words, _size);
        if (em == CBC)
        {
            for (i=0; i<_size; i++)
            {
                words[i] ^= words1[i];
            }
        }
        Encrypt(words);
        Words2Bytes(words, res + pos, _size);
    }
}

//Variable block size decryption
void Amastrid::Decrypt(BYTE const* data, BYTE* res, ULONG const& length, int em)
{
    UINT i;
    ULONG lblocks = length / _size4;
    UINT words[BlockSize256];
    UINT words1[BlockSize256];
    UINT words2[BlockSize256];
    if (em == CBC)
    {
        //IV
        GenerateIV(words1);
    }
    ULONG pos = 0; //current position
    for (ULONG ui=0; ui<lblocks; ui++, pos+=_size4)
    {
        memcpy(words, data+pos, _size4);
        Bytes2Words(words, words, _size);
        if (em == CBC)
        {
            memcpy(words2, words, _size4);
        }
        Decrypt(words);
        if (em == CBC)
        {
            for (i=0; i<_size; i++)
            {
                words[i] ^= words1[i];
            }
            memcpy(words1, words2, _size4);
        }
        Words2Bytes(words, res + pos, _size);
    }
    int r = length % _size4;
    if (r > 0)
    {
        memcpy(words, data+pos, _size4);
        Bytes2Words(words, words, _size);
        Decrypt(words);
        if (em == CBC)
        {
            for (i=0; i<_size; i++)
            {
                words[i] ^= words1[i];
            }
        }
        //Ignore padding
        Words2Bytes(words, res + pos, r);
    }
}

//Input File Length
ULONG Amastrid::FileLength(ifstream& in)
{
    //Check first the file's state
    if(!in.is_open() || in.bad())
    {
        throw runtime_error("FileLength(), file not opened or in bad state.");
    }
    //Get current position
    streampos currpos = in.tellg();
    //Move to the end
    in.seekg(0, ios::end);
    streampos endpos = in.tellg();
    //Go Back
    in.seekg(currpos, ios::beg);
    return (ULONG)endpos;
}

//Encrypt File
void Amastrid::EncryptFile(string const& infilepath, string const& outfilepath, int em)
{
    if (infilepath.empty() || outfilepath.empty())
    {
        throw runtime_error("Amastrid::EncryptFile(), empty file path.");
    }
    try
    {
        UINT i;
        UINT words[BlockSize256];
        UINT words1[BlockSize256];
        ifstream ifs(infilepath.c_str());
        if(!ifs)
        {
            throw runtime_error("Amastrid::EncryptFile(), cannot open input file.");
        }
        ULONG length = FileLength(ifs);
        ULONG lblocks = length / _size4;
        ofstream ofs(outfilepath.c_str());
        if(!ofs)
        {
            throw runtime_error("Amastrid::EncryptFile(), cannot open output file.");
        }
        if (em == CBC)
        {
            //IV
            GenerateIV(words1);
        }
        for (ULONG ui=0; ui<lblocks; ui++)
        {
            ifs.read((char*)words, (streamsize)_size4);
            Bytes2Words(words, words, _size);
            if (em == CBC)
            {
                for (i=0; i<_size; i++)
                {
                    words[i] ^= words1[i];
                }
            }
            Encrypt(words);
            if (em == CBC)
            {
                memcpy(words1, words, _size4);
            }
            Words2Bytes(words, (BYTE*)words, _size);
            ofs.write((char*)words, _size4);
        }
        int r = length % _size4;
        if (r > 0)
        {
            ifs.read((char*)words, (streamsize)r);
            //padding
            BYTE* pb = ((BYTE*)words) + r;
            BYTE v = (BYTE)_size1;
            for (i=0; i<_size4-r; i++, pb++)
            {
                *pb = (v = _kk1[v] + _kk2[(BYTE)i]);
            }
            Bytes2Words(words, words, _size);
            if (em == CBC)
            {
                for (i=0; i<_size; i++)
                {
                    words[i] ^= words1[i];
                }
            }
            Encrypt(words);
            Words2Bytes(words, (BYTE*)words, _size);
            ofs.write((char*)words, _size4);
        }
        ifs.close();
        ofs.close();
    }
    catch (exception const& ex)
    {
		throw runtime_error("Amastrid::EncryptFile(), file read error: " +
            string(ex.what()));
    }
}

//Decrypt File
void Amastrid::DecryptFile(string const& infilepath, string const& outfilepath,
    ULONG const& length, int em)
{
    if (infilepath.empty() || outfilepath.empty())
    {
        throw runtime_error("Amastrid::EncryptFile(), empty file path.");
    }
    try
    {
        UINT i;
        UINT words[BlockSize256];
        UINT words1[BlockSize256];
        UINT words2[BlockSize256];
        ifstream ifs(infilepath.c_str());
        if(!ifs)
        {
            throw runtime_error("Amastrid::EncryptFile(), cannot open input file.");
        }
        ULONG lblocks = length / _size4;
        ofstream ofs(outfilepath.c_str());
        if(!ofs)
        {
            throw runtime_error("Amastrid::EncryptFile(), cannot open output file.");
        }		
        if (em == CBC)
        {
            //IV
            GenerateIV(words1);
        }
        for (ULONG ui=0; ui<lblocks; ui++)
        {
            ifs.read((char*)words, (streamsize)_size4);
            Bytes2Words(words, words, _size);
            if (em == CBC)
            {
                memcpy(words2, words, _size4);
            }
            Decrypt(words);
            if (em == CBC)
            {
                for (i=0; i<_size; i++)
                {
                    words[i] ^= words1[i];
                }
                memcpy(words1, words2, _size4);
            }
            Words2Bytes(words, (BYTE*)words, _size);
            ofs.write((char*)words, _size4);
        }
        int r = length % _size4;
        if (r > 0)
        {
            ifs.read((char*)words, (streamsize)_size4);
            Bytes2Words(words, words, _size);
            Decrypt(words);
            if (em == CBC)
            {
                for (i=0; i<_size; i++)
                {
                    words[i] ^= words1[i];
                }
            }
            Words2Bytes(words, (BYTE*)words, _size);
            //Ignore padding
            ofs.write((char*)words, r);
        }
        ifs.close();
        ofs.close();
    }
    catch (exception const& ex)
    {
        throw runtime_error("Amastrid::EncryptFile(), file read error: " +
            string(ex.what()));
    }
}

