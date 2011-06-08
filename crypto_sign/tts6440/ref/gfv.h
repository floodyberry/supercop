#ifndef _GFV_H
#define _GFV_H
#include <emmintrin.h>
#include "gf.h"

template <unsigned p> struct gfv{
	__m128i v;

	static const unsigned short R = 65536 / p;
	inline gfv<p>(){}
	inline gfv<p>(const gfv<p>& a):v(a.v){}
	inline gfv<p>(const __m128i& a):v(a){}
	inline gfv<p>(const gf<p>& a):v(_mm_set1_epi16(a.v)){}
	inline gfv<p>& operator=(const gfv<p> &b) {v=b.v; return *this;}
	inline gfv<p>& operator+=(const gfv<p> &b) {return *this = *this + b;}
	inline gfv<p>& operator-=(const gfv<p> &b) {return *this = *this - b;}
	inline gfv<p>& operator*=(const gfv<p> &b) {return *this = *this * b;}
	inline gfv<p>& operator/=(const gfv<p> &b) {return *this = *this / b;}

	inline const gfv<p> operator+(const gfv<p> &b) const {return _mm_add_epi16(this->v, b.v);}
	inline const gfv<p> operator-(const gfv<p> &b) const {return _mm_sub_epi16(this->v, b.v);}
	inline const gfv<p> operator*(const gfv<p> &b) const {return _mm_mullo_epi16(this->v, b.v);}
	inline const gfv<p> operator/(const gfv<p> &b) const {return *this * invertv(reducev(b));}
	inline const gfv<p> operator-() const {return _mm_sub_epi16(_mm_setzero_si128(), this->v);}

	inline const gf<p> operator[](unsigned i) const {return ((short *)&v)[i];}
};

template <unsigned p> inline const gfv<p> reducev(const gfv<p> &a);
template <unsigned p> inline const gfv<p> principalv(const gfv<p> &a);
template <unsigned p> inline const gfv<p> invertv(const gfv<p> &a); /* use with caution, A must be reduced. */

template <unsigned p> inline const gfv<p> reducev(const gfv<p> &a){
	return _mm_sub_epi16(a.v, _mm_mullo_epi16(_mm_mulhi_epi16(_mm_add_epi16(a.v, _mm_set1_epi16((p-1)/2)), _mm_set1_epi16(gfv<p>::R)), _mm_set1_epi16(p)));
}

template <> inline const gfv<31> reducev(const gfv<31> &a){
	return _mm_sub_epi16(a.v, _mm_mullo_epi16(_mm_mulhi_epi16(_mm_add_epi16(a.v, _mm_set1_epi16(16)), _mm_set1_epi16(gfv<31>::R)), _mm_set1_epi16(31)));
}

template <> inline const gfv<31> principalv(const gfv<31> &a){
	gfv<31> tmp = reducev(a);
	return _mm_sub_epi16(tmp.v, _mm_mullo_epi16(_mm_mulhi_epi16(_mm_add_epi16(tmp.v, _mm_set1_epi16(15)), _mm_set1_epi16(gfv<31>::R)), _mm_set1_epi16(31)));
}

template <> inline const gfv<31> invertv(const gfv<31> &a){
	gfv<31> result = reducev(a * a * a);
	result = reducev(a * result * result);
	result = reducev(result * result);	
	return reducev(a * result * result);
}

#endif
