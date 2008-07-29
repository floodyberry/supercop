/*
 *    MIRACL  C++ Implementation file ZZn6.cpp
 *
 *    AUTHOR  : M. Scott
 *  
 *    PURPOSE : Implementation of class ZZn6  (Arithmetic over n^6)
 *
 * WARNING: This class has been cobbled together for a specific use with
 * the MIRACL library. It is not complete, and may not work in other 
 * applications
 *
 *    Copyright (c) 2006 Shamus Software Ltd.
 */

#include "zzn6.h"

using namespace std;

void init_zzn6(Big &p)
{
   init_zzn3(p);
}

// Frobenius

ZZn6& ZZn6::powq(void)
{ 
    ZZn X;
    copy(get_mip()->sru,X.getzzn());
    a.powq(); b.powq();
    b*=X;
    return *this;
}

void ZZn6::get(ZZn3& x,ZZn3& y)  
{x=a; y=b;} 

void ZZn6::get(ZZn3& x) 
{x=a; }

ZZn6& ZZn6::operator*=(const ZZn6& x)
{ // optimized to reduce constructor/destructor calls
 if (&x==this)
 {
    ZZn3 t=a; t+=b;
    ZZn3 t2=a; t2+=tx(b);
    t*=t2;
    b*=a;
    t-=b;
    t-=tx(b);
    b+=b;
    a=t;
 }
 else
 {
    ZZn3 ac=a; ac*=x.a;
    ZZn3 bd=b; bd*=x.b;
    ZZn3 t=x.a; t+=x.b;
    b+=a; b*=t; b-=ac; b-=bd;
    a=ac; a+=tx(bd);
 }
 return *this;
}

ZZn6& ZZn6::operator/=(const ZZn3& x)
{
    *this*=inverse(x);
    return *this;
}

ZZn6& ZZn6::operator/=(const ZZn& x)
{
    ZZn t=(ZZn)1/x;
    a*=t;
    b*=t;
    return *this;
}

ZZn6& ZZn6::operator/=(int i)
{
    ZZn t=(ZZn)1/i;
    a*=t;
    b*=t;
    return *this;
}

ZZn6& ZZn6::operator/=(const ZZn6& x)
{
 *this*=inverse(x);
 return *this;
}

ZZn6 inverse(const ZZn6& w)
{
    ZZn6 y=conj(w);
    ZZn3 u=w.a;
    ZZn3 v=w.b;
    u*=u;
    v*=v;
    u-=tx(v);
    u=inverse(u);
    y*=u;
    return y;
}

ZZn6 operator+(const ZZn6& x,const ZZn6& y) 
{ZZn6 w=x; w.a+=y.a; w.b+=y.b; return w; } 

ZZn6 operator+(const ZZn6& x,const ZZn3& y) 
{ZZn6 w=x; w.a+=y; return w; } 

ZZn6 operator+(const ZZn6& x,const ZZn& y) 
{ZZn6 w=x; w.a+=y; return w; } 

ZZn6 operator-(const ZZn6& x,const ZZn6& y) 
{ZZn6 w=x; w.a-=y.a; w.b-=y.b; return w; } 

ZZn6 operator-(const ZZn6& x,const ZZn3& y) 
{ZZn6 w=x; w.a-=y; return w; } 

ZZn6 operator-(const ZZn6& x,const ZZn& y) 
{ZZn6 w=x; w.a-=y; return w; } 

ZZn6 operator-(const ZZn6& x) 
{ZZn6 w; w.a=-x.a; w.b=-x.b; return w; } 

ZZn6 operator*(const ZZn6& x,const ZZn6& y)
{
 ZZn6 w=x;  
 if (&x==&y) w*=w;
 else        w*=y;  
 return w;
}

ZZn6 operator*(const ZZn6& x,const ZZn3& y)
{ZZn6 w=x; w*=y; return w;}

ZZn6 operator*(const ZZn6& x,const ZZn& y)
{ZZn6 w=x; w*=y; return w;}

ZZn6 operator*(const ZZn3& y,const ZZn6& x)
{ZZn6 w=x; w*=y; return w;}

ZZn6 operator*(const ZZn& y,const ZZn6& x)
{ZZn6 w=x; w*=y; return w;}

ZZn6 operator*(const ZZn6& x,int y)
{ZZn6 w=x; w*=y; return w;}

ZZn6 operator*(int y,const ZZn6& x)
{ZZn6 w=x; w*=y; return w;}

ZZn6 operator/(const ZZn6& x,const ZZn6& y)
{ZZn6 w=x; w/=y; return w;}

