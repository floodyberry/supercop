
// Counter.cpp
#include "Counter.h"

//Increment _data with _incr
void Counter::Increment()
{
    static UINT carry = 0;
    static long long res;
    carry = 0;
    for (register int i = 0; i < _size; i++)
    {
        res = _data[i] + _incr[i] + carry;
        _data[i] = (UINT)res;
        carry = (UINT)(res >> 32);
	}
}
		
void Counter::MakeGoodIncrement()
{
    //Set first bit to ensure that the increment is an odd number
    //(guarantees maximal period of the counter, the same as for incrementing with 1)
    _incr[0] |= 0x01;
    //A good increment should provide fast variation.
    //Ensure that each byte is between 64 and 191.
    BYTE* pbytes = (BYTE*)&_incr[0];
    for (register int i = 0; i < _size4; i++,pbytes++)
    {
        if ((*pbytes & 0x80) != 0)
        {
            //reset bit 64
            *pbytes &= 0xBF;
        }
        else
        {
            //set bit 64
            *pbytes |= 0x40;
        }
    }
}

