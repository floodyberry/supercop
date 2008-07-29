/*
 *    MIRACL  C++ Header file ecn3.h
 *
 *    AUTHOR  : M. Scott
 *  
 *    PURPOSE : Definition of class ECn3 (Arithmetic on an Elliptic Curve,
 *               mod n^3)
 *
 *    NOTE    : Must be used in conjunction with zzn.cpp, big.cpp and 
 *              zzn3.cpp
 *
 * WARNING: This class has been cobbled together for a specific use with
 * the MIRACL library. It is not complete, and may not work in other 
 * applications
 *
 *    Copyright (c) 2006 Shamus Software Ltd.
 */

#ifndef ECN3_H
#define ECN3_H

#include "zzn3.h"

class ECn3
{
    ZZn3 x,y;
    int marker;
public:
    ECn3()     {marker=MR_EPOINT_INFINITY;}
    ECn3(const ECn3& b) {x=b.x; y=b.y; marker=b.marker; }

    ECn3& operator=(const ECn3& b) 
        {x=b.x; y=b.y; marker=b.marker; return *this; }
    
    BOOL add(const ECn3&,ZZn3&);

    ECn3& operator+=(const ECn3&); 
    ECn3& operator-=(const ECn3&); 
    ECn3& operator*=(const Big&); 
   
    void clear() {x=y=0; marker=MR_EPOINT_INFINITY;}
    BOOL iszero() {if (marker==MR_EPOINT_INFINITY) return TRUE; return FALSE;}

    void get(ZZn3&,ZZn3&);
    void get(ZZn3&);
    BOOL set(const ZZn3&,const ZZn3&); // set on the curve - returns FALSE if no such point
    BOOL set(const ZZn3&);      // sets x coordinate on curve, and finds y coordinate
    
    friend ECn3 operator-(const ECn3&);
    friend ECn3 operator+(const ECn3&,const ECn3&);
    friend ECn3 operator-(const ECn3&,const ECn3&);

    friend BOOL operator==(const ECn3& a,const ECn3 &b) 
        {return (a.x==b.x && a.y==b.y && a.marker==b.marker); }
    friend BOOL operator!=(const ECn3& a,const ECn3 &b) 
        {return (a.x!=b.x || a.y!=b.y || a.marker!=b.marker); }

    friend ECn3 operator*(const Big &,const ECn3&);
    friend ostream& operator<<(ostream&,ECn3&);


    ~ECn3() {}
};

#endif

