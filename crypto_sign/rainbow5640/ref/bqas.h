#ifndef _BQAS_H
#define _BQAS_H

#include <cstdio>
#include "gfv.h"

template <unsigned p, unsigned m> struct VEC{
	static unsigned const M = (m+7)/8;
	gfv<p> c[M];

	inline VEC<p,m>& operator= (const VEC<p,m> &b){for (unsigned i = M; i--;) c[i] = b.c[i]; return *this; }

	inline VEC<p,m>& operator+= (const VEC<p,m> &b){for (unsigned i = M; i--;) c[i] += b.c[i]; return *this;}
	inline VEC<p,m>& operator-= (const VEC<p,m> &b){for (unsigned i = M; i--;) c[i] -= b.c[i]; return *this;}
	inline VEC<p,m>& operator*= (const gf<p> &b){gfv<p> _b = b; for (unsigned i = M; i--;) c[i] *= _b; return *this;}
	inline VEC<p,m>& operator/= (const gf<p> &b){gfv<p> _b = invert(b); for (unsigned i = M; i--;) c[i] *= _b; return *this;}

	inline const VEC<p,m> operator+ (const VEC<p,m> &b) const {VEC<p,m> r = *this; return r+=b;}
	inline const VEC<p,m> operator- (const VEC<p,m> &b) const {VEC<p,m> r = *this; return r-=b;}
	inline const VEC<p,m> operator* (const gf<p> &b) const {VEC<p,m> r = *this; return r*=b;}
	inline const VEC<p,m> operator/ (const gf<p> &b) const {VEC<p,m> r = *this; return r/=b;}

	inline gf<p>& operator[](unsigned i) {return ((gf<p>*)c)[i];}
	inline const gf<p>& operator[](unsigned i) const {return ((const gf<p>*)c)[i];}

	inline void reduce() {for(unsigned i = M; i--;) c[i] = reducev(c[i]);}
	inline void principal(){for(unsigned i = M; i--;) c[i] = principalv(c[i]);}

	void dump(FILE *f) const;
};

template <unsigned p, unsigned m, unsigned n> struct MLPS : public VEC<p, m>{
	static unsigned const M = (m+7)/8;
	static unsigned const N = (n+7)/8;
	gfv<p> l[M][N*8];
	void dump(FILE *f) const;
};

template <unsigned p, unsigned m, unsigned n> void eval(VEC<p,m> *r, 
	const MLPS<p,m,n> *qq, const VEC<p,n> *w);

template <unsigned p, unsigned m, unsigned n> struct MQPS : public MLPS<p, m, n>{
	static unsigned const M = (m+7)/8;
	static unsigned const N = (n+7)/8;
	gfv<p> q[M][n*(n+1)/2];
};

template <unsigned p, unsigned m, unsigned n> void eval(VEC<p,m> *r, 
	const MQPS<p,m,n> *qq, const VEC<p,n> *w);

template <unsigned p, unsigned m, unsigned n> struct MQPSv2 {
	static unsigned const M = (m+3)/4;
	static unsigned const N = ((n+1)*(n+2)/2+7)/8*4;
	gfv<p> q[M][N];
};

template <unsigned p, unsigned m, unsigned n> void eval(VEC<p,m> *r, 
	const MQPSv2<p,m,n> *qq, const VEC<p,n> *w);

template <unsigned p, unsigned m, unsigned n> struct MQPSv3 {
	static unsigned const M = (m+3)/4;
	static unsigned const N = ((n+1)*(n+2)/2+23)/24*4;
	gfv<p> q[M][N];
};

template <unsigned p, unsigned m, unsigned n> void eval(VEC<p,m> *r, 
	const MQPSv3<p,m,n> *qq, const VEC<p,n> *w);

template <unsigned p, unsigned n> void zero_vec(VEC<p, n> *vec);
template <unsigned p, unsigned m, unsigned n> void zero_linear(MLPS<p,m,n> *mat);
template <unsigned p, unsigned m, unsigned n> void zero_quad(MQPS<p,m,n> *quad);

template <unsigned p, unsigned n> void rand_vec(VEC<p, n> *v);
template <unsigned p, unsigned n> void rand_affine_inv(MLPS<p, n, n> *m, MLPS<p, n, n> *inv);

