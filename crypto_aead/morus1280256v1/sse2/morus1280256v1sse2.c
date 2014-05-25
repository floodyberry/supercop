#include <string.h>         
#include <immintrin.h>      
#include <stdint.h>   
#include "crypto_aead.h"       

#ifdef _MSC_VER            
#define  inline __inline   
#define _mm_store_si128 _mm_storeu_si128    
#define _mm_load_si128 _mm_loadu_si128      
#endif     

#define n1 13   
#define n2 46   
#define n3 38   
#define n4 7    
#define n5 4    

#define XOR(x,y)       _mm_xor_si128((x),(y))     /*XOR(x,y) = x ^ y, where x and y are two 128-bit word*/
#define AND(x,y)       _mm_and_si128((x),(y))     /*AND(x,y) = x & y, where x and y are two 128-bit word*/
#define ANDNOT(x,y)    _mm_andnot_si128((x),(y))  /*ANDNOT(x,y) = (!x) & y, where x and y are two 128-bit word*/
#define OR(x,y)        _mm_or_si128((x),(y))      /*OR(x,y)  = x | y, where x and y are two 128-bit word*/
#define SETZERO()      _mm_setzero_si128()        /*set the value of 128-bit register to zero*/
#define SETONE()       _mm_set_epi32(0xffffffff,0xffffffff,0xffffffff,0xffffffff)  /*set each bit in the 128-bit register to 1*/  

#define SHIFTL64(x)    _mm_slli_si128(x, 8) 
#define SHIFTR64(x)    _mm_srli_si128(x, 8)

#define ROTL(x,n)      XOR(_mm_slli_epi64((x), (n)),  _mm_srli_epi64((x),(64-n)))  /*Rotate 4 32-bit unsigned integers in x to the left by n-bit positions*/
#define ROTL8(x)       _mm_shuffle_epi8((x), _mm_set_epi8(14,13,12,11,10,9,8,7,6,5,4,3,2,1,0,15) )  /*Rotate 4 32-bit unsigned integers in x to the left by 8-bit positions*/  

#define ROTL32(x)      _mm_shuffle_epi32((x),_MM_SHUFFLE(2,1,0,3))   /*Rotate x by 32-bit positions to the left*/
#define ROTL64(x)      _mm_shuffle_epi32((x),_MM_SHUFFLE(1,0,3,2))   /*Rotate x by 64-bit positions to the left*/
#define ROTL96(x)      _mm_shuffle_epi32((x),_MM_SHUFFLE(0,3,2,1))   /*Rotate x by 96-bit positions to the left*/

#define STORE(x,p)     _mm_store_si128((__m128i *)(p), (x))         /*store the 128-bit word x into memory address p, where p is the multiple of 16 bytes*/
#define LOAD(p)        _mm_load_si128((__m128i *)(p))               /*load 16 bytes from the memory address p, return a 128-bit word, where p is the multiple of 16 bytes*/

void morus_stateupdate(__m128i *msgblk, __m128i (*state)[2])  
{   
	__m128i t; 
	state[0][0] = XOR(state[0][0], state[3][0]);  state[0][1] = XOR(state[0][1], state[3][1]); 
	state[0][0] = XOR(state[0][0], AND(state[1][0], state[2][0]));   state[0][1] = XOR(state[0][1], AND(state[1][1], state[2][1]));  
	state[0][0] = ROTL(state[0][0], n1);  state[0][1] = ROTL(state[0][1], n1);  
	t = state[3][0]; 
	state[3][0] = OR(SHIFTL64(state[3][0]), SHIFTR64(state[3][1])); 
	state[3][1] = OR(SHIFTR64(t), SHIFTL64(state[3][1])); 

	state[1][0] = XOR(state[1][0], msgblk[0]);  state[1][1] = XOR(state[1][1], msgblk[1]);  
	state[1][0] = XOR(state[1][0], state[4][0]);  state[1][1] = XOR(state[1][1], state[4][1]); 
	state[1][0] = XOR(state[1][0], AND(state[2][0], state[3][0]));   state[1][1] = XOR(state[1][1], AND(state[2][1], state[3][1]));  
	state[1][0] = ROTL(state[1][0], n2);  state[1][1] = ROTL(state[1][1], n2);  
	t = state[4][0]; 
	state[4][0] = state[4][1]; 
	state[4][1] = t; 

	state[2][0] = XOR(state[2][0], msgblk[0]);  state[2][1] = XOR(state[2][1], msgblk[1]);  
	state[2][0] = XOR(state[2][0], state[0][0]);  state[2][1] = XOR(state[2][1], state[0][1]); 
	state[2][0] = XOR(state[2][0], AND(state[3][0], state[4][0]));   state[2][1] = XOR(state[2][1], AND(state[3][1], state[4][1]));  
	state[2][0] = ROTL(state[2][0], n3);  state[2][1] = ROTL(state[2][1], n3);  
	t = state[0][0]; 
	state[0][0] = OR(SHIFTL64(state[0][1]), SHIFTR64(state[0][0])); 
	state[0][1] = OR(SHIFTR64(state[0][1]), SHIFTL64(t));

	state[3][0] = XOR(state[3][0], msgblk[0]);  state[3][1] = XOR(state[3][1], msgblk[1]);  
	state[3][0] = XOR(state[3][0], state[1][0]);  state[3][1] = XOR(state[3][1], state[1][1]); 
	state[3][0] = XOR(state[3][0], AND(state[4][0], state[0][0]));   state[3][1] = XOR(state[3][1], AND(state[4][1], state[0][1]));  
	state[3][0] = ROTL(state[3][0], n4);  state[3][1] = ROTL(state[3][1], n4);  
	t = state[1][0]; 
	state[1][0] = state[1][1]; 
	state[1][1] = t;

	state[4][0] = XOR(state[4][0], msgblk[0]);  state[4][1] = XOR(state[4][1], msgblk[1]);        
	state[4][0] = XOR(state[4][0], state[2][0]);  state[4][1] = XOR(state[4][1], state[2][1]);       
	state[4][0] = XOR(state[4][0], AND(state[0][0], state[1][0]));   state[4][1] = XOR(state[4][1], AND(state[0][1], state[1][1]));  
	state[4][0] = ROTL(state[4][0], n5);  state[4][1] = ROTL(state[4][1], n5);                     
	t = state[2][0];                                                    
	state[2][0] = OR(SHIFTL64(state[2][0]), SHIFTR64(state[2][1]));    
	state[2][1] = OR(SHIFTR64(t), SHIFTL64(state[2][1]));              
}


