
#ifndef _RAINBOW_W_H_
#define _RAINBOW_W_H_

#include <cstdlib>
#include <cstring>
#include "bqas.h"
#include "wiedemann.h"


typedef unsigned char uint8;



template <unsigned p>
void rand_gfv(gfv<p> *vec){
	for(unsigned i = 8; i--;)
		((gf<p> *)(&(vec->v)))[i] = gf<p>::rand();
}

template <unsigned p, unsigned m, unsigned n>
void rand_matrix( MLPS<p,m,n> * mat )
{
	for( unsigned i = mat->M ; i-- ; )
		for( unsigned j = ( mat->N * 8 ) ; j-- ; ) 
			rand_gfv( &(mat->l[i][j]) );
	zero_vec( mat );
}

template <unsigned p, unsigned m, unsigned n>
void rand_quad( MQPS<p,m,n> * poly )
{
	rand_matrix( poly );
	for( unsigned i = poly->M ; i-- ; )
		for( unsigned j = n*(n+1)/2 ; j-- ; )
			rand_gfv( &(poly->q[i][j]) );
}




template <unsigned p>
class rainbow_w_56_40 {
public:
	rainbow_w_56_40() {}
	virtual ~rainbow_w_56_40(){}

	static const unsigned l_msg = 56;
	static const unsigned l_sec = 40;

	static void pub_map( VEC<p,l_sec> *y , const uint8 * pub_key , const VEC<p,l_msg> *x );
	static size_t sizeof_pub_key() { return sizeof( MQPSv3<p, l_sec, l_msg> ); }

	static void gen_key( uint8 * pub_key , uint8 * pri_key );
	static int pri_map( VEC<p,l_msg> *x , const uint8 * pri_key , const VEC<p,l_sec> *y );
	static void pri_pub_map( VEC<p,l_sec> *y , const uint8 * pub_pri_key , const VEC<p,l_msg> *x );
	static size_t sizeof_pri_key() { return (sizeof( MLPS<p, l_msg, l_msg> ) + sizeof( MLPS<p, l_sec, l_sec> ) + sizeof_q_key()); }

	static size_t sizeof_q_key();
	static void gen_q_key( uint8 *  pri_key  );
	static void q_map( VEC<p,l_sec> *y , const uint8 * pri_key  , const VEC<p,l_msg> *x );
	static int inv_q_map( VEC<p,l_msg> *x , const uint8 *  pri_key  , const VEC<p,l_sec> *y );
};






template <unsigned p>
size_t rainbow_w_56_40<p>::sizeof_q_key()
{
	return 	( sizeof(MQPS< p , 16 , 16 >) 
				+ sizeof(MQPS< p , 8 , 32 >) 
				+ sizeof(MQPS< p , 16 , 40 >) 
				+ sizeof(MLPS< p , 16 , 16 >)
				+ sizeof(MLPS< p , 8 , 8 >)
				+ sizeof(MLPS< p , 16 , 16 >)
				+ sizeof(MLPS< p , 16 , 16 >[16]) 
				+ sizeof(MLPS< p , 8 , 32 >[8]) 
				+ sizeof(MLPS< p , 16 , 40 >[16]) );
}

