// Counter.cpp
#include "Counter.h"

//Increment _data with _incr
void Counter::Increment()
{
	BYTE carry = 0;
	for (int i = 0; i < _size; i++)
	{
		short res = _data[i] + _incr[i] + carry;
		_data[i] = (BYTE)res;
		carry = (BYTE)(res >> 8);
	}
}
		
void Counter::MakeGoodIncrement()
{
	//Set first bit to ensure that the increment is an odd number
	//(guarantees maximal period of the counter, the same as for incrementing with 1)
	_incr[0] |= 0x01;
	//A good increment should provide fast variation.
	//Ensure that each byte is between 64 and 191.
	for (int i = 0; i < _size; i++)
	{
		if ((_incr[i] & 0x80) != 0)
		{
			//reset bit 64
			_incr[i] &= 0xBF;
		}
		else
		{
			//set bit 64
			_incr[i] |= 0x40;
		}
	}
}