/*The input to the initialization is the 256-bit key; 256-bit IV;*/
void morus_initialization(const unsigned char *key, const unsigned char *iv, __m128i (*state)[2])
{
	int i;
	__m128i  tmp[2];
	tmp[0] = SETZERO(); 
	tmp[1] = SETZERO();  

	state[0][0] = _mm_load_si128((__m128i*)iv); state[0][1] = SETZERO(); 
	state[1][0] = _mm_load_si128((__m128i*)key); state[1][1] = _mm_load_si128((__m128i*)(key+16)); 
	state[2][0] = SETONE(); state[2][1] = SETONE(); 
	state[3][0] = SETZERO(); state[3][1] = SETZERO(); 
	state[4][0] = _mm_set_epi8(0x62,0x79,0xe9,0x90,0x59,0x37,0x22,0x15,0x0d,0x08,0x05,0x03,0x02,0x01,0x1, 0x0); 
	state[4][1] = _mm_set_epi8(0xdd,0x28,0xb5,0x73,0x42,0x31,0x11,0x20,0xf1,0x2f,0xc2,0x6d,0x55,0x18,0x3d,0xdb);  

	for (i = 0; i < 16; i++) morus_stateupdate(tmp, state); 

	state[1][0] = XOR(state[1][0], _mm_load_si128((__m128i*)key));  
	state[1][1] = XOR(state[1][1], _mm_load_si128((__m128i*)(key+16)));   
}

//the finalization state of MORUS
void morus_tag_generation(uint64_t msglen, uint64_t adlen, uint8_t *c, __m128i (*state)[2])
{
	int i;
	uint8_t t[32]; 
	__m128i  tmp[2]; 

	_mm_store_si128((__m128i*)t, state[3][0]);

	((uint64_t*)t)[0] ^= (adlen << 3);
	((uint64_t*)t)[1] ^= (msglen << 3);

	tmp[0] = _mm_load_si128((__m128i*)t); 
	tmp[1] = state[3][1]; 

	state[4][0] = XOR(state[4][0], state[0][0]); 
	state[4][1] = XOR(state[4][1], state[0][1]); 

	for (i = 0; i < 8; i++) morus_stateupdate(tmp, state);  

	for (i = 2; i < 5; i++) {
	    state[1][0] = XOR(state[1][0], state[i][0]);   
	    state[1][1] = XOR(state[1][1], state[i][1]);    
	}

	_mm_store_si128((__m128i*)t, state[1][0]);
	//in this program, the mac length is assumed to be multiple of bytes
	memcpy(c+msglen, t, 16);
}

