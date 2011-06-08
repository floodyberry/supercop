#ifndef _CANTOR_ZASSENHAUS_H
#define _CANTOR_ZASSENHAUS_H


#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <assert.h>

#include "tower.h"



template <class T>
class util
{
public:	
	static void polyDivMonic( T * po , int *dim_po , const T *p1 , const int dim_p1 , const T* p2 , const int dim_p2 );
	static void polyModMonic( T * po , int *dim_po , const T *p1 , const int dim_p1 , const T* p2 , const int dim_p2 );
	static inline void polyToMonic( T* p , const int d_p ) { T l_inv = T::inv(p[d_p-1]); p[d_p-1]=T::one; for(int i=d_p-2;i>=0;i--) p[i]*=l_inv; }
	static void polyGCD(T *po , int *dim_po , const T *p1 , const int dim_p1 , const T* p2 , const int dim_p2 );
	static void polyMul(T *po , int *dim_po , const T *p1 , const int dim_p1 , const T* p2 , const int dim_p2 );
};

template <class T>
void dump_poly( const char * s , T * poly , int dim )
{
	T tmp;
	printf( s );
	for( int i = dim - 1 ; i >= 0 ; i-- ){
		tmp = poly[i]*T::one;
		printf("%d " , tmp.toInt() );
	}
	printf("\n");
}

template <class T>
void util<T>::polyMul( T * po , int *dim_po , const T *p1 , const int dim_p1 , const T* p2 , const int dim_p2 )
{
	*dim_po = dim_p1+dim_p2-1;
	memset( po , 0 , sizeof(T)*(*dim_po));
	for( int i = 0 ; i < dim_p1 ;i++ )
		for( int j = 0 ; j < dim_p2 ; j++ )
			po[i+j] += p1[i]*p2[j];
}


template <class T>
void util<T>::polyDivMonic( T * po , int *dim_po , const T *p1 , const int dim_p1 , const T* p2 , const int dim_p2 )
{
	if( dim_p2 > dim_p1 ){
		*dim_po = 0;
		return;
	}
	static T pq[40];
	memcpy( pq , p1 , sizeof(T)*dim_p1);
	*dim_po = dim_p1 - dim_p2 + 1;
	for( int i = dim_p1; i >= dim_p2 ; i-- ){
		T tmp = pq[i-1];
		for( int j = dim_p2-2; j >= 0 ; j-- )
			pq[ i + j - dim_p2  ] -= p2[j]*tmp;
	}
	memcpy( po , pq + dim_p2 - 1 , sizeof(T)*(*dim_po) );
}

template <class T>
void util<T>::polyModMonic( T * po , int *dim_po , const T *p1 , const int dim_p1 , const T* p2 , const int dim_p2 )
{
	if( dim_p2 > dim_p1 ){
		*dim_po = dim_p1;
		memcpy( po , p1 , sizeof(T)*dim_p1 );
		return;
	}
	memcpy( po , p1 , sizeof(T)*dim_p1);
	for( int i = dim_p1; i >= dim_p2 ; i-- ){
		T tmp = po[i-1];
		for( int j = dim_p2-2; j >= 0 ; j-- )
			po[ i + j - dim_p2  ] -= p2[j]*tmp;
	}
	for( int i = dim_p2 - 2 ; i >= 0 ; i-- )
		if( po[i] ) {
			*dim_po = i+1;
			return;	
		}
	*dim_po = 0;
}

template <class T>
void util<T>::polyGCD( T * po , int *dim_po , const T *p1 , const int dim_p1 , const T* p2 , const int dim_p2 )
{
	static T tmp1[64];
	static T tmp2[64];
	static T tmp3[64];
	memcpy( tmp1 , p1 , sizeof(T)*dim_p1 );
	memcpy( tmp2 , p2 , sizeof(T)*dim_p2 );
	T *a, *b, *r;
	int d_a,d_b,d_r;
	a = tmp3;
	if( dim_p1 >= dim_p2 ){
		b = tmp1; 	d_b = dim_p1;
		r = tmp2; 	d_r = dim_p2;
	}else {
		b = tmp2; 	d_b = dim_p2;
		r = tmp1; 	d_r = dim_p1;
	}
	while( d_r > 1 ){
		T * tmp = a;
		a = b;	d_a = d_b;
		b = r;	d_b = d_r;
		r = tmp;
		polyToMonic( b , d_b );
		polyModMonic( r , &d_r , a , d_a , b , d_b );
	}
	if( d_r ){
		po[0] = T::one;
		*dim_po = 1;
		return;
	}
	*dim_po=d_b;
	memcpy( po , b , sizeof(T)*d_b );
}



