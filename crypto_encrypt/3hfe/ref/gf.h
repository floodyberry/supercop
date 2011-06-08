#ifndef _GF_H
#define _GF_H
#include <cstdlib>

template <unsigned p> struct gf;
template <unsigned p> inline const gf<p> reduce(const gf<p> &a){return a.v-((a.v+p/2)*gf<p>::R>>16)*p;}
template <unsigned p> inline const gf<p> principal(const gf<p> &a){short t = a%(short)p; return t<0?t+p:t;}
template <unsigned p> inline const gf<p> invert(const gf<p> &a){return gf<p>::inv_table[reduce(a).v];}

template <unsigned p> struct gf{
	short v;

	static const unsigned short R = 65536 / p;
	inline gf<p>(){}
	inline gf<p>(const gf<p>& a):v(a.v){}
	inline gf<p>(const short &a):v(a){}
	inline gf<p>& operator=(const gf<p> &b) {v=b.v; return *this;}
	inline gf<p>& operator+=(const gf<p> &b) {return *this = *this + b;}
	inline gf<p>& operator-=(const gf<p> &b) {return *this = *this - b;}
	inline gf<p>& operator*=(const gf<p> &b) {return *this = *this * b;}
	inline gf<p>& operator/=(const gf<p> &b) {return *this = *this / b;}

	inline const gf<p> operator+(const gf<p> &b) const {return v+b.v;}
	inline const gf<p> operator-(const gf<p> &b) const {return v-b.v;}
	inline const gf<p> operator*(const gf<p> &b) const {return v*b.v;}
	inline const gf<p> operator/(const gf<p> &b) const {return *this*invert(b);}
	inline const gf<p> operator-() const {return -v;}

	inline bool operator==(const gf<p> &b) const {return !(*this-b);}
	inline bool operator!=(const gf<p> &b) const {return *this-b;}

	inline operator bool() const {return reduce(*this).v;}

	static const short _inv_table[];
	static const short * const inv_table;

	static inline gf<p> rand() {return ::rand()%p-p/2;}
	static inline gf<p> rand_unit() {short tmp = ::rand()%(p-1)-p/2; return tmp<0?tmp:(tmp+1);}
};


template<> const short gf<31>::_inv_table[] = {1, -15, -10, 8, -6, -5, 9, 4, 7, -3, -14, 13, 12, -11, -2, 2, 11, -12, -13, 14, 3, -7, -4, -9, 5, 6, -8, 10, 15, -1, 0, 1, -15, -10, 8, -6, -5, 9, 4, 7, -3, -14, 13, 12, -11, -2, 2, 11, -12, -13, 14, 3, -7, -4, -9, 5, 6, -8, 10, 15, -1};
template<unsigned p> const short * const gf<p>::inv_table = _inv_table + p - 1;

#endif
