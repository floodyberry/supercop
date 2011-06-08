#ifndef _HFE_H
#define _HFE_H

#include <cstring>
#include <cstdio>
#include "tower.h"
#include "groebner.h"
#include "cantor.h"
#include "bqas.h"


typedef unsigned char uint8;

template <unsigned p>
class HFE_3_31_9 {  /// set: p:31 , l_msg:27 , l_sec:27
public:
	typedef gftower<31,9> gf_t;
	HFE_3_31_9() {}
	virtual ~HFE_3_31_9(){}

	static void pub_map( VEC<p,27> *y , const uint8 * pub_key , const VEC<p,27> *x );
	static size_t sizeof_pub_key() { return sizeof( MQPSv3<p,27,27> ); }

	static void gen_key( uint8 * pub_key , uint8 * pri_key );
	static void pri_pub_map( VEC<p,27> *y , const uint8 * pub_pri_key , const VEC<p,27> *x );

	static int pri_map( VEC<p,27> *x , const uint8 * pri_key , const VEC<p,27> *y );
	static size_t sizeof_pri_key() { return (sizeof( MLPS<p,27,27> ) + sizeof( MLPS<p,27,27> ) + sizeof(gf_t [30]) ); }
};

template <unsigned p>
void HFE_3_31_9<p>::pub_map( VEC<p,27> *y , const uint8 * pub_key , const VEC<p,27> *x )
{
	MQPSv3<p,27,27> poly;
	memcpy( &poly , pub_key , sizeof( poly ));
	eval( y , & poly , x );
}

template <unsigned p>
int HFE_3_31_9<p>::pri_map( VEC<p,27> *x , const uint8 * pri_key , const VEC<p,27> *y )
{
	MLPS<p,27,27> s_inv;
	MLPS<p,27,27> t_inv;
	memcpy( & s_inv , pri_key , sizeof(s_inv) );
	memcpy( & t_inv , pri_key + sizeof(s_inv) , sizeof(t_inv) );

	VEC<p,27> tmp_sec; zero_vec( & tmp_sec );
	VEC<p,27> tmp_msg; zero_vec( & tmp_msg );

	eval( & tmp_sec , &t_inv , y );

//////////////////////////////////////////////////////////
	gf_t X[3];
	gf_t Y[3];
	gf_t eqs[30];
	gf_t P[10];
	int deg_p = 0;
	gf_t PY[10];
	gf_t Z[8];
	int num_z = 0;
	memcpy( eqs , pri_key + sizeof(s_inv) + sizeof(t_inv) , sizeof( eqs ) );
	X[0] = gf_t::load( &tmp_sec[0] );
	X[1] = gf_t::load( &tmp_sec[9] );
	X[2] = gf_t::load( &tmp_sec[18] );
	eqs[9] -= X[0];
	eqs[19] -= X[1];
	eqs[29] -= X[2];
	groebner< gf_t ,3>::univarPoly3( P , PY , &deg_p , eqs );
	cantor_zassen<gf_t>::findRoots<31,9>( Z, &num_z, P, deg_p);
	for( int i = 0 ; i < num_z; i++ ) {
		groebner< gf_t ,3>::solve( Y , eqs , PY , Z[i] );
		memcpy( &tmp_msg[0] , & (Y[0].v) , sizeof(gf<p>[9]));
		memcpy( &tmp_msg[9] , & (Y[1].v) , sizeof(gf<p>[9]));
		memcpy( &tmp_msg[18] , & (Y[2].v) , sizeof(gf<p>[9]));
/////////////////////////////////////////////////////////////
		eval( x , &s_inv , & tmp_msg );
		if( gf<p>(0) == (*x)[26] ) return 0;
	}
	return -1;
}

