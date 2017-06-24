/* JAMBU with SIMON 64/96 */

#include "crypto_aead.h"
#include <stdio.h> 
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "Simon.h"

#ifdef _MSC_VER
#define inline __inline
#endif

#define BS 8		// block size in byte
#define PBS 4		// plaintext block size in byte

static inline void jambu_initialization(const unsigned int *rk, const uint8_t *iv, unsigned int *stateS, unsigned int *stateR)   
{

	stateS[0] = ((unsigned int *)iv)[0]; stateS[1] = ((unsigned int *)iv)[1]; 
	SimonEncrypt64(stateS, stateS + 1, rk); 
	stateS[0] ^= 0x5; 
	stateR[0] = stateS[1]; 
	
	return; 

}  

static inline void jambu_tag_generation(const unsigned int *rk, uint64_t msglen, uint8_t *c, unsigned int *stateS, unsigned int *stateR)  
{

	SimonEncrypt64(stateS, stateS + 1, rk);
	stateS[0] ^= stateR[0] ^ 0x03; 
	stateR[0] ^= stateS[1]; 

	SimonEncrypt64(stateS, stateS + 1, rk);

	((unsigned int *)(c+msglen))[0] = stateS[0] ^ stateS[1] ^ stateR[0]; 
} 

static inline int jambu_tag_verification(const unsigned int *rk, uint64_t msglen, const uint8_t *c, unsigned int *stateS, unsigned int *stateR)  
{
	uint8_t t[8]; 
	int check = 0; 
	int i; 

	SimonEncrypt64(stateS, stateS + 1, rk);
	stateS[0] ^= stateR[0] ^ 0x03; 
	stateR[0] ^= stateS[1]; 

	SimonEncrypt64(stateS, stateS + 1, rk);

	((unsigned int *)t)[0] = stateS[0] ^ stateS[1] ^ stateR[0]; 
	for (i = 0; i < PBS; i++) check |= (c[msglen+i] ^ t[i]);
	if (0 == check) return 1; else return -1;
} 

static inline void jambu_aut_ad_step(const unsigned int *rk, const uint8_t *adblock,
									 unsigned int *stateS, unsigned int *stateR) 
{
	SimonEncrypt64(stateS, stateS + 1, rk);
	stateS[0] ^= stateR[0] ^ 0x01; 
	stateS[1] ^= ((unsigned int *)adblock)[0]; 
	stateR[0] ^= stateS[1]; 

	return;
}

static inline void jambu_aut_ad_partial(const unsigned int *rk, const uint8_t *adblock,
										unsigned int *stateS, unsigned int *stateR, unsigned int len) 
{
	uint8_t p[8]; 

	memcpy(p, adblock, len); 

	p[len] = 0x80; // pad '1' 
	memset(p+len+1, 0, 3-len); // pad '0' 

	SimonEncrypt64(stateS, stateS + 1, rk);
	
	stateS[0] ^= stateR[0] ^ 0x01; 
	stateS[1] ^= ((unsigned int *)p)[0]; 
	stateR[0] ^= stateS[1]; 

	return;
}

static inline void jambu_aut_ad_full(const unsigned int *rk, unsigned int *stateS, unsigned int *stateR) 
{
	SimonEncrypt64(stateS, stateS + 1, rk);

	stateS[0] ^= stateR[0] ^ 0x01; 
	stateS[1] ^= 0x80; 
	stateR[0] ^= stateS[1]; 
	return;
}

static inline void jambu_enc_aut_msg_step(const unsigned int *rk, const uint8_t *plaintextblk,
										  uint8_t *ciphertextblk, unsigned int *stateS, unsigned int *stateR) 
{

	SimonEncrypt64(stateS, stateS + 1, rk);

	stateS[0] ^= stateR[0]; 
	stateS[1] ^= ((unsigned int *)plaintextblk)[0]; 
	stateR[0] ^= stateS[1]; 
	((unsigned int *)ciphertextblk)[0] = stateS[0] ^ ((unsigned int *)plaintextblk)[0];

	return; 
}  

/* Deal with partial final block */
static inline void jambu_enc_aut_msg_partial(const unsigned int *rk, const uint8_t *plaintextblk,
											 uint8_t *ciphertextblk, unsigned int *stateS, unsigned int *stateR, unsigned int len) 
{   
	uint8_t p[8]; 

	memcpy(p, plaintextblk, len); 

	p[len] = 0x80; // pad '1' 
	memset(p+len+1, 0, 3-len);// pad '0'

	SimonEncrypt64(stateS, stateS + 1, rk);

	stateS[0] ^= stateR[0]; 
	stateS[1] ^= ((unsigned int *)p)[0]; 
	stateR[0] ^= stateS[1]; 

	((unsigned int *)ciphertextblk)[0] = stateS[0] ^ ((unsigned int *)p)[0];

	return; 
}  

static inline void jambu_enc_aut_msg_full(const unsigned int *rk, unsigned int *stateS, unsigned int *stateR) 
{   
	SimonEncrypt64(stateS, stateS + 1, rk);

	stateS[0] ^= stateR[0]; 
	stateS[1] ^= 0x80; 
	stateR[0] ^= stateS[1]; 

	return;  
} 

