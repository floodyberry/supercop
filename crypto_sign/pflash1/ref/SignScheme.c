/*
 * $Id: SignScheme.c 3272 2009-06-15 00:18:41Z daven $
 */
 
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "SignScheme.h"



static byte _MS[L_AFFMAT];
static byte _MT[L_AFFMAT];
int SignScheme_genKey( byte * pub , byte * pri )
{
	byte * Ms = _MS;
	byte * Ms_1 = pri;
	byte * Ms_c = pri+L_AFFMAT;
   
	byte * Mt = _MT;
	byte * Mt_1 = pri + L_AFFINE;
	byte * Mt_c = pri + L_AFFINE + L_AFFMAT;
   
	BLAS_genVec( L_SIGN , Ms_c );          // gen Ms_c
	BLAS_genMatGF16( 2 * L_SIGN, Mt , Mt_1 );  //  gen Mt  Mt_1
	// Mt_c = Mt * Q( Ms_c )
	memset( Ms , 0 , sizeof(byte)*L_AFFMAT );
	SignScheme_QMap( Ms , Ms_c );
	BLAS_affineGF16( L_SIGN*2 , Mt_c , Mt ,  Ms , Ms+L_SIGN );  // gen Mt_c
	BLAS_genMatGF16( 2 * L_SIGN, Ms, Ms_1);         // gen Ms  Ms_1
	
	SignScheme_genPubKey( Ms , Ms_c , Mt , Mt_c , pub );
	return 0;
}

static byte _PK3[L_SIGN];
static byte _PK[L_SIGN];
static byte _BI[L_SIGN];
int SignScheme_genPubKey( byte * Ms , byte * Ms_c , byte * Mt , byte * Mt_c , byte * pub )
{
	byte * P = pub;
	byte * Q = P + L_pSIGN*L_MSG;
	byte * R = Q + L_pSIGN*L_MSG;
	const int nMsg2 = L_MSG*2;
	//const int nSign2 = L_SIGN*2;
	int i,j,k; 
	// Q_ik =  ( p_k(3 b_i) - 3 p_k(b_i) )/(3( 3-1))
	for( i = 0 ; i < L_pSIGN ; i++ )
	{
		byte denominator = GF_256_mul( 3 , 3 ^ 1 );
		memset( _BI , 0 , sizeof(byte) * L_SIGN );
		GF_16_setEle( i , 3 , _BI );         // a b_i
		SignScheme_PMap( Ms , Ms_c , Mt , Mt_c , _PK3 , _BI );     // _PK3 = p_k( a b_i )

		memset( _BI , 0 , sizeof(byte) * L_SIGN );
		GF_16_setEle( i , 1 , _BI );        // b_i
		SignScheme_PMap( Ms , Ms_c , Mt , Mt_c , _PK , _BI );    // _PK = p_k( b_i )
		for( k = 0 ; k < nMsg2 ; k++ )
		{
			byte pkbi = GF_16_getEle( k, _PK );       // pkbi = p_k( b_i )
			int idx = IDX2(i,k,nMsg2);
			GF_16_setEle( idx , GF_256_div( GF_16_getEle(k,_PK3) 
				^ GF_256_mul( 3 , pkbi ) , denominator ) , Q );
			// P_ik = p_k( b_i ) - Q_ik
			GF_16_setEle( idx , pkbi ^ GF_16_getEle( idx , Q ) , P );  // P_ik = p_k( b_i ) - Q_ik
		}
	}
	// R_ijk = p_k( b_i + b_j ) - Q_ik - Q_jk - P_ik - P_jk
	for( j = 0 ; j < L_pSIGN ; j++ )
		for( i = j+1 ; i < L_pSIGN ; i++ )
		{
			memset( _BI , 0 , sizeof(byte)*L_SIGN );
			GF_16_setEle( i , 1 , _BI );
			GF_16_setEle( j , 1 , _BI );
			SignScheme_PMap( Ms , Ms_c , Mt , Mt_c , _PK , _BI );
			for( k = 0 ; k < nMsg2 ; k++ )
			{
				int idx = (IDXUUTRI(j,i,L_pSIGN))*nMsg2+k;
				GF_16_setEle( idx , GF_16_getEle( k , _PK ) ^ GF_16_getEle( IDX2(i,k,nMsg2) , Q )
						^ GF_16_getEle( IDX2(j,k,nMsg2) , Q ) ^ GF_16_getEle( IDX2(i,k,nMsg2) , P )
						^ GF_16_getEle( IDX2(j,k,nMsg2) , P ) , R );
			}
		}
	// change to log form
	for( i = 0 ; i < L_PUB ; i++ )
		pub[i] = logtab[pub[i]];
	return 0;
}



