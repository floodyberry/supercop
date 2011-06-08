#ifndef _TRANSPOSE8_H
#define _TRANSPOSE8_H
#include <emmintrin.h>

#define _transpose8(a,b,c,d,e,f,g,h) {\
	register __m128i a0, b0, c0, d0, e0, f0, g0, h0;\
	register __m128i a1, b1, c1, d1, e1, f1, g1, h1;\
\
	a0 = _mm_unpacklo_epi16(a, e);\
	b0 = _mm_unpacklo_epi16(b, f);\
	c0 = _mm_unpacklo_epi16(c, g);\
	d0 = _mm_unpacklo_epi16(d, h);\
	e0 = _mm_unpackhi_epi16(a, e);\
	f0 = _mm_unpackhi_epi16(b, f);\
	g0 = _mm_unpackhi_epi16(c, g);\
	h0 = _mm_unpackhi_epi16(d, h);\
\
	a1 = _mm_unpacklo_epi16(a0, c0);\
	b1 = _mm_unpacklo_epi16(b0, d0);\
	c1 = _mm_unpackhi_epi16(a0, c0);\
	d1 = _mm_unpackhi_epi16(b0, d0);\
	e1 = _mm_unpacklo_epi16(e0, g0);\
	f1 = _mm_unpacklo_epi16(f0, h0);\
	g1 = _mm_unpackhi_epi16(e0, g0);\
	h1 = _mm_unpackhi_epi16(f0, h0);\
\
	a = _mm_unpacklo_epi16(a1, b1);\
	b = _mm_unpackhi_epi16(a1, b1);\
	c = _mm_unpacklo_epi16(c1, d1);\
	d = _mm_unpackhi_epi16(c1, d1);\
	e = _mm_unpacklo_epi16(e1, f1);\
	f = _mm_unpackhi_epi16(e1, f1);\
	g = _mm_unpacklo_epi16(g1, h1);\
	h = _mm_unpackhi_epi16(g1, h1);\
}

inline void transpose8(__m128i t[8], const __m128i s[8]){
	register __m128i a=s[0],b=s[1],c=s[2],d=s[3],e=s[4],f=s[5],g=s[6],h=s[7];
	_transpose8(a,b,c,d,e,f,g,h);
	t[0]=a;t[1]=b;t[2]=c;t[3]=d;t[4]=e;t[5]=f;t[6]=g;t[7]=h;
}
#endif
