/*
 *    MIRACL  C++ Header file big.h
 *
 *    AUTHOR  :    N.Coghlan
 *                 Modified by M.Scott
 *             
 *    PURPOSE :    Definition of class Big
 *
 *   Bigs are normally created on the heap, but by defining BIGS=m
 *   on the compiler command line, Bigs are instead mostly created from the 
 *   stack. Note that m must be same or less than the n in the main program 
 *   with for example 
 *
 *   Miracl precison(n,0); 
 *
 *   where n is the (fixed) size in words of each Big.
 *
 *   This may be faster, as C++ tends to create and destroy lots of 
 *   temporaries. Especially recommended if m is small. Do not use
 *   for program development
 *
 *   However Bigs created from a string are always allocated from the heap.
 *   This is useful for creating large read-only constants which are larger 
 *   than m. 
 *
 *   NOTE:- I/O conversion
 *
 *   To convert a hex character string to a Big
 *
 *         Big x;
 *         char c[100];
 *
 *         mip->IOBASE=16;
 *         x=c;
 *
 *   To convert a Big to a hex character string
 * 
 *         mip->IOBASE=16;
 *         c << x;
 *
 *   To convert to/from pure binary, see the from_binary()
 *   and to_binary() friend functions.
 *
 *   int len;
 *   char c[100];
 *   ...
 *   Big x=from_binary(len,c);  // creates Big x from len bytes of binary in c 
 *
 *   len=to_binary(x,100,c,FALSE); // converts Big x to len bytes binary in c[100] 
 *   len=to_binary(x,100,c,TRUE);  // converts Big x to len bytes binary in c[100] 
 *                                 // (right justified with leading zeros)
 *                              
 *   Copyright (c) 1988-2001 Shamus Software Ltd.
 */

#ifndef BIG_H
#define BIG_H

#include <cstdlib>
#include <cmath>
#include <cstdio>

extern "C"                    
{
    #include "miracl.h"
}

#ifndef MR_NO_STANDARD_IO
#include <iostream>
using std::istream;
using std::ostream;
#endif

#ifndef MIRACL_CLASS
#define MIRACL_CLASS

#ifdef __cplusplus
#ifdef MR_GENERIC_MT
#error "The generic method isn't supported for C++, its C only"
#endif
#endif

#ifndef MR_STATIC
class Miracl
{ /* dummy class to initialise MIRACL - MUST be called before any Bigs    *
   * are created. This could be a problem for static/global data declared *
   * in modules other than the main module */
    miracl *mr;
public:
    Miracl(int nd,mr_small nb=0)
                                 {mr=mirsys(nd,nb);mr->RPOINT=TRUE;}
    miracl *operator&() {return mr;}
    ~Miracl()                    {mirexit();}
};
#endif

#endif

/*
#ifdef BIGS
#define MR_INIT_BIG memset(mem,0,mr_big_reserve(1,BIGS)); fn=(big)mirvar_mem_variable(mem,0,BIGS);
#else
#define MR_INIT_BIG mem=(char *)memalloc(1); fn=(big)mirvar_mem(mem,0);
#endif
*/

#ifdef BIGS
#define MR_INIT_BIG fn=&b; b.w=a; b.len=0; for (int i=0;i<BIGS;i++) a[i]=0;
#else
#define MR_INIT_BIG fn=mirvar(0);
#endif

class Big 
{
    big fn;

/*
#ifdef BIGS
    char mem[mr_big_reserve(1,BIGS)];
#else
    char *mem;
#endif
*/

#ifdef BIGS
    mr_small a[BIGS];
    bigtype b;
#endif

public:

    Big()        {MR_INIT_BIG } 
    Big(int j)   {MR_INIT_BIG convert(j,fn); }
    Big(unsigned int j) {MR_INIT_BIG uconvert(j,fn); }
    
#ifdef mr_dltype
  #ifndef MR_DLTYPE_IS_INT
    Big(mr_dltype dl) {MR_INIT_BIG dlconv(dl,fn);}
  #endif
#else
    Big(long lg) {MR_INIT_BIG lgconv(lg,fn);}
#endif
    Big(char* s) {MR_INIT_BIG cinstr(fn,s);}
    Big(big& c)  {MR_INIT_BIG copy(c,fn);}
    Big(const Big& c)  {MR_INIT_BIG copy(c.fn,fn);}
    Big(big* c)  { fn=*c; }

