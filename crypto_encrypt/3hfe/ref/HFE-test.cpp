/*
Usage:	g++ -O3 -msse2 -o HFE-test HFE-test.cpp
*/

/* ============= size.h ================== */
/// 3 HFE
#define SHORTPLAINTEXT_BYTES 64
#define ENCRYPTION_BYTES 67
#define SECRETKEY_BYTES 5184
#define PUBLICKEY_BYTES 7616
/* ============= size.h ================== */


#include <cstdio>
#include <cstdlib>
#include <ctime>
#include <iostream>
#include "HFE.h"
#include "conversion.h"
//#include "benchmark.h"

#define TEST_ROUND 500

#define SCHEME	HFE_3_31_9
#define P	31
#define L_MSG	 27
#define L_SEC	 27




/* =============  */
//extern "C"
int keypair(
  unsigned char sk[SECRETKEY_BYTES],unsigned long long *sklen,
  unsigned char pk[PUBLICKEY_BYTES],unsigned long long *pklen
)
{
	*sklen = SECRETKEY_BYTES;
	*pklen = PUBLICKEY_BYTES;
	typedef SCHEME<P> pkc;
	pkc::gen_key( pk , sk );
	return 0;
}

//extern "C"
int shortplaintext(
  unsigned char m[SHORTPLAINTEXT_BYTES],unsigned long long *mlen,
  const unsigned char c[ENCRYPTION_BYTES],const unsigned long long clen,
  const unsigned char sk[SECRETKEY_BYTES],const unsigned long long sklen
)
{
	if( ENCRYPTION_BYTES != clen ||  SECRETKEY_BYTES != sklen ) return -1;
	*mlen = c[ENCRYPTION_BYTES-1];
	for(int i=16;i<64;i++) m[i]=c[2+i];
	union {
	uint64 qq;
	uint8 bb[8];
	};
	qq = 0; bb[0]=c[16]; bb[1]=c[17];

	uint8 b27[27];
	VEC<P,L_MSG> gf_m;
	VEC<P,L_SEC> gf_c;
	convert_to_31<12>( b27 , *((uint64*)(&c[0])) );
	convert_to_31<12>( &b27[12] , *((uint64*)(&c[8])) );
	convert_to_31<3>( &b27[24] , qq );
	for(int i=0;i<L_SEC;i++) gf_c[i]=b27[i];

	typedef SCHEME<P> pkc;
	if( 0 != pkc::pri_map( & gf_m , sk , & gf_c )) return -1;

//	gf_m.principle();
	for( int i=0 ; i<L_MSG ; i++ ) { gf_m[i].v += ((gf_m[i].v<0)?31:0); }

	for( int i=0 ; i<L_MSG ; i++ ) { b27[i] = gf_m[i].v; }

	convert_from_31<13>( *((uint64*)(&m[0])) , b27 );
	convert_from_31<13>( *((uint64*)(&m[8])) , &b27[13] );

	return 0;
}



//extern "C"
int shortciphertext(
  unsigned char c[ENCRYPTION_BYTES],unsigned long long *clen,
  const unsigned char m[SHORTPLAINTEXT_BYTES],const unsigned long long mlen,
  const unsigned char pk[PUBLICKEY_BYTES],const unsigned long long pklen
)
{
	if( PUBLICKEY_BYTES != pklen || SHORTPLAINTEXT_BYTES < mlen ) return -1;
	c[ENCRYPTION_BYTES-1] = (uint8) mlen;
	*clen = ENCRYPTION_BYTES;
	for(int i=16;i<64;i++) c[i+2] = m[i];

	uint8 b27[27];

	VEC<P,L_MSG> gf_m;
	VEC<P,L_SEC> gf_c;

	convert_to_31<13>( b27 ,  *((uint64 *)(&m[0])) ); 
	convert_to_31<13>( &b27[13] ,  *((uint64 *)(&m[8])) ); 
	b27[26] = 0;
	for(unsigned i = 0 ; i < L_MSG; i++ ) gf_m[i] = b27[i];

	typedef SCHEME<P> pkc;
	pkc::pub_map( & gf_c , pk , & gf_m );
//	gf_c.principle();
	for( int i=0 ; i<L_SEC ; i++ ) { gf_c[i].v += ((gf_c[i].v<0)?31:0); }

	for(int i=0;i<L_SEC;i++) b27[i] = gf_c[i].v;

	convert_from_31<12>( *((uint64*)(&c[0])) , b27 );
	convert_from_31<12>( *((uint64*)(&c[8])) , &b27[12] );
	union {
	uint64 qq;
	uint8 bb[8];
	};
	convert_from_31<3>( qq , &b27[24] );
	c[16] = bb[0];
	c[17] = bb[1];

	return 0;
}

