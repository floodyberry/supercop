/*
 *    MIRACL  C++  functions ecn.cpp
 *
 *    AUTHOR  :    M. Scott
 *             
 *    PURPOSE :    Implementation of class ECn functions using Montgomery
 *                 representation
 *    NOTE    :    Must be used in conjunction with big.h and big.cpp
 *
 *    Copyright (c) 1988-2004 Shamus Software Ltd.
 */

#include "ecn.h"

int ECn::get(Big& x,Big& y) const 
        {return epoint_get(p,x.getbig(),y.getbig());}
int ECn::get(Big& x) const   
        {return epoint_get(p,x.getbig(),x.getbig());}
void ECn::getx(Big &x) const
        {epoint_getxyz(p,x.getbig(),NULL,NULL);}
void ECn::getxy(Big &x,Big &y) const
        {epoint_getxyz(p,x.getbig(),y.getbig(),NULL);}
void ECn::getxyz(Big &x,Big &y, Big &z) const
        {epoint_getxyz(p,x.getbig(),y.getbig(),z.getbig());}


BOOL ECn::iszero() const
        {if (p->marker==MR_EPOINT_INFINITY) return TRUE; return FALSE;}

epoint * ECn::get_point() const
{ return p; }

ECn operator-(const ECn& e)
{ ECn t=e; epoint_negate(t.p); return t;}

ECn mul(const Big& e1,const ECn& p1,const Big& e2,const ECn& p2)
{ 
    ECn t; 
    ecurve_mult2(e1.getbig(),p1.get_point(),e2.getbig(),p2.get_point(),t.get_point());
    return t;
}

ECn operator*(const Big& e,const ECn& b)
{
    ECn t;
    ecurve_mult(e.getbig(),b.p,t.p);
    return t;
}

#ifndef MR_STATIC

ECn mul(int n,const Big *y,ECn *x)
{
    ECn w;
    int i;
    big *a=(big *)mr_alloc(n,sizeof(big));
    epoint **b=(epoint **)mr_alloc(n,sizeof(epoint *));
    for (i=0;i<n;i++)
    {
        a[i]=y[i].getbig();
        b[i]=x[i].p;
    }
    ecurve_multn(n,a,b,w.p);

    mr_free(b);
    mr_free(a);
    return w;  
}

void multi_add(int m,ECn *x, ECn *w)
{
    int i;
    epoint **xp=(epoint **)mr_alloc(m,sizeof(epoint *));
    epoint **wp=(epoint **)mr_alloc(m,sizeof(epoint *));
    for (i=0;i<m;i++)
    {
        xp[i]=x[i].p;
        wp[i]=w[i].p;
    }
    ecurve_multi_add(m,xp,wp);
    mr_free(wp);
    mr_free(xp);
}

#endif

void double_add(ECn& A,ECn& B,ECn& C,ECn& D,big& s1,big& s2)
{
    ecurve_double_add(A.p,B.p,C.p,D.p,&s1,&s2);
}

#ifndef MR_NO_STANDARD_IO

ostream& operator<<(ostream& s,const ECn& b)
{
    Big x,y;
    if (b.iszero())
        s << "(Infinity)";
    else
    {
        b.get(x,y);
        s << "(" << x << "," << y << ")";
    }
    return s;
}

#endif

void ecurve(const Big& a,const Big& b,const Big& p,int t)
{
    ecurve_init(a.fn,b.fn,p.fn,t);
}

#ifndef MR_NOSUPPORT_COMPRESSION

BOOL is_on_curve(const Big& a)
{ return epoint_x(a.fn);}

#endif
