#ifndef _BLAS_H
#define _BLAS_H

#include "gf.h"

template <unsigned p,unsigned m,unsigned n> struct matrix;

template <unsigned p,unsigned n>
bool prod( matrix<p,n,n> & c , const matrix<p,n,n> & b , const matrix<p,n,n> & a);

template <unsigned p,unsigned n1 , unsigned m , unsigned n2>
bool matrix_mad( matrix<p,n2,n1>& sum_row_mat, const matrix<p,m,n1> &row_mat1, const matrix<p,n2,m> &row_mat2 );

template <unsigned p,unsigned m,unsigned n>
bool guass_elim( matrix<p,m,n> & mat );

template <unsigned p,unsigned n>
bool guass_elim_two_matrix( matrix<p,n,n> & mat1 , matrix<p,n,n> &mat2 );

template <unsigned p,unsigned n>
bool gen_matrix( matrix<p,n,n> & mat , matrix<p,n,n> & ivs_mat );

template <unsigned p,unsigned m,unsigned n> struct quad_poly;




template <unsigned p,unsigned m,unsigned n>
struct matrix
{
	gfv<p,m> L[n];

	inline const gfv<p,m> prod( const gfv<p,n> & x ) const { gfv<p,m> ret; ret.set_zero(); for(unsigned i=n;i--;) ret += L[i]*x[i]; return ret; }
	inline const gfv<p,n> rowmat_prod( const gfv<p,m> & x ) const { gfv<p,n> r; for(unsigned i=n;i--;) r.set(i,x.dot(L[i])); return r; }
	inline static void rand( matrix<p,m,n> & mat ) { for(unsigned i=n;i--;) mat.L[i]=gfv<p,m>::rand(); }
	inline static void identity( matrix<p,m,n> & mat ) { for(unsigned i=n;i--;) { mat.L[i].set_zero(); mat.L[i].set(i,(gf<p>)1); } }
	inline void set_zero() { for(unsigned i=n;i--;) L[i].set_zero(); }

	inline void transpose( matrix<p,n,m> & mat ) const { for( unsigned i=0; i < m ; i++ ) for( unsigned j=0; j<n ; j++ ) mat.L[i].set( j , L[j][i] ); }

	inline void dump( FILE * fp ) const { fprintf(fp,"col mat:(%d,%d)\n",n,m); for(int i=0;i<(int)m;i++) { for(int j=0;j<(int)n;j++) fprintf(fp,"%2x ",(int)L[j][i].v); fprintf(fp,"\n"); } fprintf(fp,"\n"); }
	inline void row_dump(FILE *fp) const { fprintf(fp,"row mat:(%d,%d)\n",m,n); for(int i=0;i<(int)n;i++) L[i].dump(fp); fprintf(fp,"\n"); }
};



template <unsigned p,unsigned n>
bool prod( matrix<p,n,n> & c , const matrix<p,n,n> & b , const matrix<p,n,n> & a)
{
	for( unsigned i=0 ; i < n ; i++ ) c.L[i].set_zero();

	for( unsigned i=0 ; i < n ; i++ )
		for( unsigned j=0 ; j < n ; j++ ) c.L[i] += b.L[j] * (a.L[i][j] );
	return true;
}

template <unsigned p,unsigned n1 , unsigned m , unsigned n2>
bool matrix_mad( matrix<p,n2,n1>& sum_row_mat, 
			const matrix<p,m,n1> &row_mat1, const matrix<p,n2,m> &row_mat2 )
{
	for(unsigned i=0; i<n1 ; i++ ){
		const gfv<p,m> & t = row_mat1.L[i];
		for(unsigned j=0; j<m; j++ ) sum_row_mat.L[i] += row_mat2.L[j] * t[j];
	}
	return true;
}


