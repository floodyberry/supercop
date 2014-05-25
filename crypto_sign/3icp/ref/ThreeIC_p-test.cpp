/*
Usage:	g++ -O3 -msse2 -o ThreeIC_p-test ThreeIC_p-test.cpp
*/



#include <cstdio>
#include <cstdlib>
#include <ctime>
#include <iostream>

#ifdef _USE_SHA1_
#include <openssl/sha.h>
#endif

#include "ThreeIC_p.h"
#include "conversion.h"
//#include "benchmark.h"

#define TEST_ROUND 500

#define SCHEME IC3_31_p
#define POW	18
#define P 31
#define L_MSG	 36
#define L_SEC	 53




/* ========= sizes.h ================ */

#define SECRETKEY_BYTES 12768
#define PUBLICKEY_BYTES 35712

#define SIGNATURE_BYTES 36
#define SHORTHASH_BYTES 20


/* ========= sizes.h ================ */


int keypair( unsigned char sk[SECRETKEY_BYTES] , unsigned long long * sklen , unsigned char pk[PUBLICKEY_BYTES] , unsigned long long * pklen )
{
	typedef SCHEME<POW> pkc;
	pkc::gen_key( pk , sk );
	* sklen = SECRETKEY_BYTES;
	* pklen = PUBLICKEY_BYTES;
	return 0;
}


int signatureofshorthash(
  unsigned char sm[SIGNATURE_BYTES],unsigned long long *smlen,
  const unsigned char m[SHORTHASH_BYTES],const unsigned long long mlen,
  const unsigned char sk[SECRETKEY_BYTES],const unsigned long long sklen )
{
	if( sklen != SECRETKEY_BYTES ) return -1;
	if (mlen > SHORTHASH_BYTES) return -1;

	unsigned char h[20];
	for(int i=0;i<20;i++) h[i]=m[i];
#ifdef _USE_SHA1_
	SHA1(m,mlen,h);
#endif

	* smlen = SIGNATURE_BYTES;

	VEC<P,L_MSG> dig; dig[33] = gf<P>::rand(); dig[34] = gf<P>::rand(); dig[35] = gf<P>::rand();
	VEC<P,L_SEC> sig;

	uint8 b13[13],b7[7];
	convert_to_31<13>( b13 , *(uint64 *)(&h[0]) ); for(int i=0;i<13;i++) dig[i].v = b13[i];
	convert_to_31<13>( b13 , *(uint64 *)(&h[8]) ); for(int i=0;i<13;i++) dig[13+i].v = b13[i];
	uint64 qq = (*(uint32 *)(&h[16]));
	convert_to_31<7>( b7 , qq ); for(int i=0;i<7;i++) dig[26+i].v = b7[i];

	typedef SCHEME<POW> pkc;
	pkc::pri_map( &sig , sk , &dig );

	for(int i=0;i<53;i++) sig[i].v += ((sig[i].v<0)? 31:0);
	
	uint8 b54[54] = {0};
	for( int i = 0 ; i < 53 ; i++ ) b54[i] = sig[i].v;

	convert_from_31<12>( *(uint64 *)(&sm[0]) , b54 );
	convert_from_31<12>( *(uint64 *)(&sm[8]) , &b54[12] );
	convert_from_31<12>( *(uint64 *)(&sm[16]) , &b54[24] );
	convert_from_31<12>( *(uint64 *)(&sm[24]) , &b54[36] );
	convert_from_31<6>( qq , &b54[48] ); *(uint32 *)(&sm[32]) = (uint32)qq;
	return 0;
}

