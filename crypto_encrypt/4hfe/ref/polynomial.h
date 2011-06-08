#ifndef _POLYNOMIAL_H
#define _POLYNOMIAL_H
#include <cstdio>
#include "gf.h"
#include "gfv.h"
#include "tower.h"


template <int n_v>
class monomial
{
public:
	monomial<n_v>(int idx=0) { for(int i=0; i<n_v;i++) {v[i] = idx&3; idx>>=2; }}
	monomial<n_v> & operator+= (monomial<n_v> const& e) 	{ for( int i = 0 ; i < n_v; i++ ) v[i] += e.v[i]; return (*this);}
	monomial<n_v> & operator-= (monomial<n_v> const& e) 	{ for( int i = 0 ; i < n_v; i++ ) v[i] -= e.v[i];return (*this);}
	friend const monomial<n_v> operator+ (monomial<n_v> const& e1, monomial<n_v> const& e2) 	{monomial<n_v> ret = e1;for( int i=0; i<n_v ; i++) ret.v[i] += e2.v[i];return ret;}
	friend const monomial<n_v> operator- (monomial<n_v> const& e1, monomial<n_v> const& e2) 	{monomial<n_v> ret = e1;for( int i=0; i<n_v ; i++) ret.v[i] -= e2.v[i];return ret;}
	const monomial<n_v> operator- () const	{ monomial<n_v> ret; for(int i=0; i<n_v; i++) ret.v[i] = -v[i]; return ret; }
	friend bool operator >=( monomial<n_v> const & a , monomial<n_v> const & b) 	{	for(int i=0;i<n_v;i++) if(a.v[i]>b.v[i])return true; else if( a.v[i]<b.v[i] ) return false; return true; }
	friend bool operator >( monomial<n_v> const & a , monomial<n_v> const & b) 	{	for(int i=0;i<n_v;i++) if(a.v[i]>b.v[i])return true; else if( a.v[i]<b.v[i] ) return false; return false; }	
	friend bool operator ==( monomial<n_v> const & a , monomial<n_v> const & b) 	{ for(int i=0;i<n_v;i++) if(a.v[i]!=b.v[i])return false; return true; }	

	static const monomial<n_v>LCM(monomial<n_v> const& e1, monomial<n_v> const& e2) 	{ monomial<n_v>ret = e1; for(int i=0; i<n_v ; i++) if(ret.v[i]<e2.v[i]) ret.v[i]=e2.v[i]; return ret;}
	bool isDividable( monomial<n_v> const & a) const	{ for(int i=0;i<n_v;i++) if(v[i]<a.v[i]) return false; return true; }
	int degree() const { int ret=0; for(int i=0;i<n_v;i++) ret+= v[i]; return ret; }
	
	void dump(FILE *f) const { fprintf(f,"[%d",v[0]); for(int i=1;i<n_v;i++) fprintf(f,",%d",v[i]); fprintf(f,"]");}
	char v[n_v];
};



template <class T , int n_v , int m_t>
class polynomial
{
public:
	polynomial() { terms=0; }
	~polynomial() {}
	
	inline void extend( const monomial<n_v> & mul ) { for( int i = 0; i < terms ; i++ ) monos[i] += mul; }
	inline void mul( const T & mul ) { for( int i = 0; i < terms ; i++ ) coffs[i] *= mul; }
	inline void normalize() { if(terms) if( !(T::one == coffs[0]) ) { T ivs = T::inv(coffs[0]); coffs[0] = T::one; for( int i = 1 ; i < terms ; i++ ) coffs[i] *= ivs; } }
	inline int degree() const { int ret=0; for(int i=0;i<terms;i++){int d=monos[i].degree(); if(d>ret) ret=d;} return ret; }

