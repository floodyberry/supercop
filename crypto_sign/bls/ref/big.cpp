/*
 *    MIRACL  C++ functions big.cpp
 *
 *    AUTHOR  :    N.Coghlan
 *                 Modified by M.Scott
 *             
 *    PURPOSE :    Implementation of class Big functions
 *
 *   Copyright (c) 1988-1997 Shamus Software Ltd.
 */

#include "big.h"

void Big::negate() const
         { negify(fn,fn); }
big Big::getbig() const         
         { return fn;}
BOOL Big::iszero() const
         { if (size(fn)==0) return TRUE; return FALSE;}
BOOL Big::isone() const
         { if (size(fn)==1) return TRUE; return FALSE;}
int Big::len() const
         { return numdig(fn); }

Big operator-(const Big& b)
{Big nb; negify(b.fn,nb.fn); return nb;}
Big operator+(const Big& b,int i)
{Big abi; incr(b.fn, i, abi.fn); return abi;}
Big operator+(int i,const Big& b)
{Big aib; incr(b.fn, i, aib.fn); return aib;}
Big operator+(const Big& b1, const Big& b2)
{Big abb;add(b1.fn,b2.fn,abb.fn);return abb;}

Big operator-(const Big& b, int i)
{Big mbi; decr(b.fn, i, mbi.fn); return mbi;}
Big operator-(int i, const Big& b)
{Big mib;decr(b.fn, i, mib.fn);negify(mib.fn,mib.fn);return mib;}
Big operator-(const Big& b1, const Big& b2)
{Big mbb; subtract(b1.fn,b2.fn,mbb.fn); return mbb;}

Big operator*(const Big& b, int i)
{Big xbi; premult(b.fn, i, xbi.fn); return xbi;}
Big operator*(int i, const Big& b)
{Big xib; premult(b.fn, i, xib.fn); return xib;}
Big operator*(const Big& b1, const Big& b2)
{Big xbb; multiply(b1.fn,b2.fn,xbb.fn); return xbb;}

//#ifndef MR_STATIC
//BOOL fmt(int n,const Big& b1,const Big& b2,Big& f)
//{
//#ifdef MR_KCM
// return kcm_top(n,b1.fn,b2.fn,f.fn);       /* see mrkcm.tpl */
//#else
// return fastmultop(n,b1.fn,b2.fn,f.fn);    /* see mrfast.c  */
//#endif
//}
//#endif

Big operator/(const Big& b, int i)
{Big dbi; subdiv(b.fn, i, dbi.fn); return dbi;}
Big operator/(const Big& b1, const Big& b2)
{Big dbb; copy(b1.fn,dbb.fn); divide(dbb.fn,b2.fn,dbb.fn); return dbb;}

int operator%(const Big& b, int i)
{Big mdbi; return(subdiv(b.fn,i, mdbi.fn));}
Big operator%(const Big& b1, const Big& b2)
{Big mdbb;copy(b1.fn,mdbb.fn);divide(mdbb.fn,b2.fn,b2.fn);return mdbb;}

Big operator<<(const Big& b, int i)
{Big ms; sftbit(b.fn,i,ms.fn); return ms;}

Big operator>>(const Big& b, int i)
{Big ms; sftbit(b.fn,-i,ms.fn); return ms;}


Big from_binary(int len,char *ptr)
{Big z; bytes_to_big(len,ptr,z.fn); return z;}
int to_binary(const Big& b,int max,char *ptr,BOOL justify)
{ return big_to_bytes(max,b.fn,ptr,justify);}

Big modmult(const Big& b1,const Big& b2,const Big& m)
{Big z; mad(b1.fn,b2.fn,b2.fn,m.fn,m.fn,z.fn); return z;}
Big mad(const Big& b1,const Big& b2,const Big& b3,const Big& m,Big &r)
{Big q; mad(b1.fn,b2.fn,b3.fn,m.fn,q.fn,r.fn); return q;}

Big norm(const Big& b) {Big z; normalise(b.fn,z.fn); return z;}
Big sqrt(const Big& b) {Big z; nroot(b.fn, 2, z.fn); return z;}
Big abs(const Big& b) {Big z; absol(b.fn,z.fn); return z;}
Big root(const Big &b,int n) {Big z; nroot(b.fn, n, z.fn); return z;}
Big gcd(const Big& b1, const Big& b2){Big z;egcd(b1.fn,b2.fn,z.fn);return z;}
Big pow(const Big& b,int n)
{Big z;int x; 
if (mr_abs(x=size(b.fn))<MR_TOOBIG) expint(x,n,z.fn);
              else power(b.fn,n,z.fn,z.fn);return z;}
