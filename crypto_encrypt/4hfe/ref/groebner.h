/*
 * $Id: groebner.h 1483 2008-09-07 04:13:56Z daven $
 */

#ifndef _GROEBNER_H
#define _GROEBNER_H

#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <assert.h>
#include "polynomial.h"



template <class T, int n_var = 3>
class groebner
{
public:
	static void genEquas(T *fo)
	{
		for( int i = 0 ; i < 30 ; i++ ) fo[i] = T::rand();
		fo[10] -= fo[10];
		fo[20] -= fo[20];
		fo[21] -= fo[21];
	}
	
	static void eval(T *c, const T *fi, T *v)
	{
		static polynomial<T,n_var,10> poly;
		for( int i = 0 ; i < n_var ; i++ )
		{
			poly.set_quad_poly( fi );
			c[i] = poly.eval( v );
			fi += 10;
		}
	}

	static void univarPoly3( T *p , T *py , int *deg_p , T *fi )
	{
		const int n_t = 20;
		const int n_v = 3;
		static polynomial<T,n_v,n_t> gusMat[17];
		monomial<3> x = monomial<3>(1);
		monomial<3> y = monomial<3>(4);
		monomial<3> z = monomial<3>(16);
		
		gusMat[0].set_quad_poly( fi );		// 200
		gusMat[1].set_quad_poly( fi+10 );  // 110
		gusMat[2].set_quad_poly( fi+20 );  // 101

		//puts(""); print_mat<T,n_v,n_t,3>(gusMat);
		gusElim_sp<T,n_v,n_t,3>( gusMat );
		//puts(""); print_mat<T,n_v,n_t,3>(gusMat);
		
		gusMat[10] = gusMat[9] = gusMat[7] = gusMat[6] = gusMat[2]; // 101
		gusMat[8] = gusMat[5] = gusMat[4] = gusMat[3] = gusMat[1]; // 110
		gusMat[2] = gusMat[1] = gusMat[0]; // 200
		gusMat[0].extend( y ); // 210
		gusMat[1].extend( z ); // 201
		//gusMat[2] = S[0]; // 200
		gusMat[3].extend( y ); // 120
		gusMat[4].extend( z ); // 111
		//gusMat[5] = S[1]; // 110
		gusMat[6].extend( z ); // 102
		//gusMat[7] = S[2]; // 101
		gusMat[8].extend( x ); // 210 -> 100
		gusMat[9].extend( x ); // 201 -> 030
		gusMat[10].extend( y ); // 111 -> 021
		//puts(""); print_mat<T,n_v,n_t,11>(gusMat);
		gusElim_sp<T,n_v,n_t,11>( gusMat );
		//puts(""); print_mat<T,n_v,n_t,11>(gusMat);
		
		gusMat[14] = gusMat[12] = gusMat[11] = gusMat[10]; // 021
		gusMat[10] = gusMat[9]; // 030
		gusMat[13] = gusMat[8]; // 100
		gusMat[9].extend( z ); // 031
		//gusMat[10]; // 030
		gusMat[11].extend( z ); // 022
		//gusMat[12] = S[3]; // 021
		gusMat[13].extend( z ); // 101 -> 020
		gusMat[14].extend( y ); // 031 -> 013
		//puts(""); print_mat<T,n_v,n_t,8>(gusMat+7);
		gusElim_sp<T,n_v,n_t,8>( gusMat + 7 );
		//puts(""); print_mat<T,n_v,n_t,8>(gusMat+7);
		
		gusMat[15] = gusMat[14]; // 013
		gusMat[14].extend( z ); // 014
		// gusMat[15] // 013
		gusMat[16] = gusMat[13]; gusMat[16].extend(z); // 021 -> 012
		//puts(""); print_mat<T,n_v,n_t,5>(gusMat+12);
		gusElim_sp<T,n_v,n_t,5>( gusMat + 12 );
		//puts(""); print_mat<T,n_v,n_t,5>(gusMat+12);
		//printMat<T,n_v,n_t,5>(gusMat+12);
		//            0     1    2    3   4    5     6   7   8 
		//gusMat[15] yz3 + yz2 + yz + y + z4 + z3 + z2 + z + 1
		//            0    1    2    3   4    5     6   7   8
		//gusMat[16] yz2 + yz + y + z5 + z4 + z3 + z2 + z + 1
		T * p1 = gusMat[15].coffs;
		T * p2 = gusMat[16].coffs;
		memset(p, 0, sizeof(T)*9);
		int i;
		for( i = 8 ; i > 2; i-- ) p[8-i+3]=p2[i];
		for( i = 8 ; i > 2; i-- ) p[8-i+2] += p1[1] * p2[i];
		for( i = 8 ; i > 2; i-- ) p[8-i+1] += p1[2] * p2[i];
		for( i = 8 ; i > 2; i-- ) p[8-i] += p1[3] * p2[i];
		for( i = 8 ; i > 3; i-- ) p[8-i+2] -= p1[i];
		for( i = 8 ; i > 3; i-- ) p[8-i+1] -= p2[1]*p1[i];
		for( i = 8 ; i > 3; i-- ) p[8-i] -= p2[2]*p1[i];
		*deg_p = 8;
		T inv_p = T::inv( p[8]);
		p[8] = T::one;
		for( i = 0 ; i < 8 ; i ++ ) p[i] *= inv_p;
		
		memcpy( py , p1 , sizeof(T)*9 );
		//for( i = 0 ; i < gusMat[15].terms ; i++ ) py[i] = p1[i];
		return;
	}
	