static byte _YHASH[L_MSG];
static byte _YR[L_SIGN];
static byte _YY[L_SIGN*2];
int SignScheme_sign( byte * pri , byte * Y , int Ylen , byte * outX )
{
	byte * Ms_1 = pri;
	byte * Ms_c = pri + L_AFFMAT;
	byte * Mt_1 = pri + L_AFFINE;
	byte * Mt_c = pri + L_AFFINE + L_AFFMAT;
	int i, is_continue;
	
	for( i=0;i<L_MSG;i++) _YHASH[i] = Y[i];
//	SignScheme_hash( _YHASH , Y , Ylen );

	//int t_start;
	is_continue = 1;
	while(is_continue)
	{
		memcpy( _YR , _YHASH , sizeof(byte)*L_MSG );
		BLAS_genVec( L_DELTA , _YR+L_MSG );

		// t^-1
		//t_start = clock();
		BLAS_ivsAffineGF16( L_SIGN*2 , outX , Mt_1 , _YR , Mt_c );
		//t_affineMap += clock()-t_start;
		// Computing A=F^-1(B)
		//t_start = clock();
		SignScheme_ivsQMap( _YR , outX );
		//t_QMap += clock()-t_start;
		// s^-1
		//t_start = clock();
	
		for(i = 0; i < L_SIGN; i++)
		{
			byte tmp = _YR[i] ^ Ms_c[i];
			_YY[2*i] = logtab[tmp&0x0f];
			_YY[2*i+1] = logtab[tmp>>4];
		}
		is_continue = BLAS_pLinearGF16( L_SIGN*2 , outX , Ms_1 , _YY , L_pSIZE ); 
		if(!is_continue)
		{
			BLAS_rLinearGF16( L_SIGN*2 , outX , Ms_1 , _YY , L_pSIZE );
		}
		//t_affineMap += clock()-t_start;
	}
	return 0;
}



static byte __W[L_SIGN];
int SignScheme_PMap( byte * Ms , byte * Ms_c , byte * Mt , byte * Mt_c , byte * outZ , byte * W )
{
	BLAS_affineGF16( L_SIGN*2 , outZ , Ms , W , Ms_c );
	SignScheme_QMap( __W , outZ );
	BLAS_affineGF16( L_SIGN*2 , outZ , Mt , __W , Mt_c );
	return 0;	
}


int SignScheme_GMap( byte * pub , byte * X , byte * outY )
{
	byte * P = pub;
	byte * Q = P + L_pSIGN*L_MSG;
	byte * R = Q + L_pSIGN*L_MSG;
	int i, j, k;
	memset( outY , 0 , sizeof(byte) * L_MSG );
	for( i = 0 ; i < L_pSIGN ; i++ )
	{
		int logWi = logtab[GF_16_getEle(i,X)];       if( 0 == logWi ) continue;
		for( k = 0 ; k < L_MSG ; k++ )
		{
			int idx = i*L_MSG+k;//IDX2(i,k*2,52)/2;
			int logPi = P[idx];
			int logQi = Q[idx];
			outY[k] ^= ((0==logPi)?0: alogtab[ (logPi+logWi) ])
					^((0==logQi)? 0 : alogtab[ (logQi+logWi+logWi)]);         
		}
		for( j = i+1 ;j < L_pSIGN ; j++ )
		{
			int idx = IDXUUTRI(i,j,L_pSIGN)*L_MSG;
			int logWj = logtab[GF_16_getEle(j,X)];     if( 0 == logWj ) continue;
			for( k = 0 ; k < L_MSG ; k++ )
			{
				int logR = R[idx+k];
				if( 0 != logR ) outY[k] ^= alogtab[(logR+logWi+logWj)];
			}
		}
	}
	return 0;
}


/* For eBATS benchmarking use */

#include "sizes.h"

int keypair( unsigned char sk[SECRETKEY_BYTES] , unsigned
long long * sklen , unsigned char pk[PUBLICKEY_BYTES] ,
unsigned long long * pklen )
{
	*sklen = (unsigned long long)L_PRI;
	*pklen = (unsigned long long)L_PUB;
	return SignScheme_genKey(pk, sk);
}

int signatureofshorthash (
  unsigned char sm[SIGNATURE_BYTES],unsigned long long *smlen,
  const unsigned char m[SHORTHASH_BYTES],const unsigned long long mlen,
  const unsigned char sk[SECRETKEY_BYTES],const unsigned long long sklen )
{
	if( sklen != SECRETKEY_BYTES ) return -1;
	if (mlen > SHORTHASH_BYTES) return -1;

	unsigned char h[26];
	int i;
	for(i=0;i<26;i++) h[i]=m[i];

	* smlen = SIGNATURE_BYTES;
	SignScheme_sign( sk , h , mlen , sm );
	return 0;
	
}

int verification (
    const unsigned char m[SHORTHASH_BYTES],const unsigned long long mlen,
    const unsigned char sm[SIGNATURE_BYTES],const unsigned long long smlen,
    const unsigned char pk[PUBLICKEY_BYTES],const unsigned long long pklen )
{
	if (smlen != SIGNATURE_BYTES) return -100;
	if (mlen != SHORTHASH_BYTES) return -100;
	if( pklen != PUBLICKEY_BYTES ) return -1;

	unsigned char h[26];

	SignScheme_GMap( pk , sm , h );
	int i;
	for(i=0;i<26;i++) if(h[i] != m[i]) return -100;

//	for(int i=0;i<24;i++) printf("%x ",check[i]); printf("\n");
	return 0;
}



/*
 * SignScheme.c
 */