template <unsigned p>
void rainbow_w_56_40<p>::gen_q_key( uint8 *  pri_key  )
{

	// 16,16,8,16
	MQPS< p , 16 , 16 > l0_v;
	MQPS< p , 8 , 32 > l1_v;
	MQPS< p , 16 , 40 > l2_v;
	MLPS< p , 16 , 16 > l0_o;
	MLPS< p , 8 , 8 > l1_o;
	MLPS< p , 16 , 16 > l2_o;
	MLPS< p , 16 , 16 > l0_vo[16];
	MLPS< p , 8 , 32 > l1_vo[8];
	MLPS< p , 16 , 40 > l2_vo[16];
	rand_quad( & l0_v );
	rand_quad( & l1_v );
	rand_quad( & l2_v );
	rand_matrix( &l0_o );
	rand_matrix( &l1_o );
	rand_matrix( &l2_o );
	for( unsigned i=0 ; i < 16 ; i++ ) { rand_matrix(&l0_vo[i]); rand_matrix(&l2_vo[i]); }
	for( unsigned i=0 ; i < 8 ; i++ ) rand_matrix(&l1_vo[i]);

	uint8 * q_start = pri_key + sizeof( MLPS<p, l_msg, l_msg> ) + sizeof( MLPS<p, l_sec, l_sec> );
	memcpy( q_start , & l0_v , sizeof( l0_v ) ); q_start += sizeof( l0_v );
	memcpy( q_start , & l1_v , sizeof( l1_v ) ); q_start += sizeof( l1_v );
	memcpy( q_start , & l2_v , sizeof( l2_v ) ); q_start += sizeof( l2_v );
	memcpy( q_start , & l0_o , sizeof( l0_o ) ); q_start += sizeof( l0_o );
	memcpy( q_start , & l1_o , sizeof( l1_o ) ); q_start += sizeof( l1_o );
	memcpy( q_start , & l2_o , sizeof( l2_o ) ); q_start += sizeof( l2_o );
	memcpy( q_start , & l0_vo , sizeof( l0_vo ) ); q_start += sizeof( l0_vo );
	memcpy( q_start , & l1_vo , sizeof( l1_vo ) ); q_start += sizeof( l1_vo );
	memcpy( q_start , & l2_vo , sizeof( l2_vo ) ); q_start += sizeof( l2_vo );
}

template <unsigned p>
void rainbow_w_56_40<p>::q_map( VEC<p,l_sec> *y , const uint8 *  pri_key  , const VEC<p,l_msg> *x )
{
	MQPS< p , 16 , 16 > l0_v;
	MQPS< p , 8 , 32 > l1_v;
	MQPS< p , 16 , 40 > l2_v;
	MLPS< p , 16 , 16 > l0_o;
	MLPS< p , 8 , 8 > l1_o;
	MLPS< p , 16 , 16 > l2_o;
	MLPS< p , 16 , 16 > l0_vo[16];
	MLPS< p , 8 , 32 > l1_vo[8];
	MLPS< p , 16 , 40 > l2_vo[16];

	const uint8 * q_start = pri_key + sizeof( MLPS<p, l_msg, l_msg> ) + sizeof( MLPS<p, l_sec, l_sec> );
	memcpy( & l0_v , q_start , sizeof( l0_v ) ); q_start += sizeof( l0_v );
	memcpy( & l1_v , q_start , sizeof( l1_v ) ); q_start += sizeof( l1_v );
	memcpy( & l2_v , q_start , sizeof( l2_v ) ); q_start += sizeof( l2_v );
	memcpy( & l0_o , q_start , sizeof( l0_o ) ); q_start += sizeof( l0_o );
	memcpy( & l1_o , q_start , sizeof( l1_o ) ); q_start += sizeof( l1_o );
	memcpy( & l2_o , q_start , sizeof( l2_o ) ); q_start += sizeof( l2_o );
	memcpy( & l0_vo , q_start , sizeof( l0_vo ) ); q_start += sizeof( l0_vo );
	memcpy( & l1_vo , q_start , sizeof( l1_vo ) ); q_start += sizeof( l1_vo );
	memcpy( & l2_vo , q_start , sizeof( l2_vo ) ); q_start += sizeof( l2_vo );

	const VEC<p,16> * v0 = (const VEC<p,16> *)x;
	const VEC<p,32> * v1 = (const VEC<p,32> *)x;
	const VEC<p,40> * v2 = (const VEC<p,40> *)x;
	VEC<p,16> o0; memcpy( & o0 , &((*x)[16])	 , sizeof(gf<p>[16]) );
	VEC<p, 8> o1; memcpy( & o1 , &((*x)[32])	 , sizeof(gf<p>[8]) );
	VEC<p,16> o2; memcpy( & o2 , &((*x)[40])	 , sizeof(gf<p>[16]) );
	VEC<p,16> tmp,tmp2;
	VEC<p, 8> tmp8,tmp28;
	MLPS<p,16,16> o_mat;
	MLPS<p,8,8> o_mat8; 

	memcpy(&o_mat,&l0_o,sizeof(MLPS<p,16,16>));
	for( unsigned i=0;i<16;i++) 
	{ eval(&tmp,&l0_vo[i],v0); for(unsigned j=tmp.M;j--;) o_mat.l[j][i]+=tmp.c[j]; }
	eval( & tmp2 , & o_mat , & o0 );
	eval( & tmp , & l0_v , v0 );
	tmp += tmp2; tmp.reduce();
	memcpy( y , & tmp , sizeof(gf<p>[16]) );
	
	memcpy(&o_mat8,&l1_o,sizeof(MLPS<p,8,8>));
	for( unsigned i=0;i<8;i++) 
	{ eval(&tmp8,&l1_vo[i],v1); for(unsigned j=tmp8.M;j--;) o_mat8.l[j][i]+=tmp8.c[j]; }
	eval( & tmp28 , & o_mat8 , & o1 );
	eval( & tmp8 , & l1_v , v1 );
	tmp8 += tmp28; tmp8.reduce();
	memcpy( &((*y)[16]) , & tmp8 , sizeof(gf<p>[8]) );

	memcpy(&o_mat,&l2_o,sizeof(MLPS<p,16,16>));
	for( unsigned i=0;i<16;i++) 
	{ eval(&tmp,&l2_vo[i],v2); for(unsigned j=tmp.M;j--;) o_mat.l[j][i]+=tmp.c[j]; }
	eval( & tmp2 , & o_mat , & o2 );
	eval( & tmp , & l2_v , v2 );
	tmp += tmp2; tmp.reduce();
	memcpy( &((*y)[24]) , & tmp , sizeof(gf<p>[16]) );

	y->reduce();
}