	static void solve(T *sol, T *fi , T* py, T & z)
	{
		sol[2] = z; T & x = sol[0]; T & y = sol[1];
		//          0     1    2    3   4    5     6   7   8 
		//   py =  yz3 + yz2 + yz + y + z4 + z3 + z2 + z + 1
		T z2 = z*z;
		T z3 = z2*z;
		T tmp = ( py[3] + py[2]*z + py[1]*z2 + py[0]*z3 );
		T tmp2 = ((-py[8])-(py[7]*z)-(py[6]*z2)-(py[5]*z3)-(py[4]*z2*z2));
		y = tmp2 * T::inv( tmp );
		//T y = tmp2/tmp;
		//           0   1   2    3    4    5   6    7   8   9
		//  fi+20 =  0 + 0 + xz + x + yy + yz + y + zz + z + 1
		fi += 20;
		tmp = ( fi[3] + fi[2]*z );
		tmp2 = ( -fi[9]-(fi[8]*z)-(fi[7]*z2)-(fi[6]*y)-(fi[5]*y*z)-(fi[4]*y*y));
		x = tmp2 * T::inv( tmp );
		//T x = tmp2/tmp;
		return;
	}


};



template <class T>
class groebner < T,4 >
{
public:
	static void genEquas(T *fo);
	static void eval(T *c, const T *fi, T *v);
	
	static bool solve( T* sol , T* fi , T* py , T & z );
	
	static const int t_s1 = 64;   // max terms of polynomial
	static bool univarPoly3(T *pz, T*py , int * degP , T *fi );

};


template <class T>
void groebner< T,4 >::genEquas(T *fo)
{
	// ( 4*3/2 + 4 ) + C(4,1) + 1 = 15
	for( int i = 1 ; i < 60 ; i++ ) fo[i] = T::rand();
	fo[0] = T::one;
	fo += 15;
	fo[0] -= fo[0];
	fo[1] = T::one;
	fo += 15;
	fo[0] -= fo[0];
	fo[1] -= fo[1];
	fo[2] = T::one;
	fo += 15;
	fo[0] -= fo[0];
	fo[1] -= fo[1];
	fo[2] -= fo[2];
	fo[3] = T::one;
	
}

template <class T>
void groebner< T,4 >::eval(T *c, const T *fi, T *v)
{
	static polynomial<T,4,15> poly;
	for( int i = 0 ; i < 4 ; i++ )
	{
		poly.set_quad_poly( fi );
		c[i] = poly.eval( v );
		fi += 15;
	}
}



template <class T>
bool groebner<T,4>::solve( T* sol , T* fi , T* py , T & z )
{
	sol[3] = z;
	T & y = sol[2]; T & x = sol[1]; T & w = sol[0];
	//      0    1  2      6  7  8  9   15 16
	// py: yz7,yz6,yz5,....yz,y,z8,z7,...z,1
	T z_pow[9];
	z_pow[1] = z;
	for( int i = 2 ; i < 9 ; i++ ) z_pow[i] = z*z_pow[i-1];
	w = py[7] + z_pow[7];
	for( int i = 1 ; i < 7 ; i++ ) w += z_pow[7-i]*py[i];
	x = py[16];
	for( int i = 1 ; i < 9 ; i++ ) x += z_pow[i]*py[16-i];
	y = (-x) * T::inv( w );
	//y = - (x / w );

	T inter[14];
	inter[9] = y*y;
	inter[10] = y*z;
	inter[11] = y;
	inter[12] = z*z;
	inter[13] = z;
	// w + xx + x + 1
	T poly[3][4];
	for( int j = 0 ; j < 3 ; j++ )
	{
		T * f = fi + 15*(j+1);
		poly[j][0] = (f[2]*y) + (f[3]*z) + f[4];
		poly[j][1] = f[5];
		poly[j][2] = (f[6]*y)+(f[7]*z)+f[8];
		poly[j][3] = f[14]; for(int i=9; i<14;i++) poly[j][3] += inter[i]*f[i];
	}
	//  0   1    2   3
	//  w + xx + x + 1
	T a = T::inv( poly[1][0] );
	poly[1][0] = T::one;
	for( int i = 1 ; i < 4 ; i++ ) poly[1][i] *= a;    // p[1] = 1*w + xx + x + 1
	
	for( int i = 1 ; i < 4 ; i++ ) poly[2][i] -= poly[2][0]*poly[1][i]; // elim x // p[2] = p[2] - w_2 * p[1]
	poly[2][0] -= poly[2][0];
	//poly[2][0] = T(0); // w  // p[2] = ?xx + x+ 1
	a = T::inv( poly[2][1]);
	poly[2][1] = T::one; 
	for( int i = 2 ; i < 4 ; i++ ) poly[2][i] *= a; // p[2] = xx + x + 1
	for( int i = 2 ; i < 4 ; i++ ) poly[1][i] -= poly[1][1]*poly[2][i]; // elim xx  // p[1] = w + x + 1

	// reduce p[0] by p[1] and p[2]
	// p[0] - x*p[1]
	poly[0][1] -= poly[1][2]; poly[0][2] -= poly[1][3]; // p[0] = ?w+xx+x+1
	// p[0] - p[1]
	poly[0][2] -= poly[0][0]*poly[1][2]; poly[0][3] -= poly[0][0]*poly[1][3]; // p[0] = ? xx + x + 1 
	// p[0] - p[2]
	poly[0][2] -= poly[0][1]*poly[2][2]; poly[0][3] -= poly[0][1]*poly[2][3]; // p[0] = ? x + 1
	x = ( - poly[0][3] ) * T::inv( poly[0][2] );
	w = ( - poly[1][2] * x ) - poly[1][3];
	//x = - (poly[0][3] / poly[0][2]);
	//w = - poly[1][2]*x - poly[1][3];
	return true;
	// check
	inter[0] = w*w;
	inter[1] = w*x;
	inter[2] = w*y;
	inter[3] = w*z;
	inter[4] = w;
	inter[5] = x*x;
	inter[6] = x*y;
	inter[7] = x*z;
	inter[8] = x;
	a = fi[14];
	for( int i = 0; i < 14 ; i++ ) a += fi[i]*inter[i];
	return a;
}