template <class T>
class cantor_zassen
{
public:

	template <unsigned CH, unsigned POW>
	static void findRoots(T *roots, int *dim_roots, T *p, const int deg_p);
	template <unsigned CH,unsigned POW>
	static void equalDegFac(T *roots, int *dim_roots, T *pdg1, const int deg_pdg1);

	/**
	 * \brief		calculate x^q mod p(x)
	 */
	template <unsigned CH,unsigned POW>
	static void xPowQMinXModP( T* xq_min_x, T *p , const int deg_p);
	static void xPowModP(T *xpow, const int pow, T *p, const int deg_p);
	static void polyMulModP(T *xo, T *xi1, T *xi2, T *p, const int deg_p);
	static void polyPowCharModP(T *xo, T *xi, const int deg_p, T *xchs);
	
	
	//
	// for quadratic polynomial ( x^(ch+1) + x^ch + x^2 + x + 1 )
	//
	template <unsigned CH, unsigned POW>
	static void findRootsQP(T *roots, int *dim_roots, T *p );

	template <int CH> 	static void xPow2CHModQP( T * poly , T * qp );
	template <int CH> 	static void xExtCHModQP( T * op , T * ip , T * qp );
	template <int CH> 	static void polyPowCHModQP( T * op , T * ip , T * xchs );
	template <int CH,int POW> static void xPowQMinXModQP( T* xq_min_x, T* qp );
};


/////////////////////////////////////////////////////////////


template <class T> template <int CH>
void cantor_zassen<T>::xPow2CHModQP( T * poly , T * qp )
{
	static T tmp[2*CH+1];
	memset( tmp , 0 , sizeof(T)*(2*CH+1) );
	//tmp[2*CH] = T::one;
	tmp[2*CH-1] = -qp[3];
	tmp[CH+1] = -qp[2]; tmp[CH] = - qp[1]; tmp[CH-1] = - qp[0];
	for( int i = 2*CH - 1 ; i >= (CH+1) ; i-- ){
		tmp[i-(CH+1)] -= tmp[i]*qp[0];	
		tmp[i-(CH+1)+1] -= tmp[i]*qp[1];	
		tmp[i-(CH+1)+2] -= tmp[i]*qp[2];	
		tmp[i-(CH+1)+CH] -= tmp[i]*qp[3];	
	}
	memcpy( poly , tmp , sizeof(T)*(CH+1));
}

template <class T> template <int CH>
void cantor_zassen<T>::xExtCHModQP( T * op , T * ip , T * qp )
{
	static T tmp[2*CH+1];
	memset( tmp , 0 , sizeof(T)*CH );
	memcpy( tmp + CH , ip , sizeof(T)*(CH+1) );
	for( int i = 2*CH ; i >= (CH+1) ; i-- ){
		tmp[i-(CH+1)] -= tmp[i]*qp[0];
		tmp[i-(CH+1)+1] -= tmp[i]*qp[1];
		tmp[i-(CH+1)+2] -= tmp[i]*qp[2];
		tmp[i-(CH+1)+CH] -= tmp[i]*qp[3];
	}
	memcpy( op , tmp , sizeof(T)*(CH+1) );
}

template <class T> template <int CH>
void cantor_zassen<T>::polyPowCHModQP( T * op , T * ip , T * xchs )
{
	memset( op , 0 , sizeof(T)*(CH+1) );
	op[0] = T::powch( ip[0] , 1 );
	op[CH] = T::powch( ip[1] , 1 );
	for( int i = 2 ; i <= CH ; i++ ){
		T tmp = T::powch( ip[i] , 1 );
		for( int j = 0 ; j < (CH+1) ; j++ )	op[j] +=	tmp * xchs[(i-2)*(CH+1)+j];
	}
	for( int i = 0 ; i < (CH+1) ; i++ ) op[i].rd(); /////////////////////////////
}

template <class T> template <int CH , int POW>
void cantor_zassen<T>::xPowQMinXModQP( T* xq_min_x, T* qp )
{
	static T xchs[ (CH+1)*(CH-1) ];
	static T temp1[CH+1];
	static T temp2[CH+1];
	T * ptr1 = temp1;
	T * ptr2 = temp2;
	
	xPow2CHModQP<CH>( xchs , qp );
	for( int i = 3 ; i <= CH ; i++ )
		xExtCHModQP<CH>( xchs + (CH+1)*(i-2) , xchs + (CH+1)*(i-3) , qp );
	
	memcpy( ptr1 , xchs + (CH+1)*(CH-2) , sizeof(T)*(CH+1) );
	for( int i = 2 ; i < POW ; i++ ){
		polyPowCHModQP<CH>( ptr2 , ptr1 , xchs );
		T * tmp = ptr2;
		ptr2 = ptr1;
		ptr1 = tmp;
	}
	memcpy( xq_min_x , ptr1 , sizeof(T)*(CH+1) );
	xq_min_x[1] -= T::one;
}