template <unsigned p>
int rainbow_w_56_40<p>::inv_q_map( VEC<p,l_msg> *y , const uint8 *  pri_key  , const VEC<p,l_sec> *x )
{
	MQPS< p , 16 , 16 > l0_v;
	MQPS< p , 8 , 32 > l1_v;
	MQPS< p , 16 , 40 > l2_v;
	MLPS< p , 16 , 16 > l0_o;
	MLPS< p , 8 , 8 > l1_o;
	MLPS< p , 16 , 16 > l2_o;
	MLPS< p , 16 , 16 > l0_vo[16];
	MLPS< p , 8 , 32 > l1_vo[8];
	MLPS< p , 16 , 40 > l2_vo[16];

	const uint8 * q_start = pri_key + sizeof( MLPS<p, l_msg, l_msg> ) + sizeof( MLPS<p, l_sec, l_sec> );
	memcpy( & l0_v , q_start , sizeof( l0_v ) ); q_start += sizeof( l0_v );
	memcpy( & l1_v , q_start , sizeof( l1_v ) ); q_start += sizeof( l1_v );
	memcpy( & l2_v , q_start , sizeof( l2_v ) ); q_start += sizeof( l2_v );
	memcpy( & l0_o , q_start , sizeof( l0_o ) ); q_start += sizeof( l0_o );
	memcpy( & l1_o , q_start , sizeof( l1_o ) ); q_start += sizeof( l1_o );
	memcpy( & l2_o , q_start , sizeof( l2_o ) ); q_start += sizeof( l2_o );
	memcpy( & l0_vo , q_start , sizeof( l0_vo ) ); q_start += sizeof( l0_vo );
	memcpy( & l1_vo , q_start , sizeof( l1_vo ) ); q_start += sizeof( l1_vo );
	memcpy( & l2_vo , q_start , sizeof( l2_vo ) ); q_start += sizeof( l2_vo );

	VEC<p,16> * v0 = (VEC<p,16> *)y;
	VEC<p,32> * v1 = (VEC<p,32> *)y;
	VEC<p,40> * v2 = (VEC<p,40> *)y;
	VEC<p,16> tmp, sol;
	VEC<p,8> tmp8, sol8;

	MLPS<p,16,16> o_mat;
	MLPS<p,8,8> o_mat8;

	for( unsigned jjj=5; jjj--; ) {
		rand_vec( v0 );
		//zero_vec( v0 );

	memcpy(&o_mat,&l0_o,sizeof(MLPS<p,16,16>));
	for( unsigned i=0;i<16;i++) 
	{ eval(&tmp,&l0_vo[i],v0); for(unsigned j=tmp.M;j--;) o_mat.l[j][i]+=tmp.c[j]; }
		eval( & tmp , & l0_v , v0 );
		memcpy( & sol , x , sizeof(gf<p>[16]) );
		sol -= tmp;
		sol.reduce();
		if( ! wiedemann<16>( tmp , o_mat , sol ) ) continue;
		memcpy( &((*y)[16]) , & tmp , sizeof(gf<p>[16]) );

	memcpy(&o_mat8,&l1_o,sizeof(MLPS<p,8,8>));
	for( unsigned i=0;i<8;i++) 
	{ eval(&tmp8,&l1_vo[i],v1); for(unsigned j=tmp8.M;j--;) o_mat8.l[j][i]+=tmp8.c[j]; }
		eval( & tmp8 , & l1_v , v1 );
		memcpy( & sol8 , &((*x)[16]) , sizeof(gf<p>[8]) );
		sol8 -= tmp8;
		sol8.reduce();
		if( ! wiedemann<8>( tmp8 , o_mat8 , sol8 ) ) continue;
		memcpy( &((*y)[32]) , & tmp8 , sizeof(gf<p>[8]) );
			
	memcpy(&o_mat,&l2_o,sizeof(MLPS<p,16,16>));
	for( unsigned i=0;i<16;i++) 
	{ eval(&tmp,&l2_vo[i],v2); for(unsigned j=tmp.M;j--;) o_mat.l[j][i]+=tmp.c[j]; }
		eval( & tmp , & l2_v , v2 );
		memcpy( & sol , &((*x)[24]) , sizeof(gf<p>[16]) );
		sol -= tmp;
		sol.reduce();
		if( ! wiedemann<16>( tmp , o_mat , sol ) ) continue;
		memcpy( &((*y)[40]) , & tmp , sizeof(gf<p>[16]) );

		return 0;
	}

	return -1;

}


