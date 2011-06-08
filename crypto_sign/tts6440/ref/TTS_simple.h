

#ifndef _TTS_SMP_H_
#define _TTS_SMP_H_

#include <cstdlib>
#include <cstring>
#include "bqas.h"


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

template <unsigned m>
gf<31> dot( const VEC<31,m> & vec1 , const VEC<31,m> & vec2 )
{
	VEC<31,m> v1 = vec1;

	if( 0 != (m%8))
		v1.c[VEC<31,m>::M-1].v = _mm_srli_si128( _mm_slli_si128( 
(v1.c[VEC<31,m>::M-1].v),(2*(8-(m%8))) ), (2*(8-(m%8))) );
	__m128i res = _mm_setzero_si128();
	for(unsigned i=VEC<31,m>::M;i--;) res = _mm_add_epi32(res, 
_mm_madd_epi16(v1.c[i].v,vec2.c[i].v));
	
	__m128i rep_res = _mm_srli_si128( res , 8 );
	res = _mm_add_epi32( res , rep_res );
	rep_res = _mm_srli_si128( res , 4 );
	res = _mm_add_epi32( res , rep_res );

	const __m128i mask = _mm_set1_epi32(1023);
	res = _mm_add_epi32(_mm_srai_epi32(res, 10), _mm_and_si128(res, mask));
	res = reducev( (gfv<31>)res ).v;
	
	return ((gfv<31>)res)[0];
}

template <unsigned p, unsigned m , unsigned n>
struct row_matrix
{
	VEC<p,n> rows[m];

	static void prod( VEC<p,m> & y , const row_matrix<p,m,n> & mat , const 
VEC<p,n> & x ); 
	static bool guass_elim( VEC<p,m> & sol , const row_matrix<p,m,n> & mat , 
const VEC<p,n> & b );
	static void rand_mat( row_matrix<p,m,n> & mat );
	static bool guass_elim2( VEC<p,m> & sol , row_matrix<p,m,n> & mat , const 
VEC<p,n> & b );
};

template <unsigned p, unsigned m , unsigned n>
void row_matrix<p,m,n>::prod(VEC<p,m> & y , const row_matrix<p,m,n> & mat , const 
VEC<p,n> & x)
{
	gf<p> res[m];
	for( unsigned i=0; i < m ; i++ )
		res[i] = dot( mat.rows[i] , x );
	for( unsigned i=0; i < m ; i++ ) y[i] = res[i];
}



template <unsigned p, unsigned m , unsigned n>
bool row_matrix<p,m,n>::guass_elim( VEC<p,m> & sol , const row_matrix<p,m,n> & mat 
, const VEC<p,n> & b )
{
	row_matrix<p,m,n+1> _mat;
	for(unsigned i=0; i<m; i++ ) memcpy( &(_mat.rows[i]) , &(mat.rows[i]) , 
sizeof(gf<p>[n]) );
	for(unsigned i=0; i<m; i++ ) _mat.rows[i][n] = b[i];

	VEC<p,n+1> tmp;
	gf<p> pivots[m];

	for(unsigned i=0; i<m; i++ ) {
		for( unsigned j=i ; j<m ; j++ ) pivots[j] = _mat.rows[j][i];

		if( ! pivots[i] ) {
			for( unsigned j=i+1 ; j<m ; j++ )
				if( pivots[j] ) { 
					tmp=_mat.rows[i]; 
_mat.rows[i]=_mat.rows[j]; _mat.rows[j]=tmp; 
					gf<p> qq = pivots[i]; pivots[i]=pivots[j]; 
pivots[j]=qq;
					break;
				}
		}
		if( ! pivots[i] ) return false;
		
		gf<p> inv_ = invert( _mat.rows[i][i] ); _mat.rows[i] *= inv_;	 
_mat.rows[i].reduce(); 

		for( unsigned j=i+1; j<m ; j++ )
			if( pivots[j] ) { _mat.rows[j] -= _mat.rows[i] * 
pivots[j]; _mat.rows[j].reduce(); }
	}
	zero_vec( & sol );
	sol[m-1] = _mat.rows[m-1][n];
	VEC<p,n> * ptrTmp;
	for( unsigned i=m-1; i-- ; ) {
		ptrTmp = (VEC<p,n>*) &(_mat.rows[i]);
		gf<p> r = dot( *ptrTmp , sol );
		sol[i] = _mat.rows[i][n] - r;
	}
	sol.reduce();
	return true;
}


