#include <string.h>
#include <immintrin.h>
#include <stdint.h>
#include "crypto_aead.h"

#ifdef _MSC_VER
#define inline __inline
#define _mm_store_si128 _mm_storeu_si128
#define _mm_load_si128 _mm_loadu_si128
#endif

#define n1 5 
#define n2 31
#define n3 7
#define n4 22
#define n5 13

#define XOR(x,y)       _mm_xor_si128((x),(y))     /*XOR(x,y) = x ^ y, where x and y are two 128-bit word*/
#define AND(x,y)       _mm_and_si128((x),(y))     /*AND(x,y) = x & y, where x and y are two 128-bit word*/
#define ANDNOT(x,y)    _mm_andnot_si128((x),(y))  /*ANDNOT(x,y) = (!x) & y, where x and y are two 128-bit word*/
#define OR(x,y)        _mm_or_si128((x),(y))      /*OR(x,y)  = x | y, where x and y are two 128-bit word*/
#define SETZERO()      _mm_setzero_si128()        /*set the value of 128-bit register to zero*/
#define SETONE()       _mm_set_epi32(0xffffffff,0xffffffff,0xffffffff,0xffffffff)  /*set each bit in the 128-bit register to 1*/  

#define ROTL(x,n)      XOR(_mm_slli_epi32((x), (n)),  _mm_srli_epi32((x),(32-n)))  /*Rotate 4 32-bit unsigned integers in x to the left by n-bit positions*/
#define ROTL8(x)       _mm_shuffle_epi8((x), _mm_set_epi8(14,13,12,11,10,9,8,7,6,5,4,3,2,1,0,15) )  /*Rotate 4 32-bit unsigned integers in x to the left by 8-bit positions*/  

#define ROTL32(x)      _mm_shuffle_epi32((x),_MM_SHUFFLE(2,1,0,3))   /*Rotate x by 32-bit positions to the left*/
#define ROTL64(x)      _mm_shuffle_epi32((x),_MM_SHUFFLE(1,0,3,2))   /*Rotate x by 64-bit positions to the left*/
#define ROTL96(x)      _mm_shuffle_epi32((x),_MM_SHUFFLE(0,3,2,1))   /*Rotate x by 96-bit positions to the left*/

#define STORE(x,p)     _mm_store_si128((__m128i *)(p), (x))         /*store the 128-bit word x into memeory address p, where p is the multile of 16 bytes*/
#define LOAD(p)        _mm_load_si128((__m128i *)(p))               /*load 16 bytes from the memory address p, return a 128-bit word, where p is the multile of 16 bytes*/


void morus_stateupdate(__m128i msgblk, __m128i *state)  
{   
        
        state[0] = XOR(state[0], state[3]);  
        state[0] = XOR(state[0], AND(state[1], state[2]));   
        state[0] = ROTL(state[0], n1);  
        state[3] = ROTL32(state[3]);    

        state[1] = XOR(state[1], msgblk);  
        state[1] = XOR(state[1], state[4]);          
        state[1] = XOR(state[1], AND(state[2], state[3]));  
        state[1] = ROTL(state[1], n2);  
        state[4] = ROTL64(state[4]);

        state[2] = XOR(state[2], msgblk);  
        state[2] = XOR(state[2], state[0]);  
        state[2] = XOR(state[2], AND(state[3], state[4]));  
        state[2] = ROTL(state[2], n3);  
        state[0] = ROTL96(state[0]);  

        state[3] = XOR(state[3], msgblk);  
        state[3] = XOR(state[3], state[1]); 
        state[3] = XOR(state[3], AND(state[4], state[0]));    
        state[3] = ROTL(state[3], n4);  
        state[1] = ROTL64(state[1]); 

        state[4] = XOR(state[4], msgblk);    
        state[4] = XOR(state[4], state[2]);  
        state[4] = XOR(state[4], AND(state[0], state[1]));  
        state[4] = ROTL(state[4], n5);  
        state[2] = ROTL32(state[2]);     
}