	static bool minus( polynomial<T,n_v,m_t> & resPoly , polynomial<T,n_v,m_t>  const & a, 
									polynomial<T,n_v,m_t> const & b );
	static bool minus( polynomial<T,n_v,m_t> & resPoly , polynomial<T,n_v,m_t>  const & a
						, T const & coff , polynomial<T,n_v,m_t> const & b );
	static bool minus( polynomial<T,n_v,m_t> & resPoly , polynomial<T,n_v,m_t>  const & a
						, monomial<n_v> const & mono, polynomial<T,n_v,m_t> const & b );
	static bool minus( polynomial<T,n_v,m_t> & resPoly , polynomial<T,n_v,m_t>  const & a
						, T const & coff , monomial<n_v> const & mono, polynomial<T,n_v,m_t> const & b );
	static bool mod( polynomial<T,n_v,m_t> & resPoly , polynomial<T,n_v,m_t>  const & a, 
					polynomial<T,n_v,m_t> const & b );
					
	static bool SPoly( polynomial<T,n_v,m_t> & resPoly , polynomial<T,n_v,m_t> const & a, 
									polynomial<T,n_v,m_t> const & b );
	static bool reduce( polynomial<T,n_v,m_t> & resPoly , polynomial<T,n_v,m_t> const & a, 
					int num_poly , polynomial<T,n_v,m_t> * bs );
	
	static const polynomial<T,n_v,m_t> rand_quad_poly();
	void set_quad_poly( const T* cofs );

	const T eval( T* v) const{
		T ret;
		ret -= ret;
		for( int i = 0 ; i < terms ; i++ ){
			T temp = coffs[i];
			for( int j = 0; j < n_v ; j++ )
				for( int k = monos[i].v[j] ; k > 0 ; k-- ) temp *= v[j];
			ret += temp;
		}	
		return ret;
	}
	
	void dump(FILE *f) const{	
		fprintf(f,"[%d][%d]:",degree(),terms);
		if(0==terms) {fprintf(f,"\n"); return; }
		fprintf(f,"%d", coffs[0].toInt() ); monos[0].dump(f);
		for( int i = 1; i < terms;i++ ) { 	fprintf(f," + %d", coffs[i].toInt() ); monos[i].dump(f);}
		fprintf(f,"\n");
	}

	monomial<n_v> monos[m_t];
	T coffs[m_t];
	int terms;
};

                            // ww , wx , wy , wz , w , xx , xy , xz , x , yy , yz , y , zz , z , 1
static const int quad_poly_tab4[] = { 2 , 5 ,  17 , 65 , 1 ,  8 , 20 , 68 , 4 , 32 , 80 , 16, 128, 64, 0 };
                            //  xx , xy , xz , x , yy , yz , y , zz , z , 1
static const int quad_poly_tab3[] = {  2 , 5  , 17 , 1 ,  8 , 20 , 4 , 32 , 16, 0 };

template <class T,int n_v , int m_t >
void polynomial<T,n_v,m_t>::set_quad_poly( const T* cofs )
{
	int j=0;
	if( 4 == n_v )
	{
		for( int i = 0 ; i < 15 ; i++ )
			if( cofs[i] ) {
				coffs[j] = cofs[i];
				monos[j] = monomial<n_v>( quad_poly_tab4[i] );
				j++;	
			}
	}
	else if( 3 == n_v )
	{
		for( int i = 0 ; i < 10 ; i++ )
			if( cofs[i] ) {
				coffs[j] = cofs[i];
				monos[j] = monomial<n_v>( quad_poly_tab3[i] );
				j++;	
			}
	}
	else return;	
	terms = j;
}

template <class T,int n_v,int m_t>
const polynomial<T,n_v,m_t> polynomial<T,n_v,m_t>::rand_quad_poly()
{
	//const int n_v = 4;
	polynomial<T,n_v,m_t> ret;
	int j = 0;
	if( 4 == n_v )
	{
	for( int i=0; i < 15 ; i++ ){	
		do { 
			ret.coffs[j] = T::rand();
		} while( ! ret.coffs[j] );
		ret.monos[j] = monomial<n_v>(quad_poly_tab4[i]);
		j++;
	}
	}
	else if( 3 == n_v )
	{
	for( int i=0; i < 10 ; i++ ){	
		do { 
			ret.coffs[j] = T::rand();
		} while( ! ret.coffs[j] );
		ret.monos[j] = monomial<n_v>(quad_poly_tab3[i]);
		j++;	
	}	
	}
	ret.terms = j;
	return ret;
}