template<class T> template <unsigned CH, unsigned POW>
void cantor_zassen<T>::findRootsQP(T *roots, int *dim_roots, T *p )
{
	int dim_xq_min_x, dim_pdg1, deg_p2;
	T qp[CH+2];
	memset( qp , 0 , sizeof(T)*(CH+2) ); qp[0]=p[0]; qp[1]=p[1]; qp[2]=p[2]; qp[CH]=p[3]; qp[CH+1]=T::one;
	T xq_min_x[CH+1];
	T pdg1[CH+1];
	memset( pdg1 , 0 , sizeof(T)*(CH+1) );

	xPowQMinXModQP<CH,POW>( xq_min_x , p );

	dim_xq_min_x = 0;
	for(int i = ((int)CH); i >= 0; i--)
		if( xq_min_x[i] ){
			dim_xq_min_x = i+1;
			break;
		}

	// distinct degree = 1 from p 
	if( 0 == dim_xq_min_x ){
		dim_pdg1 = CH+1;
		memcpy(pdg1, p, sizeof(T)*(CH+1));
	} else {
		dim_pdg1 = 1;
		util<T>::polyGCD(pdg1, &dim_pdg1, qp, CH+2, xq_min_x, dim_xq_min_x);
	}

	deg_p2 = dim_pdg1-1;
	*dim_roots = 0;
	if( 0 != deg_p2 )	equalDegFac<CH,POW>(roots, dim_roots, pdg1, deg_p2);

	return;
}


///////////////////////////////////////////////////////





template <class T> template <unsigned CH,unsigned POW>
void cantor_zassen<T>::xPowQMinXModP( T* xq_min_x , T *p , const int deg_p)
{
	memset( xq_min_x , 0 , sizeof(T)*deg_p );
	
	int deg_p_sqr = deg_p*deg_p;
	T * xchs = new T [deg_p_sqr];
	memset( xchs , 0 , sizeof(T)*deg_p_sqr );

	xPowModP(xchs+deg_p, CH, p, deg_p);
	for(int i = 2; i < deg_p; i++)
		polyMulModP(xchs+i*deg_p, xchs+deg_p, xchs+(i-1)*deg_p, p, deg_p);
		
	// calculate xq_min_x = (x^q-x) mod p = (x^(ch^exp)-x) mod p 
	memcpy(xq_min_x, xchs+deg_p, sizeof(T)*deg_p);
	for( int i = 1; i < ((int)POW); i++)
		polyPowCharModP(xq_min_x, xq_min_x, deg_p, xchs);
	xq_min_x[1] -= T::one;

	delete [] xchs;	
}




template<class T> template <unsigned CH, unsigned POW>
void cantor_zassen<T>::findRoots(T *roots, int *dim_roots, T *p, const int deg_p)
{
	int dim_xq_min_x, dim_pdg1, deg_p2;
	T *xq_min_x, *pdg1;

	xq_min_x = new T [deg_p];
	//memset( xq_min_x , 0 , sizeof(T)*deg_p );
	pdg1 = new T [deg_p+1];
	memset( pdg1 , 0 , sizeof(T)*(deg_p+1) );
	xPowQMinXModP<CH,POW>( xq_min_x , p , deg_p );

	dim_xq_min_x = 0;
	for(int i = deg_p-1; i >= 0; i--)
		if( xq_min_x[i] ){
			dim_xq_min_x = i+1;
			break;
		}

	// distinct degree = 1 from p 
	if( 0 == dim_xq_min_x ){
		dim_pdg1 = deg_p+1;
		memcpy(pdg1, p, sizeof(T)*(deg_p+1));
	} else {
		dim_pdg1 = deg_p;
		util<T>::polyGCD(pdg1, &dim_pdg1, p, deg_p+1, xq_min_x, dim_xq_min_x);
	}

	deg_p2 = dim_pdg1-1;
	*dim_roots = 0;
	if( 0 != deg_p2 )	equalDegFac<CH,POW>(roots, dim_roots, pdg1, deg_p2);
	
	delete[] (pdg1); pdg1 = NULL;
	delete[] (xq_min_x); xq_min_x = NULL;
	return;
}