template <unsigned p,unsigned m,unsigned n>
bool guass_elim( matrix<p,m,n> & rowmat )
{
	gf<p> piv[n];
	for( unsigned i=0;i<n;i++ ){
		for( unsigned j=i;j<n;j++) piv[j] = rowmat.L[j][i];
		if( !piv[i] )
			for( unsigned j=i+1; j < n ; j++ )
				if( piv[j] ) { 
					gfv<p,m> tmp = rowmat.L[i]; rowmat.L[i]=rowmat.L[j]; rowmat.L[j]=tmp;
					gf<p> ttt=piv[i]; piv[i]=piv[j]; piv[j]=ttt;
					break; 
				}
		if( !piv[i] ) return false;
		if( 1 != piv[i].v ) rowmat.L[i] *= piv[i].inv();
		for( unsigned j=i+1 ; j < n ; j++ )
			if( piv[j] ) { rowmat.L[j] += rowmat.L[i]*piv[j]; }
	}
	return true;	
}

template <unsigned p,unsigned n>
bool guass_elim_two_matrix( matrix<p,n,n> & mat1 , matrix<p,n,n> &mat2 )
{
	for( unsigned i=0;i<n;i++ ){
		if( !(mat1.L[i])[i] )
			for( unsigned j=i+1; j < n ; j++ )
				if( (mat1.L[j])[i] ) { 
					gfv<p,n> tmp = mat1.L[i]; 
					mat1.L[i]=mat1.L[j]; 
					mat1.L[j]=tmp;
					tmp = mat2.L[i];
					mat2.L[i] = mat2.L[j];
					mat2.L[j] = tmp;
					break; 
				}
		if( !(mat1.L[i])[i] ) return false;
		if( 1 != (mat1.L[i])[i].v ) { gf<p> iv = (mat1.L[i])[i].inv(); mat1.L[i] *= iv; mat2.L[i] *= iv; }
		for( unsigned j=0 ; j < i ; j++ )
			if( (mat1.L[j])[i] ) { mat2.L[j] += mat2.L[i]*(mat1.L[j][i]); mat1.L[j] += mat1.L[i]*(mat1.L[j][i]); }
		for( unsigned j=i+1 ; j < n ; j++ )
			if( (mat1.L[j])[i] ) { mat2.L[j] += mat2.L[i]*(mat1.L[j][i]); mat1.L[j] += mat1.L[i]*(mat1.L[j][i]); }
	}
	return true;
}

template <unsigned p,unsigned n>
bool gen_matrix( matrix<p,n,n> & mat , matrix<p,n,n> & ivs_mat )
{
	//matrix<p,n,n>::identity( mat );
	//matrix<p,n,n>::identity( ivs_mat );

	matrix<p,n,n> tmp,tmp1;
	for(unsigned i=0;i<n;i++){ 
		tmp.L[i] = gfv<p,n>::rand();
		tmp1.L[i] = gfv<p,n>::rand();
		while( ! tmp.L[i][i] ) tmp.L[i].set(i,gf<p>::rand());
		while( ! tmp1.L[i][i] ) tmp1.L[i].set(i,gf<p>::rand());
		for(unsigned j=0;j<i;j++) tmp.L[i].set(j,(gf<p>)0);
		for(unsigned j=i+1;j<n;j++) tmp1.L[i].set(j,(gf<p>)0);
	}
	prod( mat , tmp , tmp1 );	

	mat.transpose( tmp );
	matrix<p,n,n>::identity( tmp1 );
	guass_elim_two_matrix( tmp , tmp1 );
	tmp1.transpose( ivs_mat );
	
	return true;
}


template <unsigned p,unsigned m,unsigned n>
struct quad_poly
{
	gfv<p,m> L[n];
	gfv<p,m> Q[n*(n+1)/2];

	static void rand( quad_poly<p,m,n> & r ) { for(unsigned i=n;i--;) r.L[i]=gfv<p,m>::rand(); for(unsigned i=(n*(n+1)/2);i--;) r.Q[i]=gfv<p,m>::rand(); }
	const gfv<p,m> eval( const gfv<p,n> & x ) const 
	{ 
		gfv<p,m> r= (gf<p>)0;
		gf<p> _x[n]; 
		for(unsigned i=n;i--;) _x[i] = x[i];

		for( unsigned i=0;i<n;i++) r += L[i] * _x[i];
		unsigned idx = 0;
		for( unsigned i=0; i<n; i++ )
			if( _x[i] ) for(unsigned j=0; j<=i; j++ ) r+= Q[idx++]*(_x[i]*_x[j]);
			else idx += i+1;
		return r;
	}
};


#endif