#include <cstdio>
#include <cstdlib>
#include "bqas.h"
#include "transpose8.h"

template <unsigned m, unsigned n>
void eval(VEC<31,m> *r, const MLPS<31,m,n> *poly, const VEC<31,n> *w){
	for (unsigned k = MLPS<31,m,n>::M; k--;){
		r->c[k] = poly->c[k];
		for (unsigned i = n; i--;)
			r->c[k] += poly->l[k][i] * (*w)[i];
		r->c[k] = reducev(r->c[k]);
	}
}

template <unsigned m, unsigned n>
void eval(VEC<31,m> *r, const MQPS<31,m,n> *poly, const VEC<31,n> *w){
	for (unsigned k = MQPS<31,m,n>::M; k--;){
		r->c[k] = poly->c[k];
		for (unsigned i = n, l = n*(n+1)/2, j; (j=i--);){
			gfv<31> t = poly->l[k][i];
			while(j--)
				t += poly->q[k][--l] * (*w)[j];
			r->c[k] += reducev(t) * (*w)[i];
		}
		r->c[k] = reducev(r->c[k]);
	}
}

template <unsigned p, unsigned m, unsigned n> void eval(VEC<p,m> *r, const MQPSv2<p,m,n> *poly, const VEC<p,n> *w){
	static unsigned const N = ((n+1)*(n+2)/2+7)/8;

	__m128i wij[N];
	short *_wij = (short *)wij;
	*_wij++ = 1;
	for (unsigned i = 0; i < n; i++){
		short _wi = (*w)[i].v;
		const __m128i wi = _mm_set1_epi16(_wi);

		*_wij++ = _wi;
		for (unsigned j = 0; j < i/8+1; j++){
			const __m128i wj = ((__m128i*)w->c)[j];
			_mm_storeu_si128((__m128i*)(_wij + 8*j), _mm_mullo_epi16(wi, wj));
		}
		_wij += i+1;
	}
	while (_wij < ((short *)wij)+N*8)
		*_wij++ = 0;

	const __m128i mask = _mm_set1_epi32(1023);
	gfv<p> *res = &r->c[VEC<p,m>::M];
	__m128i acchi = _mm_setzero_si128();
	for (unsigned k = MQPSv2<p,m,n>::M; k--;){
		__m128i acc = _mm_setzero_si128();

		__m128i *q = (__m128i*)&poly->q[k][MQPSv2<p,m,n>::N];
		for (unsigned i = N; i--;){
			__m128i wiji = wij[i];
			acc = _mm_add_epi32(acc, _mm_madd_epi16(_mm_shuffle_epi32(wiji, 255), *--q));
			acc = _mm_add_epi32(acc, _mm_madd_epi16(_mm_shuffle_epi32(wiji, 170), *--q));
			acc = _mm_add_epi32(acc, _mm_madd_epi16(_mm_shuffle_epi32(wiji, 85), *--q));
			acc = _mm_add_epi32(acc, _mm_madd_epi16(_mm_shuffle_epi32(wiji, 0), *--q));
		}
		acc = _mm_add_epi32(_mm_srai_epi32(acc, 10), _mm_and_si128(acc, mask));
		if (k & 1)
			acchi = acc;
		else
			*--res = reducev((gfv<p>)_mm_packs_epi32(acc, acchi));
	}
}