template<class T> template <unsigned CH, unsigned POW>
void cantor_zassen<T>::equalDegFac(T *roots, int *dim_roots, T *pdg1, const int deg_pdg1)
{
	int i, deg_pdg1_sqr, dim_prnd, dim_pfac1, dim_pfac2, dim_prem, is_zero;
	T *xchs, *prnd, *pfac1, *pfac2, *prem;

	if(deg_pdg1 == 1)
	{
		roots[*dim_roots] = -pdg1[0];
		(*dim_roots)++;
		return;
	}

	dim_prnd = dim_pfac1 = dim_pfac2 = dim_prem = deg_pdg1;
	deg_pdg1_sqr = deg_pdg1*deg_pdg1;
	prnd = (T *)malloc(sizeof(T)*dim_prnd);
	pfac1 = (T *)malloc(sizeof(T)*dim_pfac1);
	pfac2 = (T *)malloc(sizeof(T)*dim_pfac2);
	prem = (T *)malloc(sizeof(T)*dim_prem);
	xchs = (T *)malloc(sizeof(T)*deg_pdg1_sqr);

	while(1)
	{
		dim_pfac1 = deg_pdg1;
		memset(pfac1, 0, sizeof(T)*dim_pfac1);
		memset(prnd, 0, sizeof(T)*dim_prnd);
		for(i = 0; i < dim_prnd-1; i++)
		{
			prnd[i] = T::rand();
		}
		while(prnd[dim_prnd-1]==0) prnd[i] = T::rand();
		//BLAS::BLAS_dumpVec(dim_prnd, prnd);
		util<T>::polyGCD(pfac1, &dim_pfac1, pdg1, deg_pdg1+1, prnd, dim_prnd);

		if(dim_pfac1 != 1)
		{
			break;
		}

		memset(xchs, 0, sizeof(T)*deg_pdg1_sqr);
		//for(i = 1; i < deg_pdg1; i++)
		//{
		//	xPowModP(xchs+i*deg_pdg1, ch*i, pdg1, deg_pdg1);
		//}
		xPowModP(xchs+deg_pdg1, CH, pdg1, deg_pdg1);
		for(i = 2; i < deg_pdg1; i++)
		{
			polyMulModP(xchs+i*deg_pdg1, xchs+deg_pdg1, xchs+(i-1)*deg_pdg1, pdg1, deg_pdg1);
		}
if( 31 == CH )
{
//CH==31
		//when ch == 31 number
		polyMulModP(pfac2, prnd, prnd, pdg1, deg_pdg1);//10
		polyMulModP(pfac2, pfac2, pfac2, pdg1, deg_pdg1);//100
		polyMulModP(pfac2, pfac2, prnd, pdg1, deg_pdg1);//101
		polyMulModP(prnd, pfac2, pfac2, pdg1, deg_pdg1);//1010
		polyMulModP(pfac2, prnd, pfac2, pdg1, deg_pdg1);//pfac2 = prnd^15
if( (9 == POW )|| (18 == POW ))
{
//#if (EXP==9 || EXP==18)
		polyPowCharModP(prnd, pfac2, deg_pdg1, xchs);//10
		polyPowCharModP(prem, prnd, deg_pdg1, xchs);//100
		polyMulModP(pfac1, prem, pfac2, pdg1, deg_pdg1);//101
		polyPowCharModP(prnd, pfac1, deg_pdg1, xchs);//1010
		polyPowCharModP(prnd, prnd, deg_pdg1, xchs);//10100
		polyPowCharModP(prnd, prnd, deg_pdg1, xchs);//101000
		polyPowCharModP(prnd, prnd, deg_pdg1, xchs);//1010000
		polyMulModP(prnd, pfac1, prnd, pdg1, deg_pdg1);//1010101
		polyPowCharModP(pfac1, prnd, deg_pdg1, xchs);//10101010
		polyMulModP(prnd, pfac1, prnd, pdg1, deg_pdg1);//11111111
		polyPowCharModP(prnd, prnd, deg_pdg1, xchs);//111111110
		polyMulModP(prnd, pfac2, prnd, pdg1, deg_pdg1);//111111111
if( 18 == POW )
{
//#if EXP==18
		polyPowCharModP(pfac2, prnd, deg_pdg1, xchs);//1111111110
		for(i = 0; i < 8; i++)
		{
			polyPowCharModP(pfac2, pfac2, deg_pdg1, xchs);
		}
		polyMulModP(prnd, pfac2, prnd, pdg1, deg_pdg1);
}
//#endif
} else if ( 10 == POW )
{
//#elif EXP==10
		polyPowCharModP(prnd, pfac2, deg_pdg1, xchs);//10
		polyPowCharModP(prem, prnd, deg_pdg1, xchs);//100
		polyMulModP(pfac1, prem, pfac2, pdg1, deg_pdg1);//101
		polyPowCharModP(prnd, pfac1, deg_pdg1, xchs);//1010
		polyPowCharModP(prnd, prnd, deg_pdg1, xchs);//10100
		polyPowCharModP(prnd, prnd, deg_pdg1, xchs);//101000
		polyPowCharModP(prnd, prnd, deg_pdg1, xchs);//1010000
		polyMulModP(prnd, prnd, pfac1, pdg1, deg_pdg1);//1010101
		polyPowCharModP(prnd, prnd, deg_pdg1, xchs);//10101010
		polyPowCharModP(prnd, prnd, deg_pdg1, xchs);//101010100
		polyMulModP(pfac1, prnd, pfac2, pdg1, deg_pdg1);//101010101
		polyPowCharModP(prnd, pfac1, deg_pdg1, xchs);//1010101010
		polyMulModP(prnd, prnd, pfac1, pdg1, deg_pdg1);//1111111111
} else if( 15 == POW )
{
//#elif EXP==15
		polyPowCharModP(prnd, pfac2, deg_pdg1, xchs);//10
		polyPowCharModP(prem, prnd, deg_pdg1, xchs);//100
		polyMulModP(pfac1, prem, pfac2, pdg1, deg_pdg1);//101
		polyPowCharModP(prnd, pfac1, deg_pdg1, xchs);//1010
		polyPowCharModP(prnd, prnd, deg_pdg1, xchs);//10100
		polyMulModP(prnd, prnd, pfac2, pdg1, deg_pdg1);//10101
		polyPowCharModP(prem, prnd, deg_pdg1, xchs);//101010
		polyPowCharModP(prnd, prem, deg_pdg1, xchs);//1010100
		polyMulModP(prnd, prnd, prem, pdg1, deg_pdg1);//1111110
		polyMulModP(prnd, prnd, pfac2, pdg1, deg_pdg1);//1111111
		polyPowCharModP(pfac1, prnd, deg_pdg1, xchs);//11111110
		polyPowCharModP(prem, pfac1, deg_pdg1, xchs);//111111100
		for(i = 0; i < 6; i++)
		{
			polyPowCharModP(prem, prem, deg_pdg1, xchs);
		}
		polyMulModP(prnd, prem, pfac1, pdg1, deg_pdg1);//111111111111110
		polyMulModP(prnd, prnd, pfac2, pdg1, deg_pdg1);//111111111111111
} else if( 30 == POW ) // 16 + 8 + 6
{
	polyPowCharModP(prnd, pfac2, deg_pdg1, xchs );   //10
	polyMulModP(pfac2,prnd,pfac2,pdg1,deg_pdg1);     //11
	polyPowCharModP(prem, pfac2, deg_pdg1, xchs);   //110
	polyPowCharModP(prnd, prem, deg_pdg1, xchs);   //1100
	polyMulModP(prem,prnd,pfac2,pdg1,deg_pdg1);   // 1111
	polyPowCharModP(prnd,prem,deg_pdg1,xchs);     //11110
	polyPowCharModP(prnd,prnd,deg_pdg1,xchs);    //111100
	polyMulModP(pfac2,pfac2,prnd,pdg1,deg_pdg1); //111111     <-------------
	polyPowCharModP(prnd,prnd,deg_pdg1,xchs);   //1111000
	polyPowCharModP(prnd,prnd,deg_pdg1,xchs); // 11110000
	polyMulModP(pfac1,prem,prnd,pdg1,deg_pdg1);  // 11111111    1X8  <----------
	polyPowCharModP(prnd,pfac1,deg_pdg1,xchs); // 111111110
	for( i=7 ; i>0 ; i-- ) polyPowCharModP(prnd,prnd,deg_pdg1,xchs); // 1111111100000000  1X8 0X8
	polyMulModP(prnd,prnd,pfac1,pdg1,deg_pdg1); // 1X16
	for(i=8;i>0;i--) polyPowCharModP(prnd,prnd,deg_pdg1,xchs); // 1X16 0X8
	polyMulModP(prnd,pfac1,prnd,pdg1,deg_pdg1); // 1X24
	for(i=6;i>0;i--) polyPowCharModP(prnd,prnd,deg_pdg1,xchs); // 1X24 0X6
	polyMulModP(prnd,pfac2,prnd,pdg1,deg_pdg1); // 1X30
} else if( 40 == POW ) // 40 = 32 + 8
{
	polyPowCharModP(prnd, pfac2, deg_pdg1, xchs );   //10
	polyMulModP(prem,prnd,pfac2,pdg1,deg_pdg1);      //11
	polyPowCharModP(prnd, prem, deg_pdg1, xchs);    //110
	polyPowCharModP(prnd, prnd, deg_pdg1, xchs);   //1100
	polyMulModP(prem,prnd,prem,pdg1,deg_pdg1);    // 1111
	polyPowCharModP(prnd,prem,deg_pdg1,xchs);     //11110
	for(i=3;i>0;i--) polyPowCharModP(prnd,prnd,deg_pdg1,xchs); // 11110000
	polyMulModP(pfac1,prem,prnd,pdg1,deg_pdg1);  // 11111111    1X8
	polyPowCharModP(prnd,pfac1,deg_pdg1,xchs); // 111111110
	for( i=7 ; i>0 ; i-- ) polyPowCharModP(prnd,prnd,deg_pdg1,xchs); // 1111111100000000  1X8 0X8
	polyMulModP(prem,prnd,pfac1,pdg1,deg_pdg1); // 1X16
	polyPowCharModP(prnd,prem,deg_pdg1,xchs); // 1X16 0X1
	for( i=15; i>0 ; i-- ) polyPowCharModP(prnd,prnd,deg_pdg1,xchs); // 1X16 0X16
	polyMulModP(prnd,prnd,prem,pdg1,deg_pdg1); // 1X32
	for( i=8 ; i>0 ; i-- ) polyPowCharModP(prnd,prnd,deg_pdg1,xchs); // 1X32 0X8
	polyMulModP( prnd , prnd , pfac1 , pdg1 , deg_pdg1 ); // 1X40
} else if( 45 == POW ) // 45 = 32 + 8 + 5
{
	polyPowCharModP(prnd, pfac2, deg_pdg1, xchs );   //10
	polyMulModP(prem,prnd,pfac2,pdg1,deg_pdg1);      //11
	polyPowCharModP(prnd, prem, deg_pdg1, xchs);    //110
	polyPowCharModP(prnd, prnd, deg_pdg1, xchs);   //1100
	polyMulModP(prem,prnd,prem,pdg1,deg_pdg1);    // 1111
	polyPowCharModP(prnd,prem,deg_pdg1,xchs);     //11110
	polyMulModP(pfac2,pfac2,prnd,pdg1,deg_pdg1);  // 11111     <-----
	for(i=3;i>0;i--) polyPowCharModP(prnd,prnd,deg_pdg1,xchs); // 11110000
	polyMulModP(pfac1,prem,prnd,pdg1,deg_pdg1);  // 11111111    1X8   <-----
	polyPowCharModP(prnd,pfac1,deg_pdg1,xchs); // 111111110
	for( i=7 ; i>0 ; i-- ) polyPowCharModP(prnd,prnd,deg_pdg1,xchs); // 1111111100000000  1X8 0X8
	polyMulModP(prem,prnd,pfac1,pdg1,deg_pdg1); // 1X16
	polyPowCharModP(prnd,prem,deg_pdg1,xchs); // 1X16 0X1
	for( i=15; i>0 ; i-- ) polyPowCharModP(prnd,prnd,deg_pdg1,xchs); // 1X16 0X16
	polyMulModP(prnd,prnd,prem,pdg1,deg_pdg1); // 1X32
	for( i=8 ; i>0 ; i-- ) polyPowCharModP(prnd,prnd,deg_pdg1,xchs); // 1X32 0X8
	polyMulModP( prnd , prnd , pfac1 , pdg1 , deg_pdg1 ); // 1X40
	for( i=5;i>0;i--) polyPowCharModP(prnd,prnd,deg_pdg1,xchs); // 1X40 0X5
	polyMulModP( prnd , prnd , pfac2 , pdg1 , deg_pdg1 ); // 1X45
} else if( 54 == POW ) // 40 = 32 + 16 + 6
{
	polyPowCharModP(prnd, pfac2, deg_pdg1, xchs );   //10
	polyMulModP(prem,prnd,pfac2,pdg1,deg_pdg1);      //11
	polyPowCharModP(prnd, prem, deg_pdg1, xchs);    //110
	polyPowCharModP(prnd, prnd, deg_pdg1, xchs);   //1100
	polyMulModP(pfac1,prnd,prem,pdg1,deg_pdg1);    // 1111
	polyPowCharModP(prnd,pfac1,deg_pdg1,xchs);     //11110
	polyPowCharModP(prnd,prnd,deg_pdg1,xchs);     //111100
	polyMulModP(pfac2,prem,prnd,pdg1,deg_pdg1);  // 111111    <-----
	polyPowCharModP(prnd,pfac2,deg_pdg1,xchs);   //1111110
	polyPowCharModP(prnd,prnd,deg_pdg1,xchs);   //11111100
	polyMulModP(prem,prem,prnd,pdg1,deg_pdg1);  //11111111    1X8
	polyPowCharModP(prnd,prem,deg_pdg1,xchs);  //111111110
	for( i=7 ; i>0 ; i-- ) polyPowCharModP(prnd,prnd,deg_pdg1,xchs); // 1111111100000000  1X8 0X8
	polyMulModP(pfac1,prnd,prem,pdg1,deg_pdg1); // 1X16     <------
	polyPowCharModP(prnd,pfac1,deg_pdg1,xchs); // 1X16 0X1
	for( i=15; i>0 ; i-- ) polyPowCharModP(prnd,prnd,deg_pdg1,xchs); // 1X16 0X16
	polyMulModP(prnd,prnd,pfac1,pdg1,deg_pdg1); // 1X32
	for( i=16 ; i>0 ; i-- ) polyPowCharModP(prnd,prnd,deg_pdg1,xchs); // 1X32 0X16
	polyMulModP( prnd , prnd , pfac1 , pdg1 , deg_pdg1 ); // 1X48
	for( i=6;i>0;i--) polyPowCharModP(prnd,prnd,deg_pdg1,xchs); // 1X48 0X6
	polyMulModP( prnd , prnd , pfac2 , pdg1 , deg_pdg1 ); // 1X54
} else
{
//#else
		polyPowCharModP(prnd, pfac2, deg_pdg1, xchs);
		for(i = 0; i < ((int)POW)-2; i++)
		{
			polyMulModP(prnd, prnd, pfac2, pdg1, deg_pdg1);
			polyPowCharModP(prnd, prnd, deg_pdg1, xchs);
		}
		polyMulModP(prnd, prnd, pfac2, pdg1, deg_pdg1);
}
//#endif
}
//#endif
if( 13 == CH )
{
//#if CH==13
		polyMulModP(pfac2, prnd, prnd, pdg1, deg_pdg1);//10
		polyMulModP(pfac2, pfac2, prnd, pdg1, deg_pdg1);//11
		polyMulModP(pfac2, pfac2, pfac2, pdg1, deg_pdg1);//110, pfac2 = prnd^6

		polyPowCharModP(prnd, pfac2, deg_pdg1, xchs);//10
		polyPowCharModP(prem, prnd, deg_pdg1, xchs);//100
		polyMulModP(pfac1, prem, pfac2, pdg1, deg_pdg1);//101
		polyPowCharModP(prnd, pfac1, deg_pdg1, xchs);//1010
		polyPowCharModP(prnd, prnd, deg_pdg1, xchs);//10100
		polyMulModP(prnd, prnd, pfac2, pdg1, deg_pdg1);//10101
		polyPowCharModP(pfac1, prnd, deg_pdg1, xchs);//101010
		polyMulModP(prnd, pfac1, prnd, pdg1, deg_pdg1);//111111
		polyPowCharModP(pfac2, prnd, deg_pdg1, xchs);//1111110
		for(i = 0; i < 5; i++)
		{
			polyPowCharModP(pfac2, pfac2, deg_pdg1, xchs);
		}
		polyMulModP(prnd, pfac2, prnd, pdg1, deg_pdg1);
}
//#endif
if( (31 == CH) || (13 == CH ))
{
//#if (CH==31 || CH==13)
		prnd[0] += T::one;
		is_zero = 1;
		for(i = dim_prnd-1; i >= 1; i--)
		{
			if( prnd[i] )
			{
				is_zero = 0;
				break;
			}
		}
		if(is_zero) continue;
		dim_pfac1 = deg_pdg1;
		memset(pfac1, 0, sizeof(T)*dim_pfac1);
		util<T>::polyGCD(pfac1, &dim_pfac1, pdg1, deg_pdg1+1, prnd, dim_prnd);
		//BLAS::BLAS_dumpVec<T>(deg_pdg1+1, pdg1);
		//BLAS::BLAS_dumpVec<T>(dim_prnd, prnd);
		//BLAS::BLAS_dumpVec<T>(dim_pfac1, pfac1);
		//cout << endl;
		if(dim_pfac1 != 1)
		{
			break;
		}
}
//#endif
}
//#endif

	memset(pfac2, 0, sizeof(T)*dim_pfac2);
	memset(prem, 0, sizeof(T)*dim_prem);
	//util<T>::polyDiv(pfac2, &dim_pfac2, prem, &dim_prem, pdg1, deg_pdg1+1, pfac1, dim_pfac1);
	util<T>::polyDivMonic( pfac2 , & dim_pfac2 , pdg1 , deg_pdg1+1 , pfac1 , dim_pfac1 );
	equalDegFac<CH,POW>(roots, dim_roots, pfac1, dim_pfac1-1);
	equalDegFac<CH,POW>(roots, dim_roots, pfac2, dim_pfac2-1);

	free(xchs); xchs = NULL;
	free(pfac1); pfac1 = NULL;
	free(pfac2); pfac2 = NULL;
	free(prem); prem = NULL;
	free(prnd); prnd = NULL;
	return;
}