template <unsigned p>
void rainbow_w_56_40<p>::pub_map( VEC<p,l_sec> *y , const uint8 * pub_key , const VEC<p,l_msg> *x )
{
	MQPSv3<p, l_sec, l_msg> poly;
	memcpy( &poly , pub_key , sizeof( poly ));
	eval( y , & poly , x );
}

template <unsigned p>
int rainbow_w_56_40<p>::pri_map( VEC<p,l_msg> *x , const uint8 * pri_key , const VEC<p,l_sec> *y )
{
	MLPS<p,l_msg,l_msg> s_inv;
	MLPS<p,l_sec,l_sec> t_inv;
	memcpy( & s_inv , pri_key , sizeof(MLPS<p,l_msg,l_msg>) );
	memcpy( & t_inv , pri_key + sizeof(MLPS<p,l_msg,l_msg>) , sizeof(MLPS<p,l_sec,l_sec>) );

	VEC<p,l_sec> tmp_sec; zero_vec( & tmp_sec );
	VEC<p,l_msg> tmp_msg; zero_vec( & tmp_msg );

	eval( & tmp_sec , &t_inv , y );
	if( 0 != inv_q_map( & tmp_msg , pri_key , & tmp_sec )) return -1;
	eval( x , &s_inv , & tmp_msg );
	return 0;
}

