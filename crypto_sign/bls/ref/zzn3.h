/*
 *    MIRACL  C++ Header file ZZn3.h
 *
 *    AUTHOR  : M. Scott
 *
 *    NOTE:   : Must be used in conjunction with zzn3.cpp big.cpp and zzn.cpp
 *            : An element looks like (a+bc+cx^2)
 *            : where x is the cube root of -2.
 *
 *    PURPOSE : Definition of class ZZn3  (Arithmetic over n^3)
 *
 * WARNING: This class has been cobbled together for a specific use with
 * the MIRACL library. It is not complete, and may not work in other 
 * applications
 *
 *    Note: This code assumes that x^3+cnr is irreducible for some small n;
 *
 *    Copyright (c) 2006 Shamus Software Ltd.
 */

#ifndef ZZN3_H
#define ZZN3_H

#include "zzn.h"

extern void init_zzn3(Big&);

class ZZn3
{
    ZZn a,b,c;
public:
    ZZn3()   {}
    ZZn3(int w) {a=(ZZn)w; b=c=0;}
    ZZn3(const ZZn3& w) {a=w.a; b=w.b; c=w.c; }
    ZZn3(const ZZn &x,const ZZn& y,const ZZn& z) {a=x; b=y; c=z;}
    ZZn3(const ZZn &x) {a=x; b=c=0; }
    ZZn3(const Big &x) {a=(ZZn)x; b=c=0; }
    
    void set(const ZZn &x,const ZZn &y,const ZZn &z) {a=x; b=y; c=z;}
    void set(const ZZn &x) {a=x; b=c=0;}
    void set1(const ZZn &x) {b=x; a=c=0;}
    void set2(const ZZn &x) {c=x; a=b=0;}
    void set(const Big &x)  {a=(ZZn)x; b=c=0; }

    void get(ZZn &,ZZn &,ZZn &) ;
    void get(ZZn &) ;
    
    void clear() {a=b=c=0; }
    
    BOOL iszero()  const {if (a.iszero() && b.iszero() && c.iszero()) return TRUE; return FALSE; }
 //   BOOL isunity() const {if (a.isunity() && b.iszero() && c.iszero()) return TRUE; return FALSE; }
 //   BOOL isminusone() const {if (a.isminusone() && b.iszero()) return TRUE; return FALSE; }

    ZZn3& powq(void);
    ZZn3& operator=(int i) {a=i; b=c=0; return *this;}
    ZZn3& operator=(const ZZn& x) {a=x; b=c=0; return *this; }
    ZZn3& operator=(const ZZn3& x) {a=x.a; b=x.b; c=x.c; return *this; }
    ZZn3& operator+=(const ZZn& x) {a+=x; return *this; }
    ZZn3& operator+=(const ZZn3& x) {a+=x.a; b+=x.b; c+=x.c; return *this; }
    ZZn3& operator-=(const ZZn& x) {a-=x;  return *this; }
    ZZn3& operator-=(const ZZn3& x) {a-=x.a; b-=x.b; c-=x.c; return *this; }
    ZZn3& operator*=(const ZZn3&); 
    ZZn3& operator*=(const ZZn& x) {a*=x; b*=x; c*=x;return *this; }
    ZZn3& operator*=(int x) {a*=x; b*=x; c*=x; return *this;}
    ZZn3& operator/=(const ZZn3&); 
    ZZn3& operator/=(const ZZn&);
    ZZn3& operator/=(int);
   
    friend ZZn3 operator+(const ZZn3&,const ZZn3&);
    friend ZZn3 operator+(const ZZn3&,const ZZn&);
    friend ZZn3 operator-(const ZZn3&,const ZZn3&);
    friend ZZn3 operator-(const ZZn3&,const ZZn&);
    friend ZZn3 operator-(const ZZn3&);

    friend ZZn3 operator*(const ZZn3&,const ZZn3&);
    friend ZZn3 operator*(const ZZn3&,const ZZn&);
    friend ZZn3 operator*(const ZZn&,const ZZn3&);

    friend ZZn3 operator*(int,const ZZn3&);
    friend ZZn3 operator*(const ZZn3&,int);

    friend ZZn3 operator/(const ZZn3&,const ZZn3&);
    friend ZZn3 operator/(const ZZn3&,const ZZn&);
    friend ZZn3 operator/(const ZZn3&,int);

    friend ZZn3 pow(const ZZn3&,const Big&);
    friend ZZn3 pow(int,const ZZn3*,const Big*);
    friend ZZn3 powl(const ZZn3&,const Big&);
    friend ZZn3 inverse(const ZZn3&);

    friend ZZn3 randn3(void);        // random ZZn3
    friend ZZn3 tx(const ZZn3&);     // multiply a+bx+cx^2 by x
    friend ZZn3 txd(const ZZn3&);    // divide a+bx+cx^2 by x
    friend BOOL qr(const ZZn3&);     // quadratic residue
    friend BOOL is_on_curve(const ZZn3&);
    friend ZZn3 sqrt(const ZZn3&);   // square root - 0 if none exists

    friend BOOL operator==(const ZZn3& x,const ZZn3& y)
    {if (x.a==y.a && x.b==y.b && x.c==y.c) return TRUE; else return FALSE; }

    friend BOOL operator!=(const ZZn3& x,const ZZn3& y)
    {if (x.a!=y.a || x.b!=y.b || x.c!=y.c) return TRUE; else return FALSE; }

#ifndef MR_NO_STANDARD_IO
    friend ostream& operator<<(ostream&,const ZZn3&);
#endif

    ~ZZn3()  {}
};

extern ZZn3 randn3(void);

#endif

