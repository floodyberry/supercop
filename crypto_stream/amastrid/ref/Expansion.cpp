
// Expansion.cpp
#include "Expansion.h"

const BYTE Expansion::_skk1[256] = {
    217, 40, 106, 12, 2, 114, 98, 19, 41, 147, 220, 97, 194,
    35, 171, 105, 10, 235, 80, 56, 178, 253, 21, 39, 187,
    26, 11, 207, 27, 228, 101, 219, 176, 36, 188, 125, 121,
    45, 49, 237, 202, 109, 133, 5, 70, 108, 65, 195, 138, 72,
    58, 168, 60, 37, 161, 151, 110, 96, 198, 66, 174, 126,
    118, 13, 173, 192, 137, 139, 9, 95, 4, 212, 77, 100, 146,
    191, 50, 25, 59, 117, 233, 0, 34, 99, 208, 243, 71, 90,
    53, 8, 160, 222, 143, 177, 119, 230, 123, 46, 145, 136,
    24, 166, 47, 135, 244, 140, 196, 149, 134, 63, 61, 87,
    29, 214, 193, 6, 130, 184, 42, 190, 242, 129, 52, 206, 33,
    250, 247, 155, 86, 84, 23, 165, 88, 180, 239, 81, 16, 162,
    223, 18, 83, 236, 153, 186, 234, 200, 32, 91, 216,
    115, 132, 43, 218, 215, 107, 3, 248, 251, 44, 51, 211,
    226, 15, 201, 62, 20, 240, 22, 163, 231, 57, 246, 255, 1,
    183, 227, 245, 76, 30, 154, 189, 144, 113, 164, 209, 131,
    104, 122, 156, 142, 152, 224, 54, 67, 124, 78, 127, 94,
    175, 68, 167, 103, 48, 221, 205, 148, 150, 79, 7, 181,
    225, 204, 241, 179, 75, 158, 229, 157, 210, 232, 169, 141,
    102, 128, 249, 238, 213, 120, 111, 64, 170, 93, 85, 82,
    28, 252, 116, 112, 203, 17, 197, 254, 14, 185, 73, 92, 31,
    38, 199, 159, 55, 89, 69, 74, 182, 172,
};

void Expansion::Expand(UINT const* data, UINT const& len, BYTE* res)
{
    UINT words[64];
    memcpy(words, data, len << 2);
    UINT lend2 = len >> 1;
    //Propagate differences
    BYTE temp[4];
    temp[0] = _kk1[0]; temp[1] = _kk1[64]; temp[2] = _kk1[128]; temp[3] = _kk1[192];
    register UINT val1 = Bytes2Word(temp);
    temp[0] = _kk1[32]; temp[1] = _kk1[96]; temp[2] = _kk1[160]; temp[3] = _kk1[224];
    register UINT val2 = Bytes2Word(temp);
    register UINT temp1, temp2;
    register UINT k, i, ix = lend2;
    for (k = 0; k < _iter; k++)
    {
        if (k == 1)
        {
            //Combining with output size for compatibility with the general expansion method
            words[0] ^= KK1(256);
        }
        for (i = 0; i < len; i++, ix++)
        {
            if (ix >= len) ix = 0;
            temp1 = words[i];
            temp2 = words[ix];
            val1 ^= KK1(temp1);
            val1 += temp2;
            val2 ^= Expansion::F1(val1);
            val2 += KK1(temp2);
            val2 ^= temp1;
            words[i] = (temp1 = Expansion::G1(temp1) ^ KK1(val1));
            words[ix] = Expansion::F2(temp2) + KK1(val2);
            (this->*Swap)(temp1, val2);
        }
    }
    //Expanding
    UINT resw[64];
    i = 0;
    ix = lend2;
    int max = 64 - lend2; //assumes lend2 <= 64, which is correct for expansion
    for (k = 0; k < 64; k++, i++, ix++)
    {
        if (i >= len) i = 0;
        if (ix >= len) ix = 0;
        temp1 = words[i];
        temp2 = words[ix];        
        val1 += KK1(temp1);
        val1 ^= temp2;
        val2 += Expansion::G1(val1);
        resw[k] = Expansion::F2(val2) ^ KK1(data[i]);
        val2 ^= KK1(temp2);
        val2 += temp1;
        if ((int)k < max)
        {
            words[i] = Expansion::G2(temp1) + KK1(val1);
            words[ix] = Expansion::F1(temp2) ^ KK1(val2);
        }        
        (this->*Swap)(k, val2);
    }
    //get the result
    Words2Bytes(resw, res, 64);
}