    Big& operator=(int i)  {convert(i,fn); return *this;}

#ifdef mr_dltype
  #ifndef MR_DLTYPE_IS_INT
    Big& operator=(mr_dltype dl){dlconv(dl,fn); return *this;}
  #endif
#else
    Big& operator=(long lg){lgconv(lg,fn); return *this;}
#endif

    Big& operator=(mr_small s) {fn->len=1; fn->w[0]=s; return *this;}
    Big& operator=(const Big& b) {copy(b.fn,fn); return *this;}
    Big& operator=(big& b) {copy(b,fn); return *this;}
    Big& operator=(big* b) {fn=*b; return *this;}

    Big& operator=(char* s){cinstr(fn,s);return *this;}

    Big& operator++()      {incr(fn,1,fn); return *this;}
    Big& operator--()      {decr(fn,1,fn); return *this;}
    Big& operator+=(int i) {incr(fn,i,fn); return *this;}
    Big& operator+=(const Big& b){add(fn,b.fn,fn); return *this;}

    Big& operator-=(int i)  {decr(fn,i,fn); return *this;}
    Big& operator-=(const Big& b) {subtract(fn,b.fn,fn); return *this;}

    Big& operator*=(int i)  {premult(fn,i,fn); return *this;}
    Big& operator*=(const Big& b) {multiply(fn,b.fn,fn); return *this;}

    Big& operator/=(int i)  {subdiv(fn,i,fn);    return *this;}
    Big& operator/=(const Big& b) {divide(fn,b.fn,fn); return *this;}

    Big& operator%=(int i)  {convert(subdiv(fn,i,fn),fn); return *this;}
    Big& operator%=(const Big& b) {divide(fn,b.fn,b.fn); return *this;}

    Big& operator<<=(int i) {sftbit(fn,i,fn); return *this;}
    Big& operator>>=(int i) {sftbit(fn,-i,fn); return *this;}

    Big& shift(int n) {mr_shift(fn,n,fn); return *this;}

    mr_small& operator[](int i) {return fn->w[i];}

    void negate() const;
    BOOL iszero() const;
    BOOL isone() const;
    int get(int index)          { int m; m=getdig(fn,index); return m; }
    void set(int index,int n)   { putdig(n,fn,index);}
    int len() const; 
    
    big getbig() const;

    friend class Flash;

    friend Big operator-(const Big&);

    friend Big operator+(const Big&,int);
    friend Big operator+(int,const Big&);
    friend Big operator+(const Big&,const Big&);

    friend Big operator-(const Big&, int);
    friend Big operator-(int,const Big&);
    friend Big operator-(const Big&,const Big&);

    friend Big operator*(const Big&, int);
    friend Big operator*(int,const Big&);
    friend Big operator*(const Big&,const Big&);

  //  friend BOOL fmt(int n,const Big&,const Big&,Big&);   // fast mult - top half

    friend Big operator/(const Big&,int);
    friend Big operator/(const Big&,const Big&);

    friend int operator%(const Big&, int);
    friend Big operator%(const Big&, const Big&);

    friend Big operator<<(const Big&, int);
    friend Big operator>>(const Big&, int);

    friend BOOL operator<=(const Big& b1,const Big& b2)
             {if (compare(b1.fn,b2.fn)<=0) return TRUE; else return FALSE;}
    friend BOOL operator>=(const Big& b1,const Big& b2)
             {if (compare(b1.fn,b2.fn)>=0) return TRUE; else return FALSE;}
    friend BOOL operator==(const Big& b1,const Big& b2)
             {if (compare(b1.fn,b2.fn)==0) return TRUE; else return FALSE;}
    friend BOOL operator!=(const Big& b1,const Big& b2)
             {if (compare(b1.fn,b2.fn)!=0) return TRUE; else return FALSE;}
    friend BOOL operator<(const Big& b1,const Big& b2)
              {if (compare(b1.fn,b2.fn)<0) return TRUE; else return FALSE;}
    friend BOOL operator>(const Big& b1,const Big& b2)
              {if (compare(b1.fn,b2.fn)>0) return TRUE; else return FALSE;}

    friend Big from_binary(int,char *);
    friend int to_binary(const Big&,int,char *,BOOL justify=FALSE);
    friend Big modmult(const Big&,const Big&,const Big&);
    friend Big mad(const Big&,const Big&,const Big&,const Big&,Big&);
    friend Big norm(const Big&);
    friend Big sqrt(const Big&);
    friend Big root(const Big&,int);
    friend Big gcd(const Big&,const Big&);

