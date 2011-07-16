// CounterMode.h
#ifndef __COUNTER_MODE_H__
#define __COUNTER_MODE_H__

#include "Counter.h"
#include "Amastrid.h"

class CounterMode
{
public:
    //Constructors
    CounterMode(BYTE const* key, int keysize,
        Amastrid::BlockSize size4=Amastrid::BlockSize16,
        UINT const& iter=3) : _ams(key, keysize, size4, iter),
        _size4(size4), _bcnt(0)
    {
        _size = (_size4 >> 2);
        _wcnt = _size-1;
        _bcnt = 0;
        _ams.GenerateIV(_iv);
        //iv used as a nonce
        _cnt.Initialize(_iv, _size);
    }

    void Reset()
    {
        _wcnt = _size-1;
        _bcnt = 0;
        _cnt.Initialize(_iv, _size);
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
    Counter _cnt;
    Amastrid _ams;
    UINT _iv[Amastrid::BlockSize256];
    UINT _wcnt;
    int _size;
    int _size4;
    UINT _bcnt;
};

#endif // __COUNTER_MODE_H__
