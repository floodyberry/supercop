#include "randombytes.h"
#include "rainbow.h"
#include "crypto_sign.h"


int randombyte(void)
{
  unsigned char c;
  randombytes(&c,1);
  return 255 & (int) c;
}

int crypto_sign_keypair( unsigned char * pk, unsigned char * sk ) {
	
    GFpow * a[nv1], * b[nv1], * c[nv1],   e[nv1] ; 
    GFpow  S[nv1*nv1], s[nv1] ;
    GFpow  T[ovn*ovn], t[ovn];
	
	GFpow R[2*ovn*ovn] ;

	GFpow C[ovn1*ovn1] ;
	GFpow C1[ovn1*ovn1];
	GFpow L2[ovn1*ovn1] ;
	GFpow D0[nv1][ovn1*ovn1] ;
	GFpow D[nv1][ovn1*ovn1] ;
	GFpow temp ;


	
	int i,j,k, k0, ij,  eof;
	const int rept = 1;
	int oil, vinegar ;

	// create L1 and check that L1 is not singular
	// initialize affine transformation  L1 in S and s
	// and also put s and S^-1 on sk 
	
	for ( ij = 0 ; ij < nv1 ; ij++ ) {
		s[ij] = sk[ij] = randombyte() % pow ;
	}

	eof = 1 ;
	while ( eof ) {
		for ( i = 0 ; i < nv1 ; i ++ ) {
			for ( j = 0 ; j < nv1 ; j++ ) {
				R[i*nv2+j] = S[i*nv1+j] = randombyte() % pow ;
			}
			for ( ; j < nv2 ; j++ ) {
				R[i*nv2+j] = 0 ;
			}
			R[i*nv2+nv1+i] = 1 ;
		}
		
		eof = nv1 - gauss( R, nv1, nv2 ) ;
		//  if ( eof ) cout << "L1 was singular \n" ;
	}

	//  store S^(-1) in secrete key sk
	for ( i = 0 ; i < nv1 ; i++ ) {
		for ( j = nv1 ; j < nv2; j++ ){
			sk[ij++] = R[i*nv2+j].GFpowtochar() ;
		}
	}


    	
	k = 0 ;
	for( k0 = 0; k0 < un-1; k0++ ) {
		oil = Slist[k0+1] - Slist[k0] ; 
		vinegar = Slist[k0] ;
		
		for ( ; k < Slist[k0+1]-v1; k++ ) {
			
			a[k] = new GFpow[oil*vinegar] ;
			b[k] = new GFpow[vinegar*vinegar] ;
			c[k] = new GFpow[vinegar+oil] ;
			
			// cout << "\nallocate "<< oil*vinegar<<"  "<<vinegar*vinegar<<"  " <<vinegar * oil<<endl;
			
			if ( oil == 1 ) {
				for ( i = 0 ; i < vinegar; i++ ){
					a[k][i] = 0 ;
				}
			}
			else {
				for ( i =0 ; i < oil; i++) 	{
					for( j=0; j < vinegar; j++) {
						a[k][j*oil+i] = sk[ij++] = randombyte() % pow ;
					}
				}				
			}

			e[k] = sk[ij++] = randombyte() % pow ;     // generate in ordered needed by inverse			
			
			for( i=0; i < vinegar; i++) {
				for ( j =0 ; j < vinegar; j++) {
					if( j < i )
						b[k][i*vinegar+j]=0 ;
					else
						b[k][i*vinegar+j] = sk[ij++] = randombyte() % pow ;
				}
			}

			
			for ( i = 0 ; i < vinegar+oil; i++)	c[k][i] = sk[ij++] = randombyte() % pow ;
			if ( oil == 1) {
				i--;
				while ( c[k][i] == 0 ) {
					c[k][i] =  sk[ij-1] = randombyte() % pow ;
				}
			}
		}
	}
       
	// check that  L2 is not singular	
	// initialize affine transformation L2 in T and t


	for ( i = 0 ; i < ovn ; i++ ) {
		sk[ij++] = randombyte() % pow ;
		t[i] = GFpow( sk[ij-1] ) ;
	}

	eof = 1 ;
	while ( eof ) {
		for ( i = 0 ; i < ovn ; i ++ ) {
			for ( j = 0 ; j < ovn ; j++ ) {
				R[i*ovn2+j] = T[i*ovn+j] = randombyte() % pow ;
			}
			for ( ; j < ovn2 ; j++ ) {
				R[i*ovn2+j] = 0 ;
			}
			R[i*ovn2+ovn+i] = 1 ;
		}
		eof = ovn - gauss( R, ovn, ovn2 ) ;
		// if ( eof ) cout << "L2 was singular \n" ;
	}

	//  store T^(-1) in secrete key sk
	for ( i = 0 ; i < ovn ; i++ ) {
		for ( j = ovn ; j < ovn2; j++ ){
			sk[ij++] = R[i*ovn2+j].GFpowtochar() ;
		}
	}


	//  Now create public key 
	// set up linear transformation  L2 in homogeneous form 
	// using matrices T and t
	
	k = 0 ;
	for ( i = 0 ; i < ovn; i++ ) {
		for ( j = 0 ; j < ovn ; j++ ) {
			L2[k++] = T[ovn*i + j ] ;
		}
		L2[k++] = t[i] ;
	}
	for ( j = 0; j < ovn ; j++ ) L2[k++] = 0 ;
	L2[k] = 1 ; 
	
	k = 0 ;
	for ( k0 = 0; k0 < un-1 ; k0++ ) {
		oil = Slist[k0+1] - Slist[k0] ; 
		vinegar = Slist[k0] ;
		
		for ( ; k < Slist[k0+1]-v1; k++ ) {
			
			for ( i = 0 ; i < vinegar ; i++ ) {
				for ( j = 0 ; j < vinegar; j++ ) {
					C[i*ovn1+j] = b[k][i*vinegar+j] ;
				}
				
				for (j=0 ; j < oil; j++ ) C[i*ovn1+j+vinegar] = a[k][i*oil+j] ;
				
			}
			for (j=0  ; j < vinegar+oil ; j++ )  C[ovn*ovn1+j] = c[k][j] ;
			
			
			C[ovn*ovn1+ovn] = e[k] ;
			
			
			
			
			// form compostion with L2
			
			for ( i = 0 ; i < ovn1 ; i++ ) {
				for ( j = 0 ; j < ovn1; j++ ) {
					temp = 0 ;
					for ( ij = 0 ; ij < ovn1 ; ij++ ) {
						temp += C[i*ovn1+ij]*L2[ij*ovn1+j] ;
					}					
					C1[i*ovn1+j] =temp ;
				}
			}
			
			
			for ( i = 0 ; i < ovn1*ovn1; i++) D0[k][i]=0 ;
			
			for ( i = 0 ; i < ovn1 ; i++ ) {
				for ( j = 0 ; j < ovn1; j++ ) {
					temp = 0 ;
					for ( ij = 0 ; ij < ovn1 ; ij++ ) {
						temp += L2[ij*ovn1+i] * C1[ij*ovn1+j] ;
					}
					if ( i <= j ) D0[k][i*ovn1+j] =temp ;
					else D0[k][j*ovn1+i] += temp ;
				}
			}
			
		}
	}
	
	// Composition with L1, uses matrices S and s directly
	
	for ( k = 0 ; k < nv1 ; k++ ) {
		
		for ( i = 0 ; i < ovn1*ovn1 ; i++ ) D[k][i] = 0 ; // may not be needed, just in case
		for ( j = 0 ; j < nv1; j++ ) {
			for ( i = 0 ; i < ovn1*ovn1 ; i++ ) D[k][i]+=S[k*nv1+j]*D0[j][i] ;
		}
		
		D[k][--i] += s[k] ;     // affine part of L1
		
	}


	// write out public key 
	ij = 0 ;
	for ( k = 0 ; k < nv1 ; k++ ) {
		
		for ( i = 0 ; i < ovn1 ; i++ ) {
			for ( j = i ; j < ovn1 ; j++ ) pk[ij++]= D[k][i*ovn1+j].GFpowtochar()  ;
		}
	}

	for ( k = 0 ; k < Slist[k0+1]-v1; k++ ) {
		delete [] a[k] ;
		delete [] b[k] ;
		delete [] c[k] ;
	}



			
	return(0) ;	
}