ZZn6 operator/(const ZZn6& x,const ZZn3& y)
{ZZn6 w=x; w/=y; return w;}

ZZn6 operator/(const ZZn6& x,const ZZn& y)
{ZZn6 w=x; w/=y; return w;}

ZZn6 operator/(const ZZn6& x,int i)
{ZZn6 w=x; w/=i; return w;}

ZZn6 randn6(void)
{ZZn6 w; w.a=randn3(); w.b=randn3(); return w;}

BOOL qr(const ZZn6& x)
{
    ZZn3 a,s;
    if (x.iszero()) return TRUE;
    if (x.b.iszero()) return TRUE;
    s=x.b; s*=s; 
    a=x.a; a*=a; a-=tx(s);
    if (!qr(a)) return FALSE;
    return TRUE;
/*
    s=sqrt(a);
    if (qr((x.a+s)/2) || qr((x.a-s)/2)) return TRUE;
    exit(0);
    return FALSE;
*/
}

ZZn6 sqrt(const ZZn6& x)
{
// sqrt(a+xb) = sqrt((a+sqrt(a*a-n*b*b))/2)+x.b/(2*sqrt((a+sqrt(a*a-n*b*b))/2))
// sqrt(a) = x.sqrt(a/n)
// where x*x=n

    ZZn6 w;
    ZZn3 a,s,t;
    if (x.iszero()) return w;

    if (x.b.iszero())
    {
        if (qr(x.a))
        {
            s=sqrt(x.a);
            w.a=s; w.b=0;
        }
        else
        {
            s=sqrt(txd(x.a));
            w.a=0; w.b=s;
        }
        return w;
    }

    s=x.b; s*=s; 
    a=x.a; a*=a; a-=tx(s);
    s=sqrt(a);

    if (s.iszero()) return w;


    if (qr((x.a+s)/2))
    {
        a=sqrt((x.a+s)/2);
    }
    else
    {
        a=sqrt((x.a-s)/2);
        if (a.iszero()) return w;
    }

    w.a=a;
    w.b=x.b/(2*a);

    return w;
}

ZZn6 conj(const ZZn6& x)
{
    ZZn6 u=x;
    u.conj();
    return u;
}

// ZZn6 powering of unitary elements

ZZn6 powu(const ZZn6& x,const Big& k)
{
    int i,j,nb,n,nbw,nzs;
    ZZn6 u,u2,t[11];
    Big k3;
    if (k==0) return (ZZn6)1;
    u=x;
    if (k==1) return u;
//
// Prepare table for windowing
//
    k3=3*k;
    u2=(u*u);
    t[0]=u;

    for (i=1;i<=10;i++)
        t[i]=u2*t[i-1];

    nb=bits(k3);
    for (i=nb-2;i>=1;)
    {
        n=naf_window(k,k3,i,&nbw,&nzs);

        for (j=0;j<nbw;j++) u*=u;
        if (n>0) u*=t[n/2];
        if (n<0) u*=conj(t[(-n)/2]);
        i-=nbw;
        if (nzs)
        {
            for (j=0;j<nzs;j++) u*=u;
            i-=nzs;
        }
    }
    return u;
}

// regular ZZn6 powering - but see powl function in ZZn3.h

ZZn6 pow(const ZZn6& x,const Big& k)
{
    int i,j,nb,n,nbw,nzs;
    ZZn6 u,u2,t[16];
    if (k==0) return (ZZn6)1;
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

// standard MIRACL multi-exponentiation

ZZn6 pow(int n,const ZZn6* x,const Big* b)
{
    int k,j,i,m,nb,ea;
    ZZn6 *G;
    ZZn6 r;
    m=1<<n;
    G=new ZZn6[m];
    
    for (i=0,k=1;i<n;i++)
    {
        for (j=0; j < (1<<i) ;j++)
        {
            if (j==0)   G[k]=x[i];
            else        G[k]=G[j]*x[i];      
            k++;
        }
    }

    nb=0;
    for (j=0;j<n;j++) 
        if ((k=bits(b[j]))>nb) nb=k;

    r=1;
    for (i=nb-1;i>=0;i--) 
    {
        ea=0;
        k=1;
        for (j=0;j<n;j++)
        {
            if (bit(b[j],i)) ea+=k;
            k<<=1;
        }
        r*=r;
        if (ea!=0) r*=G[ea];
    }
    delete [] G;
    return r;
}

#ifndef MR_NO_STANDARD_IO

ostream& operator<<(ostream& s,const ZZn6& xx)
{
    ZZn6 b=xx;
    ZZn3 x,y;
    b.get(x,y);
    s << "[" << x << "," << y << "]";
    return s;    
}

#endif

