#ifndef _LINEAR_SOLVER_H
#define _LINEAR_SOLVER_H


template <unsigned p,unsigned n>
bool guass_elim_solver( gfv<p,n> & sol , matrix<p,n+1,n> & eqs )
{
	sol.set_zero();
	if( ! guass_elim( eqs ) ) return false;
	
	gfv<p,n> eq;
	sol.set( n-1 , eqs.L[n-1][n] );
	for( unsigned i=n-1;i--; ) {
		(eqs.L[i]).coerceTo(eq);
		gf<p> rem = eq.dot( sol );
		sol.set( i , eqs.L[i][n] + rem );
	}
	
	return true;
}

template <unsigned p,unsigned n>
bool guass_elim_solver( gfv<p,n> & sol , const matrix<p,n,n> & eqs , const gfv<p,n> & b )
{
	matrix<p,n+1,n> eeqs;
//	memcpy( & eeqs , & eqs , sizeof(matrix<p,n,n>) );
	for(unsigned i=n;i--; ) eqs.L[i].coerceTo( eeqs.L[i] ); 
	for(unsigned i=n;i--; ) eeqs.L[i].set( n , b[i] );
	return guass_elim_solver( sol , eeqs );
}






template <unsigned g, unsigned m>
void shiftLeft( gfv<g,m> & vec )
{
	for(unsigned i=gfv<g,m>::M-1;i>0;i--)
		vec.c[i].v = _mm_or_si128(_mm_srli_si128( vec.c[i-1].v,15),_mm_slli_si128(vec.c[i].v,1));
	vec.c[0].v = _mm_slli_si128(vec.c[0].v,1);
}




template <unsigned g,unsigned n>
void berlekamp_massey( gfv<g,n> & minPoly , int *deg_poly , const gfv<g,2*n> seq )
{
	gfv<g,n> a_i;	a_i.set_zero();
	gfv<g,n> tmp;
	gfv<g,n> pre_minPoly;	pre_minPoly.set_zero();

	minPoly.set_zero(); minPoly.set(0,gf<g>(1));

	gf<g> head_term,pre_head_term = 1;
	unsigned diff_deg = 0;

	for( unsigned j = 0; j < 2*n ; j++ )
	{
		// shift left pri_minPoly   <-- pre_minPoly = x  pre_minPoly
		shiftLeft( pre_minPoly );

		// prepare a_i // shift left and add one element
		shiftLeft( a_i ); a_i.set(0,seq[j]);

		// count head_term
		head_term = minPoly.dot( a_i );

		if( head_term ){
			tmp = minPoly;
			minPoly -= pre_minPoly * ( head_term / pre_head_term );
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


template <unsigned g,unsigned n>
void count_cc( gfv<g,n>* bs , const matrix<g,n,n> & mat , const gfv<g,n> & b )
{
	bs[0] = b;
	for( unsigned i = 1 ; i < 2*(n+1) ; i++ )
		bs[i] = mat.prod( bs[i-1] );
}


template <unsigned g,unsigned n>
bool wiedemann_solver( gfv<g,n> & sol , const matrix<g,n,n> & mat , const gfv<g,n> & b )
{
	gfv<g,n> bs[2*(n+1)];
	gfv<g,2*(n+1)> seq;
	gfv<g,n+1> minPoly;
	gfv<g,n+1> backMinPoly;
	int deg_back = 0;
	int deg_poly = 0;
	
	bs[0] = b;
	for( unsigned i = 1 ; i < 2*(n+1) ; i++ )
		bs[i] = mat.prod( bs[i-1] );
//	BENCHMARK(bm, count_cc(bs,mat,b) );

	for( unsigned j = 0 ; j < n ; j++ ) {
		for( unsigned i = 0 ; i < 2*(n+1) ; i++ ) seq.set(i,bs[i][j]);
		//VEC<31,n> rv;
		//rand_vec( & rv );
		//for( unsigned i = 0 ; i < 2*(n+1) ; i++ ) seq[i] = dot( rv , bs[i] );
		//seq.dump( stdout );

		berlekamp_massey( minPoly , & deg_poly , seq );
//		BENCHMARK(bm, berlekamp_massey( minPoly , & deg_poly , seq ) );
		//minPoly.dump( stdout );
		if( deg_poly == (int)n ) break;
		if( deg_poly == (deg_back == (int)(n-1))) break;
		if( deg_poly > deg_back ) { backMinPoly = minPoly; deg_back=deg_poly; }
	}
	if( deg_poly < deg_back ) { minPoly = backMinPoly; deg_poly = deg_back; }
	
	if( n == deg_poly )	{
		sol = bs[n-1]*minPoly[0];
		for( int i = n-2 ; i >= 0 ; i-- ) sol += bs[i] * minPoly[n-1-i];
		sol *= ( minPoly[n].inv() );
	} else {
		sol = bs[deg_poly-1]*minPoly[0];
		for( int i = deg_poly-2 ; i>=0 ; i-- ) sol += bs[i] * minPoly[deg_poly-1-i];
		sol *= ( minPoly[deg_poly].inv());
	}
	////// check answer
	bs[1] = mat.prod( sol );
	if( (bs[1][0]==bs[0][0])&& (bs[1][1]==bs[0][1]) && (bs[1][2]==bs[0][2]) ) return true; //////
	return false;
}





#endif