template <class T,int n_v,int m_t,int dim>
inline void print_mat( polynomial<T,n_v,m_t> *ps)
{
	for( int i = 0 ; i < dim; i++ ) { printf("%2d:",i);ps[i].dump( stdout ); }
}

template <class T,int n_v,int m_t,int dim>
int gusElim( polynomial<T,n_v,m_t> *ps)
{
	polynomial<T,n_v,m_t> temp;
	int num = 0;
	int div_to_zero = 0;
	for( int i = dim - 1; i >= 0 ; i-- ) 
		if( 0 == ps[i].terms ) { ps[i]=ps[dim-1-div_to_zero]; ps[dim-1-div_to_zero].terms=0; div_to_zero++; }
		
	while( num + div_to_zero < dim )
	{
		int biggest = num;
		monomial<n_v> m = ps[num].monos[0];
		
		for( int i = num+1 ; i < dim - div_to_zero ; i++ )
			if( ps[i].monos[0] > m ) { biggest=i; m=ps[i].monos[0]; }	
		if( biggest != num ) { temp=ps[num]; ps[num]=ps[biggest]; ps[biggest]=temp; }
		ps[num].normalize();
		
		for( int i = num+1 ; i < dim - div_to_zero ; i++ )
		{
			if( ps[i].monos[0] == m )
			{
				polynomial<T,n_v,m_t>::minus( temp , ps[i] , ps[i].coffs[0] , ps[num] );
				if( 0 == temp.terms )
				{
					ps[i] = ps[dim-1-div_to_zero];
					ps[dim-1-div_to_zero].terms = 0;
					div_to_zero++;
					i--;	
				}
				else ps[i] = temp;
			}
		}
		num++;
		//printf("num:%d\n",num);
		//printMat<T,n_v,m_t,dim>( ps );
		//printf("\n");
	}
	return dim-div_to_zero;
}

template <class T,int n_v,int m_t,int dim>
int gusElim_sp( polynomial<T,n_v,m_t> *ps)
{
	polynomial<T,n_v,m_t> temp;		
	
	for( int num = 0 ; num < dim ; num++ )
	{
		//if( 0 == ps[num].terms ) continue;
		monomial<n_v> m = ps[num].monos[0];
		ps[num].normalize();
		
		for( int i = num+1 ; i < dim ; i++ )
		{
			if( ps[i].monos[0] == m )
			{
				polynomial<T,n_v,m_t>::minus( temp , ps[i] , ps[i].coffs[0] , ps[num] );
				ps[i] = temp;
			}
		}
	}
	return dim;
}

template <class T,int n_v,int m_t,int dim>
inline void print_mat2( polynomial<T,n_v,m_t> *ps[])
{
	for( int i = 0 ; i < dim; i++ ) { printf("%2d:",i);ps[i]->dump( stdout ); }
}

template <class T,int n_v,int m_t,int dim>
int gusElim_sp2( polynomial<T,n_v,m_t> *ps[])
{
	static polynomial<T,n_v,m_t> temp;
	polynomial<T,n_v,m_t> * ptrTemp = & temp;
	static int min_count[dim];
	memset( min_count , 0 , sizeof(int)*dim );
	
	for( int num = 0 ; num < dim ; num++ )
	{
		//if( 0 == ps[num].terms ) continue;
		monomial<n_v> m = ps[num]->monos[0];
		ps[num]->normalize();
		
		for( int i = num+1 ; i < dim ; i++ )
		{
			if( ps[i]->monos[0] == m )
			{
				polynomial<T,n_v,m_t>::minus( *ptrTemp , *ps[i] , ps[i]->coffs[0] , *ps[num] );
				polynomial<T,n_v,m_t> * ptr = ptrTemp;
				ptrTemp = ps[i];
				ps[i] = ptr;
				min_count[i]++;
				if( min_count[i] > 5 ) { for(int g=0;g<ps[i]->terms;g++) ps[i]->coffs[g].rd(); min_count[i]=0; }
			}
		}
	}

	polynomial<T,n_v,m_t> * ptr = & temp;
	for( int i = 0 ; i < dim ; i++ )
		if( ptr == ps[i] )
		{
			*ptrTemp = *ps[i];
			ps[i] = ptrTemp;
			break;	
		}
	for( int i = 2 ; i < dim ; i++ ) if( min_count[i] ) for( int j=0; j < ps[i]->terms ; j++ ) ps[i]->coffs[j].rd();
	return dim;
}