/*The input to the initialization is the 128-bit key; 128-bit IV;*/
void morus_initialization(const unsigned char *key, const unsigned char *iv, __m128i *state)
{
        int i;
        __m128i  tmp = SETZERO(); 

	state[0] = _mm_load_si128((__m128i*)iv);
        state[1] = _mm_load_si128((__m128i*)key); 
        state[2] = SETONE();
        state[3] = _mm_set_epi8(0x62,0x79,0xe9,0x90,0x59,0x37,0x22,0x15,0x0d,0x08,0x05,0x03,0x02,0x01,0x1, 0x0); 
        state[4] = _mm_set_epi8(0xdd,0x28,0xb5,0x73,0x42,0x31,0x11,0x20,0xf1,0x2f,0xc2,0x6d,0x55,0x18,0x3d,0xdb);  

        for (i = 0; i < 16; i++) morus_stateupdate(tmp, state); 

        state[1] = XOR(state[1], _mm_load_si128((__m128i*)key));  
}


//the finalization state of MORUS
void morus_tag_generation(unsigned long long msglen, unsigned long long adlen, unsigned char *c, __m128i *state)
{
        int i;
        unsigned char t[16]; 
        __m128i  tmp; 

        _mm_store_si128((__m128i*)t, state[3]);

        ((uint64_t*)t)[0] ^= (adlen << 3);
        ((uint64_t*)t)[1] ^= (msglen << 3);

	state[4] = XOR(state[4], state[0]);

        tmp = _mm_load_si128((__m128i*)t); 

        for (i = 0; i < 8; i++) morus_stateupdate(tmp, state);  

        for (i = 2; i < 5; i++) state[1] = XOR(state[1], state[i]);  

        _mm_store_si128((__m128i*)t, state[1]);
        //in this program, the mac length is assumed to be multiple of bytes
        memcpy(c+msglen, t, 16);
}

int morus_tag_verification(unsigned long long msglen, unsigned long long adlen, const unsigned char *c, __m128i *state)
{
	int i;
	unsigned char t[16]; 
	__m128i  tmp; 
	int check = 0; 

	_mm_store_si128((__m128i*)t, state[3]);

	((uint64_t*)t)[0] ^= (adlen << 3);
	((uint64_t*)t)[1] ^= (msglen << 3);

	state[4] = XOR(state[4], state[0]);

	tmp = _mm_load_si128((__m128i*)t); 

	for (i = 0; i < 8; i++) morus_stateupdate(tmp, state);  

	for (i = 2; i < 5; i++) state[1] = XOR(state[1], state[i]);  

	_mm_store_si128((__m128i*)t, state[1]);
	//in this program, the mac length is assumed to be multiple of bytes
	for (i = 0; i  < 16; i++) check |= (c[msglen+i] ^ t[i]);
	if (0 == check) return 0; else return -1; 
}


// one step of encryption: it encrypts a 16-byte block 
static inline void morus_enc_aut_step(const unsigned char *plaintextblock, 
                   unsigned char *ciphertextblock, __m128i *state)  
{  
        __m128i keystream;  
        __m128i msgblk = _mm_load_si128((__m128i*)plaintextblock);  

        //encryption 
        keystream = XOR(state[0], ROTL96(state[1])); 
        keystream = XOR(keystream, AND(state[2], state[3])); 
        _mm_store_si128( (__m128i*)ciphertextblock, XOR(keystream, msgblk) ); 

        //state update 
	morus_stateupdate(msgblk, state); 
}


// one step of decryption: it decrypts 16-byte block  
static inline void morus_dec_aut_step(unsigned char *plaintextblock,
       const unsigned char *ciphertextblock, __m128i *state)
{
        __m128i keystream;  
        __m128i msgblk = _mm_load_si128((__m128i*)ciphertextblock);  

        //decryption 
        keystream = XOR(state[0], ROTL96(state[1])); 
        keystream = XOR(keystream,  AND(state[2], state[3])); 
        msgblk = XOR(keystream, msgblk);  
        _mm_store_si128( (__m128i*)plaintextblock, msgblk);  

        morus_stateupdate(msgblk, state); 
}