template <unsigned p, unsigned m , unsigned n>
void row_matrix<p,m,n>::rand_mat( row_matrix<p,m,n> & mat )
{
		for( unsigned i=m ; i--; ) rand_vec( &(mat.rows[i]));
}


template <unsigned p, unsigned m , unsigned n>
bool row_matrix<p,m,n>::guass_elim2( VEC<p,m> & sol , row_matrix<p,m,n> & mat , 
const VEC<p,n> & b )
{
	VEC<p,n> tmp;
	gf<p> pivots[m];
	int _b[m]; for( unsigned i=m;i--; ) _b[i]= (int)(b[i].v);
	int ttt;

	for(unsigned i=0; i<m; i++ ) {
		for( unsigned j=i ; j<m ; j++ ) pivots[j] = mat.rows[j][i];

		if( ! pivots[i] ) {
			for( unsigned j=i+1 ; j<m ; j++ )
				if( pivots[j] ) { 
					tmp=mat.rows[i]; mat.rows[i]=mat.rows[j]; 
mat.rows[j]=tmp;
					gf<p> qq = pivots[i]; pivots[i]=pivots[j]; 
pivots[j]=qq;
					ttt = _b[i]; _b[i] = _b[j]; _b[j]=ttt;
					break;
				}
		}
		if( ! pivots[i] ) return false;
		
		gf<p> inv_ = invert( mat.rows[i][i] ); mat.rows[i] *= inv_; 
mat.rows[i].reduce(); 
		_b[i] *= (int)(inv_.v); _b[i]%=31;//_b[i] = (_b[i]&31)+(_b[i]>>5);

		for( unsigned j=i+1; j<m ; j++ )
			if( pivots[j] ) { mat.rows[j]-=mat.rows[i]*pivots[j]; 
mat.rows[j].reduce(); _b[j]-=_b[i]*((int)(pivots[j].v)); 
_b[j]%=31;/*_b[j]=(_b[j]&31)+(_b[j]>>5);*/}
	}
	zero_vec( & sol );
	sol[m-1] = _b[m-1];
	for( unsigned i=m-1; i-- ; ) {
		gf<p> r = dot( mat.rows[i] , sol );
		sol[i] = ((short)_b[i] - r.v);
	}
	sol.reduce();
	return true;
}








template <unsigned p, unsigned m, unsigned n>
void rand_quad( MQPS<p,m,n> * poly )
{
	rand_matrix( poly );
	for( unsigned i = poly->M ; i-- ; )
		for( unsigned j = n*(n+1)/2 ; j-- ; )
			rand_gfv( &(poly->q[i][j]) );
}




template <int DIM>
void shuffle( unsigned char * list)
{
	for( int i = 0 ; i < 3 ; i++ )
		for( int j = 0 ; j < DIM ; j++ )
		{
			int k = rand()%DIM;
			unsigned char temp = list[j];
			list[j] = list[k];
			list[k]=temp;
		}
}

template <unsigned n1 , unsigned n2>
inline void split( unsigned char o1[n1] , unsigned char o2[n2] , const unsigned char * list )
{
	memcpy( o1 , list , sizeof(unsigned char[n1]) );
	memcpy( o2 , list+n1 , sizeof(unsigned char[n2]) );
}
template <unsigned n1 , unsigned n2 , unsigned n3>
inline void split( unsigned char o1[n1] , unsigned char o2[n2] , unsigned char o3[n3] , const unsigned char * list )
{
	memcpy( o1 , list , sizeof(unsigned char[n1]) );
	memcpy( o2 , list+n1 , sizeof(unsigned char[n2]) );
	memcpy( o3 , list+n1+n2 , sizeof(unsigned char[n3]) );
}

template <unsigned p,unsigned m1,unsigned m2>
inline void VEC_permute( VEC<p,m1> & o_v , const VEC<p,m2> & i_v , const unsigned char * idx )
{
	for(unsigned i=m1;i--;) o_v[i]=i_v[idx[i]];	
}

template <unsigned p, unsigned m>
inline void VEC_mul( VEC<p,m> & sol , const VEC<p,m> &vec1 , const VEC<p,m> &vec2 )
{
	for(unsigned i=sol.M;i--; ) sol.c[i] = vec1.c[i]*vec2.c[i];
	sol.reduce();
}


