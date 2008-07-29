/*
 *    MIRACL  C++ Implementation file zzn3.cpp
 *
 *    AUTHOR  : M. Scott
 *  
 *    PURPOSE : Implementation of class ZZn3  (Arithmetic over n^3)
 *
 * WARNING: This class has been cobbled together for a specific use with
 * the MIRACL library. It is not complete, and may not work in other 
 * applications
 *
 * Assumes p=1 mod 3
 * Irreducible is x^3+cnr
 *
 *    Copyright (c) 2006 Shamus Software Ltd.
 */

#include "zzn3.h"

using namespace std;

// First find a cubic non-residue cnr, which is also a quadratic non-residue
// X is precalculated sixth root of unity (cnr)^(p-1)/6 

void init_zzn3(Big &p)
{
    int cnr;
    ZZn X;
    miracl *mip=get_mip();
    modulo(p);

    cnr=2;
    forever
    {
        if (pow((ZZn)cnr,(p-1)/3)!=1 && pow((ZZn)cnr,(p-1)/2)!=1) break;
        cnr=-cnr;
        if (pow((ZZn)cnr,(p-1)/3)!=1 && pow((ZZn)cnr,(p-1)/2)!=1) break;
        cnr=-cnr;
        cnr++;
    }
    X=pow((ZZn)cnr,(p-1)/6);
    mip->cnr=-cnr;
    copy(X.getzzn(),mip->sru);
}

// Frobenius

ZZn3& ZZn3::powq(void)
{ 
    Big p=get_modulus();
    miracl *mip=get_mip();
    ZZn x;
    copy(mip->sru,x.getzzn());
    x*=x;
    b*=x;
    c*=x;
    c*=x;
    return *this;
}

void ZZn3::get(ZZn& x,ZZn& y,ZZn& z)  
{x=a; y=b; z=c;} 

void ZZn3::get(ZZn& x) 
{x=a;}

ZZn3& ZZn3::operator*=(const ZZn3& x)
{ // optimized to reduce constructor/destructor calls
 int cnr=mr_mip->cnr;
 if (&x==this)
 { // Chung-Hasan SQR2
    ZZn A,B,C,D;
    A=a; A*=A;
    B=b*c; B+=B;
    C=c; C*=C;
    D=a*b; D+=D;
    c+=(a+b); c*=c;

    a=A-cnr*B;
    b=D-cnr*C;
    c-=(A+B+C+D);
 }
 else
 { // Karatsuba

    ZZn Z0,Z1,Z2,Z3,Z4,T0,T1;
    Z0=a*x.a;
    Z2=b*x.b;
    Z4=c*x.c;
    T0=a+b;
    T1=x.a+x.b;
    Z1=T0*T1;
    Z1-=Z0;
    Z1-=Z2;
    T0=b+c;
    T1=x.b+x.c;
    Z3=T0*T1;
    Z3-=Z2;
    Z3-=Z4;
    T0=a+c;
    T1=x.a+x.c;
    T0*=T1;
    Z2+=T0;
    Z2-=Z0;
    Z2-=Z4;

    a=Z0-cnr*Z3;
    b=Z1-cnr*Z4;
    c=Z2;
 }
 return *this;
}

ZZn3& ZZn3::operator/=(const ZZn& x)
{
    ZZn t=(ZZn)1/x;
    a*=t;
    b*=t;
    c*=t;
    return *this;
}

ZZn3& ZZn3::operator/=(int i)
{
    ZZn t=(ZZn)1/i;
    a*=t;
    b*=t;
    c*=t;
    return *this;
}

ZZn3& ZZn3::operator/=(const ZZn3& x)
{
 *this*=inverse(x);
 return *this;
}

// Lim & Hwang 

ZZn3 inverse(const ZZn3& w)
{
    ZZn3 y;
    int cnr=get_mip()->cnr;
    ZZn f0;

    y.a=w.a*w.a+cnr*w.b*w.c;
    y.b=-cnr*(w.c*w.c)-w.a*w.b;
    y.c=w.b*w.b-w.a*w.c;

    f0=-cnr*w.b*y.c+w.a*y.a-cnr*w.c*y.b;
    f0=(ZZn)1/f0;

    y.c*=f0;
    y.b*=f0;
    y.a*=f0;

    return y;
}

ZZn3 operator+(const ZZn3& x,const ZZn3& y) 
{ZZn3 w=x; w.a+=y.a; w.b+=y.b; w.c+=y.c; return w; } 

ZZn3 operator+(const ZZn3& x,const ZZn& y) 
{ZZn3 w=x; w.a+=y; return w; } 

ZZn3 operator-(const ZZn3& x,const ZZn3& y) 
{ZZn3 w=x; w.a-=y.a; w.b-=y.b; w.c-=y.c; return w; } 

ZZn3 operator-(const ZZn3& x,const ZZn& y) 
{ZZn3 w=x; w.a-=y; return w; } 

ZZn3 operator-(const ZZn3& x) 
{ZZn3 w; w.a=-x.a; w.b=-x.b; w.c=-x.c; return w; } 

