#ifndef _MQPKC_H
#define _MQPKC_H

#include "blas.h"

template < unsigned GF , unsigned N , unsigned M , unsigned P >
struct private_key 
{
	matrix<GF,M,M> t_inv_mat;
	gfv<GF,M> t_vec;
	matrix<GF,N,N> s_inv_mat;
	gfv<GF,N> s_vec;
};


template < unsigned GF , unsigned N , unsigned M , unsigned P >
class MQPKC
{
public:
	void public_map( gfv<GF,M> & y , const byte * pub_key , const gfv<GF,N-P> x ) const {const quad_poly<GF,M,N-P> *poly=(const quad_poly<GF,M,N-P>*)pub_key; y=poly->eval(x); }
	void private_map( gfv<GF,N-P> &y , const byte * pri_key , const gfv<GF,M> x) const
	{
		const private_key<GF,N,M,P> * pri = (const private_key<GF,N,M,P>*) pri_key;
		gfv<GF,M> tmp1; gfv<GF,N> tmp2;
		tmp1 = pri->t_inv_mat.prod( x + pri->t_vec );
		ivs_qmap(tmp2,pri_key,tmp1);
		tmp2=pri->s_inv_mat.prod( tmp2 + pri->s_vec );
		memcpy( &y , &tmp2 , sizeof(gfv<GF,N-P>));   //////////////////
	}

	int gen_key( byte * pub_key , byte * pri_key );

	virtual int gen_qkey( byte * ) { return 0; }
	virtual void qmap( gfv<GF,M> & y , const byte *, const gfv<GF,N> & x ) const { memcpy(&y,&x,(N>M)?sizeof(gfv<GF,M>):sizeof(gfv<GF,N>)); }
	virtual void ivs_qmap( gfv<GF,N> & y , const byte *, const gfv<GF,M> & x ) const { memcpy( &y,&x,(N>M)?sizeof(gfv<GF,M>):sizeof(gfv<GF,N>) ); }

	unsigned sizeof_public_key() const { return sizeof(quad_poly<GF,M,N-P>); }
	virtual unsigned sizeof_private_key() const { return sizeof(private_key<GF,N,M,P>); }

	static MQPKC * get_instance() { if(!instance)instance=new MQPKC(); return instance; }
	virtual ~MQPKC() {;}
protected:
	MQPKC() {;}
	static MQPKC * instance;
	
	void pub_map( gfv<GF,M> & y ,const byte *pri_key, const gfv<GF,N> & x ) const { gfv<GF,M>tmp2;	qmap(tmp2,pri_key,s_mat.prod(x)+s_vec);	y=t_mat.prod(tmp2)+t_vec; }
	void gen_public_key( quad_poly<GF,M,N-P> & pub ,const byte *pri_key);
	
	matrix<GF,N,N> s_mat;
	gfv<GF,N> s_vec;
	matrix<GF,M,M> t_mat;
	gfv<GF,M> t_vec;
};

template < unsigned GF , unsigned N , unsigned M , unsigned P >
MQPKC<GF,N,M,P>* MQPKC<GF,N,M,P>::instance=NULL;

template < unsigned GF , unsigned N , unsigned M , unsigned P>
int MQPKC<GF,N,M,P>::gen_key( byte * pub_key , byte * pri_key )
{
	gen_qkey( pri_key );
	private_key<GF,N,M,P> & pri = *((private_key<GF,N,M,P> *) pri_key);

	gen_matrix<GF,N>( s_mat , pri.s_inv_mat );
	gen_matrix<GF,M>( t_mat , pri.t_inv_mat );
	s_vec = gfv<GF,N>::rand(); pri.s_vec = s_vec; 
	t_vec.set_zero();
	gfv<GF,N> tmp; tmp.set_zero();
	pub_map( t_vec ,pri_key, tmp );
	pri.t_vec = t_vec;
	
	quad_poly<GF,M,N-P> & pub = *((quad_poly<GF,M,N-P> *) pub_key);
	gen_public_key( pub ,pri_key);
	
	return 0;
}

template < unsigned GF , unsigned N , unsigned M , unsigned P>
void MQPKC<GF,N,M,P>::gen_public_key( quad_poly<GF,M,N-P> & pub ,const byte* pri_key)
{
	const unsigned dim_x = N-P;
	gfv<GF,N> tmp;
	gfv<GF,M> tmp2;
	for( unsigned i=0; i<dim_x ;i++ ) {
		tmp.set_zero(); tmp.set( i , gf<GF>(1) );
		pub_map( pub.L[i] ,pri_key, tmp );  // Q+L
		tmp.set( i , gf<GF>(2) );
		pub_map( pub.Q[i*(3+i)/2] ,pri_key, tmp );  // 4Q+2L
		tmp2 = pub.L[i] * gf<GF>(2); // 2Q + 2L
		pub.Q[i*(3+i)/2] += tmp2; // 6Q
		pub.Q[i*(3+i)/2]*=(gf<GF>(6)).inv(); // Q
		pub.L[i] += pub.Q[i*(3+i)/2];
	}
	unsigned idx=0;
	for( unsigned i=0; i<dim_x; i++ ) {
		for( unsigned j=0; j<i ; j++ ) {
			tmp.set_zero(); tmp.set(i,gf<GF>(1)); tmp.set(j,gf<GF>(1));
			pub_map( pub.Q[idx] ,pri_key, tmp );
			pub.Q[idx] += pub.Q[j*(3+j)/2] + pub.Q[i*(3+i)/2] + pub.L[i] + pub.L[j];
			idx++;
		}
		idx++;
	}
}


#endif