//#inlucde "polynomial.h"

template <class T,int n_v,int m_t>
bool polynomial<T,n_v,m_t>::SPoly( polynomial<T,n_v,m_t> & resPoly , polynomial<T,n_v,m_t> const & a, 
			polynomial<T,n_v,m_t> const & b )
{
	if( !((T::one == a.coffs[0]) && (T::one == b.coffs[0])) ) return false;
	monomial<n_v> m = monomial<n_v>::LCM( a.monos[0] , b.monos[0] );
	monomial<n_v> m1 = m - a.monos[0];
	monomial<n_v> m2 = m - b.monos[0];

	polynomial<T,n_v,m_t> tmp_a = a;
	tmp_a.extend( m1 );
	polynomial<T,n_v,m_t>::minus( resPoly , tmp_a , m2 , b );
	return true;
}

template <class T,int n_v,int m_t>
bool polynomial<T,n_v,m_t>::minus( polynomial<T,n_v,m_t> & resPoly , polynomial<T,n_v,m_t>  const & a, polynomial<T,n_v,m_t> const & b )
{
	int i,j,k;
	for( i=0,j=0,k=0; i<a.terms && j<b.terms ; )
	{
		if( a.monos[i] == b.monos[j] )
		{
			T t = a.coffs[i] - b.coffs[j];
			if( t ) 
			{ resPoly.coffs[k] = t; resPoly.monos[k] = a.monos[i]; k++; }
			i++;
			j++;
		}
		else if( a.monos[i] > b.monos[j] )
		{
			resPoly.coffs[k] = a.coffs[i];
			resPoly.monos[k] = a.monos[i];
			i++;
			k++;
		}
		else
		{
			resPoly.coffs[k] = - b.coffs[j];
			resPoly.monos[k] = b.monos[j];
			j++;
			k++;
		}
	}
	for( ; i < a.terms ; ) { resPoly.coffs[k]=a.coffs[i]; resPoly.monos[k]=a.monos[i]; i++; k++; }
	for( ; j < b.terms ; ) { resPoly.coffs[k]=(-b.coffs[j]); resPoly.monos[k]=b.monos[j]; j++; k++; }
	resPoly.terms = k;

	return true;
}
template <class T,int n_v,int m_t>
bool polynomial<T,n_v,m_t>::minus( polynomial<T,n_v,m_t> & resPoly , polynomial<T,n_v,m_t>  const & a
										, T const & coff , polynomial<T,n_v,m_t> const & b )
{
	int i,j,k;
	for( i=0,j=0,k=0; i<a.terms && j<b.terms ; )
	{
		if( a.monos[i] == b.monos[j] )
		{
			T t = a.coffs[i] - ( coff * b.coffs[j]);
			if( t ) 
			{ resPoly.coffs[k] = t; resPoly.monos[k] = a.monos[i]; k++; }
			i++;
			j++;
		}
		else if( a.monos[i] > b.monos[j] )
		{
			resPoly.coffs[k] = a.coffs[i];
			resPoly.monos[k] = a.monos[i];
			i++;
			k++;
		}
		else
		{
			resPoly.coffs[k] = - ( coff * b.coffs[j]);
			resPoly.monos[k] = b.monos[j];
			j++;
			k++;
		}
	}
	for( ; i < a.terms ; ) { resPoly.coffs[k]=a.coffs[i]; resPoly.monos[k]=a.monos[i]; i++; k++; }
	for( ; j < b.terms ; ) { resPoly.coffs[k]=(-(coff * b.coffs[j])); resPoly.monos[k]=b.monos[j]; j++; k++; }
	resPoly.terms = k;

	return true;
}
template <class T,int n_v,int m_t>
bool polynomial<T,n_v,m_t>::minus( polynomial<T,n_v,m_t> & resPoly , polynomial<T,n_v,m_t>  const & a
						, monomial<n_v> const & mono, polynomial<T,n_v,m_t> const & b )
{
	int i,j,k;
	monomial<n_v> tm = b.monos[0]+mono;
	for( i=0,j=0,k=0; i<a.terms && j<b.terms ; )
	{
		if( a.monos[i] == tm )
		{
			T t = a.coffs[i] - b.coffs[j];
			if( t ) { resPoly.coffs[k] = t; resPoly.monos[k] = tm; k++; }
			i++;
			j++;
			tm = b.monos[j]+mono;
		}
		else if( a.monos[i] > tm )
		{
			resPoly.coffs[k] = a.coffs[i];
			resPoly.monos[k] = a.monos[i];
			i++;
			k++;
		}
		else
		{
			resPoly.coffs[k] = -  b.coffs[j];
			resPoly.monos[k] = tm;
			j++;
			k++;
			tm = b.monos[j]+mono;
		}
	}
	for( ; i < a.terms ; i++,k++ ) { resPoly.coffs[k]=a.coffs[i]; resPoly.monos[k]=a.monos[i];}
	for( ; j < b.terms ; j++,k++ ) { resPoly.coffs[k]=b.coffs[j]; resPoly.monos[k]=b.monos[j]+mono;}
	resPoly.terms = k;
	return true;
}
template <class T,int n_v,int m_t>
bool polynomial<T,n_v,m_t>::minus( polynomial<T,n_v,m_t> & resPoly , polynomial<T,n_v,m_t>  const & a
						, T const & coff , monomial<n_v> const & mono, polynomial<T,n_v,m_t> const & b )
{
	int i,j,k;
	monomial<n_v> tm = b.monos[0]+mono;
	for( i=0,j=0,k=0; i<a.terms && j<b.terms ; )
	{
		if( a.monos[i] == tm )
		{
			T t = a.coffs[i] - (coff * b.coffs[j]);	
			if( t ) { resPoly.coffs[k] = t; resPoly.monos[k] = tm; k++; }
			i++;
			j++;
			tm = b.monos[j]+mono;
		}
		else if( a.monos[i] > tm )
		{
			resPoly.coffs[k] = a.coffs[i];
			resPoly.monos[k] = a.monos[i];
			i++;
			k++;
		}
		else
		{
			resPoly.coffs[k] = - (coff * b.coffs[j]);
			resPoly.monos[k] = tm;
			j++;
			k++;
			tm = b.monos[j]+mono;
		}
	}
	for( ; i < a.terms ; i++,k++ ) { resPoly.coffs[k]=a.coffs[i]; resPoly.monos[k]=a.monos[i];}
	for( ; j < b.terms ; j++,k++ ) { resPoly.coffs[k]=-(coff*b.coffs[j]); resPoly.monos[k]=b.monos[j]+mono;}
	resPoly.terms = k;
	return true;
}




