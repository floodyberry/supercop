// Counter.h
#ifndef __COUNTER_H__
#define __COUNTER_H__

#include <cstring>

using namespace std;

#define UINT unsigned int

class Counter
{
public:
    //Constructors
    Counter() {}

    Counter(UINT* data, int size)
    {
        Initialize(data, size);
    }

    void Initialize(UINT* data, int size)
    {
        _size = size;
        _size4 = size << 2;
        memcpy(_data, data, _size4);
    }

    UINT& operator[](int i)
    {
        return _data[i];
    }

    UINT* Data()
    {
        return _data;
    }

    //Increment (overload ++)
    void operator++();
	
private:
    int _size;
    int _size4;
    UINT _data[256];
};

#endif // __COUNTER_H__