int morus_tag_verification(uint64_t msglen, uint64_t adlen, const uint8_t *c, __m128i (*state)[2])
{
	int i;
	uint8_t t[32]; 
	__m128i  tmp[2]; 
	int check = 0; 

	_mm_store_si128((__m128i*)t, state[3][0]);

	((uint64_t*)t)[0] ^= (adlen << 3);
	((uint64_t*)t)[1] ^= (msglen << 3);


	tmp[0] = _mm_load_si128((__m128i*)t); 
	tmp[1] = state[3][1]; 

	state[4][0] = XOR(state[4][0], state[0][0]); 
	state[4][1] = XOR(state[4][1], state[0][1]); 

	for (i = 0; i < 8; i++) morus_stateupdate(tmp, state);  

	for (i = 2; i < 5; i++) {
		state[1][0] = XOR(state[1][0], state[i][0]);  
		state[1][1] = XOR(state[1][1], state[i][1]);  
	}

	_mm_store_si128((__m128i*)t, state[1][0]);
	//in this program, the mac length is assumed to be multiple of bytes
	for (i = 0; i  < 16; i++) check |= (c[msglen+i] ^ t[i]);
	if (0 == check) return 0; else return -1; 
}



// one step of encryption: it encrypts a 16-byte block  
inline void morus_enc_aut_step(const uint8_t *plaintextblock, uint8_t *ciphertextblock, __m128i (*state)[2])  
{  
	__m128i keystream[2];    
	__m128i msgblk[2];                         

	msgblk[0] = _mm_load_si128((__m128i*)plaintextblock);            
	msgblk[1] = _mm_load_si128((__m128i*)(plaintextblock+16));       

	//encryption 
	keystream[0] = XOR(state[0][0], OR(SHIFTL64(state[1][1]), SHIFTR64(state[1][0]))); 
	keystream[1] = XOR(state[0][1], OR(SHIFTL64(state[1][0]), SHIFTR64(state[1][1]))); 

	keystream[0] = XOR(keystream[0], AND(state[2][0], state[3][0])); 
	keystream[1] = XOR(keystream[1], AND(state[2][1], state[3][1])); 
	_mm_store_si128( (__m128i*)ciphertextblock, XOR(keystream[0], msgblk[0]) ); 
	_mm_store_si128( (__m128i*)(ciphertextblock+16), XOR(keystream[1], msgblk[1]) ); 

	// state update  
	morus_stateupdate(msgblk, state);  
}



// one step of decryption: it decrypts 16-byte block  
inline void morus_dec_aut_step(uint8_t *plaintextblock, const uint8_t *ciphertextblock, __m128i (*state)[2])
{
	__m128i keystream[2];  
	__m128i msgblk[2];

	msgblk[0] = _mm_load_si128((__m128i*)ciphertextblock);
	msgblk[1] = _mm_load_si128((__m128i*)(ciphertextblock+16)); 

	//decryption 
	keystream[0] = XOR(state[0][0], OR(SHIFTL64(state[1][1]), SHIFTR64(state[1][0]))); 
	keystream[1] = XOR(state[0][1], OR(SHIFTL64(state[1][0]), SHIFTR64(state[1][1]))); 

	keystream[0] = XOR(keystream[0], AND(state[2][0], state[3][0])); 
	keystream[1] = XOR(keystream[1], AND(state[2][1], state[3][1])); 

	msgblk[0] = XOR(keystream[0], msgblk[0]); 
	msgblk[1] = XOR(keystream[1], msgblk[1]); 

	_mm_store_si128( (__m128i*)plaintextblock, msgblk[0] ); 
	_mm_store_si128( (__m128i*)(plaintextblock+16), msgblk[1] ); 

	morus_stateupdate(msgblk, state);   
}



// encrypt a partial block  
void morus_enc_aut_partialblock(const uint8_t *plaintext, uint8_t *ciphertext, uint64_t len, __m128i (*state)[2])
{
	uint8_t plaintextblock[32], ciphertextblock[32];   
	__m128i keystream[2];  
	__m128i msgblk[2];  

	memset(plaintextblock, 0, 32);
	memcpy(plaintextblock, plaintext, len);  
	msgblk[0]= _mm_load_si128((__m128i*)plaintextblock);  
	msgblk[1]= _mm_load_si128((__m128i*)(plaintextblock+16));  

	keystream[0] = XOR(state[0][0], OR(SHIFTL64(state[1][1]), SHIFTR64(state[1][0]))); 
	keystream[1] = XOR(state[0][1], OR(SHIFTL64(state[1][0]), SHIFTR64(state[1][1]))); 

	keystream[0] = XOR(keystream[0], AND(state[2][0], state[3][0])); 
	keystream[1] = XOR(keystream[1], AND(state[2][1], state[3][1]));          
	_mm_store_si128( (__m128i*)ciphertextblock, XOR(keystream[0], msgblk[0]) ); 
	_mm_store_si128( (__m128i*)(ciphertextblock+16), XOR(keystream[1], msgblk[1]) ); 

	memcpy(ciphertext, ciphertextblock, len);

	morus_stateupdate(msgblk,state);  
}



