#include "GFpow.h"


void mult( int * c, int * a, int * b ) {
	/* multiplication of polynomials mod 2                    */
	/* c polynomial of degree 14,                             */
	/* x^7+s polynomials of degree 7, with x^7 not stored,    */ 
	/* Compute  c = c mod s                                   */
	int i,j ; 
	for ( i = 0; i < 2*deg-1 ; i++ ) c[i] = 0 ;
	for ( i = 0; i < deg; i++ ) 
		if ( a[i]==1 ) for ( j = 0 ; j < deg ; j++ ) {
			c[i+j] += b[j] ;
			if ( c[i+j] == 2 ) c[i+j]=0 ;
		}
		for( j = 2*deg-2 ; j >= deg ; j-- ) {
			if ( c[j] == 1 ) {
				c[j] = 0 ;
				for ( i = 0 ; i < deg ; i++ ) {
					c[j-1-i] += fx[deg-1-i] ;
					if ( c[j-1-i] == 2 ) c[j-1-i] = 0 ;
				}
			}
		}
}

void binaryform( int * a, int n) {//Change an integer into polynomial (A coefficient array)
	int i ;
	for ( i=0 ; i < deg ; i++ ) {//get the last digit of n each time and put into a[i]
		a[i] = n & 1 ;
		n = n >> 1 ;
	}
}


int eval ( int * c ) {
	/* convert polynomial to integer between 0 to 256 */
	int i, a = 0 ;
	for ( i = deg-1; i >= 0; i-- ) 
		a = c[i]+ a + a ;
	return a ;
}







GFpow operator*( const GFpow & x, const GFpow & y ) {
	int j  ; 
	if (( x.a == 0 ) || ( y.a == 0 )) return (0) ;
	if ((j = lg[x.a] + lg[y.a] ) >= pow ) j -= powm1 ;
	return( ex[j] ) ;
}


GFpow operator/( const GFpow & x, const GFpow & y ) {
	int j ; 
	if ( y.a==0 ) {
		cout << "Division by zero"<< endl ;
		abort() ;
	}
	if ( x.a == 0 ) return (0 ) ;

	if( (j = lg[x.a]-lg[y.a]) < 0 ) j += powm1 ;

	return ( ex[j] ) ;
}



GFpow operator+( const GFpow & x, const GFpow & y ) {
	return (x.a^y.a) ;
}



GFpow& GFpow:: operator+=( const GFpow & x ) {
	a= a^x.a ;
	return *this ;
}



GFpow& GFpow:: operator*=( const GFpow & x ) {
	int j  ; 
	if (a == 0 ) return *this;
	if ( x.a == 0 ) {a = 0 ; return *this ;}

	if ((j = lg[a] + lg[x.a] ) >= pow ) j -= powm1 ;
	a = ex[j]  ;
	return *this ;
}
	


GFpow& GFpow:: operator/=( const GFpow & x ) {
	int j  ; 

	if ( x.a==0 ) {
		cout << "Division by zero in operator /="<< endl ;
		abort() ;
	}
	if ( a == 0 ) return *this ;

	if( (j = lg[a]-lg[x.a]) < 0 ) j += powm1 ;

	a = ex[j]  ;
	return *this ;
}
	
ostream& operator<< (ostream& out, const GFpow& v){ 
	out << v.a ;
	return ( out ) ;
}

istream& operator>> (istream& in,  GFpow& v){ 
	in >> v.a ;
	return ( in ) ;
}

