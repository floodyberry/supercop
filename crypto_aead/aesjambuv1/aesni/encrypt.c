#include "crypto_aead.h"
#include <string.h> 
#include <immintrin.h>  

// for visual studio
#ifdef _MSC_VER	
#define inline __inline
#define _mm_store_si128 _mm_storeu_si128
#define _mm_load_si128 _mm_loadu_si128
#endif

/*The input to initialization is the 128-bit key; 128-bit IV; 
  the length of the MAC in bits; noenc_len indicates that the first # of bits of the message are not encrypted.*/

#define XOR(x,y)       _mm_xor_si128((x),(y))     /*XOR(x,y) = x ^ y, where x and y are two 128-bit word*/
#define AND(x,y)       _mm_and_si128((x),(y))     /*AND(x,y) = x & y, where x and y are two 128-bit word*/
#define STORE(x,p)     _mm_storeu_si128((__m128i *)(p), (x))         /*store the 128-bit word x into memeory address p, where p is the multile of 16 bytes*/
#define LOAD(p)        _mm_loadu_si128((__m128i *)(p))               /*load 16 bytes from the memory address p, return a 128-bit word, where p is the multile of 16 bytes*/
#define KEYEXP(K, I) aes128_keyexpand(K, _mm_aeskeygenassist_si128(K, I))

typedef unsigned long long uint64; 

__m128i aes128_keyexpand(__m128i key, __m128i keygened)
{
	key = _mm_xor_si128(key, _mm_slli_si128(key, 4));
	key = _mm_xor_si128(key, _mm_slli_si128(key, 4));
	key = _mm_xor_si128(key, _mm_slli_si128(key, 4));
	keygened = _mm_shuffle_epi32(keygened, _MM_SHUFFLE(3,3,3,3));
	return _mm_xor_si128(key, keygened);
}
 
static inline void aes_enc_128(__m128i *state, __m128i *key)
{
	// 0
	*state = _mm_xor_si128(*state, key[0]);
	// 1

	*state = _mm_aesenc_si128(*state, key[1]);
	// 2

	*state = _mm_aesenc_si128(*state, key[2]);
	// 3 
	*state = _mm_aesenc_si128(*state, key[3]);
	// 4
	*state = _mm_aesenc_si128(*state, key[4]);
	// 5
	*state = _mm_aesenc_si128(*state, key[5]);
	// 6
	*state = _mm_aesenc_si128(*state, key[6]);
	// 7 
	*state = _mm_aesenc_si128(*state, key[7]);
	// 8
	*state = _mm_aesenc_si128(*state, key[8]);
	// 9 
	*state = _mm_aesenc_si128(*state, key[9]);
	// 10
	*state = _mm_aesenclast_si128(*state, key[10]);

}

static inline void jambu_initialization(__m128i *key,  const unsigned char *iv, __m128i *stateS, __m128i *stateR)   
{
	__m128i c5 = _mm_set_epi8(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5);
	
	*stateS  = _mm_loadl_epi64((__m128i*)iv);   

	aes_enc_128(stateS, key);
	*stateR = *stateS; 
	*stateS = _mm_xor_si128(*stateS, c5);
	return; 

}  


static inline void jambu_tag_generation(__m128i *key, unsigned long long mlen, unsigned char *c, __m128i *stateS, __m128i *stateR)  
{
	unsigned char t[16]; 
 
	__m128i c3 = _mm_set_epi8(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3);
	__m128i tmpT; 

	aes_enc_128(stateS, key);
	*stateS = _mm_xor_si128(*stateS, _mm_srli_si128(*stateR, 8));
	*stateS = _mm_xor_si128(*stateS, c3); 
	*stateR = _mm_xor_si128(*stateR, *stateS); 

	aes_enc_128(stateS, key);
	tmpT = _mm_srli_si128(_mm_xor_si128(*stateS, *stateR), 8); 
	tmpT = _mm_xor_si128(tmpT, *stateS); 
	
	_mm_store_si128((__m128i*)t, tmpT);	

	//in this program, the mac length is assumed to be multiple of bytes 
	memcpy(c+mlen, t, 8);
	
} 