Big pow(const Big& b1,int n, const Big& b3)
{Big z; power(b1.fn,n,b3.fn,z.fn); return z;}
Big pow(int x, const Big& b2, const Big& b3)
{Big z; powltr(x,b2.fn,b3.fn,z.fn); return z;}
Big pow(const Big& b1, const Big& b2, const Big& b3)
{Big z; powmod(b1.fn,b2.fn,b3.fn,z.fn); return z;}
Big pow(const Big& b1,const Big& b2,const Big& b3,const Big& b4,const Big& b5)
{Big z; powmod2(b1.fn,b2.fn,b3.fn,b4.fn,b5.fn,z.fn); return z;}

#ifndef MR_STATIC

void multi_inverse(int m,Big *a,const Big& n,Big *b)
{
    int i;
    big *x=(big *)mr_alloc(m,sizeof(big));
    big *y=(big *)mr_alloc(m,sizeof(big));
    for (i=0;i<m;i++)
    {
        x[i]=a[i].fn;
        y[i]=b[i].fn;
    }
    multi_inverse(m,x,n.fn,y);
    mr_free(y);  mr_free(x);
}

Big pow(int n,Big *a,Big *b,Big p)
{
    Big z;
    int i;
    big *x=(big *)mr_alloc(n,sizeof(big));
    big *y=(big *)mr_alloc(n,sizeof(big));
    for (i=0;i<n;i++)
    {
        x[i]=a[i].fn;
        y[i]=b[i].fn;
    }
    powmodn(n,x,y,p.fn,z.fn);
    mr_free(y);  mr_free(x);
    return z;
}

#endif

//Big luc(const Big& b1,const Big& b2,const Big& b3,Big *b4)
//{Big z; if (b4!=NULL) lucas(b1.fn,b2.fn,b3.fn,b4->fn,z.fn); 
//        else          lucas(b1.fn,b2.fn,b3.fn,z.fn,z.fn);
//return z;}


Big inverse(const Big& b1, const Big& b2)
{Big z; xgcd(b1.fn,b2.fn,z.fn,z.fn,z.fn);return z;}

Big rand(const Big& b) {Big z; bigrand(b.fn,z.fn); return z;}
Big rand(int n,int b) {Big z; bigdig(n,b,z.fn);  return z;}

//Big strong_rand(csprng *rng,const Big& b) {Big z; strong_bigrand(rng,b.fn,z.fn); return z;}
//Big strong_rand(csprng *rng,int n,int b) {Big z; strong_bigdig(rng,n,b,z.fn);  return z;}

Big nextprime(const Big& b) {Big z; nxprime(b.fn,z.fn); return z;}
Big nextsafeprime(int type,int subset,const Big& b) {Big z; 
nxsafeprime(type,subset,b.fn,z.fn); return z; }
Big trial_divide(const Big& b) {Big r; trial_division(b.fn,r.fn); return r;}
BOOL small_factors(const Big& b)
{if (trial_division(b.fn,b.fn)==0) return TRUE; return FALSE;}
BOOL perfect_power(const Big& b)
{int i;
 miracl *mip=get_mip();
 if (size(b.fn)<4) return FALSE;
 for (i=2;;i++)
 {
    if (nroot(b.fn,i,mip->w8)) return TRUE;
    if (size(mip->w8)<=1) break;
 }   
 return FALSE; 
}


Big sqrt(const Big& x,const Big& p) {Big z; sqroot(x.fn,p.fn,z.fn); return z;}

void modulo(const Big& n) {prepare_monty(n.fn);}
Big get_modulus()      
{Big m; 
miracl *mip=get_mip();
copy(mip->modulus,m.fn); 
return m;}


/* 

Big nres(const Big& b) {Big z; nres(b.fn,z.fn); return z;}
Big redc(const Big& b) {Big z;  redc(b.fn,z.fn);return z;}
Big nres_negate(const Big& b)
{ Big z; nres_negate(b.fn,z.fn); return z;}
Big nres_modmult(const Big& b1,const Big& b2)
{ Big z; nres_modmult(b1.fn,b2.fn,z.fn); return z;}
Big nres_premult(const Big& b1,int i)
{ Big z; nres_premult(b1.fn,i,z.fn); return z;}

Big nres_modadd(const Big& b1,const Big& b2)
{ Big z; nres_modadd(b1.fn,b2.fn,z.fn); return z;}
Big nres_modsub(const Big& b1,const Big& b2)
{ Big z; nres_modsub(b1.fn,b2.fn,z.fn); return z;}
Big nres_moddiv(const Big& b1,const Big& b2)
{ Big z; nres_moddiv(b1.fn,b2.fn,z.fn); return z;}
Big nres_pow(const Big& b1,const Big& b2)
{ Big z; nres_powmod(b1.fn,b2.fn,z.fn); return z;}




Big nres_pow2(const Big& b1,const Big& b2,const Big& b3,const Big& b4)
{ Big z; nres_powmod2(b1.fn,b2.fn,b3.fn,b4.fn,z.fn); return z;}


Big nres_pown(int n,Big *a,Big *b)
{
    Big z;
    int i;
    big *x=(big *)mr_alloc(n,sizeof(big));
    big *y=(big *)mr_alloc(n,sizeof(big));
    for (i=0;i<n;i++)
    {
        x[i]=a[i].fn;
        y[i]=b[i].fn;
    }
    nres_powmodn(n,x,y,z.fn);
    mr_free(y);  mr_free(x);
    return z;
}

Big nres_luc(const Big& b1,const Big& b2,Big *b3)
{ Big z; if (b3!=NULL) nres_lucas(b1.fn,b2.fn,b3->fn,z.fn); 
         else          nres_lucas(b1.fn,b2.fn,z.fn,z.fn);
  return z;}

Big nres_sqrt(const Big& b)
{ Big z; nres_sqroot(b.fn,z.fn); return z;}
*/