template <unsigned p>
void HFE_3_31_9<p>::pri_pub_map( VEC<p,27> *y , const uint8 * pub_pri_key , const VEC<p,27> *x )
{
	MLPS<p,27,27> s;
	MLPS<p,27,27> t;
	memcpy( &s , pub_pri_key , sizeof(s));
	memcpy( &t , pub_pri_key + sizeof(s) , sizeof(t));

	VEC<p,27> tmp_sec; zero_vec( & tmp_sec );
	VEC<p,27> tmp_msg; zero_vec( & tmp_msg );

	eval( & tmp_msg , &s , x );

///////////////////////////////////
	gf_t eqs[30];
	memcpy( eqs , pub_pri_key + sizeof(s) + sizeof(t) , sizeof( eqs ) );
	gf_t X[3];
	gf_t Y[3];
	X[0] = gf_t::load( &tmp_msg[0] );
	X[1] = gf_t::load( &tmp_msg[9] );
	X[2] = gf_t::load( &tmp_msg[18] );
	groebner<gf_t,3>::eval( Y , eqs , X );
	memcpy( &tmp_sec[0] , & (Y[0].v) , sizeof(gf<p>[9]));
	memcpy( &tmp_sec[9] , & (Y[1].v) , sizeof(gf<p>[9]));
	memcpy( &tmp_sec[18] , & (Y[2].v) , sizeof(gf<p>[9]));
////////////////////////////////////

	eval( y , &t , & tmp_sec );
}

template <unsigned p>
void HFE_3_31_9<p>::gen_key( uint8 * pub_key , uint8 * pri_key )
{
	const unsigned l_msg = 27;
	const unsigned l_sec = 27;
	uint8 * pri_pub_key = new uint8 [sizeof_pri_key()];
	MLPS<p,27,27> s;
	MLPS<p,27,27> s_inv;
	MLPS<p,27,27> t;
	MLPS<p,27,27> t_inv;
	rand_affine_inv(&s, &s_inv);
	rand_affine_inv(&t, &t_inv);
	memcpy( pri_pub_key , &s , sizeof(s) );
	memcpy( pri_pub_key + sizeof(s) , & t , sizeof(t) );
	memcpy( pri_key , & s_inv , sizeof(s_inv) );
	memcpy( pri_key + sizeof(s_inv) , & t_inv , sizeof(t_inv) );

/////////////////////////////////////////
	gf_t eqs[30];
	groebner<gf_t,3>::genEquas( eqs );
	memcpy( pri_pub_key + sizeof(s)+sizeof(t) , eqs , sizeof(eqs) );
	memcpy( pri_key + sizeof(s_inv) + sizeof(t_inv) , eqs , sizeof(eqs) );
/////////////////////////////////////////

	MQPSv3<p,l_sec,l_msg> polys;
	VEC<p,l_msg> x;
	gfv<p> _polys[VEC<p, l_sec>::M][(l_msg+1)*(l_msg+2)/2+5];
	{
		VEC<p,l_sec> y;
		zero_vec(&x);
		pri_pub_map(&y,pri_pub_key,&x);//mold->pubmap(&y, &x);
		for (unsigned k = VEC<p, l_sec>::M; k--;)
			_polys[k][0] = y.c[k];
	}

	short *_x = (short *) x.c;
	gfv<p> half = invert((gf<p>)2);
	for (unsigned a = l_msg; a--;){
		VEC<p, l_sec> yp, ym;
		_x[a] = 1;
		pri_pub_map(&yp,pri_pub_key,&x); //mold->pubmap(&yp, &x);
		_x[a] = -1;
		pri_pub_map(&ym,pri_pub_key,&x); //mold->pubmap(&ym, &x);
		_x[a] = 0;
		for (unsigned k = MQPS<p, l_sec, l_msg>::M; k--;) {
			_polys[k][(a+1)*(a+2)/2] = principalv((yp.c[k] - ym.c[k]) * half);
			_polys[k][(a+2)*(a+3)/2-1] = principalv((yp.c[k] + ym.c[k] - _polys[k][0] - _polys[k][0]) * half);
		}
	}

	for (unsigned a = l_msg; a--;){
		_x[a] = 1;
		for (unsigned b = a; b--;){
			VEC<p, l_sec> y;
			_x[b] = 1;
			pri_pub_map(&y,pri_pub_key,&x); //mold->pubmap(&y, &x);
			_x[b] = 0;
			for (unsigned k = MQPS<p, l_sec, l_msg>::M; k--;)
				_polys[k][(a+1)*(a+2)/2+b+1] = principalv(y.c[k] - _polys[k][0] - _polys[k][(a+1)*(a+2)/2] - _polys[k][(b+1)*(b+2)/2] - _polys[k][(a+2)*(a+3)/2-1] - _polys[k][(b+2)*(b+3)/2-1]);
		}
		_x[a] = 0;
	}

	__m128i mask = _mm_set1_epi16(31);
	for (unsigned k = 0; k < VEC<p, l_sec>::M; k++)
		for (unsigned i = 0; i < (l_msg+1)*(l_msg+2)/2; i+=6){
			const __m128i lo0 = _mm_and_si128(_mm_unpacklo_epi16(_polys[k][i].v, _polys[k][i+1].v), mask);
			const __m128i lo1 = _mm_and_si128(_mm_unpacklo_epi16(_polys[k][i+2].v, _polys[k][i+3].v), mask);
			const __m128i lo2 = _mm_and_si128(_mm_unpacklo_epi16(_polys[k][i+4].v, _polys[k][i+5].v), mask);
			polys.q[k*2][i/6] = _mm_or_si128(lo0, _mm_or_si128(_mm_slli_epi16(lo1, 5), _mm_slli_epi16(lo2, 11)));
			if (k*2+1 != MQPSv3<p,l_sec,l_msg>::M){
				const __m128i hi0 = _mm_and_si128(_mm_unpackhi_epi16(_polys[k][i].v, _polys[k][i+1].v), mask);
				const __m128i hi1 = _mm_and_si128(_mm_unpackhi_epi16(_polys[k][i+2].v, _polys[k][i+3].v), mask);
				const __m128i hi2 = _mm_and_si128(_mm_unpackhi_epi16(_polys[k][i+4].v, _polys[k][i+5].v), mask);
				polys.q[k*2+1][i/6] = _mm_or_si128(hi0, _mm_or_si128(_mm_slli_epi16(hi1, 5), _mm_slli_epi16(hi2, 11)));
			}
		}

	memcpy( pub_key , & polys , sizeof(polys) );
	delete [] pri_pub_key;

}