template <unsigned p, unsigned m , unsigned n , unsigned l_q>
struct tts_eq
{
	VEC<p,l_q> coffs[m];
	unsigned char q_idx[m][l_q*2];
	unsigned char l_idx[3*m];

	static void rand( tts_eq & eqs ){
		for(unsigned i=m; i--; ) rand_vec( & (eqs.coffs[i]) );
		for(unsigned i=3*m;i--; ) eqs.l_idx[i] = i%n;  shuffle<3*m>( eqs.l_idx );
	}

	void eval( VEC<p,m> & y , const VEC<p,n> & x) const {
		VEC<p,l_q> x1,x2,x_tmp;
		gf<p> _y[m];
		const unsigned char * ptr = l_idx;
		for( unsigned i=m; i--; ) {
			VEC_permute( x1 , x , q_idx[i] );
			VEC_permute( x2 , x , q_idx[i]+l_q );
			VEC_mul( x_tmp , x1 , x2 );
			_y[i]= dot( x_tmp , coffs[i] ) + x[*ptr] + x[*(ptr+1)] + x[*(ptr+2)]; ptr += 3; 
		}
		for( unsigned i=m; i--; ) y[i] = _y[i];
		y.reduce();
	}
};









template <unsigned p>
class TTS_g_64_40 {		/// 24 20 20
public:
	TTS_g_64_40() {}
	virtual ~TTS_g_64_40(){}

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
size_t TTS_g_64_40<p>::sizeof_q_key()
{
	// 24 , 20 , 20
	return (
	sizeof( unsigned char [20][20] ) + 
	sizeof( row_matrix<p,20,20> ) + 
	sizeof( tts_eq<p,20,24,(24-20)/2> ) +
	sizeof( unsigned char [20][20] ) +
	sizeof( unsigned char [20][20] ) +
	sizeof( row_matrix<p,20,20> ) +
	sizeof( row_matrix<p,20,20> ) +
	sizeof( tts_eq<p,20,44,(44-(20*2))/2> ) );
}

template <unsigned p>
void TTS_g_64_40<p>::gen_q_key( uint8 *  pri_key  )
{
	// 24 , 20 , 20
	unsigned char l0_idx[20][20];
	row_matrix<p,20,20> l0_vo_coff;
	tts_eq<p,20,24,(24-20)/2> l0_v;
	unsigned char l1_idx1[20][20];
	unsigned char l1_idx2[20][20];
	row_matrix<p,20,20> l1_vo_coff1;
	row_matrix<p,20,20> l1_vo_coff2;
	tts_eq<p,20,44,(44-(20*2))/2> l1_v;
	
	unsigned char tmp[44];
	for( unsigned k=20;k--; ) {
		for( unsigned char i=0;i<24;i++) tmp[i]=i; shuffle<24>(tmp);
		split<20,4>( l0_idx[k] , l0_v.q_idx[k] , tmp );
	}
	tts_eq<p,20,24,2>::rand( l0_v );
	row_matrix<p,20,20>::rand_mat( l0_vo_coff );
	
	for(unsigned k=20;k--; ) {
		for( unsigned char i=0;i<44;i++) tmp[i]=i; shuffle<44>(tmp);
		split<20,20,4>( l1_idx1[k] , l1_idx2[k] , l1_v.q_idx[k] , tmp );
	}
	tts_eq<p,20,44,2>::rand( l1_v );
	row_matrix<p,20,20>::rand_mat( l1_vo_coff1 );
	row_matrix<p,20,20>::rand_mat( l1_vo_coff2 );
	
	pri_key += sizeof( MLPS<p, l_msg, l_msg> ) + sizeof( MLPS<p, l_sec, l_sec> );

	memcpy( pri_key , l0_idx , 20*20 ); pri_key += 20*20;
	memcpy( pri_key , & l0_vo_coff , sizeof(row_matrix<p,20,20>) ); pri_key += sizeof(row_matrix<p,20,20>);
	memcpy( pri_key , & l0_v , sizeof(tts_eq<p,20,24,2>) ); pri_key += sizeof(tts_eq<p,20,24,2>);
	
	memcpy( pri_key , l1_idx1 , 20*20 ); pri_key += 20*20;
	memcpy( pri_key , l1_idx2 , 20*20 ); pri_key += 20*20;
	memcpy( pri_key , & l1_vo_coff1 , sizeof(row_matrix<p,20,20>) ); pri_key += sizeof(row_matrix<p,20,20>);
	memcpy( pri_key , & l1_vo_coff2 , sizeof(row_matrix<p,20,20>) ); pri_key += sizeof(row_matrix<p,20,20>);
	memcpy( pri_key , & l1_v , sizeof(tts_eq<p,20,44,2>) ); pri_key += sizeof(tts_eq<p,20,44,2>);

}

template <unsigned p>
void TTS_g_64_40<p>::q_map( VEC<p,l_sec> *y , const uint8 *  pri_key  , const VEC<p,l_msg> *x )
{
	unsigned char l0_idx[20][20];
	row_matrix<p,20,20> l0_vo_coff;
	tts_eq<p,20,24,(24-20)/2> l0_v;
	unsigned char l1_idx1[20][20];
	unsigned char l1_idx2[20][20];
	row_matrix<p,20,20> l1_vo_coff1;
	row_matrix<p,20,20> l1_vo_coff2;
	tts_eq<p,20,44,(44-(20*2))/2> l1_v;
	
	pri_key += sizeof( MLPS<p, l_msg, l_msg> ) + sizeof( MLPS<p, l_sec, l_sec> );

	memcpy( l0_idx , pri_key , 20*20 ); pri_key += 20*20;
	memcpy( & l0_vo_coff , pri_key , sizeof(row_matrix<p,20,20>) ); pri_key += sizeof(row_matrix<p,20,20>);
	memcpy( & l0_v , pri_key , sizeof(tts_eq<p,20,24,2>) ); pri_key += sizeof(tts_eq<p,20,24,2>);
	
	memcpy( l1_idx1 , pri_key , 20*20 ); pri_key += 20*20;
	memcpy( l1_idx2 , pri_key , 20*20 ); pri_key += 20*20;
	memcpy( & l1_vo_coff1 , pri_key , sizeof(row_matrix<p,20,20>) ); pri_key += sizeof(row_matrix<p,20,20>);
	memcpy( & l1_vo_coff2 , pri_key , sizeof(row_matrix<p,20,20>) ); pri_key += sizeof(row_matrix<p,20,20>);
	memcpy( & l1_v , pri_key , sizeof(tts_eq<p,20,44,2>) ); pri_key += sizeof(tts_eq<p,20,44,2>);

	const VEC<p,24> * v0 = (const VEC<p,24> *)x;
	const VEC<p,44> * v1 = (const VEC<p,44> *)x;
	VEC<p,20> o0;	memcpy( & o0 , &((*x)[24])	 , sizeof(gf<p>[20]) );
	VEC<p,20> o1;	memcpy( & o1 , &((*x)[44])	 , sizeof(gf<p>[20]) );
	
	row_matrix<p,20,20> o_mat;
	
	VEC<p,20> tmp1,tmp2,tmp;
	for(unsigned i=20;i--;) {
		VEC_permute( tmp1 , *v0 , l0_idx[i] );
		VEC_mul( o_mat.rows[i] , l0_vo_coff.rows[i] , tmp1 );
		o_mat.rows[i][i] += (gf<p>)1;
	}
	l0_v.eval( tmp1 , *v0 );
	row_matrix<p,20,20>::prod( tmp2 , o_mat , o0 );
	tmp1 += tmp2; tmp1.reduce();
	memcpy( y , & tmp1 , sizeof(gf<p>[20]) );
	
	for(unsigned i=20;i--;){
		VEC_permute( tmp1 , *v1 , l1_idx1[i] );
		VEC_permute( tmp2 , *v1 , l1_idx2[i] );
		VEC_mul(tmp,l1_vo_coff1.rows[i],tmp1); 
		VEC_mul(o_mat.rows[i],l1_vo_coff2.rows[i],tmp2); 
		o_mat.rows[i] += tmp; o_mat.rows[i][i] += (gf<p>)1; o_mat.rows[i].reduce();
	}
	l1_v.eval( tmp1 , *v1 );
	row_matrix<p,20,20>::prod( tmp2 , o_mat , o1 );
	tmp1 += tmp2; tmp1.reduce();
	memcpy( &((*y)[20]) , & tmp1 , sizeof(gf<p>[20]) );
	y->reduce();

}

template <unsigned p>
int TTS_g_64_40<p>::inv_q_map( VEC<p,l_msg> *y , const uint8 *  pri_key  , const VEC<p,l_sec> *x )
{
	unsigned char l0_idx[20][20];
	row_matrix<p,20,20> l0_vo_coff;
	tts_eq<p,20,24,(24-20)/2> l0_v;
	unsigned char l1_idx1[20][20];
	unsigned char l1_idx2[20][20];
	row_matrix<p,20,20> l1_vo_coff1;
	row_matrix<p,20,20> l1_vo_coff2;
	tts_eq<p,20,44,(44-(20*2))/2> l1_v;
	
	pri_key += sizeof( MLPS<p, l_msg, l_msg> ) + sizeof( MLPS<p, l_sec, l_sec> );

	memcpy( l0_idx , pri_key , 20*20 ); pri_key += 20*20;
	memcpy( & l0_vo_coff , pri_key , sizeof(row_matrix<p,20,20>) ); pri_key += sizeof(row_matrix<p,20,20>);
	memcpy( & l0_v , pri_key , sizeof(tts_eq<p,20,24,2>) ); pri_key += sizeof(tts_eq<p,20,24,2>);
	
	memcpy( l1_idx1 , pri_key , 20*20 ); pri_key += 20*20;
	memcpy( l1_idx2 , pri_key , 20*20 ); pri_key += 20*20;
	memcpy( & l1_vo_coff1 , pri_key , sizeof(row_matrix<p,20,20>) ); pri_key += sizeof(row_matrix<p,20,20>);
	memcpy( & l1_vo_coff2 , pri_key , sizeof(row_matrix<p,20,20>) ); pri_key += sizeof(row_matrix<p,20,20>);
	memcpy( & l1_v , pri_key , sizeof(tts_eq<p,20,44,2>) ); pri_key += sizeof(tts_eq<p,20,44,2>);

	VEC<p,24> * l0_sv = (VEC<p,24> *)y;
	VEC<p,44> * l1_sv = (VEC<p,44> *)y;
	VEC<p,20> tmp, sol;
	VEC<p,20> l_so;
	
	row_matrix<p,20,20> mat_o;

	for( unsigned i=5; i--; ) {
		rand_vec( l0_sv );
		for(unsigned i=20;i--;) {
			VEC_permute( tmp , *l0_sv , l0_idx[i] );
			VEC_mul( mat_o.rows[i] , l0_vo_coff.rows[i] , tmp );
			mat_o.rows[i][i] += (gf<p>) 1;
		}
		memcpy( &sol , x , sizeof(gf<p>[20]));
		l0_v.eval( tmp , *l0_sv );
		sol -= tmp; sol.reduce();
		if( ! row_matrix<p,20,20>::guass_elim( l_so , mat_o , sol ) ) continue;
		memcpy( &((*y)[24]) , & l_so , sizeof(gf<p>[20]) );
		
		for( unsigned i=20;i--;){
			VEC_permute( tmp , *l1_sv , l1_idx1[i] );
			VEC_mul( mat_o.rows[i] , l1_vo_coff1.rows[i] , tmp );
			VEC_permute( tmp , *l1_sv , l1_idx2[i] );
			VEC_mul( sol , l1_vo_coff2.rows[i] , tmp); 
			mat_o.rows[i] += sol; mat_o.rows[i][i] += (gf<p>)1; mat_o.rows[i].reduce();
		}
		memcpy( & sol , & ((*x)[20]) , sizeof(gf<p>[20]));
		l1_v.eval( tmp , *l1_sv );
		sol -= tmp; sol.reduce();
		if( ! row_matrix<p,20,20>::guass_elim( l_so , mat_o , sol ) ) continue;
		memcpy( &((*y)[44]) , & l_so , sizeof(gf<p>[20]) );

		return 0;
	}
	return -1;
}


template <unsigned p>
void TTS_g_64_40<p>::pub_map( VEC<p,l_sec> *y , const uint8 * pub_key , const VEC<p,l_msg> *x )
{
	MQPSv3<p, l_sec, l_msg> poly;
	memcpy( &poly , pub_key , sizeof( poly ));
	eval( y , & poly , x );
}

template <unsigned p>
int TTS_g_64_40<p>::pri_map( VEC<p,l_msg> *x , const uint8 * pri_key , const VEC<p,l_sec> *y )
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
void TTS_g_64_40<p>::pri_pub_map( VEC<p,l_sec> *y , const uint8 * pub_pri_key , const VEC<p,l_msg> *x )
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
void TTS_g_64_40<p>::gen_key( uint8 * pub_key , uint8 * pri_key )
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
