// Counter.cpp
#include "Counter.h"

void Counter::operator++()
{
    static UINT carry;
    static long long res;
    carry = 1;
    register int i = 0;
    while (carry == 1)
    {
        res = (long long)_data[i] + 1;
        _data[i++] = (UINT)res;
        if (i == _size) break;
        carry = (UINT)(res >> 32);
    }
}