template <class T,int n_v,int m_t>
bool polynomial<T,n_v,m_t>::mod( polynomial<T,n_v,m_t> & resPoly , polynomial<T,n_v,m_t> const & a , 
				polynomial<T,n_v,m_t> const & b )
{
	resPoly = a;
	polynomial<T,n_v,m_t>  tempPoly;
	if( 0 == b.terms ) return false;
	monomial<n_v> lm = b.monos[0];
	while( resPoly.monos[0].isDividable( lm ) )
	{
		if( 0 == resPoly.terms ) return false;
		monomial<n_v> m = resPoly.monos[0] - lm;
		minus( tempPoly , resPoly , resPoly.coffs[0] , m , b );
		resPoly = tempPoly;
	}
	return true;
}


template <class T,int n_v,int m_t>
bool polynomial<T,n_v,m_t>::reduce( polynomial<T,n_v,m_t> & resPoly , polynomial<T,n_v,m_t>  const & a, 
			int num_poly , polynomial<T,n_v,m_t> * bs )
{
	resPoly = a;
	polynomial<T,n_v,m_t> tmpPoly;
	for( int i = 0 ; i < num_poly ; i++ )
	{
		if( 0 == resPoly.terms ) return false;
		if( ! resPoly.monos[0].isDividable(bs[i].monos[0]) ) continue;
		mod( tmpPoly , resPoly , bs[i] );
		resPoly = tmpPoly;
	}
	resPoly.normalize();
	return true;
}


#endif
