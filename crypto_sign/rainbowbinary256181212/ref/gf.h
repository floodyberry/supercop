#ifndef _GF_H
#define _GF_H

#include <emmintrin.h>
#include <cstdlib>
#include <cstdio>
#include <ctype.h>
#include <string.h>


typedef unsigned char byte;

template <unsigned p> struct gf;

template <unsigned p>
inline const gf<p> _mul( const gf<p> &a , const gf<p> &b);

template <unsigned p>
inline const gf <p> _inv( const gf <p> &a );

template <unsigned p>
struct gf
{
	byte v;
	inline gf<p>() {}
	inline gf<p>(const gf<p>& a):v(a.v){}
	inline gf<p>(const byte &a):v(a){}

	inline gf<p>& operator=(const gf<p> &b) {v=b.v; return *this;}
	inline gf<p>& operator+=(const gf<p> &b) { v^=b.v; return *this;}
	inline gf<p>& operator-=(const gf<p> &b) { v^=b.v; return *this;}
	inline gf<p>& operator*=(const gf<p> &b) {return *this = _mul<p>(*this,b); }

	inline const gf<p> operator+(const gf<p> &b) const {return v^b.v;}
	inline const gf<p> operator-(const gf<p> &b) const {return v^b.v;}
	inline const gf<p> operator-() const {return v;}
	inline const gf<p> operator*(const gf<p> &b) const {return _mul<p>(*this,b); }

	inline const gf<p> inv() const { return _inv<p>(*this); }

	inline bool operator==(const gf<p> &b) const {return !(v^b.v);}
	inline bool operator!=(const gf<p> &b) const {return v^b.v;}

	inline operator bool() const {return v;}

	static inline const gf<p> rand() {return (::rand()&(p-1));}
};

template <unsigned p> struct gfv_unit;

template <unsigned p>
inline const gfv_unit<p> _mul( const gfv_unit<p> &a , const gf<p> & b );

template <unsigned p>
inline const gfv_unit<p> _mul( const gfv_unit<p> & a, const gfv_unit<p> &b );

template <unsigned p>
struct gfv_unit
{
	static const unsigned N=16;
	__m128i v;
	
	inline gfv_unit<p>(){}
	inline gfv_unit<p>(const gfv_unit<p>& a):v(a.v){}
	inline gfv_unit<p>(const __m128i& a):v(a){}
	inline gfv_unit<p>(const gf<p>& a):v(_mm_set1_epi8(a.v)){}

	inline gfv_unit<p>& operator=(const gfv_unit<p> &b) { v=b.v; return *this;}
	inline gfv_unit<p>& operator+=(const gfv_unit<p> &b) { v=_mm_xor_si128(v, b.v); return *this;}
	inline const gfv_unit<p> operator+(const gfv_unit<p> &b) const {return _mm_xor_si128(v, b.v);}
	inline gfv_unit<p>& operator-=(const gfv_unit<p> &b) { v=_mm_xor_si128(v, b.v); return *this;}
	inline const gfv_unit<p> operator-(const gfv_unit<p> &b) const {return _mm_xor_si128(v, b.v);}
	inline const gfv_unit<p> operator-() const {return v;}

	inline gfv_unit<p>& operator*=(const gf<p> &b) { return *this=_mul(*this,b); }
	inline const gfv_unit<p> operator*(const gf<p> &b) const { gfv_unit<p> r=(*this); r*=b; return r; }
	inline gfv_unit<p>& operator*=(const gfv_unit<p> &b) { return *this=_mul(*this,b); }
	inline const gfv_unit<p> operator*(const gfv_unit<p>&b) const {gfv_unit<p> r=(*this); r*=b; return r;}

	inline bool is_zero() const { __m128i a=_mm_or_si128(v,_mm_srli_si128(v,8)); return 0==_mm_cvtsi128_si32(_mm_or_si128(a,_mm_srli_si128(a,4))); }
	inline const gf<p> add_up() const { __m128i tmp = _mm_xor_si128( v , _mm_srli_si128(v,8)); tmp = _mm_xor_si128( tmp , _mm_srli_si128( tmp , 4)); tmp = _mm_xor_si128( tmp , _mm_srli_si128( tmp , 2)); return ((unsigned char*)&tmp)[0] ^ ((unsigned char*)&tmp)[1]; }
	inline void set( unsigned i, const gf<p> & a ) { ((unsigned char*)&v)[i]=a.v; }
	inline const gf<p> operator[](unsigned i) const {return ((unsigned char*)&v)[i];}
	
	void dump(FILE * fp) const { for(unsigned i=0;i<N;i++) fprintf(fp,"%02X ",(int)((*this)[i].v)); fprintf(fp,"\n");}
	static inline const gfv_unit<p> rand() { return _mm_set_epi32(::rand(),::rand(),::rand(),::rand()); }
	unsigned set(FILE * fp);
};

