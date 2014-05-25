#include "gf.h"
#include "blas.h"
#include "rainbow.h"

/////////// sizes.h //////////////
#define SECRETKEY_BYTES 23408
#define PUBLICKEY_BYTES 30240
#define SIGNATURE_BYTES 42
#define SHORTHASH_BYTES 24
/////////// sizes.h ////////////////


#define TEST_ROUND 1000
#define GEN_KEY_ROUND 50

#define GF 256
#define N 42
#define M 24
#define P 0
#define SCHEME_NAME "rainbow 18 12 12"

typedef rainbow<GF,18,12,12> PKC;



int keypair( unsigned char sk[SECRETKEY_BYTES] , unsigned long long * 
sklen , unsigned char pk[PUBLICKEY_BYTES] , unsigned long long * pklen )
{
	PKC & pkc = * PKC::get_instance();
	pkc.gen_key( pk , sk );
	* sklen = SECRETKEY_BYTES;
	* pklen = PUBLICKEY_BYTES;
	return 0;
}


int signatureofshorthash(
  unsigned char sm[SIGNATURE_BYTES],unsigned long long *smlen,
  const unsigned char m[SHORTHASH_BYTES],const unsigned long long mlen,
  const unsigned char sk[SECRETKEY_BYTES],const unsigned long long sklen 
)
{
	if( sklen != SECRETKEY_BYTES ) return -1;
	if (mlen > SHORTHASH_BYTES) return -1;

	unsigned char h[M];
	for(int i=0;i<M;i++) h[i]=m[i];
#ifdef _USE_SHA1_
	SHA1(m,mlen,h);
#endif

	* smlen = SIGNATURE_BYTES;

	gfv<GF,N> x;
	gfv<GF,M> y;
	memcpy( &y , h ,M );
	PKC & pkc = * PKC::get_instance();
//	if( 0 != pkc.private_map( x , sk , y )) return -1;
	pkc.private_map( x , sk , y );
	memcpy( sm , &x , N );

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

	unsigned char h[M];
	for(int i=0;i<M;i++) h[i]=m[i];
#ifdef _USE_SHA1_
	SHA1(m,mlen,h);
#endif
	gfv<GF,N> x;
	gfv<GF,M> y;
	memcpy( &x , sm ,N );
	PKC & pkc = * PKC::get_instance();
	pkc.public_map( y , pk , x );

	unsigned char check[M];
	memcpy( check , &y , M );
	for(int i=0;i<M;i++) if(h[i] != check[i]) return -100;

	return 0;

}









#if 0
int main()
{
//	char buf[100];
//	struct benchmark pub_map;
//	struct benchmark sec_map;
//	struct benchmark gen;
//	bm_init(&pub_map);
//	bm_init(&sec_map);
//	bm_init(&gen);
	
//	srand(time(NULL));
	
	PKC & pkc = * PKC::get_instance();

	unsigned size_pub = pkc.sizeof_public_key();
	unsigned size_pri = pkc.sizeof_private_key();
	printf("%s : %d --> %d  , whith P=%d\n" , SCHEME_NAME , N , M , P );
	printf("pub: %d , pri: %d \n" , size_pub , size_pri );

	byte * pub = new byte [size_pub];
	byte * pri = new byte [size_pri];
	pkc.gen_key( pub , pri );

	gfv<GF,N-P> x = gfv<GF,N-P>::rand();
	gfv<GF,M> y;

	printf("inv q/q map:\n");
	y = gfv<GF,M>::rand();
	y.dump( stdout );
	pkc.private_map( x , pri , y );
	x.dump( stdout );
	pkc.public_map( y , pub , x );
	y.dump( stdout );

	gfv<GF,N-P> x1;
	gfv<GF,M> y1;

	unsigned sign_err = 0;
	unsigned enc_err = 0;

	for( int i = 0 ; i < TEST_ROUND ; i++ )
	{
//		if( i<GEN_KEY_ROUND) BENCHMARK(gen,(pkc.gen_key(pub,pri)) );

//		x = gfv<GF,N-P>::rand();
//		BENCHMARK(pub_map,( pkc.public_map(y,pub,x) ));
//		BENCHMARK(sec_map,( pkc.private_map(x1,pri,y) ));
//		for( unsigned j = N-P ; j-- ;  ) if(x[j]!=x1[j]) { enc_err++; break; }
//		if( enc_err > 0 && enc_err < 4 ) { puts("enc/dec error."); x.dump( stdout ); y.dump( stdout ); x1.dump( stdout ); }

//		y = gfv<GF,M>::rand();
//		BENCHMARK(sec_map,( pkc.private_map(x,pri,y) ));
//		BENCHMARK(pub_map,( pkc.public_map(y1,pub,x) ));
//		for( unsigned j = M ; j-- ;  ) if(y[j]!=y1[j]) { sign_err++; break; }
//		if( sign_err > 0 && sign_err < 4 ) { puts("sign/veri error."); y.dump( stdout ); x.dump( stdout ); y1.dump( stdout ); }

	}
//	printf("\nenc/dec error:%d/%d\nsign/veri error:%d/%d\n",enc_err,TEST_ROUND,sign_err,TEST_ROUND);
//	bm_dump(buf, sizeof(buf), &gen);
//	printf("gen key\n%s\n", buf);
//	bm_dump(buf, sizeof(buf), &pub_map);
//	printf("pub map\n%s\n", buf);
//	bm_dump(buf, sizeof(buf), &sec_map);
//	printf("pri map\n%s\n", buf);
	

	delete [] pub;
	delete [] pri;
	return 0;	
}
#endif
