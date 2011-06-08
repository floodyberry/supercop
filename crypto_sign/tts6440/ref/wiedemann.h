#ifndef _WIEDEMANN_H_
#define _WIEDEMANN_H_

#include "bqas.h"
#include <emmintrin.h>




template <unsigned m>
void shiftLeft( VEC<31,m> & vec )
{
	for(unsigned i=VEC<31,m>::M-1;i>0;i--)
		vec.c[i].v = _mm_or_si128(_mm_srli_si128( vec.c[i-1].v,14),_mm_slli_si128(vec.c[i].v,2));
	vec.c[0].v = _mm_slli_si128(vec.c[0].v,2);
}

template <unsigned m>
int dot_without_reduce( VEC<31,m> & vec1 , VEC<31,m> & vec2 )
{
	VEC<31,m> v1 = vec1;

	if( 0 != (m%8))
		v1.c[VEC<31,m>::M-1].v = _mm_srli_si128( _mm_slli_si128( (v1.c[VEC<31,m>::M-1].v),(2*(8-(m%8))) ), (2*(8-(m%8))) );
	__m128i res = _mm_setzero_si128();
	for(unsigned i=VEC<31,m>::M;i--;) res = _mm_add_epi32(res, _mm_madd_epi16(v1.c[i].v,vec2.c[i].v));
	
	__m128i rep_res = _mm_srli_si128( res , 8 );
	res = _mm_add_epi32( res , rep_res );
	rep_res = _mm_srli_si128( res , 4 );
	res = _mm_add_epi32( res , rep_res );

	return ((int*)&res)[0];
}

template <unsigned m>
gf<31> dot( const VEC<31,m> & vec1 , const VEC<31,m> & vec2 )
{
	VEC<31,m> v1 = vec1;

	if( 0 != (m%8))
		v1.c[VEC<31,m>::M-1].v = _mm_srli_si128( _mm_slli_si128( (v1.c[VEC<31,m>::M-1].v),(2*(8-(m%8))) ), (2*(8-(m%8))) );
	__m128i res = _mm_setzero_si128();
	for(unsigned i=VEC<31,m>::M;i--;) res = _mm_add_epi32(res, _mm_madd_epi16(v1.c[i].v,vec2.c[i].v));
	
	__m128i rep_res = _mm_srli_si128( res , 8 );
	res = _mm_add_epi32( res , rep_res );
	rep_res = _mm_srli_si128( res , 4 );
	res = _mm_add_epi32( res , rep_res );

	const __m128i mask = _mm_set1_epi32(1023);
	res = _mm_add_epi32(_mm_srai_epi32(res, 10), _mm_and_si128(res, mask));
	res = reducev( (gfv<31>)res ).v;
	
	return ((gfv<31>)res)[0];
}

template <unsigned n>
void berlekamp2( VEC<31,n> & minPoly , int *deg_poly , const VEC<31,2*n> seq )
{
	VEC<31,n> a_i; zero_vec<31,n>( &a_i );
	VEC<31,n> tmp;
	VEC<31,n> pre_minPoly; zero_vec<31,n>( & pre_minPoly );
	zero_vec<31,n>( &minPoly ); ((short*)( &minPoly))[0] = 1;
	int pre_deg=0 , deg=0;
	
	gf<31> head_term,pre_head_term = 1;
	int head_deg,pre_head_deg=0;
	for( int j=0 ; j < (int)(2*n) ; j++ ){
printf("round:%d\n",j+1);
		shiftLeft( a_i ); a_i[0] = seq[j];
printf("a_i:          [%d] " , -j ); a_i.dump( stdout );
		head_term = dot( a_i , minPoly );
		head_deg = deg -j - 1;
printf("minPoly:      [%d] " , deg ); minPoly.dump( stdout );
printf("head_term:     %3d [%d]\n" , (int)head_term.v , head_deg );
		if( head_term ) {
			if( head_deg <= pre_head_deg ) {
printf("pre_head_term: %3d [%d]\n",(int)(pre_head_term.v), pre_head_deg);
printf("pre_min_poly: [%d] " , pre_deg ); pre_minPoly.dump( stdout );
				int diff_deg = pre_head_deg - head_deg;
				int new_deg = deg + diff_deg;
				
				tmp = minPoly;
				for( int i = new_deg - pre_deg ; i-- ; ) shiftLeft( pre_minPoly );
				minPoly -= pre_minPoly * ( head_term / pre_head_term );
				pre_head_term = head_term;
				pre_head_deg = head_deg;
				pre_minPoly = tmp;
				pre_deg = deg;
				deg = new_deg;
printf("new minPoly:  [%d] " , deg ); minPoly.dump( stdout );
			} else {  // head_deg > pre_head_deg
				tmp = pre_minPoly;
				int tmp_pre_deg = pre_deg;
				int diff_deg = head_deg - pre_head_deg;
				tmp_pre_deg += diff_deg;
				
				for( int i = deg - tmp_pre_deg ; i--; ) shiftLeft( tmp );
				minPoly -= tmp * ( head_term / pre_head_term );
			} 
			minPoly.reduce();
		}
	}
	*deg_poly = deg;
	
}