template <unsigned p>
unsigned gfv_unit<p>::set(FILE * fp )
{
	union{
	unsigned char u8[16];
	unsigned u32[4];
	};
	u32[3]=u32[2]=u32[1]=u32[0]=0;
	unsigned n_read=0;
	char c;
	for( c=fgetc(fp); c!= '\n' && c!=EOF && n_read<16; c=fgetc(fp)) {
		if( !isdigit(c) ) continue;
		ungetc(c,fp);
		unsigned ttt=0; fscanf(fp,"%d",&ttt);
		u8[n_read++]=ttt;
	}
	v = _mm_set_epi32( u32[3] , u32[2] , u32[1] , u32[0] );
	if( n_read == 16 ) ungetc(c,fp);
	return n_read;
}


template <unsigned p,unsigned n>
struct gfv
{
	typedef gfv_unit<p> unit;
	static const unsigned M = (n+unit::N-1)/unit::N;

	unit c[M];

	inline gfv<p,n>(){}
	inline gfv<p,n>(const gfv<p,n>& a){ for(unsigned i=M;i--;) c[i]=a.c[i]; }
	inline gfv<p,n>(const gf<p>& a) {for(unsigned i=M;i--;) c[i]=a; }

	inline gfv<p,n>& operator=(const gfv<p,n> &b) { for(unsigned i=M;i--;)c[i]=b.c[i]; return *this;}
	inline gfv<p,n>& operator+=(const gfv<p,n> &b) { for(unsigned i=M;i--;) c[i] +=b.c[i]; return *this;}
	inline const gfv<p,n> operator+(const gfv<p,n> &b) const {gfv<p,n> r=(*this); r+=b; return r;}
	inline gfv<p,n>& operator-=(const gfv<p,n> &b) { for(unsigned i=M;i--;) c[i] +=b.c[i]; return *this;}
	inline const gfv<p,n> operator-(const gfv<p,n> &b) const {gfv<p,n> r=(*this); r+=b; return r;}
	inline const gfv<p,n> operator-() const {return (*this);}

	inline gfv<p,n>& operator*=(const gf<p> &b) { for(unsigned i=M;i--;) c[i]*=b; return *this; }
	inline gfv<p,n>& operator*=(const gfv<p,n>&b) { for(unsigned i=M;i--;) c[i]*=b.c[i];return *this; }
	inline const gfv<p,n> operator*(const gf<p> &b) const { gfv<p,n> r=(*this); r*=b; return r; }
	inline const gfv<p,n> operator*(const gfv<p,n>&b) const { gfv<p,n> r=(*this); r*=b; return r; }

	inline void set_zero() { for(unsigned i=M;i--;) c[i]=_mm_setzero_si128(); }
	inline void set( unsigned i, const gf<p> & a ) { c[i>>4].set(i&15,a); }
	inline const gf<p> operator[](unsigned i) const {return (c[i>>4])[i&15]; }

	inline bool is_zero() const {
		unit u; u.v=_mm_setzero_si128();
		if( n&15 ) { u.v=_mm_slli_si128(c[M-1].v,16-(n&15)); for(unsigned i=M-1;i--;) u.v=_mm_or_si128(u.v,c[i].v); }
		else { for(unsigned i=M;i--;) u.v=_mm_or_si128(u.v,c[i].v); }
		return u.is_zero();
	}

	inline const gf<p> dot( const gfv<p,n> &b) const { 
		gfv<p,n> rv=(*this)*b;
//		gf<p> r=rv[0]; for(unsigned i=1;i<n;i++) r+=rv[i]; return r;
		if( n&15 ) rv.c[M-1].v=_mm_slli_si128(rv.c[M-1].v,16-(n&15));
		for(unsigned i=1;i<M;i++) rv.c[0] += rv.c[i];
		return rv.c[0].add_up(); 
	}

	void dump(FILE * fp) const { for(unsigned i=0;i<n;i++) fprintf(fp,"%02X ",(int)((*this)[i].v)); fprintf(fp,"\n"); }
	static inline const gfv<p,n> rand() { gfv<p,n> r; for(unsigned i=M;i--;) r.c[i]=unit::rand(); if(n&15) r.c[M-1].v=_mm_srli_si128(r.c[M-1].v,16-(n&15)); return r; }

	template <unsigned n2>
	inline void coerceTo( gfv<p,n2> & r ) const { for(unsigned i=((gfv<p,n2>::M)>M)?M:(gfv<p,n2>::M);i--;)r.c[i]=c[i]; }
	
	unsigned set( FILE * fp );
};

///XXX ??????????
template <unsigned p,unsigned n>
unsigned gfv<p,n>::set( FILE * fp )
{
	gfv_unit<p> ttt;
	unsigned n_read=0;
	while( c[n_read++].set(fp) == 16  ) {
		if( M==n_read ) { while( ttt.set(fp)==16 ) ; break; }
	}
	for(unsigned i=n_read; i<M ;i++) c[i]=_mm_setzero_si128();
	return n_read;
}




#ifndef NO_SSSE3
#include "gf16.h"
#include "gf256.h"
#endif


#endif