template <unsigned p>
void rainbow_w_56_40<p>::pri_pub_map( VEC<p,l_sec> *y , const uint8 * pub_pri_key , const VEC<p,l_msg> *x )
{
	MLPS<p,l_msg,l_msg> s;
	MLPS<p,l_sec,l_sec> t;
	memcpy( &s , pub_pri_key , sizeof(s));
	memcpy( &t , pub_pri_key + sizeof(s) , sizeof(t));

	VEC<p,l_sec> tmp_sec; zero_vec( & tmp_sec );
	VEC<p,l_msg> tmp_msg; zero_vec( & tmp_msg );

	eval( & tmp_msg , &s , x );
	q_map( & tmp_sec , pub_pri_key , & tmp_msg );
	eval( y , &t , & tmp_sec );
}

template <unsigned p>
void rainbow_w_56_40<p>::gen_key( uint8 * pub_key , uint8 * pri_key )
{
	uint8 * pri_pub_key = new uint8 [sizeof_pri_key()];
	MLPS<p,l_msg,l_msg> s;// = (MLPS<p,l_msg,l_msg> *) pri_pub_key;
	MLPS<p,l_msg,l_msg> s_inv;
	MLPS<p,l_sec,l_sec> t;// = (MLPS<p,l_sec,l_sec> *) (pri_pub_key + sizeof( *s ));
	MLPS<p,l_sec,l_sec> t_inv;
	rand_affine_inv(&s, &s_inv);
	rand_affine_inv(&t, &t_inv);
	memcpy( pri_pub_key , &s , sizeof(s) );
	memcpy( pri_pub_key + sizeof(s) , & t , sizeof(t) );
	memcpy( pri_key , & s_inv , sizeof(s_inv) );
	memcpy( pri_key + sizeof(s_inv) , & t_inv , sizeof(t_inv) );
	
	gen_q_key(pri_key);
	memcpy( pri_pub_key + sizeof(s) + sizeof(t) , pri_key + sizeof(s) + sizeof(t) , sizeof_q_key() );

	MQPSv3<p, l_sec, l_msg> polys;
	VEC<p, l_msg> x;
	gfv<p> _polys[VEC<p, l_sec>::M][(l_msg+1)*(l_msg+2)/2+5];
	{
		VEC<p, l_sec> y;
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
class rainbow_w_64_40 {		/// 24 20 20
public:
	rainbow_w_64_40() {}
	virtual ~rainbow_w_64_40(){}

	static const unsigned l_msg = 64;
	static const unsigned l_sec = 40;

	static void pub_map( VEC<p,l_sec> *y , const uint8 * pub_key , const VEC<p,l_msg> *x );
	static size_t sizeof_pub_key() { return sizeof( MQPSv3<p, l_sec, l_msg> ); }

	static void gen_key( uint8 * pub_key , uint8 * pri_key );
	static int pri_map( VEC<p,l_msg> *x , const uint8 * pri_key , const VEC<p,l_sec> *y );
	static void pri_pub_map( VEC<p,l_sec> *y , const uint8 * pub_pri_key , const VEC<p,l_msg> *x );
	static size_t sizeof_pri_key() { return (sizeof( MLPS<p, l_msg, l_msg> ) + sizeof( MLPS<p, l_sec, l_sec> ) + sizeof_q_key()); }

	static size_t sizeof_q_key();
	static void gen_q_key( uint8 *  pri_key  );
	static void q_map( VEC<p,l_sec> *y , const uint8 * pri_key  , const VEC<p,l_msg> *x );
	static int inv_q_map( VEC<p,l_msg> *x , const uint8 *  pri_key  , const VEC<p,l_sec> *y );
};






template <unsigned p>
size_t rainbow_w_64_40<p>::sizeof_q_key()
{
	return ( sizeof(MQPS< p , 20 , 24 >) + sizeof(MLPS< p , 20 , 20 >) + sizeof(MQPS< p , 20 , 44 >) 
				+ sizeof(MLPS< p , 20 , 20 >) + sizeof(MLPS< p , 20 , 24 >[20]) + sizeof(MLPS< p , 20 , 44 >[20]) );

}

template <unsigned p>
void rainbow_w_64_40<p>::gen_q_key( uint8 *  pri_key  )
{
	MQPS< p , 20 , 24 > l0_v;
	MLPS< p , 20 , 20 > l0_o;
	MQPS< p , 20 , 44 > l1_v;
	MLPS< p , 20 , 20 > l1_o;
	MLPS< p , 20 , 24 > l0_vo[20];
	MLPS< p , 20 , 44 > l1_vo[20];
	rand_quad( & l0_v );
	rand_matrix( &l0_o );
	rand_quad( & l1_v );
	rand_matrix( &l1_o );
	for( unsigned i=0 ; i < 20 ; i++ ) { rand_matrix(&l0_vo[i]); rand_matrix(&l1_vo[i]); }

	uint8 * q_start = pri_key + sizeof( MLPS<p, l_msg, l_msg> ) + sizeof( MLPS<p, l_sec, l_sec> );
	memcpy( q_start , & l0_v , sizeof( l0_v ) ); q_start += sizeof( l0_v );
	memcpy( q_start , & l0_o , sizeof( l0_o ) ); q_start += sizeof( l0_o );
	memcpy( q_start , & l1_v , sizeof( l1_v ) ); q_start += sizeof( l1_v );
	memcpy( q_start , & l1_o , sizeof( l1_o ) ); q_start += sizeof( l1_o );
	memcpy( q_start , & l0_vo , sizeof( l0_vo ) ); q_start += sizeof( l0_vo );
	memcpy( q_start , & l1_vo , sizeof( l1_vo ) ); q_start += sizeof( l1_vo );
}

template <unsigned p>
void rainbow_w_64_40<p>::q_map( VEC<p,l_sec> *y , const uint8 *  pri_key  , const VEC<p,l_msg> *x )
{
	MQPS< p , 20 , 24 > l0_v;
	MLPS< p , 20 , 20 > l0_o;
	MQPS< p , 20 , 44 > l1_v;
	MLPS< p , 20 , 20 > l1_o;
	MLPS< p , 20 , 24 > l0_vo[20];
	MLPS< p , 20 , 44 > l1_vo[20];

	const uint8 * q_start = pri_key + sizeof( MLPS<p, l_msg, l_msg> ) + sizeof( MLPS<p, l_sec, l_sec> );
	memcpy( & l0_v , q_start , sizeof( l0_v ) ); q_start += sizeof( l0_v );
	memcpy( & l0_o , q_start , sizeof( l0_o ) ); q_start += sizeof( l0_o );
	memcpy( & l1_v , q_start , sizeof( l1_v ) ); q_start += sizeof( l1_v );
	memcpy( & l1_o , q_start , sizeof( l1_o ) ); q_start += sizeof( l1_o );
	memcpy( & l0_vo , q_start , sizeof( l0_vo ) ); q_start += sizeof( l0_vo );
	memcpy( & l1_vo , q_start , sizeof( l1_vo ) ); q_start += sizeof( l1_vo );

	const VEC<p,24> * v0 = (const VEC<p,24> *)x;
	const VEC<p,44> * v1 = (const VEC<p,44> *)x;
	VEC<p,20> o0; memcpy( & o0 , &((*x)[24])	 , sizeof(gf<p>[20]) );
	VEC<p,20> o1; memcpy( & o1 , &((*x)[44])	 , sizeof(gf<p>[20]) );
	VEC<p,20> tmp,tmp2;

	MLPS<p,20,20> o_mat; 
	memcpy(&o_mat,&l0_o,sizeof(MLPS<p,20,20>));
	for( unsigned i=0;i<20;i++) 
	{ eval(&tmp,&l0_vo[i],v0); for(unsigned j=tmp.M;j--;) o_mat.l[j][i]+=tmp.c[j]; }
	eval( & tmp2 , & o_mat , & o0 );
	eval( & tmp , & l0_v , v0 );
	tmp += tmp2; tmp.reduce();
	memcpy( y , & tmp , sizeof(gf<p>[20]) );
	
	memcpy(&o_mat,&l1_o,sizeof(MLPS<p,20,20>));
	for( unsigned i=0;i<20;i++) 
	{ eval(&tmp,&l1_vo[i],v1); for(unsigned j=tmp.M;j--;) o_mat.l[j][i]+=tmp.c[j]; }
	eval( & tmp2 , & o_mat , & o1 );
	eval( & tmp , & l1_v , v1 );
	tmp += tmp2; tmp.reduce();
	memcpy( &((*y)[20]) , & tmp , sizeof(gf<p>[20]) );

	y->reduce();

}

template <unsigned p>
int rainbow_w_64_40<p>::inv_q_map( VEC<p,l_msg> *y , const uint8 *  pri_key  , const VEC<p,l_sec> *x )
{

	MQPS< p , 20 , 24 > l0_v;
	MLPS< p , 20 , 20 > l0_o;
	MQPS< p , 20 , 44 > l1_v;
	MLPS< p , 20 , 20 > l1_o;
	MLPS< p , 20 , 24 > l0_vo[20];
	MLPS< p , 20 , 44 > l1_vo[20];

	const uint8 * q_start = pri_key + sizeof( MLPS<p, l_msg, l_msg> ) + sizeof( MLPS<p, l_sec, l_sec> );
	memcpy( & l0_v , q_start , sizeof( l0_v ) ); q_start += sizeof( l0_v );
	memcpy( & l0_o , q_start , sizeof( l0_o ) ); q_start += sizeof( l0_o );
	memcpy( & l1_v , q_start , sizeof( l1_v ) ); q_start += sizeof( l1_v );
	memcpy( & l1_o , q_start , sizeof( l1_o ) ); q_start += sizeof( l1_o );
	memcpy( & l0_vo , q_start , sizeof( l0_vo ) ); q_start += sizeof( l0_vo );
	memcpy( & l1_vo , q_start , sizeof( l1_vo ) ); q_start += sizeof( l1_vo );


	VEC<p,24> * v0 = (VEC<p,24> *)y;
	VEC<p,44> * v1 = (VEC<p,44> *)y;
	VEC<p,20> tmp, sol;

	for( int ii=0; ii<5;ii++ ) {
		rand_vec( v0 );
		//zero_vec( v0 );

	MLPS<p,20,20> o_mat; 
	memcpy(&o_mat,&l0_o,sizeof(MLPS<p,20,20>));
	for( unsigned i=0;i<20;i++) 
	{ eval(&tmp,&l0_vo[i],v0); for(unsigned j=tmp.M;j--;) o_mat.l[j][i]+=tmp.c[j]; }

		eval( & tmp , & l0_v , v0 );
		memcpy( & sol , x , sizeof(gf<p>[20]) );
		sol -= tmp;
		sol.reduce();
		if( ! wiedemann<20>( tmp , o_mat , sol ) ) continue;
		memcpy( &((*y)[24]) , & tmp , sizeof(gf<p>[20]) );

	memcpy(&o_mat,&l1_o,sizeof(MLPS<p,20,20>));
	for( unsigned i=0;i<20;i++) 
	{ eval(&tmp,&l1_vo[i],v1); for(unsigned j=tmp.M;j--;) o_mat.l[j][i]+=tmp.c[j]; }

		eval( & tmp , & l1_v , v1 );
		memcpy( & sol , &((*x)[20]) , sizeof(gf<p>[20]) );
		sol -= tmp;
		sol.reduce();
		if( ! wiedemann<20>( tmp , o_mat , sol ) ) continue;
		memcpy( &((*y)[44]) , & tmp , sizeof(gf<p>[20]) );
			
		return 0;
	}
	return -1;

}


template <unsigned p>
void rainbow_w_64_40<p>::pub_map( VEC<p,l_sec> *y , const uint8 * pub_key , const VEC<p,l_msg> *x )
{
	MQPSv3<p, l_sec, l_msg> poly;
	memcpy( &poly , pub_key , sizeof( poly ));
	eval( y , & poly , x );
}

template <unsigned p>
int rainbow_w_64_40<p>::pri_map( VEC<p,l_msg> *x , const uint8 * pri_key , const VEC<p,l_sec> *y )
{
	MLPS<p,l_msg,l_msg> s_inv;
	MLPS<p,l_sec,l_sec> t_inv;
	memcpy( & s_inv , pri_key , sizeof(MLPS<p,l_msg,l_msg>) );
	memcpy( & t_inv , pri_key + sizeof(MLPS<p,l_msg,l_msg>) , sizeof(MLPS<p,l_sec,l_sec>) );

	VEC<p,l_sec> tmp_sec; zero_vec( & tmp_sec );
	VEC<p,l_msg> tmp_msg; zero_vec( & tmp_msg );

	eval( & tmp_sec , &t_inv , y );
	if( 0 != inv_q_map( & tmp_msg , pri_key , & tmp_sec )) return -1;
	eval( x , &s_inv , & tmp_msg );
	return 0;
}

template <unsigned p>
void rainbow_w_64_40<p>::pri_pub_map( VEC<p,l_sec> *y , const uint8 * pub_pri_key , const VEC<p,l_msg> *x )
{
	MLPS<p,l_msg,l_msg> s;
	MLPS<p,l_sec,l_sec> t;
	memcpy( &s , pub_pri_key , sizeof(s));
	memcpy( &t , pub_pri_key + sizeof(s) , sizeof(t));

	VEC<p,l_sec> tmp_sec; zero_vec( & tmp_sec );
	VEC<p,l_msg> tmp_msg; zero_vec( & tmp_msg );

	eval( & tmp_msg , &s , x );
	q_map( & tmp_sec , pub_pri_key , & tmp_msg );
	eval( y , &t , & tmp_sec );
}

template <unsigned p>
void rainbow_w_64_40<p>::gen_key( uint8 * pub_key , uint8 * pri_key )
{
	uint8 * pri_pub_key = new uint8 [sizeof_pri_key()];
	MLPS<p,l_msg,l_msg> s;// = (MLPS<p,l_msg,l_msg> *) pri_pub_key;
	MLPS<p,l_msg,l_msg> s_inv;
	MLPS<p,l_sec,l_sec> t;// = (MLPS<p,l_sec,l_sec> *) (pri_pub_key + sizeof( *s ));
	MLPS<p,l_sec,l_sec> t_inv;
	rand_affine_inv(&s, &s_inv);
	rand_affine_inv(&t, &t_inv);
	memcpy( pri_pub_key , &s , sizeof(s) );
	memcpy( pri_pub_key + sizeof(s) , & t , sizeof(t) );
	memcpy( pri_key , & s_inv , sizeof(s_inv) );
	memcpy( pri_key + sizeof(s_inv) , & t_inv , sizeof(t_inv) );
	
	gen_q_key(pri_key);
	memcpy( pri_pub_key + sizeof(s) + sizeof(t) , pri_key + sizeof(s) + sizeof(t) , sizeof_q_key() );

	MQPSv3<p, l_sec, l_msg> polys;
	VEC<p, l_msg> x;
	gfv<p> _polys[VEC<p, l_sec>::M][(l_msg+1)*(l_msg+2)/2+5];
	{
		VEC<p, l_sec> y;
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





#endif