template <unsigned p, unsigned m, unsigned n> void eval(VEC<p,m> *r, const MQPSv3<p,m,n> *poly, const VEC<p,n> *w){
	static unsigned const N = ((n+1)*(n+2)/2+23)/24*3;

	__m128i wij[N];
	short *_wij = (short *)wij;
	*_wij++ = 1;
	for (unsigned i = 0; i < n; i++){
		short _wi = (*w)[i].v;
		const __m128i wi = _mm_set1_epi16(_wi);

		*_wij++ = _wi;
		for (unsigned j = 0; j < i/8+1; j++){
			const __m128i wj = ((__m128i*)w->c)[j];
			_mm_storeu_si128((__m128i*)(_wij + 8*j), _mm_mullo_epi16(wi, wj));
		}
		_wij += i+1;
	}
	while (_wij < ((short *)wij)+N*8)
		*_wij++ = 0;

	const __m128i mask = _mm_set1_epi32(1023);
	gfv<p> *res = &r->c[VEC<p,m>::M];
	__m128i acchi = _mm_setzero_si128();
	for (unsigned k = MQPSv3<p,m,n>::M; k--;){
		__m128i acc = _mm_setzero_si128();

		__m128i *q = (__m128i*)&poly->q[k][MQPSv3<p,m,n>::N];
		for (unsigned i = N; i;){
			__m128i wiji = wij[--i];
			__m128i qqq = *--q;
			acc = _mm_add_epi32(acc, _mm_madd_epi16(_mm_shuffle_epi32(wiji, 255), _mm_srai_epi16(qqq, 11)));
			acc = _mm_add_epi32(acc, _mm_madd_epi16(_mm_shuffle_epi32(wiji, 170), _mm_srai_epi16(_mm_slli_epi16(qqq, 6),11)));
			acc = _mm_add_epi32(acc, _mm_madd_epi16(_mm_shuffle_epi32(wiji, 85), _mm_srai_epi16(_mm_slli_epi16(qqq, 11),11)));
			qqq = *--q;
			acc = _mm_add_epi32(acc, _mm_madd_epi16(_mm_shuffle_epi32(wiji, 0), _mm_srai_epi16(qqq, 11)));
			wiji = wij[--i];
			acc = _mm_add_epi32(acc, _mm_madd_epi16(_mm_shuffle_epi32(wiji, 255), _mm_srai_epi16(_mm_slli_epi16(qqq, 6),11)));
			acc = _mm_add_epi32(acc, _mm_madd_epi16(_mm_shuffle_epi32(wiji, 170), _mm_srai_epi16(_mm_slli_epi16(qqq, 11),11)));
			qqq = *--q;
			acc = _mm_add_epi32(acc, _mm_madd_epi16(_mm_shuffle_epi32(wiji, 85), _mm_srai_epi16(qqq, 11)));
			acc = _mm_add_epi32(acc, _mm_madd_epi16(_mm_shuffle_epi32(wiji, 0), _mm_srai_epi16(_mm_slli_epi16(qqq, 6),11)));
			wiji = wij[--i];
			acc = _mm_add_epi32(acc, _mm_madd_epi16(_mm_shuffle_epi32(wiji, 255), _mm_srai_epi16(_mm_slli_epi16(qqq, 11),11)));
			qqq = *--q;
			acc = _mm_add_epi32(acc, _mm_madd_epi16(_mm_shuffle_epi32(wiji, 170), _mm_srai_epi16(qqq, 11)));
			acc = _mm_add_epi32(acc, _mm_madd_epi16(_mm_shuffle_epi32(wiji, 85), _mm_srai_epi16(_mm_slli_epi16(qqq, 6),11)));
			acc = _mm_add_epi32(acc, _mm_madd_epi16(_mm_shuffle_epi32(wiji, 0), _mm_srai_epi16(_mm_slli_epi16(qqq, 11),11)));
		}
		acc = _mm_add_epi32(_mm_srai_epi32(acc, 10), _mm_and_si128(acc, mask));
		if (k & 1)
			acchi = acc;
		else
			*--res = reducev((gfv<p>)_mm_packs_epi32(acc, acchi));
	}
}

template <unsigned p, unsigned n>
void zero_vec(VEC<p, n> *vec){
	for(unsigned i = VEC<p,n>::M; i--;)
		vec->c[i] = _mm_setzero_si128();
}

template <unsigned p, unsigned m, unsigned n>
void zero_linear(MLPS<p,m,n> *mat){
	for (unsigned j = MLPS<p,m,n>::M; j--;)
		for (unsigned i = n; i--;)
			mat->l[j][i] = _mm_setzero_si128();
}

template <unsigned p, unsigned m, unsigned n>
void zero_quad(MQPS<p,m,n> *quad){
	for (unsigned j = MQPS<p,m,n>::M; j--;)
		for (unsigned i = n*(n+1)/2; i--;)
			quad->q[j][i] = _mm_setzero_si128();
}