int verification(
    const unsigned char m[SHORTHASH_BYTES],const unsigned long long mlen,
    const unsigned char sm[SIGNATURE_BYTES],const unsigned long long smlen,
    const unsigned char pk[PUBLICKEY_BYTES],const unsigned long long pklen )
{
	if (smlen != SIGNATURE_BYTES) return -100;
	if (mlen != SHORTHASH_BYTES) return -100;
	if( pklen != PUBLICKEY_BYTES ) return -1;

	unsigned char h[20];
	for(int i=0;i<20;i++) h[i]=m[i];
#ifdef _USE_SHA1_
	SHA1(m,mlen,h);
#endif

	VEC<P,L_MSG> dig;
	VEC<P,L_SEC> sig;

	uint8 b12[12],b6[6];
	convert_to_31<12>( b12 , *(uint64 *)(&sm[0]) ); for(int i=0;i<12;i++) sig[i].v = b12[i];
	convert_to_31<12>( b12 , *(uint64 *)(&sm[8]) ); for(int i=0;i<12;i++) sig[12+i].v = b12[i];
	convert_to_31<12>( b12 , *(uint64 *)(&sm[16]) ); for(int i=0;i<12;i++) sig[24+i].v = b12[i];
	convert_to_31<12>( b12 , *(uint64 *)(&sm[24]) ); for(int i=0;i<12;i++) sig[36+i].v = b12[i];
	uint64 qq = *(uint32 *)(&sm[32]);
	convert_to_31<6>( b6 , qq ); for(int i=0;i<5;i++) sig[48+i].v = b6[i];

	typedef SCHEME<POW> pkc;
	pkc::pub_map( &dig , pk , &sig );

	for(int i=0;i<36;i++) dig[i].v += ((dig[i].v < 0)? 31: 0);
	uint8 b36[36];
	for( int i = 0 ; i < 36 ; i++ ) b36[i] = dig[i].v;

	uint8 check[24];
	convert_from_31<13>( *(uint64 *)(&check[0]) , b36 );
	convert_from_31<13>( *(uint64 *)(&check[8]) , &b36[13] );
	convert_from_31<7>( *(uint64 *)(&check[16]) , &b36[26] );

	for(int i=0;i<20;i++) if(h[i] != check[i]) return -100;

//	for(int i=0;i<20;i++) printf("%x ",check[i]); printf("\n");
	return 0;

}



#if 0



int main()
{
	srand(time(0));

	uint8 c[SIGNATURE_BYTES];
	uint8 m[SHORTHASH_BYTES];
	uint8 pk[PUBLICKEY_BYTES];
	uint8 sk[SECRETKEY_BYTES];

	uint64 lc,lm = SHORTHASH_BYTES,lpk,lsk;

	keypair( sk , &lsk , pk , &lpk );

	for( int i=0;i<SHORTHASH_BYTES;i++) m[i] = rand() % 256;

	for( int i=0;i<SHORTHASH_BYTES;i++) printf("%x " , (unsigned) m[i]); printf("\n");

	signatureofshorthash( c , &lc , m , lm , sk , lsk );
	for( int i=0;i<SIGNATURE_BYTES;i++) printf("%x " , (unsigned) c[i]); printf("\n");

	int i = verification( m , lm , c , lc , pk , lpk );
	printf("verify: %d\n" , i );

}

#endif




#if 0
int main(){
	srand(time(0));

	benchmark b_gen;
	benchmark b_pub;
	benchmark b_pri;
	bm_init(&b_gen);
	bm_init(&b_pub);
	bm_init(&b_pri);

	typedef SCHEME<POW> pkc;

	std::cout << "pub_key:" << pkc::sizeof_pub_key() << "\n" << "pri_key:" << pkc::sizeof_pri_key() << "\n";
	uint8 * pub_key; pub_key = new uint8 [pkc::sizeof_pub_key()];
	uint8 * pri_key; pri_key = new uint8 [pkc::sizeof_pri_key()];

	pkc::gen_key( pub_key , pri_key );

	VEC<P, L_MSG> vec0, vec2;//, vec4;
	VEC<P, L_SEC> vec1;//, vec3;//, vec5;

	rand_vec( &vec0 );
	vec0.dump( stdout );

	pkc::pri_map( & vec1 , pri_key , & vec0 );
	vec1.dump( stdout );
	
	pkc::pub_map( & vec2 , pub_key , & vec1 );
	//zero_vec( & vec2 );
	vec2.dump( stdout );


	for( int i = 0 ; i < TEST_ROUND ; i++ ) {
		BENCHMARK(b_gen, pkc::gen_key( pub_key , pri_key ) );
		BENCHMARK(b_pri, pkc::pri_map( & vec1 , pri_key , & vec0 ) );
		BENCHMARK(b_pub, pkc::pub_map( & vec2 , pub_key , & vec1 ) );
	}

	char buf[256];
	bm_dump(buf, sizeof(buf), &b_gen); printf ("gen key   : %s\n", buf);
	bm_dump(buf, sizeof(buf), &b_pub); printf ("pub map   : %s\n", buf);
	bm_dump(buf, sizeof(buf), &b_pri); printf ("pri map   : %s\n", buf);

	delete [] pub_key;
	delete [] pri_key;

	return 0;
}

#endif


