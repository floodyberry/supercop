// Counter.h
#ifndef __COUNTER_H__
#define __COUNTER_H__

#include <cstring>
#include <string.h>

using namespace std;

#define BYTE unsigned char

class Counter
{
public:
	//Constructors
	Counter() {}

	Counter(BYTE const* init, int size)
	{
		Initialize(init, size);
	}

	void Initialize(BYTE const* init, int size)
	{
		_size = size;
		memcpy(_init, init, _size);
		memcpy(_data, init, _size);
		memcpy(_incr, init+_size, _size);
		MakeGoodIncrement();
	}
	
	BYTE& operator[](int i) { return _data[i]; }

	void Reset()
	{
		memcpy(_data, _init, _size);
	}

	void SaveState()
	{
		memcpy(_init, _data, _size);
	}

	//Increment _data with _incr
	void Increment();

		
private:
	void MakeGoodIncrement();

	int _size;
	BYTE _init[256];
	BYTE _data[256];
	BYTE _incr[256];
};

#endif // __COUNTER_H__