static inline int jambu_tag_verification(__m128i *key, unsigned long long mlen, const unsigned char *c, __m128i *stateS, __m128i *stateR)  
{

	unsigned char t[16]; 
	int check = 0; 
	int i; 
	__m128i c3 = _mm_set_epi8(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3);
	__m128i tmpT; 

	aes_enc_128(stateS, key);
	*stateS = _mm_xor_si128(*stateS, _mm_srli_si128(*stateR, 8));
	*stateS = _mm_xor_si128(*stateS, c3); 
	*stateR = _mm_xor_si128(*stateR, *stateS); 

	aes_enc_128(stateS, key);
	tmpT = _mm_srli_si128(_mm_xor_si128(*stateS, *stateR), 8); 
	tmpT = _mm_xor_si128(tmpT, *stateS); 

	_mm_store_si128((__m128i*)t, tmpT);	

	//in this program, the mac length is assumed to be multiple of bytes 
	for (i = 0; i  < 8; i++) check |= (c[mlen+i] ^ t[i]);
	if (0 == check) return 0; else return -1;

} 

static inline void jambu_aut_ad_step(__m128i *key, const unsigned char *adblock,
									   __m128i *stateS, __m128i *stateR) 
{
	 __m128i  msgtmp = _mm_set_epi8(adblock[7], adblock[6], adblock[5], adblock[4], adblock[3], adblock[2], adblock[1], adblock[0], 0, 0, 0, 0, 0, 0, 0, 0);
	__m128i c1 = _mm_set_epi8(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1);

	aes_enc_128(stateS, key);
	*stateS = _mm_xor_si128(*stateS, _mm_srli_si128(*stateR, 8));
	*stateS = _mm_xor_si128(*stateS, c1);
	*stateS = _mm_xor_si128(*stateS, msgtmp);  
	*stateR = _mm_xor_si128(*stateS, *stateR);  
	return;
}

static inline void jambu_aut_ad_partial(__m128i *key, const unsigned char *adblock,
									 __m128i *stateS, __m128i *stateR, unsigned long len) 
{
	__m128i  msgtmp; 
	__m128i c1 = _mm_set_epi8(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1); 
	unsigned char p[8]; 
	
	memcpy(p, adblock, len); 
	p[len] = 0x80; // pad '1' 
	if (len < 7) memset(p+(len+1), 0, 7-len); // pad '0' 

	msgtmp = _mm_set_epi8(p[7], p[6], p[5], p[4], p[3], p[2], p[1], p[0], 0, 0, 0, 0, 0, 0, 0, 0);

	aes_enc_128(stateS, key);
	*stateS = _mm_xor_si128(*stateS, _mm_srli_si128(*stateR, 8));
	*stateS = _mm_xor_si128(*stateS, c1);
	*stateS = _mm_xor_si128(*stateS, msgtmp);  
	*stateR = _mm_xor_si128(*stateS, *stateR);  
	return;
}

static inline void jambu_aut_ad_full(__m128i *key, __m128i *stateS, __m128i *stateR) 
{
	__m128i  msgtmp = _mm_set_epi8(0, 0, 0, 0, 0, 0, 0, 0x80, 0, 0, 0, 0, 0, 0, 0, 0); 
	__m128i c1 = _mm_set_epi8(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1); 

	aes_enc_128(stateS, key);
	*stateS = _mm_xor_si128(*stateS, _mm_srli_si128(*stateR, 8));
	*stateS = _mm_xor_si128(*stateS, c1);
	*stateS = _mm_xor_si128(*stateS, msgtmp);  
	*stateR = _mm_xor_si128(*stateS, *stateR);  
	return;
}

static inline void jambu_enc_aut_msg_step(__m128i *key, const unsigned char *plaintextblk,
       unsigned char *ciphertextblk, __m128i *stateS, __m128i *stateR) 
{   

	__m128i  msgtmp = _mm_set_epi8(plaintextblk[7], plaintextblk[6], plaintextblk[5], plaintextblk[4], plaintextblk[3], plaintextblk[2], plaintextblk[1], plaintextblk[0], 0, 0, 0, 0, 0, 0, 0, 0);
	__m128i tmp = _mm_srli_si128(msgtmp, 8);

	aes_enc_128(stateS, key);
	*stateS = _mm_xor_si128(*stateS, _mm_srli_si128(*stateR, 8));
	*stateS = _mm_xor_si128(*stateS, msgtmp);  
	tmp = _mm_xor_si128(tmp, *stateS);		
	_mm_storel_epi64((__m128i *)ciphertextblk, tmp);
	*stateR = _mm_xor_si128(*stateS, *stateR); 
}  