//benchmark bench_gus1;
//benchmark bench_gus2;
//benchmark bench_gus3;
//benchmark bench_gus4;

template <class T>
bool groebner<T,4>::univarPoly3( T*pz , T*py , int * degP , T * fi  )
{
	static polynomial<T,4,t_s1> gusMat_[56];
	polynomial<T,4,t_s1> * gusMat[56];
	for( int i = 0 ; i < 56 ; i++ ) gusMat[i] = & gusMat_[i];
	
	monomial<4> w = monomial<4>(1);
	monomial<4> x = monomial<4>(4);
	monomial<4> x2 = monomial<4>(8);
	monomial<4> xy = monomial<4>(20);
	monomial<4> xz = monomial<4>(68);
	monomial<4> y = monomial<4>(16);
	monomial<4> y2 = monomial<4>(32);
	monomial<4> y3 = monomial<4>(48);
	monomial<4> yz = monomial<4>(80);
	monomial<4> z = monomial<4>(64);
	monomial<4> z2 = monomial<4>(128);
	monomial<4> z3 = monomial<4>(192);
	monomial<4> z4 = z2 + z2;
	
	gusMat[3]->set_quad_poly( fi );		// 2000
	gusMat[7]->set_quad_poly( fi+15 );   // 1100
	gusMat[10]->set_quad_poly( fi+30 );  // 1010
	gusMat[12]->set_quad_poly( fi+45 );  // 1001

	*gusMat[2] = *gusMat[1] = *gusMat[0] = *gusMat[3]; // 0200
	*gusMat[13] = *gusMat[6] = *gusMat[5] = *gusMat[4] = *gusMat[7]; //  1100
	*gusMat[15] = *gusMat[14] = *gusMat[9] = *gusMat[8] = *gusMat[10]; // 1010
	*gusMat[18] = *gusMat[17] = *gusMat[16] = *gusMat[11] = *gusMat[12]; // 1001
	gusMat[0]->extend( x ); // 2100
	gusMat[1]->extend( y ); // 2010	
	gusMat[2]->extend( z ); // 2001
	//gusMat[3]; // 2000
	gusMat[4]->extend( x ); // 1200
	gusMat[5]->extend( y ); // 1110
	gusMat[6]->extend( z ); // 1101
	//gusMat[7]; // 1100
	gusMat[8]->extend( y );	// 1020
	gusMat[9]->extend( z ); // 1011
	//gusMat[10]; // 1010
	gusMat[11]->extend( z ); // 1002
	//gusMat[12]; // 1001
	gusMat[13]->extend( w ); // 2100 XX 1000
	gusMat[14]->extend( w ); // 2010 XX 0300
	gusMat[15]->extend( x ); // 1110 XX 0210
	gusMat[16]->extend( w ); // 2001 XX 0201
	gusMat[17]->extend( x ); // 1101 XX 0200
	gusMat[18]->extend( y );	// 1011 XX 0120
	
	gusElim_sp2<T,4,t_s1,19>( gusMat );
	//printMat<T,4,t_s1,19>( gusMat );
//BENCHMARK(bench_gus1, (gusElim_sp2<T,4,t_s1,19>( gusMat ) ) );
	
	*gusMat[36] = *gusMat[35] = *gusMat[34] = *gusMat[18]; // 0120
	*gusMat[33] = *gusMat[17]; // 0200
	*gusMat[32] = *gusMat[31] = *gusMat[16]; // 0201
	*gusMat[30] = *gusMat[29] = *gusMat[28] = *gusMat[15]; // 0210
	*gusMat[27] = *gusMat[26] = *gusMat[25] = *gusMat[24] = *gusMat[14]; // 0300
	*gusMat[40] = *gusMat[39] = *gusMat[38] = *gusMat[37] = *gusMat[23] = *gusMat[13]; // 1000
	*gusMat[22] = *gusMat[12]; // 1001
	*gusMat[21] = *gusMat[20] = *gusMat[11]; // 1002
	*gusMat[19] = *gusMat[10]; // 1010
	*gusMat[18] = *gusMat[17] = *gusMat[9]; // 1011
	*gusMat[16] = *gusMat[15] = *gusMat[14] = *gusMat[8]; // 1020
	*gusMat[13] = *gusMat[7]; // 1100
   *gusMat[12] = *gusMat[11] = *gusMat[6]; // 1101
	*gusMat[10] = *gusMat[9] = *gusMat[8] = *gusMat[5]; // 1110
	*gusMat[7] = *gusMat[6] = *gusMat[5] = *gusMat[4]; // 1200
	//gusMat[3]; // 2000
	gusMat[4]->extend(x); // 1300
	gusMat[5]->extend(y); // 1210
	gusMat[6]->extend(z); // 1201
	//gusMat[7]; // 1200
	gusMat[8]->extend(y); // 1120
	gusMat[9]->extend(z); // 1111
	//gusMat[10]; // 1110
	gusMat[11]->extend(z); // 1102
	//gusMat[12]; // 1101
	//gusMat[13]; // 1100
	gusMat[14]->extend(y); // 1030
	gusMat[15]->extend(z); // 1021
	//gusMat[16]; // 1020
	gusMat[17]->extend(z); // 1012
	//gusMat[18]; // 1011
	//gusMat[19]; // 1010
	gusMat[20]->extend(z); // 1003
	//gusMat[21]; // 1002
	//gusMat[22]; // 1001
	//gusMat[23]; // 1000
	gusMat[24]->extend(x); // 0400
	gusMat[25]->extend(y); // 0310
	gusMat[26]->extend(z); // 0301
	//gusMat[27]; // 0300
	gusMat[28]->extend(y); // 0220
	gusMat[29]->extend(z); // 0211
	//gusMat[30]; // 0210
	gusMat[31]->extend(z); // 0202
	//gusMat[32]; // 0201
	//gusMat[33]; // 0200
	gusMat[34]->extend(y); // 0130
	gusMat[35]->extend(z); // 0121
	//gusMat[36]; //0120
	gusMat[37]->extend(w); // 2000 XX 0112
	gusMat[38]->extend(x); // 1100 XX 0111
	gusMat[39]->extend(y); // 1010 XX 0110
	gusMat[40]->extend(z); // 1001 XX 0103
	*gusMat[41] = *gusMat[32]; gusMat[41]->extend(w); // 1201 XX 0102
	*gusMat[42] = *gusMat[32]; gusMat[42]->extend(x); // 0301 XX 0101
	
	gusElim_sp2<T,4,t_s1,40>( gusMat + 3 );
	//printMat<T,4,t_s1,40>( gusMat + 3 );
//BENCHMARK(bench_gus2, (gusElim_sp2<T,4,t_s1,40>( gusMat + 3 ) ) );
	
	*gusMat[0] = *gusMat[1] = *gusMat[2] = *gusMat[3] = *gusMat[25]; // 0310
	*gusMat[4] = *gusMat[5] = *gusMat[6] = *gusMat[26];
	*gusMat[7] = *gusMat[27];
	*gusMat[8] = *gusMat[9] = *gusMat[10] = *gusMat[11] = *gusMat[12] = *gusMat[13] = *gusMat[28];
	*gusMat[14] = *gusMat[15] = *gusMat[16] = *gusMat[29];
	*gusMat[17] = *gusMat[30];
	*gusMat[18] = *gusMat[19] = *gusMat[20] = *gusMat[31];
	*gusMat[21] = *gusMat[32];
	*gusMat[22] = *gusMat[33];
	*gusMat[23] = *gusMat[24] = *gusMat[25] = *gusMat[26] = *gusMat[27] = *gusMat[28] = *gusMat[34];
	*gusMat[29] = *gusMat[30] = *gusMat[31] = *gusMat[35];
	*gusMat[32] = *gusMat[36];
	*gusMat[33] = *gusMat[34] = *gusMat[35] = *gusMat[37];
	*gusMat[36] = *gusMat[38];
	*gusMat[37] = *gusMat[39];
	*gusMat[38] = *gusMat[39] = *gusMat[40];
	gusMat[0]->extend(y); // 0320
	gusMat[1]->extend(z2); // 0312
	gusMat[2]->extend(z); // 0311
	//gusMat[3]; // 0310
	gusMat[4]->extend(z2); // 0303
	gusMat[5]->extend(z); // 0302
	//gusMat[6]; // 0301
	//gusMat[7]; // 0300
	gusMat[8]->extend(y2); // 0240
	gusMat[9]->extend(yz); // 0231
	gusMat[10]->extend(y); // 0230
	gusMat[11]->extend(z2); // 0222
	gusMat[12]->extend(z); // 0221
	//gusMat[13]; // 0220
	gusMat[14]->extend(z2); // 0213
	gusMat[15]->extend(z); // 0212
	//gusMat[16]; // 0211
	//gusMat[17]; // 0210
	gusMat[18]->extend(z2); // 0204
	gusMat[19]->extend(z); // 0203
	//gusMat[20]; // 0202
	//gusMat[21]; // 0201
	//gusMat[22]; // 0200
	gusMat[23]->extend(y2); // 0150
	gusMat[24]->extend(yz); // 0141
	gusMat[25]->extend(y); // 0140
	gusMat[26]->extend(z2); // 0132
	gusMat[27]->extend(z); // 0131
	//gusMat[28]; // 0130
	gusMat[29]->extend(z2); //0123
	gusMat[30]->extend(z); //0122
	//gusMat[31]; //0121
	//gusMat[32]; //0120
	gusMat[33]->extend(z2); // 0114
	gusMat[34]->extend(z); // 0113
	//gusMat[35]; // 0112 <---
	//gusMat[36]; // 0111
	//gusMat[37]; // 0110
	gusMat[38]->extend(z2); // 0105
	gusMat[39]->extend(z); // 0104
	//gusMat[40]; // 0103
	//gusMat[41]; // 0102
	//gusMat[42]; // 0101
	*gusMat[43] = *gusMat[32]; gusMat[43]->extend(x2); // 0320 XX 0100
	*gusMat[44] = *gusMat[40]; gusMat[44]->extend(yz); // 0114 XX 0051 ////
	*gusMat[45] = *gusMat[32]; gusMat[45]->extend(xy); // 0230 XX 0050
	*gusMat[46] = *gusMat[40]; gusMat[46]->extend(xz); // 0204 XX 0042 ////
	*gusMat[47] = *gusMat[35]; gusMat[47]->extend(y); // 0122 XX 0041
	*gusMat[48] = *gusMat[35]; gusMat[48]->extend(x); // 0212 XX 0040
	*gusMat[49] = *gusMat[41]; gusMat[49]->extend(z2); // 0104 XX 0033 ////
	*gusMat[50] = *gusMat[36]; gusMat[50]->extend(z); // 0112 XX 0032
	*gusMat[51] = *gusMat[36]; gusMat[51]->extend(y); // 0121 XX 0031
	*gusMat[52] = *gusMat[41]; gusMat[52]->extend(yz); // 0113 XX 0030
	*gusMat[53] = *gusMat[41]; gusMat[53]->extend(xz); // 0203 XX 0024
	*gusMat[54] = *gusMat[42]; gusMat[54]->extend(z2); // 0103 XX 0023

	gusElim_sp2<T,4,t_s1,55>( gusMat );
	//printMat<T,4,t_s1,55>( gusMat );
//BENCHMARK(bench_gus3, (gusElim_sp2<T,4,t_s1,55>( gusMat ) ) );
	
	*gusMat[0] = *gusMat[1] = *gusMat[2] = *gusMat[3] = *gusMat[4] = *gusMat[45]; // 0050
	*gusMat[5] = *gusMat[6] = *gusMat[7] = *gusMat[8] = *gusMat[9] = *gusMat[47]; // 0041
	*gusMat[10] = *gusMat[48]; // 0040
	*gusMat[11] = *gusMat[12] = *gusMat[13] = *gusMat[14] = *gusMat[15] = *gusMat[50]; // 0032
	*gusMat[16] = *gusMat[51]; // 0031
	*gusMat[17] = *gusMat[52]; // 0030
	*gusMat[18] = *gusMat[19] = *gusMat[20] = *gusMat[21] = *gusMat[22] = *gusMat[53]; // 0024
	*gusMat[23] = *gusMat[54]; // 0023
	
	gusMat[0]->extend(z4); // 0054
	gusMat[1]->extend(z3);  // 0053
	gusMat[2]->extend(z2);  // 0052
	gusMat[3]->extend(z);   // 0051
	//gusMat[4]; // 0050
	gusMat[5]->extend(z4); // 0045
	gusMat[6]->extend(z3); // 0044
	gusMat[7]->extend(z2); // 0043
	gusMat[8]->extend(z); // 0042
	//gusMat[9]; // 0041
	//gusMat[10];  // 0040
	gusMat[11]->extend(z4); // 0036
	gusMat[12]->extend(z3); // 0035
	gusMat[13]->extend(z2); // 0034
	gusMat[14]->extend(z); // 0033
	//gusMat[15];  // 0032
	//gusMat[16];  // 0031
	//gusMat[17]; // 0030
	gusMat[18]->extend(z4); // 0028 
	gusMat[19]->extend(z3); // 0027
	gusMat[20]->extend(z2); // 0026
	gusMat[21]->extend(z); // 0025
	//gusMat[22]; // 0024
	//gusMat[23]; // 0023
	
	*gusMat[24] = *gusMat[10]; gusMat[24]->extend(z2); // 0042 XX 0022
	*gusMat[25] = *gusMat[15]; gusMat[25]->extend(y2); // 0052 XX 0021
	*gusMat[26] = *gusMat[17]; gusMat[26]->extend(y2); // 0050 XX 0020
	*gusMat[27] = *gusMat[23]; gusMat[27]->extend(z3); // 0026 XX 0018
	*gusMat[28] = *gusMat[17]; gusMat[28]->extend(yz); // 0041 XX 0017
	
	gusElim_sp2<T,4,t_s1,29>( gusMat );
//BENCHMARK(bench_gus4, (gusElim_sp2<T,4,t_s1,29>( gusMat ) ) );
	//printMat<T,4,t_s1,29>( gusMat );
	//              0   1   2      7  8 9  10   17 18
	// gusMat[27]: yz8,yz7,yz6,....yz,y,z9,z8,...z,1
	//              0    1  2      6  7  8  9   15 16
	// gusMat[28]: yz7,yz6,yz5,....yz,y,z8,z7,...z,1
	memset( pz , 0 , sizeof(T)*17);
	T* p27 = gusMat[27]->coffs;
	T* p28 = gusMat[28]->coffs;
	for( int i=18 ; i > 8 ; i-- ) pz[18-i+7] = p27[i];
	for( int j = 1; j < 8 ; j++ )
		for( int i=18; i > 8 ; i-- ) pz[18-i+7-j] += p28[j]*p27[i];
	for( int i=16 ; i > 7 ; i-- ) pz[16-i+8] -= p28[i];
	for( int j = 1; j < 9 ; j++ )
		for( int i=16; i > 7 ; i-- ) pz[16-i+8-j] -= p27[j]*p28[i];
	T invPz = T::inv(pz[16]);
	pz[16] = T::one;
	for( int i = 0 ; i < 16 ; i++ ) pz[i] *= invPz;
	* degP = 16;
	
	memcpy( py , p28 , sizeof(T)*17);
	
	return true;
}


