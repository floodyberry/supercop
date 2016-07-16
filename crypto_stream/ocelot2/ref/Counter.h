// Counter.h
#ifndef __COUNTER_H__
#define __COUNTER_H__

#include <cstring>

using namespace std;

#define BYTE unsigned char
#define UINT unsigned int

class Counter
{
public:
	//Constructors
	Counter() {}

	Counter(UINT const* init, int size)
	{
		Initialize(init, size);
	}

	void Initialize(UINT const* init, int size)
	{
		_size = size;
		_size4 = size << 2;
		memcpy(_init, init, _size4);
		memcpy(_data, init, _size4);
		memcpy(_incr, init+_size, _size4);
		MakeGoodIncrement();
	}
	
	UINT& operator[](int i) { return _data[i]; }

	void Reset()
	{
		memcpy(_data, _init, _size4);
	}

	void SaveState()
	{
		memcpy(_init, _data, _size4);
	}

	//Increment _data with _incr
	void Increment();

		
private:
	void MakeGoodIncrement();

	int _size;
	int _size4;
	UINT _init[64];
	UINT _data[64];
	UINT _incr[64];
};

#endif // __COUNTER_H__