Big shift(const Big&b,int n)
{
    Big r;
    mr_shift(b.fn,n,r.fn);
    return r;
}

int length(const Big& b)
{                     
    return mr_lent(b.fn);
}

/* Note that when inputting text as a number the CR is NOT   *
 * included in the text, unlike C I/O which does include CR. */

#ifndef MR_NO_STANDARD_IO

istream& operator>>(istream& s, Big& x)
{ 
  miracl *mip=get_mip();
  if (mip->IOBASE>60) 
  {
     s.sync(); 
     s.getline(mip->IOBUFF,mip->IOBSIZ);
  }
  else s >> mip->IOBUFF;
  if (s.eof() || s.bad()) 
  {   
      zero(x.fn); 
      return s; 
  }
  cinstr(x.fn,mip->IOBUFF); 
  return s;
}

#endif

int window(const Big& x,int i,int *nbs,int *nzs)
{ /* returns sliding window value, max. of 5 bits,         *
   * starting at i-th bit of big x. nbs is number of bits  *
   * processed, nzs is the number of additional trailing   *
   * zeros detected. Returns valid bit pattern 1x..x1 with *
   * no two adjacent 0's. So 10101 will return 21 with     *
   * nbs=5, nzs=0. 11001 will return 3, with nbs=2, nzs=2, *
   * having stopped after the first 11..  */

    return mr_window(x.fn,i,nbs,nzs);
}

int naf_window(const Big& x,const Big& x3,int i,int *nbs,int *nzs)
{ /* returns sliding window value, max of 5 bits           *
   * starting at i-th bit of x. nbs is number of bits      *
   * processed. nzs is number of additional trailing       *    
   * zeros detected. x and x3 (which is 3*x) are           *
   * combined to produce the NAF (non-adjacent form)       *
   * So if x=11011(27) and x3 is 1010001, the LSB is       *
   * ignored and the value 100T0T (32-4-1=27) processed,   *
   * where T is -1. Note x.P = (3x-x)/2.P. This value will *
   * return +7, with nbs=4 and nzs=1, having stopped after *
   * the first 4 bits. Note in an NAF non-zero elements    *
   * are never side by side, so 10T10T won't happen        */


    return mr_naf_window(x.fn,x3.fn,i,nbs,nzs);
}

#ifndef MR_NO_STANDARD_IO

ostream& operator<<(ostream& s, const Big& x)
{
    miracl *mip=get_mip();
    cotstr(x.fn,mip->IOBUFF); 
    s << mip->IOBUFF; 
    return s;
}

#ifdef MR_FLASH

ostream& otfloat(ostream& s,const Big& m,int e)
{
    miracl *mip=get_mip();
    copy(m.fn,mip->w5);

    convert(1,mip->w6);
    copy(mip->w6,mip->w9);
    mr_shift(mip->w6,mr_lent(m.fn),mip->w6);
    mround(mip->w5,mip->w6,mip->w8);
    if (e>=-2 && e<=2)
    {
        if (e>0)
        {
            mr_shift(mip->w9,e,mip->w9);
            fmul(mip->w8,mip->w9,mip->w8);
        }
        else
        {
            mr_shift(mip->w9,-e,mip->w9);
            fdiv(mip->w8,mip->w9,mip->w8);
        }
     
        cotstr(mip->w8,mip->IOBUFF);
        s << mip->IOBUFF;
    }
    else
    {
        cotstr(mip->w8,mip->IOBUFF);
        s << mip->IOBUFF;
        s << ".2^" << e*MIRACL; 
    }

    return s;
}

#endif

#endif

char* operator<<(char *s,const Big& x)
{
    miracl *mip=get_mip();
    int i,n=cotstr(x.fn,mip->IOBUFF);
    if (s!=mip->IOBUFF) for (i=0;i<=n;i++) s[i]=mip->IOBUFF[i];
    return s;
}