/*
template <class T>
bool groebner<T,4>::univarPoly3( T*pz , T*py , int * degP , T * fi  )
{
	static polynomial<T,4,t_s1> gusMat[56];
	
	monomial<4> w = monomial<4>(1);
	monomial<4> x = monomial<4>(4);
	monomial<4> x2 = monomial<4>(8);
	monomial<4> xy = monomial<4>(20);
	monomial<4> xz = monomial<4>(68);
	monomial<4> y = monomial<4>(16);
	monomial<4> y2 = monomial<4>(32);
	monomial<4> y3 = monomial<4>(48);
	monomial<4> yz = monomial<4>(80);
	monomial<4> z = monomial<4>(64);
	monomial<4> z2 = monomial<4>(128);
	monomial<4> z3 = monomial<4>(192);
	monomial<4> z4 = z2 + z2;
	
	gusMat[3].set_quad_poly( fi );		// 2000
	gusMat[7].set_quad_poly( fi+15 );   // 1100
	gusMat[10].set_quad_poly( fi+30 );  // 1010
	gusMat[12].set_quad_poly( fi+45 );  // 1001

	gusMat[2] = gusMat[1] = gusMat[0] = gusMat[3]; // 0200
	gusMat[13] = gusMat[6] = gusMat[5] = gusMat[4] = gusMat[7]; //  1100
	gusMat[15] = gusMat[14] = gusMat[9] = gusMat[8] = gusMat[10]; // 1010
	gusMat[18] = gusMat[17] = gusMat[16] = gusMat[11] = gusMat[12]; // 1001
	gusMat[0].extend( x ); // 2100
	gusMat[1].extend( y ); // 2010	
	gusMat[2].extend( z ); // 2001
	//gusMat[3]; // 2000
	gusMat[4].extend( x ); // 1200
	gusMat[5].extend( y ); // 1110
	gusMat[6].extend( z ); // 1101
	//gusMat[7]; // 1100
	gusMat[8].extend( y );	// 1020
	gusMat[9].extend( z ); // 1011
	//gusMat[10]; // 1010
	gusMat[11].extend( z ); // 1002
	//gusMat[12]; // 1001
	gusMat[13].extend( w ); // 2100 XX 1000
	gusMat[14].extend( w ); // 2010 XX 0300
	gusMat[15].extend( x ); // 1110 XX 0210
	gusMat[16].extend( w ); // 2001 XX 0201
	gusMat[17].extend( x ); // 1101 XX 0200
	gusMat[18].extend( y );	// 1011 XX 0120
	
	gusElim_sp<T,4,t_s1,19>( gusMat );
	//printMat<T,4,t_s1,19>( gusMat );
	
	gusMat[36] = gusMat[35] = gusMat[34] = gusMat[18]; // 0120
	gusMat[33] = gusMat[17]; // 0200
	gusMat[32] = gusMat[31] = gusMat[16]; // 0201
	gusMat[30] = gusMat[29] = gusMat[28] = gusMat[15]; // 0210
	gusMat[27] = gusMat[26] = gusMat[25] = gusMat[24] = gusMat[14]; // 0300
	gusMat[40] = gusMat[39] = gusMat[38] = gusMat[37] = gusMat[23] = gusMat[13]; // 1000
	gusMat[22] = gusMat[12]; // 1001
	gusMat[21] = gusMat[20] = gusMat[11]; // 1002
	gusMat[19] = gusMat[10]; // 1010
	gusMat[18] = gusMat[17] = gusMat[9]; // 1011
	gusMat[16] = gusMat[15] = gusMat[14] = gusMat[8]; // 1020
	gusMat[13] = gusMat[7]; // 1100
   gusMat[12] = gusMat[11] = gusMat[6]; // 1101
	gusMat[10] = gusMat[9] = gusMat[8] = gusMat[5]; // 1110
	gusMat[7] = gusMat[6] = gusMat[5] = gusMat[4]; // 1200
	//gusMat[3]; // 2000
	gusMat[4].extend(x); // 1300
	gusMat[5].extend(y); // 1210
	gusMat[6].extend(z); // 1201
	//gusMat[7]; // 1200
	gusMat[8].extend(y); // 1120
	gusMat[9].extend(z); // 1111
	//gusMat[10]; // 1110
	gusMat[11].extend(z); // 1102
	//gusMat[12]; // 1101
	//gusMat[13]; // 1100
	gusMat[14].extend(y); // 1030
	gusMat[15].extend(z); // 1021
	//gusMat[16]; // 1020
	gusMat[17].extend(z); // 1012
	//gusMat[18]; // 1011
	//gusMat[19]; // 1010
	gusMat[20].extend(z); // 1003
	//gusMat[21]; // 1002
	//gusMat[22]; // 1001
	//gusMat[23]; // 1000
	gusMat[24].extend(x); // 0400
	gusMat[25].extend(y); // 0310
	gusMat[26].extend(z); // 0301
	//gusMat[27]; // 0300
	gusMat[28].extend(y); // 0220
	gusMat[29].extend(z); // 0211
	//gusMat[30]; // 0210
	gusMat[31].extend(z); // 0202
	//gusMat[32]; // 0201
	//gusMat[33]; // 0200
	gusMat[34].extend(y); // 0130
	gusMat[35].extend(z); // 0121
	//gusMat[36]; //0120
	gusMat[37].extend(w); // 2000 XX 0112
	gusMat[38].extend(x); // 1100 XX 0111
	gusMat[39].extend(y); // 1010 XX 0110
	gusMat[40].extend(z); // 1001 XX 0103
	gusMat[41] = gusMat[32]; gusMat[41].extend(w); // 1201 XX 0102
	gusMat[42] = gusMat[32]; gusMat[42].extend(x); // 0301 XX 0101
	
	gusElim_sp<T,4,t_s1,40>( gusMat + 3 );
	//printMat<T,4,t_s1,40>( gusMat + 3 );
	
	gusMat[0] = gusMat[1] = gusMat[2] = gusMat[3] = gusMat[25]; // 0310
	gusMat[4] = gusMat[5] = gusMat[6] = gusMat[26];
	gusMat[7] = gusMat[27];
	gusMat[8] = gusMat[9] = gusMat[10] = gusMat[11] = gusMat[12] = gusMat[13] = gusMat[28];
	gusMat[14] = gusMat[15] = gusMat[16] = gusMat[29];
	gusMat[17] = gusMat[30];
	gusMat[18] = gusMat[19] = gusMat[20] = gusMat[31];
	gusMat[21] = gusMat[32];
	gusMat[22] = gusMat[33];
	gusMat[23] = gusMat[24] = gusMat[25] = gusMat[26] = gusMat[27] = gusMat[28] = gusMat[34];
	gusMat[29] = gusMat[30] = gusMat[31] = gusMat[35];
	gusMat[32] = gusMat[36];
	gusMat[33] = gusMat[34] = gusMat[35] = gusMat[37];
	gusMat[36] = gusMat[38];
	gusMat[37] = gusMat[39];
	gusMat[38] = gusMat[39] = gusMat[40];
	gusMat[0].extend(y); // 0320
	gusMat[1].extend(z2); // 0312
	gusMat[2].extend(z); // 0311
	//gusMat[3]; // 0310
	gusMat[4].extend(z2); // 0303
	gusMat[5].extend(z); // 0302
	//gusMat[6]; // 0301
	//gusMat[7]; // 0300
	gusMat[8].extend(y2); // 0240
	gusMat[9].extend(yz); // 0231
	gusMat[10].extend(y); // 0230
	gusMat[11].extend(z2); // 0222
	gusMat[12].extend(z); // 0221
	//gusMat[13]; // 0220
	gusMat[14].extend(z2); // 0213
	gusMat[15].extend(z); // 0212
	//gusMat[16]; // 0211
	//gusMat[17]; // 0210
	gusMat[18].extend(z2); // 0204
	gusMat[19].extend(z); // 0203
	//gusMat[20]; // 0202
	//gusMat[21]; // 0201
	//gusMat[22]; // 0200
	gusMat[23].extend(y2); // 0150
	gusMat[24].extend(yz); // 0141
	gusMat[25].extend(y); // 0140
	gusMat[26].extend(z2); // 0132
	gusMat[27].extend(z); // 0131
	//gusMat[28]; // 0130
	gusMat[29].extend(z2); //0123
	gusMat[30].extend(z); //0122
	//gusMat[31]; //0121
	//gusMat[32]; //0120
	gusMat[33].extend(z2); // 0114
	gusMat[34].extend(z); // 0113
	//gusMat[35]; // 0112 <---
	//gusMat[36]; // 0111
	//gusMat[37]; // 0110
	gusMat[38].extend(z2); // 0105
	gusMat[39].extend(z); // 0104
	//gusMat[40]; // 0103
	//gusMat[41]; // 0102
	//gusMat[42]; // 0101
	gusMat[43] = gusMat[32]; gusMat[43].extend(x2); // 0320 XX 0100
	gusMat[44] = gusMat[40]; gusMat[44].extend(yz); // 0114 XX 0051 ////
	gusMat[45] = gusMat[32]; gusMat[45].extend(xy); // 0230 XX 0050
	gusMat[46] = gusMat[40]; gusMat[46].extend(xz); // 0204 XX 0042 ////
	gusMat[47] = gusMat[35]; gusMat[47].extend(y); // 0122 XX 0041
	gusMat[48] = gusMat[35]; gusMat[48].extend(x); // 0212 XX 0040
	gusMat[49] = gusMat[41]; gusMat[49].extend(z2); // 0104 XX 0033 ////
	gusMat[50] = gusMat[36]; gusMat[50].extend(z); // 0112 XX 0032
	gusMat[51] = gusMat[36]; gusMat[51].extend(y); // 0121 XX 0031
	gusMat[52] = gusMat[41]; gusMat[52].extend(yz); // 0113 XX 0030
	gusMat[53] = gusMat[41]; gusMat[53].extend(xz); // 0203 XX 0024
	gusMat[54] = gusMat[42]; gusMat[54].extend(z2); // 0103 XX 0023

	gusElim_sp<T,4,t_s1,55>( gusMat );
	//printMat<T,4,t_s1,55>( gusMat );
	
	gusMat[0] = gusMat[1] = gusMat[2] = gusMat[3] = gusMat[4] = gusMat[45]; // 0050
	gusMat[5] = gusMat[6] = gusMat[7] = gusMat[8] = gusMat[9] = gusMat[47]; // 0041
	gusMat[10] = gusMat[48]; // 0040
	gusMat[11] = gusMat[12] = gusMat[13] = gusMat[14] = gusMat[15] = gusMat[50]; // 0032
	gusMat[16] = gusMat[51]; // 0031
	gusMat[17] = gusMat[52]; // 0030
	gusMat[18] = gusMat[19] = gusMat[20] = gusMat[21] = gusMat[22] = gusMat[53]; // 0024
	gusMat[23] = gusMat[54]; // 0023
	
	gusMat[0].extend(z4); // 0054
	gusMat[1].extend(z3);  // 0053
	gusMat[2].extend(z2);  // 0052
	gusMat[3].extend(z);   // 0051
	//gusMat[4]; // 0050
	gusMat[5].extend(z4); // 0045
	gusMat[6].extend(z3); // 0044
	gusMat[7].extend(z2); // 0043
	gusMat[8].extend(z); // 0042
	//gusMat[9]; // 0041
	//gusMat[10];  // 0040
	gusMat[11].extend(z4); // 0036
	gusMat[12].extend(z3); // 0035
	gusMat[13].extend(z2); // 0034
	gusMat[14].extend(z); // 0033
	//gusMat[15];  // 0032
	//gusMat[16];  // 0031
	//gusMat[17]; // 0030
	gusMat[18].extend(z4); // 0028 
	gusMat[19].extend(z3); // 0027
	gusMat[20].extend(z2); // 0026
	gusMat[21].extend(z); // 0025
	//gusMat[22]; // 0024
	//gusMat[23]; // 0023
	
	gusMat[24] = gusMat[10]; gusMat[24].extend(z2); // 0042 XX 0022
	gusMat[25] = gusMat[15]; gusMat[25].extend(y2); // 0052 XX 0021
	gusMat[26] = gusMat[17]; gusMat[26].extend(y2); // 0050 XX 0020
	gusMat[27] = gusMat[23]; gusMat[27].extend(z3); // 0026 XX 0018
	gusMat[28] = gusMat[17]; gusMat[28].extend(yz); // 0041 XX 0017
	
	gusElim_sp<T,4,t_s1,29>( gusMat );
	//printMat<T,4,t_s1,29>( gusMat );
	//              0   1   2      7  8 9  10   17 18
	// gusMat[27]: yz8,yz7,yz6,....yz,y,z9,z8,...z,1
	//              0    1  2      6  7  8  9   15 16
	// gusMat[28]: yz7,yz6,yz5,....yz,y,z8,z7,...z,1
	memset( pz , 0 , sizeof(T)*17);
	T* p27 = gusMat[27].coffs;
	T* p28 = gusMat[28].coffs;
	for( int i=18 ; i > 8 ; i-- ) pz[18-i+7] = p27[i];
	for( int j = 1; j < 8 ; j++ )
		for( int i=18; i > 8 ; i-- ) pz[18-i+7-j] += p28[j]*p27[i];
	for( int i=16 ; i > 7 ; i-- ) pz[16-i+8] -= p28[i];
	for( int j = 1; j < 9 ; j++ )
		for( int i=16; i > 7 ; i-- ) pz[16-i+8-j] -= p27[j]*p28[i];
	T invPz = T::inv(pz[16]);
	pz[16] = T::one;
	for( int i = 0 ; i < 16 ; i++ ) pz[i] *= invPz;
	* degP = 16;
	
	memcpy( py , p28 , sizeof(T)*17);
	
	return true;
}
*/






