/*
 *    MIRACL  C++ Implementation file ecn3.cpp
 *
 *    AUTHOR  : M. Scott
 *  
 *    PURPOSE : Implementation of class ECn3  (Elliptic curves over n^3)
 *
 * WARNING: This class has been cobbled together for a specific use with
 * the MIRACL library. It is not complete, and may not work in other 
 * applications
 *
 *    Copyright (c) 2006 Shamus Software Ltd.
 */

#include "ecn3.h"

using namespace std;

void ECn3::get(ZZn3& a,ZZn3& b)
{a=x;b=y;}

void ECn3::get(ZZn3& a)
{a=x;}

BOOL ECn3::set(const ZZn3& xx,const ZZn3& yy)
{ 
  int qnr;
  BOOL twist;
  miracl *mip=get_mip();
  twist=mip->TWIST;
  qnr=-mip->cnr;
  if (twist)
  {
     if (yy*yy != xx*xx*xx+qnr*qnr*getA()*xx+(qnr*qnr*qnr)*getB()) return FALSE;
  }
  else
  {  
    if (yy*yy != xx*xx*xx+getA()*xx+getB()) return FALSE;
  }
  x=xx;
  y=yy;
  marker=MR_EPOINT_GENERAL;
  return TRUE;
}

BOOL ECn3::set(const ZZn3& xx)
{ 
  int qnr;
  BOOL twist;
  ZZn3 w;
  miracl *mip=get_mip();
  twist=mip->TWIST;
  qnr=-mip->cnr;
  if (twist)
  {
    w=xx*xx*xx+qnr*qnr*getA()*xx+(qnr*qnr*qnr)*getB();   
  }
  else
  {
    w=xx*xx*xx+getA()*xx+getB();
  }
 if (!w.iszero())
 {
   w=sqrt(w); 
   if (w.iszero()) return FALSE;

 }
 x=xx;
 y=w;

 marker=MR_EPOINT_GENERAL;
 return TRUE;
}

ECn3 operator-(const ECn3& a) 
{ECn3 w; 
 if (a.marker!=MR_EPOINT_INFINITY) 
   {w.x=a.x; w.y=-a.y; w.marker=a.marker;} 
 return w; 
}  

ECn3& ECn3::operator*=(const Big& k)
{
    int i,j,n,nb,nbs,nzs;
    ECn3 p2,pt,t[11];
    Big h,kk;

    if (k==0)
    {
        clear();
        return *this;
    }
    if (k==1)
    {
        return (*this);
    }

    pt=*this;
    kk=k;
    if (kk<0)
    {
        pt=-pt;
        kk=-kk;
    }
    h=3*kk;

    p2=pt+pt; 
    t[0]=pt;
    for (i=1;i<=10;i++)
        t[i]=t[i-1]+p2;

// Left to Right method

    nb=bits(h);
    for (i=nb-2;i>=1;)
    {
        n=naf_window(kk,h,i,&nbs,&nzs);
        for (j=0;j<nbs;j++) pt+=pt;
        if (n>0) pt+=t[n/2];
        if (n<0) pt-=t[(-n)/2];
        i-=nbs;
        if (nzs)
        {
            for (j=0;j<nzs;j++) pt+=pt;
            i-=nzs;
        }
    }
    *this=pt;
    return *this;
}

ECn3 operator*(const Big& r,const ECn3& P)
{
    ECn3 T=P;
    T*=r;
    return T;
}

ostream& operator<<(ostream& s,ECn3& b)
{
    ZZn3 x,y;
    if (b.iszero())
        s << "(Infinity)";
    else
    {
        b.get(x,y);
        s << "(" << x << "," << y << ")";
    }
    return s;
}

ECn3 operator+(const ECn3& a,const ECn3& b)
{ECn3 c=a; c+=b; return c;}

ECn3 operator-(const ECn3& a,const ECn3& b)
{ECn3 c=a; c-=b; return c;}

ECn3& ECn3::operator-=(const ECn3& z)
{ECn3 t=(-z); *this+=t; return *this; }

ECn3& ECn3::operator+=(const ECn3& z)
{
    ZZn3 lam;
    add(z,lam);
    return *this;
}

BOOL ECn3::add(const ECn3& z,ZZn3& lam)
{
    miracl *mip=get_mip();
    BOOL twist=mip->TWIST;
    int qnr=-mip->cnr;

    if (marker==MR_EPOINT_INFINITY)
    {
        *this=z;
        return FALSE;
    }
    if (z.marker==MR_EPOINT_INFINITY)
    {
        return FALSE;
    }


    if (x!=z.x)
    {
        ZZn3 t=y;  t-=z.y;
        ZZn3 t2=x; t2-=z.x;    
        lam=t; lam/=t2;

        x+=z.x; t=lam; t*=t; t-=x; x=t;   
        y=z.x; y-=x; y*=lam; y-=z.y;   

    }
    else
    {
        if (y!=z.y || y.iszero())
        {
            clear();
            lam=(ZZn3)1;       // any non-zero value
            return TRUE;     
        }
        ZZn3 t=x;
        ZZn3 t2=x;

     //   lam=(3*(x*x)+getA())/(y+y);

        lam=x;
        lam*=lam;
        lam*=3;
        if (twist)
        {
           lam+=qnr*qnr*getA();
        }
        else
        {
            lam+=getA();
        }
        lam/=(y+y);    
        t2+=x;
        x=lam;
        x*=x;
        x-=t2;
         
        t-=x;
        t*=lam;
        t-=y;
        y=t;            
    }

    marker=MR_EPOINT_GENERAL;    
    return TRUE;
}

