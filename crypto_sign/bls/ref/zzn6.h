/*
 *    MIRACL  C++ Header file ZZn6.h
 *
 *    AUTHOR  : M. Scott
 *
 *    NOTE:   : Must be used in conjunction with zzn6.cpp zzn3.cpp big.cpp and zzn.cpp
 *            : This is designed as a "towering extension", so a ZZn6 consists
 *            : of a pair of ZZn3. An element looks like (a+x^2.b+x^4.c) + x(d+x^2.e+x^4.f)
 *            : where x is the cubic (and quadratic) non-residue
 *
 *    PURPOSE : Definition of class zzn6  (Arithmetic over n^6)
 *
 * WARNING: This class has been cobbled together for a specific use with
 * the MIRACL library. It is not complete, and may not work in other 
 * applications
 *
 * p = 1 mod 6
 * irreducible poly is x^6+n
 *
 *    Copyright (c) 2006 Shamus Software Ltd.
 */

#ifndef ZZN6_H
#define ZZN6_H

#include "zzn3.h"

extern void init_zzn6(Big&);

class ZZn6
{
    ZZn3 a,b;
public:
    ZZn6()   {}
    ZZn6(int w) {a=(ZZn3)w; b=0;}
    ZZn6(const ZZn6& w) {a=w.a; b=w.b; }
    ZZn6(const ZZn3 &x,const ZZn3& y) {a=x; b=y; }
    ZZn6(const ZZn &x) {a=x; b=0; }
    ZZn6(const Big &x) {a=(ZZn)x; b=0; }
    
    void set(const ZZn3 &x,const ZZn3 &y) {a=x; b=y; }
    void set(const ZZn3 &x) {a=x; b.clear();}
    void seti(const ZZn3 &x) {a.clear(); b=x;}
    void set(const Big &x) {a=(ZZn)x; b.clear(); }

    void get(ZZn3 &,ZZn3 &) ;
    void get(ZZn3 &) ;
    
    void clear() {a=0; b=0; }
    
    BOOL iszero()  const {if (a.iszero() && b.iszero()) return TRUE; return FALSE; }
 //   BOOL isunity() const {if (a.isunity() && b.iszero()) return TRUE; return FALSE; }
 //   BOOL isminusone() const {if (a.isminusone() && b.iszero()) return TRUE; return FALSE; }

    ZZn6& powq(void);
    ZZn6& operator=(int i) {a=i; b=0; return *this;}
    ZZn6& operator=(const ZZn& x) {a=x; b=0; return *this; }
    ZZn6& operator=(const ZZn3& x) {a=x; b=0; return *this; }
    ZZn6& operator=(const ZZn6& x) {a=x.a; b=x.b; return *this; }
    ZZn6& operator+=(const ZZn& x) {a+=x; return *this; }
    ZZn6& operator+=(const ZZn3& x) {a+=x; return *this; }
    ZZn6& operator+=(const ZZn6& x) {a+=x.a; b+=x.b; return *this; }
    ZZn6& operator-=(const ZZn& x) {a-=x;  return *this; }
    ZZn6& operator-=(const ZZn3& x) {a-=x; return *this; }
    ZZn6& operator-=(const ZZn6& x) {a-=x.a; b-=x.b; return *this; }
    ZZn6& operator*=(const ZZn6&); 
    ZZn6& operator*=(const ZZn3& x) {a*=x; b*=x; return *this; }
    ZZn6& operator*=(const ZZn& x) {a*=x; b*=x; return *this; }
    ZZn6& operator*=(int x) {a*=x; b*=x; return *this;}
    ZZn6& operator/=(const ZZn6&); 
    ZZn6& operator/=(const ZZn3&);
    ZZn6& operator/=(const ZZn&);
    ZZn6& operator/=(int);
    ZZn6& conj() {b=-b; return *this;}

    friend ZZn6 operator+(const ZZn6&,const ZZn6&);
    friend ZZn6 operator+(const ZZn6&,const ZZn3&);
    friend ZZn6 operator+(const ZZn6&,const ZZn&);
    friend ZZn6 operator-(const ZZn6&,const ZZn6&);
    friend ZZn6 operator-(const ZZn6&,const ZZn3&);
    friend ZZn6 operator-(const ZZn6&,const ZZn&);
    friend ZZn6 operator-(const ZZn6&);

    friend ZZn6 operator*(const ZZn6&,const ZZn6&);
    friend ZZn6 operator*(const ZZn6&,const ZZn3&);
    friend ZZn6 operator*(const ZZn6&,const ZZn&);
    friend ZZn6 operator*(const ZZn&,const ZZn6&);
    friend ZZn6 operator*(const ZZn3&,const ZZn6&);

    friend ZZn6 operator*(int,const ZZn6&);
    friend ZZn6 operator*(const ZZn6&,int);

    friend ZZn6 operator/(const ZZn6&,const ZZn6&);
    friend ZZn6 operator/(const ZZn6&,const ZZn3&);
    friend ZZn6 operator/(const ZZn6&,const ZZn&);
    friend ZZn6 operator/(const ZZn6&,int);

    friend ZZn3  real(const ZZn6& x)      {return x.a;}
    friend ZZn3  imaginary(const ZZn6& x) {return x.b;}

    friend ZZn6 pow(const ZZn6&,const Big&);
    friend ZZn6 powu(const ZZn6&,const Big&);
    friend ZZn6 pow(int,const ZZn6*,const Big*);
    friend ZZn6 powl(const ZZn6&,const Big&);
    friend ZZn6 conj(const ZZn6&);
    friend ZZn6 inverse(const ZZn6&);

    friend ZZn6 randn6(void);        // random ZZn6
    friend BOOL qr(const ZZn6&);
    friend ZZn6 sqrt(const ZZn6&);   // square root - 0 if none exists

    friend BOOL operator==(const ZZn6& x,const ZZn6& y)
    {if (x.a==y.a && x.b==y.b) return TRUE; else return FALSE; }

    friend BOOL operator!=(const ZZn6& x,const ZZn6& y)
    {if (x.a!=y.a || x.b!=y.b) return TRUE; else return FALSE; }

#ifndef MR_NO_STANDARD_IO
    friend ostream& operator<<(ostream&,const ZZn6&);
#endif

    ~ZZn6()  {}
};

extern ZZn6 randn6(void);  

#endif