/* Deal with partial final block */
static inline void jambu_enc_aut_msg_partial(__m128i *key, const unsigned char *plaintextblk,
									  unsigned char *ciphertextblk, __m128i *stateS, __m128i *stateR, unsigned long len) 
{   

	__m128i  msgtmp; 
	__m128i tmp; 
	unsigned char p[8]; 

	memcpy(p, plaintextblk, len); 
	p[len] = 0x80; // pad '1' 
	if (len < 7) memset(p+(len+1), 0, 7-len); // pad '0'

	msgtmp = _mm_set_epi8(p[7], p[6], p[5], p[4], p[3], p[2], p[1], p[0], 0, 0, 0, 0, 0, 0, 0, 0);
	tmp = _mm_srli_si128(msgtmp, 8);

	aes_enc_128(stateS, key);
	*stateS = _mm_xor_si128(*stateS, _mm_srli_si128(*stateR, 8));
	*stateS = _mm_xor_si128(*stateS, msgtmp);  
	tmp = _mm_xor_si128(tmp, *stateS);		
	_mm_storel_epi64((__m128i *)ciphertextblk, tmp);
	*stateR = _mm_xor_si128(*stateS, *stateR); 
}  

static inline void jambu_enc_aut_msg_full(__m128i *key, __m128i *stateS, __m128i *stateR) 
{   
	__m128i  msgtmp = _mm_set_epi8(0, 0, 0, 0, 0, 0, 0, 0x80, 0, 0, 0, 0, 0, 0, 0, 0);  

	aes_enc_128(stateS, key);
	*stateS = _mm_xor_si128(*stateS, _mm_srli_si128(*stateR, 8));
	*stateS = _mm_xor_si128(*stateS, msgtmp);  
	*stateR = _mm_xor_si128(*stateS, *stateR); 
} 

static inline void jambu_dec_aut_msg_step(__m128i *key, unsigned char *plaintextblk,
									 const unsigned char *ciphertextblk, __m128i *stateS, __m128i *stateR) 
{
	__m128i  msgtmp = _mm_set_epi8(0, 0, 0, 0, 0, 0, 0, 0, ciphertextblk[7], ciphertextblk[6], ciphertextblk[5], ciphertextblk[4], ciphertextblk[3], ciphertextblk[2], 	ciphertextblk[1], ciphertextblk[0]);
	__m128i tmp;

	aes_enc_128(stateS, key);

	*stateS = _mm_xor_si128(*stateS, _mm_srli_si128(*stateR, 8));
	tmp = _mm_xor_si128(msgtmp, *stateS);
	_mm_storel_epi64((__m128i *)plaintextblk, tmp);	
	tmp = _mm_slli_si128(tmp, 8); 
	*stateS = _mm_xor_si128(*stateS, tmp);  
	*stateR = _mm_xor_si128(*stateS, *stateR);   
}  

static inline void jambu_dec_aut_partial(__m128i *key, unsigned char *plaintextblk,
									  const unsigned char *ciphertextblk, __m128i *stateS, __m128i *stateR, unsigned long len) 
{
	__m128i  msgtmp = _mm_set_epi8(0, 0, 0, 0, 0, 0, 0, 0, ciphertextblk[7], ciphertextblk[6], ciphertextblk[5], ciphertextblk[4], ciphertextblk[3], ciphertextblk[2], 	ciphertextblk[1], ciphertextblk[0]);
	__m128i tmp;

	aes_enc_128(stateS, key);

	*stateS = _mm_xor_si128(*stateS, _mm_srli_si128(*stateR, 8));
	tmp = _mm_xor_si128(msgtmp, *stateS);
	_mm_storel_epi64((__m128i *)plaintextblk, tmp);	
	plaintextblk[len] = 0x80; // pad '1' 
	memset(plaintextblk+(len+1), 0, 7-len); // pad '0' 

	tmp = _mm_set_epi8(plaintextblk[7], plaintextblk[6], plaintextblk[5], plaintextblk[4], plaintextblk[3], plaintextblk[2], plaintextblk[1], plaintextblk[0], 0, 0, 0, 0, 0, 0, 0, 0);

	*stateS = _mm_xor_si128(*stateS, tmp);  
	*stateR = _mm_xor_si128(*stateS, *stateR);   
}  