int verification( const unsigned char * m,unsigned long long mlen,
					   const unsigned char * sm, unsigned long long smlen,
					   const unsigned char * pk, unsigned long long pklen){
	
	int i,j,k, ij=0 ;
	if (smlen != ovn) return -100;
	if (mlen != nv1) return -100;
	GFpow temp, x[ovn1];
	
	for ( k = 0 ; k < ovn; k++ ) x[k] = GFpow(sm[k]); 
	x[ovn] = 1;
	
	for ( k = 0 ; k < nv1 ; k++ ) {
		temp = 0 ;
		
		for ( i = 0 ; i < ovn1 ; i++ ) {
			for ( j = i ; j < ovn1 ; j++ ) {
				temp += GFpow(pk[ij++])*x[i]*x[j] ;	
			}
		}
		
		if (m[k] != temp.GFpowtochar() ) return -100;
	}
	
	return 0;
}



int signatureofshorthash( unsigned char * sm,unsigned long long * smlen,
					   const unsigned char * m, unsigned long long mlen,
					   const unsigned char * sk, unsigned long long sklen)

//int Finverse( GFpow * x, GFpow * y, unsigned char * sk)
// given y[0],...,y[nv1-1]  
// select vinegar variables x[0],...,x[v1-1] at random
// and solve for x[v1],..., x[ovn]
// matrix A is set up to hold resulting linear equations
{
	int i,j,k,k0,k1,ij, ij0, oil, vinegar, repeat, eof  ;
	GFpow c0, A[nv1*(nv1+1)], B[ovn*ovn1], * xoil, y1[ovn];

	GFpow y[nv1] ;
	GFpow x[ovn] ;


	for (ij=0; ij < nv1 ; ij++) y[ij] = GFpow( m[ij] ) + GFpow( sk[ij] ) ;

		
	// compute first L1^{-1} 
	
	k = 0 ;
	for ( i = 0 ; i < nv1 ; i++ )
	{
		y1[i] = 0 ;
		for ( j = 0 ; j < nv1 ; j++ ) {
			y1[i] += GFpow(sk[ij++]) * y[j]  ;
		}

	}
	
    // next find F^{-1}
	
	
	ij0 = ij ;   
	eof = 0 ;
	do {
		ij = ij0 ;     // in case we have to repeat
		repeat = 0;
		for ( j = 0 ; j < v1; j++ ) x[j] = randombyte() % pow ;
		
		
		for ( k0 = 0; k0 < un-1 ; k0++ ) {
			oil = Slist[k0+1] - Slist[k0] ; 
			vinegar = Slist[k0] ;
			xoil = x + Slist[k0] ;
			if ( oil == 1 ) {  // special case   mixed terms set to zero
				// no difficulty in solving equation
									// constant term caused by vinegar, subtract from y1[k] 
				k1 = Slist[k0] - v1 ;
				c0 = GFpow( sk[ij++] )+ y1[k1] ; //e[k1]+y1[k1];       // 
				for ( i =0; i < vinegar; i++ ) {
					for ( j = i ; j < vinegar; j++ ) {
						c0 += GFpow(sk[ij++])* x[i]* x[j] ;    // b[k1][i*vinegar+j] 
					}
					
				}
				for ( i =0; i < vinegar; i++ ) {
					c0 += GFpow(sk[ij++]) * x[i] ;     // c[k1][i] * x[i] ;
				}
				x[vinegar] =  c0 / GFpow( sk[ij++] ) ;   ///  c0 / c[k1][vinegar] ;
			}
			else {  // general case
				for ( k = 0 ; k < oil ; k++ ) {
					k1 = k + Slist[k0]-v1 ; 
					
					for ( i =0 ; i < oil ; i++) {
						c0 = 0 ; 
						for( j = 0 ; j < vinegar; j++ ) c0 +=  GFpow(sk[ij++])*x[j] ; //a[k1][j*oil+i]*x[j]; //
						A[k*(oil+1)+i] = c0 ;
					}
					// constant term caused by vinegar, subtract from y1[k] 
					c0 = GFpow( sk[ij++] ) ;      //   e[k1] ;
					for ( i =0; i < vinegar; i++ ) {
						for ( j = i ; j < vinegar; j++ ) {
							c0 += GFpow(sk[ij++]) * x[i]* x[j] ;   // b[k1][i*vinegar+j] 
						}
					}
					for ( i = 0 ; i < vinegar ; i++ ) {
						c0 +=  GFpow( sk[ij++] ) * x[i] ;    //  c[k1][i] * x[i] ;
					}

					A[k*(oil+1)+oil] = y1[k1]+ c0 ; 
					// update equation for oil variables with terms from vector c
					for ( i = 0 ; i < oil; i++ ) {
						A[k*(oil+1)+i] += GFpow(sk[ij++]) ;  //  c[k1][i+vinegar] ;
					}
				}
				i = gauss( A, oil, oil+1 ) ;
				if ( A[(oil-1)*(oil+2)] == 0  ) {
					eof++ ;
					if (eof < 100) { 
						repeat = 1 ;
					}
					break ;
				}
				else {
					for ( i = 0 ; i< oil ; i++ ) x[i+vinegar] = A[i*(oil+1)+oil] ;
				}
			}   // general case oil > 1
		} 
	} while( repeat ) ;
	  
	if ( eof >= 100 ) {
          return ( -1 ) ;
	}

	// finally apply L2^{-1}
	k =0 ;
	for ( i = 0 ; i < ovn ; i++ ) {
		y1[i] = GFpow(sk[ij++]) + x[i] ;
	}
	for ( i = 0 ; i < ovn ; i++ ) {
		x[i] = 0 ;
		for ( j = 0 ; j < ovn ; j++ )  {
			x[i] += GFpow(sk[ij++]) * y1[j] ;
		}
	}


	for ( i = 0 ; i< ovn ; i++ ) sm[i] = x[i].GFpowtochar() ;

	* smlen = ovn ;
	
	return(repeat) ;
}


