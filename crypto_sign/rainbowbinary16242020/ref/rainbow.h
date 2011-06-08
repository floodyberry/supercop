#ifndef _RAINBOW_H
#define _RAINBOW_H

#include "MQPKC.h"
#include "linear_solver.h"

template < unsigned GF , unsigned V0 , unsigned O0 , unsigned O1 >
struct rainbow_private_key : private_key<GF,V0+O0+O1,O0+O1,0>
{
	// 24 , 20 , 20
	quad_poly<GF,O0,V0> l0_v;
	matrix<GF,O0,O0> l0_o;
	quad_poly<GF,O1,V0+O0> l1_v;
	matrix<GF,O1,O1> l1_o;
	matrix<GF,O0,V0> l0_vo[O0];
	matrix<GF,O1,V0+O0> l1_vo[O1];
};

template < unsigned GF , unsigned V0 , unsigned O0 , unsigned O1 >
class rainbow : public MQPKC<GF,V0+O0+O1,O0+O1,0>
{
public:
	static const unsigned M=O0+O1;
	static const unsigned N=V0+O0+O1;

	virtual int gen_qkey( byte * pri_key );
	virtual void qmap( gfv<GF,M> & y , const byte * pri_key, const gfv<GF,N> & x ) const;
	virtual void ivs_qmap( gfv<GF,N> & y , const byte * pri_key , const gfv<GF,M> & x ) const;

	virtual unsigned sizeof_private_key() const { return sizeof(rainbow_private_key<GF,V0,O0,O1>); }
	
	static rainbow * get_instance() { if(!instance)instance=new rainbow(); return instance; }
private:
	static rainbow * instance;
	rainbow() {;}
};

template < unsigned GF , unsigned V0 , unsigned O0 , unsigned O1 >
rainbow<GF,V0,O0,O1> * rainbow<GF,V0,O0,O1>::instance = NULL;


template < unsigned GF , unsigned V0 , unsigned O0 , unsigned O1 >
int rainbow<GF,V0,O0,O1>::gen_qkey( byte * pri_key ) 
{
	rainbow_private_key<GF,V0,O0,O1>* pri=(rainbow_private_key<GF,V0,O0,O1>*)pri_key;

	quad_poly<GF,O0,V0>::rand( pri->l0_v );
	matrix<GF,O0,O0>::rand( pri->l0_o );
	quad_poly<GF,O1,V0+O0>::rand( pri->l1_v );
	matrix<GF,O1,O1>::rand( pri->l1_o );
	for( unsigned i=O0;i--;) { matrix<GF,O0,V0>::rand( pri->l0_vo[i] );	}
	for( unsigned i=O1;i--;) { matrix<GF,O1,V0+O0>::rand( pri->l1_vo[i] ); }

	return 0;
}

template < unsigned GF , unsigned V0 , unsigned O0 , unsigned O1 >
void rainbow<GF,V0,O0,O1>::qmap( gfv<GF,M> & y , const byte *pri_key , const gfv<GF,N> & x ) const 
{
	const rainbow_private_key<GF,V0,O0,O1>& pri=*((rainbow_private_key<GF,V0,O0,O1>*)pri_key);

	const gfv<GF,V0> * v0 = (const gfv<GF,V0> *)&x;
	const gfv<GF,V0+O0> * v1 = (const gfv<GF,V0+O0> *)&x;
	gfv<GF,O0> o0; for(unsigned i=0; i<O0;i++ ) o0.set( i , x[V0+i] );
	gfv<GF,O1> o1; for(unsigned i=0; i<O1;i++ ) o1.set( i , x[V0+O0+i] );

	matrix<GF,O0,O0> o_mat;
	gfv<GF,O0> tmp1;
	memcpy(&o_mat,&pri.l0_o,sizeof(matrix<GF,O0,O0>));
	for( unsigned i=0;i<O0;i++) o_mat.L[i] += pri.l0_vo[i].prod(*v0);
	tmp1 = o_mat.rowmat_prod(o0) + pri.l0_v.eval(*v0);
	tmp1.coerceTo(y);//for( unsigned i=0;i<O0;i++) y.set(i,tmp1[i]);//memcpy( &y , & tmp1 , sizeof(gf<GF>[O0]) );

	memcpy(&o_mat,&pri.l1_o,sizeof(matrix<GF,O1,O1>));
	for( unsigned i=0;i<O1;i++) o_mat.L[i]+=pri.l1_vo[i].prod(*v1);
	tmp1 = o_mat.rowmat_prod(o1) + pri.l1_v.eval(*v1);
	for( unsigned i=0;i<O1;i++ ) y.set( O0+i,tmp1[i] );

}

template < unsigned GF , unsigned V0 , unsigned O0 , unsigned O1 >
void rainbow<GF,V0,O0,O1>::ivs_qmap( gfv<GF,N> & y , const byte * pri_key , const gfv<GF,M> & x ) const 
{ 
	const rainbow_private_key<GF,V0,O0,O1>& pri=*((const rainbow_private_key<GF,V0,O0,O1>*)pri_key);
	gfv<GF,V0> * v0 = (gfv<GF,V0> *)&y;
	gfv<GF,V0+O0> * v1 = (gfv<GF,V0+O0> *)&y;
	gfv<GF,O0> tmp, sol;
	matrix<GF,O0,O0> o_mat;
	
	for( unsigned i=5; i--; ) {
		*v0 = gfv<GF,V0>::rand();
		memcpy(&o_mat,&pri.l0_o,sizeof(matrix<GF,O0,O0>));
		for( unsigned i=0;i<O0;i++) o_mat.L[i]+=pri.l0_vo[i].prod(*v0);
		tmp = pri.l0_v.eval( *v0 );
		x.coerceTo(sol);//memcpy( & sol , &x , sizeof(gf<GF>[O0]) );
		sol += tmp;
		if( ! guass_elim_solver<GF,O0>( tmp , o_mat , sol ) ) continue;
//		wiedemann_solver<GF,O0>( tmp , o_mat , sol );
		for( unsigned i=0;i<O0;i++ ) y.set( V0+i , tmp[i] );

		memcpy(&o_mat,&pri.l1_o,sizeof(matrix<GF,O1,O1>));	
		for( unsigned i=0;i<O1;i++) o_mat.L[i] += pri.l1_vo[i].prod(*v1);
		tmp = pri.l1_v.eval( *v1 );
		for( unsigned i=0;i<O1;i++ ) sol.set(i,x[O0+i]);
		sol += tmp;
		if( ! guass_elim_solver<GF,O1>( tmp , o_mat , sol ) ) continue;
//		wiedemann_solver<GF,O1>( tmp , o_mat , sol );
		for( unsigned i=0 ; i<O1 ; i++ ) y.set( V0+O0+i , tmp[i] );
		
		break;
	}
}



#endif