static inline void jambu_dec_aut_msg_step(const unsigned int *rk, uint8_t *plaintextblk, const uint8_t *ciphertextblk, unsigned int *stateS, unsigned int *stateR) 
{
	SimonEncrypt64(stateS, stateS + 1, rk);
	stateS[0] ^= stateR[0]; 
	((unsigned int *)plaintextblk)[0] = stateS[0] ^ ((unsigned int *)ciphertextblk)[0];

	stateS[1] ^= ((unsigned int *)plaintextblk)[0]; 
	stateR[0] ^= stateS[1]; 
	
	return; 
}  

static inline void jambu_dec_aut_partial(const unsigned int *rk, uint8_t *plaintextblk, const uint8_t *ciphertextblk, unsigned int *stateS, unsigned int *stateR, unsigned int len) 
{
	uint8_t p[8]; 

	SimonEncrypt64(stateS, stateS + 1, rk);
	stateS[0] ^= stateR[0]; 
	((unsigned int *)p)[0] = stateS[0] ^ ((unsigned int *)ciphertextblk)[0];
	p[len] = 0x80; 
	memset(p+len+1, 0, 3-len); 
	memcpy(plaintextblk, p, len); 

	stateS[1] ^= ((unsigned int *)p)[0]; 
	stateR[0] ^= stateS[1]; 

	return; 
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
 	unsigned int i;
 	unsigned int jambu_state[2];  
 	unsigned int stateR[1]; 
 	unsigned int EK[44]; // 44 round keys for Simon64/96
 
 	// key expansion
	SimonKeySetup64(k, EK); 

 	// Initialization
 	memset(jambu_state, 0, BS); 
 	memset(stateR, 0, (BS>>1)); 
 	jambu_initialization(EK, npub, jambu_state, stateR);  
 
 	// process the associated data
	for (i = 0; (i + PBS) <= adlen; i += PBS) {
 		jambu_aut_ad_step(EK, ad+i, jambu_state, stateR);
 	}

 	// deal with the partial block of associated data
 	// in this program, we assume that the message length is a multiple of bytes.
	if ((adlen & (PBS-1)) != 0)  {
		jambu_aut_ad_partial(EK, ad + i, jambu_state, stateR, adlen & (PBS-1));
 	}
 	else
 	{
 		jambu_aut_ad_full(EK, jambu_state, stateR); 
 	}
 
 	// encrypt the plaintext, we assume that the message length is multiple of bytes. 
	for (i = 0; (i + PBS) <= mlen; i += PBS) {
 		jambu_enc_aut_msg_step(EK, m+i, c+i, jambu_state, stateR);     
 	}  
 
 	// deal with the final plaintext block
	if ((mlen & (PBS-1) != 0)) {
		jambu_enc_aut_msg_partial(EK, m + i, c + i, jambu_state, stateR, mlen & (PBS-1));
 	}
 	else
 	{
 		jambu_enc_aut_msg_full(EK, jambu_state, stateR);
 	}
 
 	// finalization stage, we assume that the tag length is a multiple of bytes
 	jambu_tag_generation(EK, mlen, c, jambu_state, stateR);     
	*clen = mlen + PBS; 
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
 	unsigned int i;  
 	uint8_t check = 0;  
 	unsigned int jambu_state[BS>>2];  
 	unsigned int stateR[BS>>3]; 
 	unsigned int EK[44]; 
 
 	// key expansion
 	//AESKeySteup(k, EK); 
	SimonKeySetup64(k, EK); 
 
 	// Initialization
 	memset(jambu_state, 0, BS); 
 	memset(stateR, 0, PBS); 
 	jambu_initialization(EK, npub, jambu_state, stateR);   
 
 	// process the associated data
	for (i = 0; (i + PBS) <= adlen; i += PBS) {
 		jambu_aut_ad_step(EK, ad+i, jambu_state, stateR);
 	}
 	// deal with the partial block of associated data
 	// in this program, we assume that the message length is a multiple of bytes.
 	if (  (adlen & (PBS - 1)) != 0 )  {
		jambu_aut_ad_partial(EK, ad + i, jambu_state, stateR, adlen & (PBS - 1));
 	}
 	else
 	{
 		jambu_aut_ad_full(EK, jambu_state, stateR); 
 	} 
 
 	// decrypt the ciphertext
 	*mlen = clen - PBS; 
	for (i = 0; (i + PBS) <= *mlen; i = i + PBS) {
 		jambu_dec_aut_msg_step(EK, m+i, c+i, jambu_state, stateR);  
 	}  
 
 	// deal with the final block
 	if (((*mlen) & (PBS - 1)) != 0) {
 		jambu_dec_aut_partial(EK, m+i, c+i, jambu_state, stateR, *mlen & (PBS - 1));
 	}
 	else
 	{
 		jambu_enc_aut_msg_full(EK, jambu_state, stateR);
 	}
 
 	// verification, we assume that the tag length is a multiple of bytes  
 	return jambu_tag_verification(EK, *mlen, c, jambu_state, stateR);
}  