    friend Big pow(const Big&,int);               // x^m
    friend Big pow(const Big&, int, const Big&);  // x^m mod n
    friend Big pow(int, const Big&, const Big&);  // x^m mod n
    friend Big pow(const Big&, const Big&, const Big&);  // x^m mod n
    friend Big pow(const Big&, const Big&, const Big&, const Big&, const Big&);
                                                         // x^m.y^k mod n 
    friend Big pow(int,Big *,Big *,Big);  // x[0]^m[0].x[1].m[1]... mod n

//    friend Big luc(const Big& ,const Big&, const Big&, Big *b4=NULL);
    friend Big inverse(const Big&, const Big&);
    friend void multi_inverse(int,Big*,const Big&,Big *);
    friend Big rand(const Big&);     // 0 < rand < parameter
    friend Big rand(int,int);        // (digits,base) e.g. (1024,2)
//    friend Big strong_rand(csprng *,const Big&);
//    friend Big strong_rand(csprng *,int,int);
    friend Big abs(const Big&);
    friend int bit(const Big& b,int i)  {return mr_testbit(b.fn,i);}
    friend int bits(const Big& b) {return logb2(b.fn);}
    friend int ham(const Big& b)  {return hamming(b.fn);}
    friend int jacobi(const Big& b1,const Big& b2) {return jack(b1.fn,b2.fn);}
    friend int toint(const Big& b)  {return size(b.fn);} 
    friend BOOL prime(const Big& b) {return isprime(b.fn);}  
    friend Big nextprime(const Big&);
    friend Big nextsafeprime(int type,int subset,const Big&);
    friend Big trial_divide(const Big& b);
    friend BOOL small_factors(const Big& b);
    friend BOOL perfect_power(const Big& b);
    friend Big sqrt(const Big&,const Big&);

    friend void ecurve(const Big&,const Big&,const Big&,int);
    friend BOOL ecurve2(int,int,int,int,const Big&,const Big&,BOOL,int); 
    friend BOOL is_on_curve(const Big&);
    friend void modulo(const Big&);
    friend BOOL modulo(int,int,int,int,BOOL);
    friend Big get_modulus(void);
    friend int window(const Big&,int,int*,int*);
    friend int naf_window(const Big&,const Big&,int,int*,int*);

/* Montgomery stuff */
/*
    friend Big nres(const Big&);
    friend Big redc(const Big&);
    friend Big nres_negate(const Big&);
    friend Big nres_modmult(const Big&,const Big&);
    friend Big nres_premult(const Big&,int);
    friend Big nres_pow(const Big&,const Big&);
    friend Big nres_pow2(const Big&,const Big&,const Big&,const Big&);
    friend Big nres_pown(int,Big *,Big *);
    friend Big nres_luc(const Big&,const Big&,Big *b3=NULL);
    friend Big nres_sqrt(const Big&);
    friend Big nres_modadd(const Big&,const Big&);
    friend Big nres_modsub(const Big&,const Big&);
    friend Big nres_moddiv(const Big&,const Big&);
*/
/* these are faster.... */
/*
    friend void nres_modmult(Big& a,const Big& b,Big& c)
        {nres_modmult(a.fn,b.fn,c.fn);}
    friend void nres_modadd(Big& a,const Big& b,Big& c)
        {nres_modadd(a.fn,b.fn,c.fn);}
    friend void nres_modsub(Big& a,const Big& b,Big& c)
        {nres_modsub(a.fn,b.fn,c.fn);}
    friend void nres_negate(Big& a,Big& b)
        {nres_negate(a.fn,b.fn);} 
    friend void nres_premult(Big& a,int b,Big& c)
        {nres_premult(a.fn,b,c.fn);}
    friend void nres_moddiv(Big & a,const Big& b,Big& c)
        {nres_moddiv(a.fn,b.fn,c.fn);}
*/       
    friend Big shift(const Big&b,int n);
    friend int length(const Big&b);


/* Note that when inputting text as a number the CR is NOT   *
 * included in the text, unlike C I/O which does include CR. */

#ifndef MR_NO_STANDARD_IO

    friend istream& operator>>(istream&, Big&);
    friend ostream& operator<<(ostream&, const Big&);
    friend ostream& otfloat(ostream&,const Big&,int);

#endif

// output Big to a String
    friend char * operator<<(char * s,const Big&);

    ~Big() {
        // zero(fn);
#ifndef BIGS
        mr_free(fn); 
#endif
    }
};

extern BOOL modulo(int,int,int,int,BOOL);
extern Big get_modulus(void);
extern Big rand(int,int); 
extern int to_binary(const Big&,int,char *,BOOL);
extern Big from_binary(int,char *);
//extern Big strong_rand(csprng *,int,int);

#endif