// encrypt a partial block  
void morus_enc_aut_partialblock(const unsigned char *plaintext,
       unsigned char *ciphertext, unsigned long len, __m128i *state)
{
        unsigned char plaintextblock[16], ciphertextblock[16];   
        __m128i keystream;  
        __m128i msgblk;  

        memset(plaintextblock, 0, 16);
        memcpy(plaintextblock, plaintext, len);  
        msgblk= _mm_load_si128((__m128i*)plaintextblock);  

        keystream = XOR(state[0], ROTL96(state[1])); 
        keystream = XOR(keystream, AND(state[2], state[3]));          
        _mm_store_si128( (__m128i*)ciphertextblock, XOR(keystream, msgblk) );
   
        memcpy(ciphertext, ciphertextblock, len);

        morus_stateupdate(msgblk,state);  
}

// decrypt a partial block   
void morus_dec_aut_partialblock(unsigned char *plaintext,
       const unsigned char *ciphertext, unsigned long len, __m128i *state)
{
        unsigned char plaintextblock[16], ciphertextblock[16];   
        __m128i keystream;  
        __m128i msgblk;  

        memset(ciphertextblock, 0, 16);
        memcpy(ciphertextblock, ciphertext, len);  
        msgblk= _mm_load_si128((__m128i*)ciphertextblock);  

        keystream = XOR(state[0], ROTL96(state[1])); 
        keystream = XOR(keystream,  AND(state[2], state[3])); 
        msgblk = XOR(keystream, msgblk);   
         
        _mm_store_si128( (__m128i*)plaintextblock, msgblk); 
        memset(plaintextblock+len,  0, 16-len);  
 
        memcpy( plaintext, plaintextblock, len);
        msgblk= _mm_load_si128((__m128i*)plaintextblock);  

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
        unsigned char plaintextblock[16], ciphertextblock[16];
        __m128i morus_state[5];

        //initialization 
        morus_initialization(k, npub, morus_state);

        //process the associated data
        for (i = 0; (i+16) <= adlen; i += 16) {
              morus_enc_aut_step(ad+i, ciphertextblock, morus_state);
        }

        //deal with the partial block of associated data
        //in this program, we assume that the message length is a multiple of bytes.
        if (  (adlen & 0xf) != 0 )  {
              morus_enc_aut_partialblock(ad+i, ciphertextblock, adlen & 0xf, morus_state); 
        }

        //encrypt the plaintext
        for (i = 0; (i+16) <= mlen; i += 16) {
              morus_enc_aut_step(m+i, c+i, morus_state);
        }

        // Deal with the partial block
        // In this program, we assume that the message length is a multiple of bytes.
        if (  (mlen & 0xf) != 0 )  {
              morus_enc_aut_partialblock(m+i, c+i, mlen & 0xf, morus_state);  
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
        unsigned long i,j;
        unsigned char plaintextblock[16], ciphertextblock[16];
        unsigned char tag[16];
        __m128i morus_state[5];

        morus_initialization(k, npub, morus_state);

        if (clen < 16)  return -1;  

        //process the associated data
        for (i = 0; (i+16) <= adlen; i += 16) {
              morus_enc_aut_step(ad+i, ciphertextblock, morus_state);
        }

        // deal with the partial block of associated data
        // in this program, we assume that the message length is a multiple of bytes.
        if (  (adlen & 0xf) != 0 ) {  
              morus_enc_aut_partialblock(ad+i, ciphertextblock, adlen & 0xf, morus_state); 
        }

        // decrypt the ciphertext
	*mlen = clen - 16; 
        for (i = 0; (i+16) <= *mlen; i += 16) {
              morus_dec_aut_step(m+i, c+i, morus_state);
        }

        // Deal with the partial block
        // In this program, we assume that the message length is a multiple of bytes.
        if (  (*mlen & 0xf) != 0 )  { 
              morus_dec_aut_partialblock(m+i, c+i, *mlen & 0xf, morus_state);
        }

        //we assume that the tag length is a multiple of bytes  
	//verification  
        return morus_tag_verification(*mlen, adlen, c, morus_state);

}