/* ================ */





#if 0

int main()
{
	srand(time(0));

	uint8 c[ENCRYPTION_BYTES];
	uint8 m[SHORTPLAINTEXT_BYTES] = {0};
	uint8 cm[SHORTPLAINTEXT_BYTES];
	uint64 lcm;
	uint8 pk[PUBLICKEY_BYTES];
	uint8 sk[SECRETKEY_BYTES];

	uint64 lc,lm = SHORTPLAINTEXT_BYTES,lpk,lsk;

	keypair( sk , &lsk , pk , &lpk );

	shortciphertext( c , & lc , m ,  0 , pk , lpk );
	for( int i=0;i<ENCRYPTION_BYTES;i++) printf("%x " , (unsigned) c[i]); printf("\n");
	int q = shortplaintext( cm , & lcm , c , lc , sk , lsk );
	for( int i=0;i<SHORTPLAINTEXT_BYTES;i++) 
		printf("%x " , (unsigned) cm[i]); printf(" : %d\n" , q);
	if( 0 != q ) printf("fail!\n");

	for( int i=0;i<SHORTPLAINTEXT_BYTES;i++) m[i] = rand() % 256;
	for( int i=0;i<SHORTPLAINTEXT_BYTES;i++) printf("%x " , (unsigned) m[i]); printf("\n");
	shortciphertext( c , & lc , m ,  lm , pk , lpk );
	for( int i=0;i<ENCRYPTION_BYTES;i++) printf("%x " , (unsigned) c[i]); printf("\n");
	q = shortplaintext( cm , & lcm , c , lc , sk , lsk );
	for( int i=0;i<SHORTPLAINTEXT_BYTES;i++) 
		printf("%x " , (unsigned) cm[i]); printf(": %d\n", q );

	int err = 0;
	int _check_err = 0;
	for( int j = 0 ; j < TEST_ROUND ; j++ ) {
		for( int i=0;i<SHORTPLAINTEXT_BYTES;i++) m[i] = rand() % 256;
		shortciphertext( c , & lc , m ,  lm , pk , lpk );
		int q = shortplaintext( cm , & lcm , c , lc , sk , lsk );
		if( 0 != q ) err ++;
		uint8 _check_sum = 0;
		for( uint64 k=0;k<lm;k++) _check_sum |= m[k] ^ cm[k];
		if( _check_sum ) _check_err ++;
	}

	printf("err: %d : %d / %d\n" , err , _check_err , TEST_ROUND );

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

	typedef SCHEME<P> pkc;

	std::cout << "pub_key:" << pkc::sizeof_pub_key() << "\n" << "pri_key:" << pkc::sizeof_pri_key() << "\n";
	uint8 * pub_key; pub_key = new uint8 [pkc::sizeof_pub_key()];
	uint8 * pri_key; pri_key = new uint8 [pkc::sizeof_pri_key()];

	pkc::gen_key( pub_key , pri_key );

	VEC<P, L_MSG> vec0, vec2;//, vec4;
	VEC<P, L_SEC> vec1;//, vec3;//, vec5;

	uint8 bb1[L_MSG];
	uint8 bb2[L_MSG];
	for(unsigned i=0;i<L_MSG;i++) { bb1[i]=rand()%P; vec0[i].v=0; }
	vec0[26] = gf<P>(0);
//	vec0[39] = gf<P>(0);
	//zero_vec( &vec0 );
	vec0.dump( stdout );

	pkc::pub_map( & vec1 , pub_key , & vec0 );
	vec1.dump( stdout );
	
	int q = pkc::pri_map( & vec2 , pri_key , & vec1 );
	//zero_vec( & vec2 );
	for(unsigned i=0;i<L_MSG;i++) {
		vec2[i].v += (vec2[i].v<0)?31:0;
		bb2[i]=vec2[i].v;
	}
	vec2.dump( stdout );
	printf("return :%d\n" , q );

	for( int i = 0 ; i < TEST_ROUND ; i++ ) {
//		BENCHMARK(b_gen, pkc::gen_key( pub_key , pri_key ) );
//		BENCHMARK(b_pub, pkc::pub_map( & vec1 , pub_key , & vec0 ) );
//		BENCHMARK(b_pri, pkc::pri_map( & vec2 , pri_key , & vec1 ) );
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