template <unsigned p, unsigned n>
void rand_vec(VEC<p, n> *vec){
	for(unsigned i = n; i--;)
		((gf<p> *)vec->c)[i] = gf<p>::rand();
}

template <unsigned p, unsigned n>
void transpose(MLPS<p,n,n> *mat){
	for (unsigned i = MLPS<p,n,n>::N; i--;)
		transpose8(&mat->l[i][i<<3].v, &mat->l[i][i<<3].v);
	__m128i tmp[8];
	for (unsigned j = MLPS<p,n,n>::N; j--;)
		for (unsigned i = j; i--;){
			for (unsigned w = 8; w--;)
				tmp[w] = mat->l[j][(i<<3)+w].v;
			transpose8(&mat->l[j][i<<3].v, &mat->l[i][j<<3].v);
			transpose8(&mat->l[i][j<<3].v, tmp);
		}
}

static void swap(unsigned &a, unsigned &b){
	unsigned c = a;
	a = b;
	b = c;
}

template <unsigned p, unsigned m, unsigned n>
static void mat_col_scale(MLPS<p, m, n> *mat, unsigned col, gf<p> s){
	gfv<p> sv = s;
	for (unsigned i = MLPS<p,m,n>::M; i--;)
		mat->l[i][col] = reducev(mat->l[i][col] * sv);
}

template <unsigned p, unsigned m, unsigned n>
static void mat_col_add(MLPS<p, m, n> *mat, unsigned col, unsigned from, gf<p> s){
	gfv<p> sv = s;
	for (unsigned i = MLPS<p,m,n>::M; i--;)
		mat->l[i][col] = reducev(mat->l[i][col] + mat->l[i][from] * sv);
}

template <unsigned p, unsigned n>
void rand_affine_inv(MLPS<p, n, n> *mat, MLPS<p, n, n> *inv){
	zero_linear(mat);
	zero_linear(inv);

	unsigned reorder[n];
	for (unsigned i = n; i--;)
		reorder[i] = i;
	for (unsigned i = n; i--;){
		unsigned r = rand()%(i+1);
		swap(reorder[r], reorder[i]);
	}

	gf<p> (*mat_)[MLPS<p,n,n>::N * 8][8] = (gf<p> (*)[MLPS<p,n,n>::N * 8][8]) mat->l;
	gf<p> (*inv_)[MLPS<p,n,n>::N * 8][8] = (gf<p> (*)[MLPS<p,n,n>::N * 8][8]) inv->l;
	for (unsigned j = n; j--;)
		mat_[j>>3][reorder[j]][j&7] = inv_[j>>3][reorder[j]][j&7] = (gf<p>)1;

	for (unsigned i = n; i--;){
		gf<p> scale = gf<p>::rand_unit();
		mat_col_scale(mat, i, scale);
		mat_col_scale(inv, i, invert(scale));
		for (unsigned j = n; j--;){
			if (i == j)
				continue;
			scale = gf<p>::rand();
			mat_col_add(mat, j, i, scale);
			mat_col_add(inv, i, j, -scale);
		}
	}

	transpose(inv);

	rand_vec(mat);
	zero_vec(inv);

	VEC<p, n> tmp1, tmp2;
	eval(&tmp1, mat, inv);
	eval(&tmp2, inv, &tmp1);
	for (unsigned j = VEC<p,n>::M; j--;)
		inv->c[j] = -tmp2.c[j];
}

template <unsigned p, unsigned m> void VEC<p, m>::dump(FILE *f) const{
	for (unsigned i = 0; i < m; i++)
		fprintf (f, "%hd ", ((short *)this->c)[i]);
	fprintf (f, "\n");
}

template <unsigned p, unsigned m, unsigned n> void MLPS<p, m, n>::dump(FILE *f) const{
	short (*mat_)[MLPS<p,m,n>::N * 8][8] = (short (*)[MLPS<p,m,n>::N * 8][8])this->l;
	for (unsigned j = 0; j < m; j++){
		for (unsigned i = 0; i < n; i++)
			fprintf (f, "%hd ", mat_[j>>3][i][j&7]);
		fprintf (f, " %hd\n", ((short *)this->c)[j]);
	}
}

#endif
