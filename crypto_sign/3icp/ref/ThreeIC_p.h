#ifndef _3IC_P_H
#define _3IC_P_H
#include <cstring>
#include <cstdlib>
#include "bqas.h"
#include "tower.h"


typedef unsigned char uint8;

template <unsigned pow>
class IC3_31_p {
public:
	IC3_31_p() {}
	virtual ~IC3_31_p(){}

	static void pub_map( VEC<31,pow*2> *y , const uint8 * pub_key , const VEC<31,pow*3-1> *x );
	static size_t sizeof_pub_key() { return sizeof( MQPSv3<31,pow*2,pow*3-1> ); }

	static void gen_key( uint8 * pub_key , uint8 * pri_key );
	static int pri_map( VEC<31,pow*3-1> *x , const uint8 * pri_key , const VEC<31,pow*2> *y );
	static void pri_pub_map( VEC<31,pow*2> *y , const uint8 * pub_pri_key , const VEC<31,pow*3-1> *x );
	static size_t sizeof_pri_key() { return (sizeof( MLPS<31,pow*3,pow*3> ) + sizeof( MLPS<31,pow*3,pow*3> ) + sizeof_q_key()); }

	static size_t sizeof_q_key() { return 0; }
	static void gen_q_key( uint8 * /* pri_key */ ) {}
	static void q_map( VEC<31,pow*3> *y , const uint8 * /* pri_key */ , const VEC<31,pow*3> *x );
	//static void inv_q_map( VEC<p,l_sec> *x , const uint8 * /* pri_key */ , const VEC<p,l_msg> *y );
};

template <unsigned pow>
void IC3_31_p<pow>::pub_map( VEC<31,pow*2> *y , const uint8 * pub_key , const VEC<31,pow*3-1> *x )
{
	MQPSv3<31,pow*2,pow*3-1> poly;
	memcpy( &poly , pub_key , sizeof( poly ));
	eval( y , & poly , x );
}

template <unsigned pow>
int IC3_31_p<pow>::pri_map( VEC<31,pow*3-1> *x , const uint8 * pri_key , const VEC<31,pow*2> *y )
{
	MLPS<31,pow*3,pow*3> s_inv;
	MLPS<31,pow*3,pow*3> t_inv;
	memcpy( & s_inv , pri_key , sizeof(s_inv) );
	memcpy( & t_inv , pri_key + sizeof(s_inv) , sizeof(t_inv) );

	VEC<31,pow*3> tmp_sec;
	VEC<31,pow*3> tmp_sec1;
	VEC<31,pow*3> tmp_msg;
	VEC<31,pow*3> tmp_msg1; 

	memcpy( & tmp_sec[0] , &(*y)[0] , sizeof(gf<31>[pow*2]) );

	while( 1 ){
		for( unsigned i=pow*2; i < pow*3 ; i++ )
			tmp_sec[i] = gf<31>::rand();
	
		eval( & tmp_sec1 , &t_inv , & tmp_sec );

		gftower<31, pow> x1 = gftower<31, pow>::load(&tmp_sec1[0]);
		gftower<31, pow> x2 = gftower<31, pow>::load(&tmp_sec1[pow]);	
		gftower<31, pow> R1 = x1 * x2;
		if( !R1 ) continue;
		gftower<31, pow> R2 = invert(R1);
		gftower<31, pow> x3 = gftower<31, pow>::load(&tmp_sec1[2*pow]);
		gftower<31, pow> R3 = x3 * R2;
		if (!R3) continue;
		gftower<31, pow> R4, R4a; sqrt_n_inv(&R4, &R4a, R3);
		if (square(R4) != R3) continue;
		gftower<31, pow> y1 = R4 * x2;
		gftower<31, pow> y2 = R4 * x1;
		gftower<31, pow> y3 = R4 * R4a;

		memcpy(&tmp_msg[0], &y1.v, sizeof(gf<31>[pow]));
		memcpy(&tmp_msg[pow], &y2.v, sizeof(gf<31>[pow]));
		memcpy(&tmp_msg[pow*2], &y3.v, sizeof(gf<31>[pow]));
	
		eval( &tmp_msg1 , &s_inv , & tmp_msg );
		if( tmp_msg1[pow*3-1] ) continue;
		break;
	}
	memcpy(&(*x)[0], &(tmp_msg1[0]), sizeof(*x));
	return 0;
}

template <unsigned pow>
void IC3_31_p<pow>::q_map( VEC<31,pow*3> *y , const uint8 * /* pri_key */ , const VEC<31,pow*3> *x )
{

	gftower<31, pow> x1 = gftower<31, pow>::load(&(*x)[0]);
	gftower<31, pow> x2 = gftower<31, pow>::load(&(*x)[pow]);
	gftower<31, pow> x3 = gftower<31, pow>::load(&(*x)[pow*2]);

	gftower<31, pow> y1 = x2 * x3;
	gftower<31, pow> y2 = x1 * x3;
	gftower<31, pow> y3 = x1 * x2;

	memcpy(&(*y)[0], &y1.v, sizeof(gf<31>[pow]));
	memcpy(&(*y)[pow], &y2.v, sizeof(gf<31>[pow]));
	memcpy(&(*y)[pow*2], &y3.v, sizeof(gf<31>[pow]));
}

template <unsigned pow>
void IC3_31_p<pow>::pri_pub_map( VEC<31,pow*2> *y , const uint8 * pub_pri_key , const VEC<31,pow*3-1> *x )
{
	MLPS<31,pow*3,pow*3> s;
	MLPS<31,pow*3,pow*3> t;
	memcpy( & s , pub_pri_key , sizeof(s) );
	memcpy( & t , pub_pri_key + sizeof(s) , sizeof(t) );

	VEC<31,pow*3> tmp_sec0; zero_vec( & tmp_sec0 );
	memcpy( &tmp_sec0[0] , &(*x)[0] , sizeof(gf<31>[pow*3-1]) );
	VEC<31,pow*3> tmp_sec;
	VEC<31,pow*3> tmp_msg;
	VEC<31,pow*3> tmp_msg1;

	eval( & tmp_sec , &s , &tmp_sec0 );
	q_map( & tmp_msg , pub_pri_key , & tmp_sec );
	eval( &tmp_msg1 , &t , & tmp_msg );
	memcpy( &(*y)[0] , &tmp_msg1 , sizeof( gf<31>[pow*2] ) );
}

template <unsigned pow>
void IC3_31_p<pow>::gen_key( uint8 * pub_key , uint8 * pri_key )
{
	uint8 * pri_pub_key = new uint8 [sizeof_pri_key()];
	MLPS<31,pow*3,pow*3> s;
	MLPS<31,pow*3,pow*3> s_inv;
	MLPS<31,pow*3,pow*3> t;
	MLPS<31,pow*3,pow*3> t_inv;
	rand_affine_inv(&s, &s_inv);
	rand_affine_inv(&t, &t_inv);
	memcpy( pri_pub_key , &s , sizeof(s) );
	memcpy( pri_pub_key + sizeof(s) , & t , sizeof(t) );
	memcpy( pri_key , & s_inv , sizeof(s_inv) );
	memcpy( pri_key + sizeof(s_inv) , & t_inv , sizeof(t_inv) );
	
	gen_q_key(pri_key);
	memcpy( pri_pub_key + sizeof(s) + sizeof(t) , pri_key + sizeof(s) + sizeof(t) , sizeof_q_key() );

	const unsigned p = 31;
	const unsigned l_sec = pow*2;
	const unsigned l_msg = pow*3 - 1;

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