ZZn3 operator*(const ZZn3& x,const ZZn3& y)
{
 ZZn3 w=x;  
 if (&x==&y) w*=w;
 else        w*=y;  
 return w;
}

ZZn3 operator*(const ZZn3& x,const ZZn& y)
{ZZn3 w=x; w*=y; return w;}

ZZn3 operator*(const ZZn& y,const ZZn3& x)
{ZZn3 w=x; w*=y; return w;}

ZZn3 operator*(const ZZn3& x,int y)
{ZZn3 w=x; w*=y; return w;}

ZZn3 operator*(int y,const ZZn3& x)
{ZZn3 w=x; w*=y; return w;}

ZZn3 operator/(const ZZn3& x,const ZZn3& y)
{ZZn3 w=x; w/=y; return w;}

ZZn3 operator/(const ZZn3& x,const ZZn& y)
{ZZn3 w=x; w/=y; return w;}

ZZn3 operator/(const ZZn3& x,int i)
{ZZn3 w=x; w/=i; return w;}

ZZn3 randn3(void)
{ZZn3 w; w.a=randn(); w.b=randn(); w.c=randn(); return w;}

BOOL is_on_curve(const ZZn3& x)
{
    ZZn3 w;
    BOOL twist=get_mip()->TWIST;
    int qnr=-get_mip()->cnr;    // the cubic non-residue is also a quadratic non-residue

    if (twist)
    {
        w=x*x*x+qnr*qnr*getA()*x+qnr*qnr*qnr*getB();
    }
    else
    {
        w=x*x*x+getA()*x+getB();
    }
    if (qr(w)) return TRUE;
    return FALSE;
}

BOOL qr(const ZZn3& x)
{
    Big p=get_modulus();
    ZZn3 r,t;
    
    t=r=x;
    t.powq();
    r*=t;
    t.powq();
    r*=t;

    if (pow(r,(p-1)/2)==1) return TRUE;
    else return FALSE;
}

ZZn3 sqrt(const ZZn3& x)
{
    ZZn3 r,w,t;
    Big p=get_modulus();

    if (!qr(x)) return r;


// oh boy this is clever! 

    switch (get_mip()->pmod8)
    {
    case 5:
        r=(x+x);
        r.powq(); 
        w=r*r; t=w*r; w*=t;
        r.powq();
        r*=(w*(x+x));
        r=pow(r,(p-5)/8);
        r*=t;
        w=r*r; w*=x; w+=w;
        r*=x; r*=(w-(ZZn)1); 
        break;
    case 3:
    case 7:
        r=x;
        r.powq();
        t=r*r;
        w=t*r;
        r.powq();
        r*=(w*x);
        r=pow(r,(p-3)/4);
        r*=(t*x);
        break;
    default: break;
    }

    return r;
}

ZZn3 tx(const ZZn3& w)
{
    ZZn3 u=w;
    
    ZZn t=u.a;
    u.a=-(get_mip()->cnr*u.c);
    u.c=u.b;
    u.b=t;

    return u;
}

ZZn3 txd(const ZZn3& w)
{
    ZZn3 u=w;
    
    ZZn t=u.c;
    u.c=-(u.a/get_mip()->cnr);
    u.a= u.b;
    u.b = t;

    return u;
}

// regular ZZn3 powering

ZZn3 pow(const ZZn3& x,const Big& k)
{
    int i,j,nb,n,nbw,nzs;
    ZZn3 u,u2,t[16];
    if (k==0) return (ZZn3)1;
    u=x;
    if (k==1) return u;
//
// Prepare table for windowing
//
    u2=(u*u);
    t[0]=u;
   
    for (i=1;i<16;i++)
        t[i]=u2*t[i-1];

// Left to right method - with windows

    nb=bits(k);
    if (nb>1) for (i=nb-2;i>=0;)
    {
        n=window(k,i,&nbw,&nzs);
        for (j=0;j<nbw;j++) u*=u;
        if (n>0) u*=t[n/2];
        i-=nbw;
        if (nzs)
        {
            for (j=0;j<nzs;j++) u*=u;
            i-=nzs;
        }
    }
    return u;
}

ZZn3 powl(const ZZn3& x,const Big& k)
{
    ZZn3 w8,w9,two,y;
    int i,nb;

    two=(ZZn)2;
    y=two*x;
    if (k==0)  return (ZZn3)two;
    if (k==1)  return y;

    w8=two;
    w9=y;
    nb=bits(k);
    for (i=nb-1;i>=0;i--)
    {
        if (bit(k,i))
        {
            w8*=w9; w8-=y; w9*=w9; w9-=two;
        }
        else
        {
            w9*=w8; w9-=y; w8*=w8; w8-=two;
        }
    }
    return (w8/2);
}

#ifndef MR_NO_STANDARD_IO

ostream& operator<<(ostream& s,const ZZn3& xx)
{
    ZZn3 b=xx;
    ZZn x,y,z;
    b.get(x,y,z);
    s << "[" << x << "," << y << "," << z << "]";
    return s;    
}

#endif