template <unsigned p>
class HFE_4_31_10 {  /// set: p:31 , l_msg:40 , l_sec:40
public:
	typedef gftower<31,10> gf_t;
	HFE_4_31_10() {}
	virtual ~HFE_4_31_10(){}

	static void pub_map( VEC<p,40> *y , const uint8 * pub_key , const VEC<p,40> *x );
	static size_t sizeof_pub_key() { return sizeof( MQPSv3<p,40,40> ); }

	static void gen_key( uint8 * pub_key , uint8 * pri_key );
	static void pri_pub_map( VEC<p,40> *y , const uint8 * pub_pri_key , const VEC<p,40> *x );

	static int pri_map( VEC<p,40> *x , const uint8 * pri_key , const VEC<p,40> *y );
	static size_t sizeof_pri_key() { return (sizeof( MLPS<p,40,40> ) + sizeof( MLPS<p,40,40> ) + sizeof(gf_t [60]) ); }
};

template <unsigned p>
void HFE_4_31_10<p>::pub_map( VEC<p,40> *y , const uint8 * pub_key , const VEC<p,40> *x )
{
	MQPSv3<p,40,40> poly;
	memcpy( &poly , pub_key , sizeof( poly ));
	eval( y , & poly , x );
}

template <unsigned p>
int HFE_4_31_10<p>::pri_map( VEC<p,40> *x , const uint8 * pri_key , const VEC<p,40> *y )
{
	MLPS<p,40,40> s_inv;
	MLPS<p,40,40> t_inv;
	memcpy( & s_inv , pri_key , sizeof(s_inv) );
	memcpy( & t_inv , pri_key + sizeof(s_inv) , sizeof(t_inv) );

	VEC<p,40> tmp_sec; zero_vec( & tmp_sec );
	VEC<p,40> tmp_msg; zero_vec( & tmp_msg );

	eval( & tmp_sec , &t_inv , y );

//////////////////////////////////////////////////////////
	gf_t X[4];
	gf_t Y[4];
	gf_t eqs[60];
	gf_t P[18];
	int deg_p = 0;
	gf_t PY[18];
	gf_t Z[18];
	int num_z = 0;
	memcpy( eqs , pri_key + sizeof(s_inv) + sizeof(t_inv) , sizeof( eqs ) );
	X[0] = gf_t::load( &tmp_sec[0] );
	X[1] = gf_t::load( &tmp_sec[10] );
	X[2] = gf_t::load( &tmp_sec[20] );
	X[3] = gf_t::load( &tmp_sec[30] );
	eqs[14] -= X[0];
	eqs[29] -= X[1];
	eqs[44] -= X[2];
	eqs[59] -= X[3];	
	groebner< gf_t ,4>::univarPoly3( P , PY , &deg_p , eqs );
	cantor_zassen<gf_t>::findRoots<31,10>( Z, &num_z, P, deg_p);
	for( int i = 0 ; i < num_z; i++ ) {
		groebner< gf_t ,4>::solve( Y , eqs , PY , Z[i] );
		memcpy( &tmp_msg[0] , & (Y[0].v) , sizeof( gf<p>[10]));
		memcpy( &tmp_msg[10] , & (Y[1].v) , sizeof(gf<p>[10]));
		memcpy( &tmp_msg[20] , & (Y[2].v) , sizeof(gf<p>[10]));
		memcpy( &tmp_msg[30] , & (Y[3].v) , sizeof(gf<p>[10]));
/////////////////////////////////////////////////////////////
		eval( x , &s_inv , & tmp_msg );
		if( gf<p>(0) == (*x)[39] ) return 0;
	}
	return -1;
}