template <class T>
class groebner <T,2>
{
public:
	static void genEquas(T *fo)
	{
	//H(n_var+1,2) = C(n_var+2,2) = (n_var+2)*(n_var+1)/2
		int i;
		for(i = 0; i < 12; i++)
		{
			fo[i] = T::rand();
		}
		return;
	}
	static void eval(T *c, T *fi, T *v)
	{
		T inter[5];
		T *f1, *f2;
	
		T &v1 = v[0];
		T &v2 = v[1];
	
		f1 = fi;
		f2 = fi + 6;

		inter[0] = (v1 * v1);
		inter[1] = (v1 * v2);
		inter[2] = v1;
		inter[3] = (v2 * v2);
		inter[4] = v2;

		c[0] = (f1[0]* inter[0]) + (f1[1]* inter[1]) + (f1[2]* inter[2]) + (f1[3]* inter[3])
			+ (f1[4]* inter[4]) + f1[5];
	
		c[1] = (f2[0]* inter[0]) + (f2[1]* inter[1]) + (f2[2]* inter[2]) + (f2[3]* inter[3])
			+ (f2[4]* inter[4]) + f2[5];
	
		return;
	}
	
	// structure of array  { x^2 , xy^2 , xy , x , y^4 , y^3 , Y^2 , y , 1 }
	//                        0     1     2    3    4     5     6    7   8 
	static void univarPoly2(T *p, int *deg_p, T *fi)
	{
		T R[5][9];
		for( int i = 0 ; i < 5 ; i++ ) memset( R[i] , 0 , sizeof(T)*9 );
		for( int i = 0 ; i < 2 ; i++ )
		{
			R[i][0] = fi[i*6+0]; // x^2
			R[i][2] = fi[i*6+1]; // xy
			R[i][3] = fi[i*6+2]; // x
			R[i][6] = fi[i*6+3]; // y^2
			R[i][7] = fi[i*6+4]; // y
			R[i][8] = fi[i*6+5]; // 1	
		}
		// T[2] = (LD(T[1]))T[0] - (LD(T[0]))T[1] =   xy + x + y^2 + y + 1
		for( int i = 2 ; i < 9 ; i++ ) R[2][i] = ( R[1][0] * R[0][i] ) - ( R[0][0] * R[1][i] );
		// T[3] = _ x T[2] - _ y T[0] = x^2 + xy^2 + xy + x + y^3 + y^2 + y 
		R[3][0] = R[0][0] * R[2][3];   // x^2
		R[3][1] = R[0][0] * R[2][6] - R[2][2] * R[0][2];  // xy^2
		R[3][2] = R[0][0] * R[2][7] - R[2][2] * R[0][3];   // xy
		R[3][3] = R[0][0] * R[2][8];   // x
		R[3][5] = -R[2][2] * R[0][6];   // y^3
		R[3][6] = -R[2][2] * R[0][7];   // y^2
		R[3][7] = -R[2][2] * R[0][8];   // y
		// T[4] = T[3] - T[0] = xy^2 + xy + x + y^3 + y^2 + y + 1
		R[4][1] = R[0][0] * R[3][1];  // xy^2
		R[4][2] = R[0][0] * R[3][2] - R[3][0] * R[0][2];  // xy
		R[4][3] = R[0][0] * R[3][3] - R[3][0] * R[0][3];  // x
		R[4][5] = R[0][0] * R[3][5];   // y^3
		R[4][6] = R[0][0] * R[3][6] - R[3][0] * R[0][6];  // y^2
		R[4][7] = R[0][0] * R[3][7] - R[3][0] * R[0][7];  // y
		R[4][8] = - R[3][0] * R[0][8];   // 1

		// output = ((xy + x)/x)_2  T[4] - ((xy^2 + xy + x)/x)_4 T[2] = y^4 + y^3 + y^2 + y + 1
		*deg_p = 4;
		memset( p , 0  , sizeof(T)*5 );
		p[4] = R[2][2] * R[4][5] - R[4][1] * R[2][6];  // y^4
		p[3] = R[2][2] * R[4][6] + R[2][3] * R[4][5] - R[4][1] * R[2][7] - R[4][2] * R[2][6]; // y^3
		p[2] = R[2][2] * R[4][7] + R[2][3] * R[4][6] - R[4][1] * R[2][8] - R[4][2] * R[2][7] - R[4][3] * R[2][6]; // y^2
		p[1] = R[2][2] * R[4][8] + R[2][3] * R[4][7] - R[4][2] * R[2][8] - R[4][3] * R[2][7] ; // y
		p[0] = R[2][3] * R[4][8] - R[4][3] * R[2][8]; // 1
	

		T tmpinv = T::inv( p[4] );
		p[4] = T::one;
		for( int i = 0 ; i < 4 ; i++ ) p[i] *= tmpinv;
	
		return;
	}
	
	static void solve(T *sol, T *fi , T & y)
	{
		sol[1] = y; T & x = sol[0];
		//          0     1    2    3   4   5
		//   fi =  xx +  xy +  x + yy + y + 1
		T yy = y*y;
		//        -1      0     1
		//  f1 =  xx   +  x   + 1
		T f1[2];
		T f2[2];
		f1[0] = y* fi[1] + fi[2];
		f1[1] = yy * fi[3] + y*fi[4] + fi[5];
		f2[0] = y* fi[7] + fi[8];
		f2[1] = yy * fi[9] + y*fi[10] + fi[11];
		
		T mul = fi[6] * T::inv( fi[0] );
		f1[0] *= mul;
		f1[1] *= mul;
		x = (f1[1] - f2[1] )* T::inv( f2[0] - f1[0] );
		return;
	}

};





#endif /* _ H */

/*
 * groebner.h
 */