template<class T>
void cantor_zassen<T>::xPowModP(T *xpow, const int pow, T *p, const int deg_p)
{
	int i, j, deg_p_min_1, deg_tmp;
	T lc_xch;
	T *xpowtmp;// = new T [pow+1];

	if(pow < deg_p) {
		xpow[pow] = T::one;
		return;
	}
	xpowtmp = new T [pow+1];
	//xpowtmp = (T *)malloc(sizeof(T)*(pow+1));
	memset(xpowtmp, 0, sizeof(T)*pow);
	xpowtmp[pow] = T::one;

	deg_p_min_1 = deg_p - 1;
	for(i = pow; i > deg_p_min_1; i--) {
		lc_xch = xpowtmp[i];
		if( lc_xch ) {
			deg_tmp = i-deg_p;
			for(j = 0; j <= deg_p_min_1; j++) {
				xpowtmp[deg_tmp] -= lc_xch * p[j];
				deg_tmp++;
			}
		}
	}
	memcpy(xpow, xpowtmp, sizeof(T)*deg_p);
	for( i=0 ; i < deg_p ; i++ ) xpow[i].rd(); /////////////////////////////////
	delete [] xpowtmp;
	//free(xpowtmp); xpowtmp = NULL;
	return;
}


template<class T>
void cantor_zassen<T>::polyMulModP(T *xo, T *xi1, T *xi2, T *p, const int deg_p)
{
	int i, j, deg_p_min_1, deg_mul;
	//T xmultmp[l_polyMul];
	T * xmultmp;
	T lc_xo;

	deg_mul = 2*deg_p - 2;
	xmultmp = new T [deg_mul+1];
	//xmultmp = (T *)malloc(sizeof(T)*(deg_mul+1));
	memset(xmultmp, 0, sizeof(T)*(deg_mul+1));

	deg_p_min_1 = deg_p - 1;
	for(i = deg_p_min_1; i >= 0; i--) {
		for(j = deg_p_min_1; j >= 0; j--) {
			xmultmp[i+j] += (xi1[i] * xi2[j]);
		}
	}

	for(i = deg_mul; i > deg_p_min_1; i--) {
		lc_xo = xmultmp[i];
		if( lc_xo ) {
			for(j = 0; j <= deg_p_min_1; j++) {
				xmultmp[i-(deg_p-j)] -= (lc_xo * p[j]);
			}
		}
	}
	memcpy(xo, xmultmp, sizeof(T)*deg_p);
	for( i=0; i < deg_p ; i++ ) xo[i].rd(); ///////////////////////////////////
	delete [] (xmultmp); xmultmp = NULL;
	return;
}


template<class T>
void cantor_zassen<T>::polyPowCharModP(T *xo, T *xi, const int deg_p, T *xchs)
{
	int i, j, deg_p_min_1;
	T xchtmp, *itr;
	T * xotmp = new T [deg_p];
	//T xotmp[l_powChar];

	deg_p_min_1 = deg_p - 1;
	//xotmp = (T *)malloc(sizeof(T)*deg_p);
	memset(xotmp, 0, sizeof(T)*deg_p);
	xotmp[0] = T::powch( xi[0] , 1 );
	itr = xchs+deg_p;
	for(i = 1; i <= deg_p_min_1; i++) {
		xchtmp = T::powch(xi[i] , 1);
		for(j = 0; j <= deg_p_min_1; j++) {
			//xotmp[j] += (xchtmp* xchs[i*deg_p+j]);
			xotmp[j] += xchtmp*(*itr);
			itr++;
		}
	}
	memcpy(xo, xotmp, sizeof(T)*deg_p);
	for(i=0; i < deg_p ;i++ ) xo[i].rd();       ///////////////////////////////
	//free(xotmp); xotmp = NULL;
	delete [] xotmp;
	return;
}













#endif