template <unsigned n>
void berlekamp_massey( VEC<31,n> & minPoly , int *deg_poly , const VEC<31,2*n> seq )
{
	VEC<31,n> a_i;	zero_vec<31,n>( &a_i );
	VEC<31,n> tmp;
	VEC<31,n> pre_minPoly;	zero_vec<31,n>( &pre_minPoly );

	zero_vec<31,n>( &minPoly ); minPoly[0] = gf<31>(1);

	gf<31> head_term,pre_head_term = 1;
	unsigned diff_deg = 0;

	for( unsigned j = 0; j < 2*n ; j++ )
	{
		// shift left pri_minPoly   <-- pre_minPoly = x  pre_minPoly
		shiftLeft( pre_minPoly );

		// prepare a_i // shift left and add one element
		shiftLeft( a_i ); a_i[0] = seq[j];

		// count head_term
		head_term = dot( a_i , minPoly );

		if( head_term ){
			tmp = minPoly;
			minPoly -= pre_minPoly * ( head_term / pre_head_term );
			minPoly.reduce();
			// update dim_minPoly
			if( (j+1) > (diff_deg<<1) ) {
				pre_minPoly = tmp;
				pre_head_term = head_term;
				diff_deg = (j+1) - diff_deg;
			}
		}
	}
	for( unsigned i=n ; i-- ; ) if( minPoly[i] ) { *deg_poly = i; return; }
}


template <unsigned n>
bool wiedemann( VEC<31,n> & sol , const MLPS<31,n,n> &mat , const VEC<31,n> &b )
{
	VEC<31,n> bs[2*(n+1)];
	VEC<31,2*(n+1)> seq;
	VEC<31,n+1> minPoly;
	VEC<31,n+1> backMinPoly;
	int deg_back = 0;
	int deg_poly = 0;
	
	bs[0] = b;
	for( unsigned i = 1 ; i < 2*(n+1) ; i++ )
		eval( & (bs[i]), &mat , &(bs[i-1]));

	for( unsigned j = 0 ; j < n ; j++ ) {
		for( unsigned i = 0 ; i < 2*(n+1) ; i++ ) seq[i] = bs[i][j];
		//VEC<31,n> rv;
		//rand_vec( & rv );
		//for( unsigned i = 0 ; i < 2*(n+1) ; i++ ) seq[i] = dot( rv , bs[i] );
		//seq.dump( stdout );

		berlekamp_massey( minPoly , & deg_poly , seq );
		//minPoly.dump( stdout );
		if( deg_poly == (int)n ) break;
		if( deg_poly == (deg_back == (int)(n-1))) break;
		if( deg_poly > deg_back ) { backMinPoly = minPoly; deg_back=deg_poly; }
	}
	if( deg_poly < deg_back ) { minPoly = backMinPoly; deg_poly = deg_back; }
	
	if( n == deg_poly )	{
		sol = bs[n-1]*minPoly[0];
		for( int i = n-2 ; i >= 0 ; i-- ) sol += bs[i] * minPoly[n-1-i];
		sol *= ( - invert<31>(minPoly[n]) );
		sol.reduce();
	} else {
		sol = bs[deg_poly-1]*minPoly[0];
		for( int i = deg_poly-2 ; i>=0 ; i-- ) sol += bs[i] * minPoly[deg_poly-1-i];
		sol *= ( -invert<31>(minPoly[deg_poly]));
		sol.reduce();
	}
	eval( & (bs[1]) , &mat , &sol );  /////////// for check answer
	bs[1].reduce();  ///////////
	if( (bs[1][0]==bs[0][0])&& (bs[1][1]==bs[0][1]) && (bs[1][2]==bs[0][2]) ) return true; //////
	return false;
	return true;
}





#endif
