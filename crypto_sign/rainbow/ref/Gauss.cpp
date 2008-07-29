#include "rainbow.h"

#ifdef OUTFILE
ofstream fout(OUTFILE,ios::out ) ; //Output Document


void display(GFpow *a, int const n, int const m, char * ch ) {   
	// display in a in matrix form:  n rows , m columns
	int i,j ;
	fout<<endl<<ch<<endl;
	for (i =0 ; i < n ; i++ ) {
		fout << endl ;
		for (j=0 ; j < m ; j++ ) if( a[i*m+j] == 0 ) fout<<". ";else fout << a[i*m+j]<<' ';
	}
	fout << endl ;
}

#endif

int gauss( GFpow ab[],  int const nequ, int const nvar  )  {
	// nequ = number of equations,
	// nvar = number of variables
	// dimension: ab[nequ*nvar] ab[neq][nvar]
	
	int i, j, k, i0, i00, j0;
	int * ind  ;

	int *ij = new int[nequ] ;


	for (i=0; i < nequ ; i++) ij[i]=i ;


	GFpow temp ;


#ifdef DEBUG
	int b0,b1 ;

	fout << "starting gauss"<<endl ;

	for ( i = 0 ; i < nequ ; i++ ) {
		b0 = 0 ;
		for ( j = 0 ; j < nvar; j++) {
			if (ab[i*nvar+j] != 0 ) {
				if (b0==0) 	b0=1 ;
				else fout <<'+' ;
				fout << ab[i*nvar+j]<<"*u["<<j<<"]" ;
			}
		}
		if (b0==0) fout <<"0,"<<endl ;
		else fout <<','<<endl ;
	}
#endif


    ind = new int[nvar] ; 


	i0 = j0 = 0 ;
	while ( (i0< nequ ) && ( j0 < nvar )) {


		i = i0 ;
		while ( ( ab[i*nvar+j0] ==  0 ) && ( i < nequ ) ) i++ ;

		if ( i < nequ ) {
			if ( i > i0 ) {  // interchange row i and i0


				for ( j = j0 ; j < nvar ; j++ ) {
					temp = ab[i*nvar+j] ;
					ab[i*nvar+j] = ab[i0*nvar+j] ;
					ab[i0*nvar+j] = temp ;
				}

			}
		
			

			temp = 1/ab[i0*nvar+j0] ;
			
			ab[i0*nvar+j0] = 1 ;
			ind[i0] = j0 ;
			for ( k = j0+1 ; k < nvar; k++ ) ab[i0*nvar+k] = ab[i0*nvar+k]*temp ; 

			for ( j = i+1; j < nequ; j++ ) {
				if( (temp = ab[j*nvar+j0]) != 0 ){ 
					ab[j*nvar+j0] = 0 ;
					for ( k = j0+1; k < nvar ; k++ )  
						ab[j*nvar+k] += ab[i0*nvar+k]*temp ;
				}
			}
			i0++ ;
		}
		j0++;

	}


	i00 = i0 ;

	for ( i0--; i0>=0 ; i0-- ) {

		j0 = ind[i0] ;
		for ( i = i0-1 ; i >= 0 ; i-- ) {
			temp = ab[i*nvar+j0] ;
			ab[i*nvar+j0] = 0 ;
			for ( k = j0+1;  k < nvar ; k++ ) 
				ab[i*nvar+k] = ab[i*nvar+k]+ab[i0*nvar+k]*temp ;
		}
		
	}


#ifdef DEBUG	
	for ( i = 0 ; i < i00 ; i++ ) {
		b0 = b1 = 0 ;
		for ( j = 0 ; j < nvar; j++) {
			if (ab[i*nvar+j] != 0 ) {
				if (b0==0) {
					b0=1 ;
					if ( ab[i*nvar+j]!= 1) fout << ab[i*nvar+j]<<'*'; 
					fout <<"u["<<j<<"]->" ;
				}
				else {
					if ( b1==1 ) fout << '+' ;
					fout <<ab[i*nvar+j]<< "*u["<<j<<"]" ;
					b1=1 ;
				}
			}
		}
		if (b1==0) fout <<"0,"<<endl ;
		else fout <<','<<endl ;
	}
#endif
	return ( i00 ) ;

}