template <unsigned p>
void HFE_4_31_10<p>::pri_pub_map( VEC<p,40> *y , const uint8 * pub_pri_key , const VEC<p,40> *x )
{
	MLPS<p,40,40> s;
	MLPS<p,40,40> t;
	memcpy( &s , pub_pri_key , sizeof(s));
	memcpy( &t , pub_pri_key + sizeof(s) , sizeof(t));

	VEC<p,40> tmp_sec; zero_vec( & tmp_sec );
	VEC<p,40> tmp_msg; zero_vec( & tmp_msg );

	eval( & tmp_msg , &s , x );

///////////////////////////////////
	gf_t eqs[60];
	memcpy( eqs , pub_pri_key + sizeof(s) + sizeof(t) , sizeof( eqs ) );
	gf_t X[4];
	gf_t Y[4];
	X[0] = gf_t::load( &tmp_msg[0] );
	X[1] = gf_t::load( &tmp_msg[10] );
	X[2] = gf_t::load( &tmp_msg[20] );
	X[3] = gf_t::load( &tmp_msg[30] );
	groebner<gf_t,4>::eval( Y , eqs , X );
	memcpy( &tmp_sec[0] , & (Y[0].v) , sizeof(gf<p>[10]) );
	memcpy( &tmp_sec[10] , & (Y[1].v) , sizeof(gf<p>[10]) );
	memcpy( &tmp_sec[20] , & (Y[2].v) , sizeof(gf<p>[10]) );
	memcpy( &tmp_sec[30] , & (Y[3].v) , sizeof(gf<p>[10]) );
////////////////////////////////////

	eval( y , &t , & tmp_sec );
}

