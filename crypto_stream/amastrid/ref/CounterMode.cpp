// CounterMode.cpp
#include "CounterMode.h"

//The counter mode turns a block cipher into a stream cipher. It generates
//the next keystream block by encrypting successive values of a "counter".
//The counter can be any function which produces a sequence which is guaranteed
//not to repeat for a long time, although an actual counter is the simplest and
//most popular. The IV/nonce and the counter can be concatenated, added, or
//XORed together to produce the actual unique counter block for encryption.
void CounterMode::GetNextWord(UINT& rnd)
{
    static UINT words[Amastrid::BlockSize256];
    _wcnt++;
    if (_wcnt == (UINT)_size)
    {
        _wcnt = 0;
        memcpy(words, _cnt.Data(), _size4);
        _ams.Encrypt(words);
        ++_cnt;
    }
    rnd = words[_wcnt];
}

void CounterMode::GetNextByte(BYTE& rnd)
{
    static UINT word = 0;
    switch (_bcnt)
    {
        case 0:
            GetNextWord(word);
            rnd = (BYTE)word;
            break;

        case 1:
            rnd = (BYTE)(word >> 8);
            break;

        case 2:
            rnd = (BYTE)(word >> 16);
            break;

        case 3:
            rnd = (BYTE)(word >> 24);
            break;
    }
    _bcnt = (_bcnt + 1) & 3;
}