// decrypt a partial block   
void morus_dec_aut_partialblock(uint8_t *plaintext, const uint8_t *ciphertext, uint64_t len, __m128i (*state)[2])
{
	uint8_t plaintextblock[32], ciphertextblock[32];   
	__m128i keystream[2];  
	__m128i msgblk[2];  

	memset(ciphertextblock, 0, 32);
	memcpy(ciphertextblock, ciphertext, len);  
	msgblk[0] = _mm_load_si128((__m128i*)ciphertextblock);
	msgblk[1] =  _mm_load_si128((__m128i*)(ciphertextblock+16)); 

	keystream[0] = XOR(state[0][0], OR(SHIFTL64(state[1][1]), SHIFTR64(state[1][0]))); 
	keystream[1] = XOR(state[0][1], OR(SHIFTL64(state[1][0]), SHIFTR64(state[1][1]))); 

	keystream[0] = XOR(keystream[0], AND(state[2][0], state[3][0])); 
	keystream[1] = XOR(keystream[1], AND(state[2][1], state[3][1])); 
	msgblk[0] = XOR(keystream[0], msgblk[0]); 
	msgblk[1] = XOR(keystream[1], msgblk[1]); 

	_mm_store_si128( (__m128i*)plaintextblock, msgblk[0] ); 
	_mm_store_si128( (__m128i*)(plaintextblock+16), msgblk[1] );
	memset(plaintextblock+len,  0, 32-len);  
	memcpy( plaintext, plaintextblock, len);

	msgblk[0] = _mm_load_si128((__m128i*)plaintextblock);  
	msgblk[1] = _mm_load_si128((__m128i*)(plaintextblock+16));

	morus_stateupdate(msgblk,state);  
}



//encrypt a message
int crypto_aead_encrypt(
	unsigned char *c,unsigned long long *clen,
	const unsigned char *m,unsigned long long mlen,
	const unsigned char *ad,unsigned long long adlen,
	const unsigned char *nsec,
	const unsigned char *npub,
	const unsigned char *k
	)
{
	uint64_t i;
	uint8_t ciphertextblock[32];
	__m128i morus_state[5][2];

	//initialization 
	morus_state[0][0] = SETZERO(); 
	morus_initialization(k, npub, morus_state);

	//process the associated data
	for (i = 0; (i+32) <= adlen; i += 32) {
		morus_enc_aut_step(ad+i, ciphertextblock, morus_state);
	}

	//deal with the partial block of associated data
	//in this program, we assume that the message length is a multiple of bytes.
	if (  (adlen & 0x1f) != 0 )  {
		morus_enc_aut_partialblock(ad+i, ciphertextblock, adlen & 0x1f, morus_state); 
	}

	//encrypt the plaintext
	for (i = 0; (i+32) <= mlen; i += 32) {
		morus_enc_aut_step(m+i, c+i, morus_state);
	}

	// Deal with the partial block
	// In this program, we assume that the message length is a multiple of bytes.
	if (  (mlen & 0x1f) != 0 )  {
		morus_enc_aut_partialblock(m+i, c+i, mlen & 0x1f, morus_state);  
	}

	//finalization stage, we assume that the tag length is a multiple of bytes
	morus_tag_generation(mlen,adlen, c, morus_state);
	*clen = mlen + 16; 
	return 0; 
}


int crypto_aead_decrypt(
	unsigned char *m,unsigned long long *mlen,
	unsigned char *nsec,
	const unsigned char *c,unsigned long long clen,
	const unsigned char *ad,unsigned long long adlen,
	const unsigned char *npub,
	const unsigned char *k
	)
{
	uint64_t i;
	uint8_t ciphertextblock[32];
	__m128i morus_state[5][2];

	morus_initialization(k, npub, morus_state);

	//process the associated data
	for (i = 0; (i+32) <= adlen; i += 32) {
		morus_enc_aut_step(ad+i, ciphertextblock, morus_state);
	}

	// deal with the partial block of associated data
	// in this program, we assume that the message length is a multiple of bytes.
	if (  (adlen & 0x1f) != 0 ) {  
		morus_enc_aut_partialblock(ad+i, ciphertextblock,adlen & 0x1f, morus_state); 
	}

	// decrypt the ciphertext
	*mlen = clen - 16; 
	for (i = 0; (i+32) <= *mlen; i += 32) {
		morus_dec_aut_step(m+i, c+i, morus_state);
	}

	// Deal with the partial block
	// In this program, we assume that the message length is a multiple of bytes.
	if (  (*mlen & 0x1f) != 0 )  { 
		morus_dec_aut_partialblock(m+i, c+i, *mlen & 0x1f, morus_state);
	}

	//we assume that the tag length is a multiple of bytes  
	//verification  
	return morus_tag_verification(*mlen, adlen, c, morus_state);
}