template <unsigned p>
void HFE_4_31_10<p>::gen_key( uint8 * pub_key , uint8 * pri_key )
{
	const unsigned l_msg = 40;
	const unsigned l_sec = 40;
	uint8 * pri_pub_key = new uint8 [sizeof_pri_key()];
	MLPS<p,40,40> s;
	MLPS<p,40,40> s_inv;
	MLPS<p,40,40> t;
	MLPS<p,40,40> t_inv;
	rand_affine_inv(&s, &s_inv);
	rand_affine_inv(&t, &t_inv);
	memcpy( pri_pub_key , &s , sizeof(s) );
	memcpy( pri_pub_key + sizeof(s) , & t , sizeof(t) );
	memcpy( pri_key , & s_inv , sizeof(s_inv) );
	memcpy( pri_key + sizeof(s_inv) , & t_inv , sizeof(t_inv) );

/////////////////////////////////////////
	gf_t eqs[60];
	groebner<gf_t,4>::genEquas( eqs );
	memcpy( pri_pub_key + sizeof(s)+sizeof(t) , eqs , sizeof(eqs) );
	memcpy( pri_key + sizeof(s_inv) + sizeof(t_inv) , eqs , sizeof(eqs) );
/////////////////////////////////////////

	MQPSv3<p,l_sec,l_msg> polys;
	VEC<p,l_msg> x;
	gfv<p> _polys[VEC<p, l_sec>::M][(l_msg+1)*(l_msg+2)/2+5];
	{
		VEC<p,l_sec> y;
		zero_vec(&x);
		pri_pub_map(&y,pri_pub_key,&x);//mold->pubmap(&y, &x);
		for (unsigned k = VEC<p, l_sec>::M; k--;)
			_polys[k][0] = y.c[k];
	}

	short *_x = (short *) x.c;
	gfv<p> half = invert((gf<p>)2);
	for (unsigned a = l_msg; a--;){
		VEC<p, l_sec> yp, ym;
		_x[a] = 1;
		pri_pub_map(&yp,pri_pub_key,&x); //mold->pubmap(&yp, &x);
		_x[a] = -1;
		pri_pub_map(&ym,pri_pub_key,&x); //mold->pubmap(&ym, &x);
		_x[a] = 0;
		for (unsigned k = MQPS<p, l_sec, l_msg>::M; k--;) {
			_polys[k][(a+1)*(a+2)/2] = principalv((yp.c[k] - ym.c[k]) * half);
			_polys[k][(a+2)*(a+3)/2-1] = principalv((yp.c[k] + ym.c[k] - _polys[k][0] - _polys[k][0]) * half);
		}
	}

	for (unsigned a = l_msg; a--;){
		_x[a] = 1;
		for (unsigned b = a; b--;){
			VEC<p, l_sec> y;
			_x[b] = 1;
			pri_pub_map(&y,pri_pub_key,&x); //mold->pubmap(&y, &x);
			_x[b] = 0;
			for (unsigned k = MQPS<p, l_sec, l_msg>::M; k--;)
				_polys[k][(a+1)*(a+2)/2+b+1] = principalv(y.c[k] - _polys[k][0] - _polys[k][(a+1)*(a+2)/2] - _polys[k][(b+1)*(b+2)/2] - _polys[k][(a+2)*(a+3)/2-1] - _polys[k][(b+2)*(b+3)/2-1]);
		}
		_x[a] = 0;
	}

	__m128i mask = _mm_set1_epi16(31);
	for (unsigned k = 0; k < VEC<p, l_sec>::M; k++)
		for (unsigned i = 0; i < (l_msg+1)*(l_msg+2)/2; i+=6){
			const __m128i lo0 = _mm_and_si128(_mm_unpacklo_epi16(_polys[k][i].v, _polys[k][i+1].v), mask);
			const __m128i lo1 = _mm_and_si128(_mm_unpacklo_epi16(_polys[k][i+2].v, _polys[k][i+3].v), mask);
			const __m128i lo2 = _mm_and_si128(_mm_unpacklo_epi16(_polys[k][i+4].v, _polys[k][i+5].v), mask);
			polys.q[k*2][i/6] = _mm_or_si128(lo0, _mm_or_si128(_mm_slli_epi16(lo1, 5), _mm_slli_epi16(lo2, 11)));
			if (k*2+1 != MQPSv3<p,l_sec,l_msg>::M){
				const __m128i hi0 = _mm_and_si128(_mm_unpackhi_epi16(_polys[k][i].v, _polys[k][i+1].v), mask);
				const __m128i hi1 = _mm_and_si128(_mm_unpackhi_epi16(_polys[k][i+2].v, _polys[k][i+3].v), mask);
				const __m128i hi2 = _mm_and_si128(_mm_unpackhi_epi16(_polys[k][i+4].v, _polys[k][i+5].v), mask);
				polys.q[k*2+1][i/6] = _mm_or_si128(hi0, _mm_or_si128(_mm_slli_epi16(hi1, 5), _mm_slli_epi16(hi2, 11)));
			}
		}

	memcpy( pub_key , & polys , sizeof(polys) );
	delete [] pri_pub_key;

}








////////////////////////////////////////////////////////////////////////////////





#endif
