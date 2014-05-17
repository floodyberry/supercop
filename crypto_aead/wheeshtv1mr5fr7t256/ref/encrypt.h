#ifndef __WHEESHT_V1
#define __WHEESHT_V1

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <time.h>
#include <limits.h>
#include <assert.h>

//#define DEBUG 0

#define ROTL64(a,b) (((a)<<(b))|((a)>>(64-b)))

// Meh
#define BLOCKSIZE_BYTES					32

// Rotation constants
#define ROT_I	9
#define ROT_II	29
#define ROT_III	33
#define ROT_IV	41


// Crypt mode_bits
#define CRYPT_CIPHERTEXTBLOCK			0x01
#define CRYPT_ADBLOCK					0x02
#define CRYPT_AUTHFINAL					0x04
#define CRYPT_HASNSEC					0x08
#define CRYPT_HASNPUB					0x10
#define CRYPT_LASTBLOCK					0x20


// "Gloomy Winter's noo awa'; saft the westlin' breezes blaw. 1808\n"
//aead_bytestream_to_u64block: 47 6c 6f 6f 6d 79 20 57  69 6e 74 65 72 27 73 20  6e 6f 6f 20 61 77 61 27  3b 20 73 61 66 74 20 74 
//aead_bytestream_to_u64block: 5720796d6f6f6c47; 2073277265746e69; 27617761206f6f6e; 742074666173203b;
//aead_bytestream_to_u64block: 68 65 20 77 65 73 74 6c  69 6e 27 20 62 72 65 65  7a 65 73 20 62 6c 61 77  2e 20 31 38 30 38 0a 00 
//aead_bytestream_to_u64block: 6c74736577206568; 6565726220276e69; 77616c622073657a; 000a38303831202e;

// Constants
#define C0 0x5720796d6f6f6c47LLU
#define C1 0x2073277265746e69LLU
#define C2 0x27617761206f6f6eLLU
#define C3 0x742074666173203bLLU
#define C4 0x6c74736577206568LLU
#define C5 0x6565726220276e69LLU
#define C6 0x77616c622073657aLLU
#define C7 0x000a38303831202eLLU


#define ENCCORE( m_a, m_b, m_c, rot ) \
	m_a += m_b; \
	m_b = ROTL64( m_b, rot ); \
	m_b ^= m_a; \
	m_c += m_b;

#define MIX( m0, m1, m2, m3, m4, m5, m6, m7, param_0, param_1, param_2, param_3 ) \
	m1 ^= param_0; \
	m3 ^= param_1; \
	m5 ^= param_2; \
	m7 ^= param_3;

	
#define PARTROUND(m0, m1, m2, m3 ) \
	ENCCORE( m0, m1, m3, ROT_I ); \
	ENCCORE( m2, m3, m1, ROT_II ); \
	ENCCORE( m0, m1, m3, ROT_III ); \
	ENCCORE( m2, m3, m1, ROT_IV );


#define PARTROUND5( m0, m1, m2, m3 ) \
	PARTROUND( m0, m1, m2, m3 ); \
	PARTROUND( m0, m1, m2, m3 ); \
	PARTROUND( m0, m1, m2, m3 ); \
	PARTROUND( m0, m1, m2, m3 ); \
	PARTROUND( m0, m1, m2, m3 );
	
#define PARTROUND7( m0, m1, m2, m3 ) \
	PARTROUND( m0, m1, m2, m3 ); \
	PARTROUND( m0, m1, m2, m3 ); \
	PARTROUND( m0, m1, m2, m3 ); \
	PARTROUND( m0, m1, m2, m3 ); \
	PARTROUND( m0, m1, m2, m3 ); \
	PARTROUND( m0, m1, m2, m3 ); \
	PARTROUND( m0, m1, m2, m3 );	
	
#ifdef DEBUG
#define PRINTSTATE( message ) printf( "\n%s\n", message ); \
		printf( "m0:  %016llx; m1:  %016llx; m2:  %016llx; m3:  %016llx\n", m0, m1, m2, m3 ); \
		printf( "m4:  %016llx; m5:  %016llx; m6:  %016llx; m7:  %016llx\n", m4, m5, m6, m7 );
#else
#define PRINTSTATE( message ) ;
#endif

#ifdef DEBUG
#define PRINTHALFSTATE( message ) printf( "\n%s\n", message ); \
		printf( "m0:  %016llx; m1:  %016llx; m2:  %016llx; m3:  %016llx\n", m0, m1, m2, m3 );
#else
#define PRINTHALFSTATE( message ) ;
#endif


typedef struct aead_params aead_params_t;
struct aead_params {
  	uint64_t k0;
	uint64_t k1;
	uint64_t k2;
	uint64_t k3;
	uint64_t p0;
	uint64_t p1;	
	uint64_t s0;
	uint64_t s1;	
	uint64_t block0;
	uint64_t block1;
	uint64_t mode_bits;
	uint64_t len;
};


typedef struct aead_state aead_state_t;
struct aead_state {
	uint64_t r0;
	uint64_t r1;
	uint64_t r2;
	uint64_t r3;
	uint64_t r4;
	uint64_t r5;
	uint64_t r6;
	uint64_t r7;
};

typedef struct aead_block aead_block_t;
struct aead_block {
	uint64_t r0;
	uint64_t r1;
	uint64_t r2;
	uint64_t r3;
};

// Flags for computation optimisation (this was more substantial in earlier versions)
#define FLG_PRE_CALC			0x01


#endif // __WHEESHT_V1