int crypto_aead_encrypt(
	unsigned char *c,unsigned long long *clen,
	const unsigned char *m,unsigned long long mlen,
	const unsigned char *ad,unsigned long long adlen,
	const unsigned char *nsec,
	const unsigned char *npub,
	const unsigned char *k
	)
{   
	unsigned long i,j;
	unsigned char partialblockplaintext[8],partialblockciphertext[8];
	//unsigned char ad[8] = {0, 0, 0, 0, 0, 0, 0, 8}; 
	__m128i jambu_state;  
	__m128i stateR; 


	// key expansion
	/* The initial part of the expanded key is the key itself. */
	__m128i K[11]; 
	K[0]  = _mm_loadu_si128((__m128i*)(k));
	K[1] = KEYEXP(K[0], 0x01);
	K[2] = KEYEXP(K[1], 0x02);
	K[3] = KEYEXP(K[2], 0x04);
	K[4] = KEYEXP(K[3], 0x08);
	K[5] = KEYEXP(K[4], 0x10);
	K[6] = KEYEXP(K[5], 0x20);
	K[7] = KEYEXP(K[6], 0x40);
	K[8] = KEYEXP(K[7], 0x80);
	K[9] = KEYEXP(K[8], 0x1B);
	K[10] = KEYEXP(K[9], 0x36);


	jambu_state = _mm_setzero_si128(); 
	stateR = _mm_setzero_si128(); 

	jambu_initialization(K, npub, &jambu_state, &stateR);  

	//process the associated data
	for (i = 0; (i+8) <= adlen; i += 8) {
		jambu_aut_ad_step(K, ad+i, &jambu_state, &stateR);
	}
	//deal with the partial block of associated data
	//in this program, we assume that the message length is a multiple of bytes.
	if (  (adlen & 0x7) != 0 )  {
		jambu_aut_ad_partial(K, ad+i, &jambu_state, &stateR, adlen & 0x7); 
	}
	else
	{
		jambu_aut_ad_full(K, &jambu_state, &stateR); 
	}


	// encrypt the plaintext
	for (i = 0; (i+8) <= mlen; i += 8) {    
		jambu_enc_aut_msg_step(K, m+i, c+i, &jambu_state, &stateR);     
	}  

	//In this program, we assume that the message length is multiple of bytes. 
	if ((mlen & 0x7) != 0) {
		jambu_enc_aut_msg_partial(K, m+i, c+i, &jambu_state, &stateR, mlen & 0x7);
	}
	else
	{
		jambu_enc_aut_msg_full(K, &jambu_state, &stateR);
	}
	
	// finalization stage, we assume that the tag length is a multiple of bytes
	jambu_tag_generation(K, mlen, c, &jambu_state, &stateR);     
	*clen = mlen + 8; 
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
	unsigned long i,j;  
	unsigned char partialblockplaintext[16],partialblockciphertext[16];
	unsigned char tag[8];   
	unsigned char check = 0;  
	__m128i jambu_state;  
	__m128i stateR; 
	__m128i K[11]; 

        if (clen < 8) return -1; 

	jambu_state = _mm_setzero_si128(); 
	stateR = _mm_setzero_si128(); 

	// key expansion
	/* The initial part of the expanded key is the key itself. */

	K[0]  = _mm_loadu_si128((__m128i*)(k));
	K[1] = KEYEXP(K[0], 0x01);
	K[2] = KEYEXP(K[1], 0x02);
	K[3] = KEYEXP(K[2], 0x04);
	K[4] = KEYEXP(K[3], 0x08);
	K[5] = KEYEXP(K[4], 0x10);
	K[6] = KEYEXP(K[5], 0x20);
	K[7] = KEYEXP(K[6], 0x40);
	K[8] = KEYEXP(K[7], 0x80);
	K[9] = KEYEXP(K[8], 0x1B);
	K[10] = KEYEXP(K[9], 0x36);

	jambu_initialization(K, npub, &jambu_state, &stateR);  

	//process the associated data
	for (i = 0; (i+8) <= adlen; i += 8) {
		jambu_aut_ad_step(K, ad+i, &jambu_state, &stateR);
	}

	//deal with the partial block of associated data
	//in this program, we assume that the message length is a multiple of bytes.
	if (  (adlen & 0x7) != 0 )  {
		jambu_aut_ad_partial(K, ad+i, &jambu_state, &stateR, adlen & 0x7); 
	}
	else
	{
		jambu_aut_ad_full(K, &jambu_state, &stateR); 
	} 


	// decryption
	*mlen = clen - 8; 
	for (i = 0; (i+8)  <= *mlen; i = i+8) { 
		jambu_dec_aut_msg_step(K, m+i, c+i, &jambu_state, &stateR);  
	}  

	//In this program, we assume that the message length is multiple of bytes. 
	if ((*mlen & 0x7) != 0) {
		jambu_dec_aut_partial(K, m+i, c+i, &jambu_state, &stateR, *mlen & 0x7);
	}
	else
	{
		jambu_enc_aut_msg_full(K, &jambu_state, &stateR);
	}

	return jambu_tag_verification(K, *mlen, c, &jambu_state, &stateR);
}  

