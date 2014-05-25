#include <string.h>  
#include <immintrin.h>
#include "crypto_aead.h"

/*define data alignment for different C compilers*/
#if defined(__GNUC__)
#define DATA_ALIGN32(x) x __attribute__ ((aligned(32)))
#else
#define DATA_ALIGN32(x) __declspec(align(32)) x
#endif

#ifdef _MSC_VER
#define  inline __inline
#endif

#define n1 13
#define n2 46
#define n3 38
#define n4 7
#define n5 4

#define XOR256(x,y)       _mm256_xor_si256((x),(y))        /*XOR256(x,y) = x ^ y, where x and y are two 256-bit word*/
#define AND256(x,y)       _mm256_and_si256((x),(y))        /*AND(x,y) = x & y, where x and y are two 256-bit word*/
#define ANDNOT256(x,y)    _mm256_andnot_si256((x),(y))     /*ANDNOT(x,y) = (!x) & y, where x and y are two 256-bit word*/
#define OR256(x,y)        _mm256_or_si256((x),(y))         /*OR(x,y)  = x | y, where x and y are two 256-bit word*/
#define SETZERO256()      _mm256_setzero_si256()           /*set the value of 256-bit register to zero*/
#define SETONE256()       _mm256_set_epi32(0xffffffff,0xffffffff,0xffffffff,0xffffffff,0xffffffff,0xffffffff,0xffffffff,0xffffffff)  /*set each bit in the 256-bit register to 1*/

#define XOR(x,y)          _mm_xor_si128((x),(y))       /*XOR(x,y) = x ^ y, where x and y are two 128-bit word*/
#define AND(x,y)          _mm_and_si128((x),(y))       /*AND(x,y) = x & y, where x and y are two 128-bit word*/
#define ANDNOT(x,y)       _mm_andnot_si128((x),(y))    /*ANDNOT(x,y) = (!x) & y, where x and y are two 128-bit word*/
#define OR(x,y)           _mm_or_si128((x),(y))        /*OR(x,y)  = x | y, where x and y are two 128-bit word*/
#define SETZERO()         _mm_setzero_si128()          /*set the value of 128-bit register to zero*/
#define SETONE()          _mm_set_epi8(0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff, 0xff) /*set each bit in the 128-bit register to 1*/

#define ROTL256(x,n)      OR256( _mm256_slli_epi64((x), (n)), _mm256_srli_epi64((x),(64-n)) )   /*Rotate 4 64-bit unsigned integers in x to the left by n-bit positions*/

#define ROTL256_64(x)     _mm256_permute4x64_epi64((x), _MM_SHUFFLE(2,1,0,3))  /*Rotate x by 64-bit  positions to the left*/
#define ROTL256_128(x)    _mm256_permute4x64_epi64((x), _MM_SHUFFLE(1,0,3,2))  /*Rotate x by 128-bit positions to the left*/
#define ROTL256_192(x)    _mm256_permute4x64_epi64((x), _MM_SHUFFLE(0,3,2,1))  /*Rotate x by 192-bit positions to the left*/

#define SHIFTL256_64(x)   _mm256_slli_si256((x), 4)                    /*Shift each 128-bit words in x by 32-bit  positions to the left*/ 

#define STORE(x,p)        _mm_store_si128((__m128i *)(p), (x))         /*store the 128-bit word x into memeory address p, where p is the multile of 16 bytes*/
#define LOAD(p)           _mm_load_si128((__m128i *)(p))               /*load 16 bytes from the memory address p, return a 128-bit word, where p is the multile of 16 bytes*/

#define STORE256(x,p)     _mm256_store_si256((__m256i *)(p), (x))         /*store the 256-bit word x into memeory address p, where p is the multile of 32 bytes*/
#define LOAD256(p)        _mm256_load_si256((__m256i *)(p))               /*load 32 bytes from the memory address p, return a 256-bit word, where p is the multile of 32 bytes*/

/*
void printfxmm(__m256i *state)    //print the state, used for debugging
{
         int i,j;
         DATA_ALIGN32(unsigned char t[32]);
 
         for (i = 0; i < 5; i++) {
                _mm256_store_si256((__m256i*)t, state[i]);
                printf("\n");
                for (j = 0; j < 32; j++) printf("%2x",t[j]);
                printf("\n");
         }
}
*/

void morus_stateupdate(__m256i msgblk, __m256i *state)  
{   
	state[0] = XOR256(state[0], state[3]);  
	state[0] = XOR256(state[0], AND256(state[1], state[2]));   
	state[0] = ROTL256(state[0], n1);  
	state[3] = ROTL256_64(state[3]);    

	state[1] = XOR256(state[1], msgblk);  
	state[1] = XOR256(state[1], state[4]);          
	state[1] = XOR256(state[1], AND256(state[2], state[3]));  
	state[1] = ROTL256(state[1], n2);  
	state[4] = ROTL256_128(state[4]);

	state[2] = XOR256(state[2], msgblk);  
	state[2] = XOR256(state[2], state[0]);  
	state[2] = XOR256(state[2], AND256(state[3], state[4]));  
	state[2] = ROTL256(state[2], n3);  
	state[0] = ROTL256_192(state[0]);  

	state[3] = XOR256(state[3], msgblk);  
	state[3] = XOR256(state[3], state[1]); 
	state[3] = XOR256(state[3], AND256(state[4], state[0]));    
	state[3] = ROTL256(state[3], n4);  
	state[1] = ROTL256_128(state[1]); 

	state[4] = XOR256(state[4], msgblk);    
	state[4] = XOR256(state[4], state[2]);  
	state[4] = XOR256(state[4], AND256(state[0], state[1]));  
	state[4] = ROTL256(state[4], n5);  
	state[2] = ROTL256_64(state[2]);     
}

/* The input to the initialization is the 128-bit key; 128-bit IV; */
void morus_initialization(const unsigned char *key, const unsigned char *iv, __m256i *state)
{
	int i;   
	__m256i tmp = SETZERO256(); 
	DATA_ALIGN32(unsigned char t[32]); 
	__m256i keytmp; 

	memset(t, 0, 32); 
	memcpy(t, iv, 16); 
	state[0] = _mm256_loadu_si256((__m256i*)t);  
	memcpy(t, key, 32); 
	keytmp = _mm256_loadu_si256((__m256i*)t); 
	state[1] = keytmp; 
	state[2] = SETONE256(); 
	state[3] = SETZERO256();  
	state[4] = _mm256_set_epi8(0xdd,0x28,0xb5,0x73,0x42,0x31,0x11,0x20,0xf1,0x2f,0xc2,0x6d,0x55,0x18,0x3d,0xdb, 0x62,0x79,0xe9,0x90,0x59,0x37,0x22,0x15,0x0d,0x08,0x05,0x03,0x02,0x01,0x1, 0x0); 

	for (i = 0; i < 16; i++)
    {       
         morus_stateupdate(tmp, state); 
    }  

	state[1] = XOR256(state[1], keytmp);  
}


//the finalization state of MORUS
void morus_tag_generation(unsigned long long msglen, unsigned long long adlen, unsigned char *c, __m256i *state)
{
	int i;
	DATA_ALIGN32(unsigned char t[32]); 
	__m256i  tmp; 

	_mm256_store_si256((__m256i*)t, state[3]);  

	((unsigned long long*)t)[0] ^= (adlen  << 3);  
	((unsigned long long*)t)[1] ^= (msglen << 3);  

	state[4] = XOR256(state[0], state[4]);  

	tmp = _mm256_load_si256((__m256i*)t);   
	for (i = 0; i < 8; i++) morus_stateupdate(tmp, state);  

	for (i = 2; i < 5; i++) state[1] = XOR256(state[1], state[i]);   

	_mm256_store_si256((__m256i*)t, state[1]);  
	//in this program, the mac length is assumed to be multiple of bytes
	memcpy(c+msglen, t, 16);
}



int morus_tag_verification(unsigned long long msglen, unsigned long long adlen, const unsigned char *c, __m256i *state)
{
	int i;
	DATA_ALIGN32(unsigned char t[32]);  
	__m256i  tmp;   
	int check = 0;  

	_mm256_store_si256((__m256i*)t, state[3]);    

	((unsigned long long*)t)[0] ^= (adlen << 3);  
	((unsigned long long*)t)[1] ^= (msglen << 3);  

	state[4] = XOR256(state[0], state[4]);   

	tmp = _mm256_load_si256((__m256i*)t);   
	for (i = 0; i < 8; i++) morus_stateupdate(tmp, state);     

	for (i = 2; i < 5; i++) state[1] = XOR256(state[1], state[i]);  

	_mm256_store_si256((__m256i*)t, state[1]);
	//in this program, the mac length is assumed to be multiple of bytes
	for (i = 0; i  < 16; i++) check += (c[msglen+i] ^ t[i]);
	if (check == 0) return 0; 
	else return -1; 
}


// one step of encryption: it encrypts a 32-byte block 
inline void morus_enc_aut_step(const unsigned char *plaintext, 
									  unsigned char *ciphertext, __m256i *state)  
{  
	__m256i keystream;  
	__m256i msgblk = _mm256_loadu_si256((__m256i*)plaintext);   

        //encryption 
	keystream = XOR256(state[0], ROTL256_192(state[1])); 
	keystream = XOR256(keystream, AND256(state[2], state[3])); 
	_mm256_storeu_si256((__m256i*)ciphertext, XOR256(keystream, msgblk)); 

	state[0] = XOR256(state[0], state[3]);  
	state[0] = XOR256(state[0], AND256(state[1], state[2]));   
	state[0] = ROTL256(state[0], n1);   
	state[3] = ROTL256_64(state[3]);    

	state[1] = XOR256(state[1], msgblk);  
	state[1] = XOR256(state[1], state[4]);          
	state[1] = XOR256(state[1], AND256(state[2], state[3]));  
	state[1] = ROTL256(state[1], n2);  
	state[4] = ROTL256_128(state[4]);  

	state[2] = XOR256(state[2], msgblk);    
	state[2] = XOR256(state[2], state[0]);  
	state[2] = XOR256(state[2], AND256(state[3], state[4]));  
	state[2] = ROTL256(state[2], n3);  
	state[0] = ROTL256_192(state[0]);  

	state[3] = XOR256(state[3], msgblk);  
	state[3] = XOR256(state[3], state[1]); 
	state[3] = XOR256(state[3], AND256(state[4], state[0]));    
	state[3] = ROTL256(state[3], n4);  
	state[1] = ROTL256_128(state[1]); 

	state[4] = XOR256(state[4], msgblk);    
	state[4] = XOR256(state[4], state[2]);  
	state[4] = XOR256(state[4], AND256(state[0], state[1]));    
	state[4] = ROTL256(state[4], n5);  
	state[2] = ROTL256_64(state[2]);    
}

// one step of decryption: it decrypts 32-byte block  
inline void morus_dec_aut_step(unsigned char *plaintext, const unsigned char *ciphertext, __m256i *state)
{
	__m256i keystream;  
	__m256i msgblk = _mm256_loadu_si256((__m256i*)ciphertext); 

	//decryption 
	keystream = XOR256(state[0], ROTL256_192(state[1])); 
	keystream = XOR256(keystream,  AND256(state[2], state[3])); 
	msgblk = XOR256(keystream, msgblk);  
	_mm256_storeu_si256( (__m256i*)plaintext, msgblk);

	state[0] = XOR256(state[0], state[3]);  
	state[0] = XOR256(state[0], AND256(state[1], state[2]));  
	state[0] = ROTL256(state[0], n1);  
	state[3] = ROTL256_64(state[3]);    

	state[1] = XOR256(state[1], msgblk);  
	state[1] = XOR256(state[1], state[4]);          
	state[1] = XOR256(state[1], AND256(state[2], state[3]));  
	state[1] = ROTL256(state[1], n2);  
	state[4] = ROTL256_128(state[4]);

	state[2] = XOR256(state[2], msgblk);  
	state[2] = XOR256(state[2], state[0]);  
	state[2] = XOR256(state[2], AND256(state[3], state[4]));  
	state[2] = ROTL256(state[2], n3);  
	state[0] = ROTL256_192(state[0]);  

	state[3] = XOR256(state[3], msgblk);  
	state[3] = XOR256(state[3], state[1]); 
	state[3] = XOR256(state[3], AND256(state[4], state[0]));    
	state[3] = ROTL256(state[3], n4);  
	state[1] = ROTL256_128(state[1]); 

	state[4] = XOR256(state[4], msgblk);    
	state[4] = XOR256(state[4], state[2]);  
	state[4] = XOR256(state[4], AND256(state[0], state[1]));  
	state[4] = ROTL256(state[4], n5);  
	state[2] = ROTL256_64(state[2]);     
}


// encrypt a partial block  
void morus_enc_aut_partialblock(const unsigned char *plaintext, unsigned char *ciphertext, unsigned long len, __m256i *state)
{
	unsigned char plaintextblock[32];
	unsigned char ciphertextblock[32];   
	__m256i keystream;  
	__m256i msgblk;  

	memset(plaintextblock, 0, 32);
	memcpy(plaintextblock, plaintext, len);  
	msgblk= _mm256_loadu_si256((__m256i*)plaintextblock);  

	keystream = XOR256(state[0], ROTL256_192(state[1])); 
	keystream = XOR256(keystream, AND256(state[2], state[3]));          
	_mm256_storeu_si256( (__m256i*)ciphertextblock, XOR256(keystream, msgblk) );

	memcpy(ciphertext, ciphertextblock, len);

	morus_stateupdate(msgblk,state);  
}


// decrypt a partial block   
void morus_dec_aut_partialblock(unsigned char *plaintext, const unsigned char *ciphertext, unsigned long len, __m256i *state)
{
	unsigned char plaintextblock[32];
	unsigned char ciphertextblock[32];   
	__m256i keystream;  
	__m256i msgblk;  

	memset(ciphertextblock, 0, 32);
	memcpy(ciphertextblock, ciphertext, len);  
	msgblk= _mm256_loadu_si256((__m256i*)ciphertextblock);  

	keystream = XOR256(state[0], ROTL256_192(state[1])); 
	keystream = XOR256(keystream,  AND256(state[2], state[3])); 
	msgblk = XOR256(keystream, msgblk);   

	_mm256_storeu_si256( (__m256i*)plaintextblock, msgblk); 
	memset(plaintextblock+len,  0, 32-len);  

	memcpy( plaintext, plaintextblock, len);
	msgblk= _mm256_loadu_si256((__m256i*)plaintextblock);  

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
	unsigned long long i,j;

	unsigned char ciphertextblock[32];
	__m256i morus_state[5];

	//initialization stage
	morus_initialization(k, npub, morus_state);

	//process the associated data
	for (i = 0; (i+32) <= adlen; i += 32) 
	{
		morus_enc_aut_step(ad+i, ciphertextblock, morus_state);
	}

	//deal with the partial block of associated data 
	//in this program, we assume that the message length is a multiple of bytes.
	if (  (adlen & 0x1f) != 0 )  
	{
		morus_enc_aut_partialblock(ad+i, ciphertextblock, adlen & 0x1f, morus_state);
	}

	//encrypt the plaintext
	for (i = 0; (i+32) <= mlen; i += 32) {           
		morus_enc_aut_step(m+i, c+i, morus_state);   
	}

	// Deal with the partial block
	// In this program, we assume that the message length is multiple of bytes.
	if (  (mlen & 0x1f) != 0 )  {
		morus_enc_aut_partialblock(m+i, c+i, mlen & 0x1f, morus_state);  
	}

	//finalization stage, we assume that the tag length is multiple of bytes
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
	unsigned long long i,j;
	unsigned char ciphertextblock[32];
	unsigned char tag[16];
	unsigned char check = 0;
	__m256i morus_state[5];

        if (clen < 16)  return -1;   

	morus_initialization(k, npub, morus_state);

	//process the associated data
	for (i = 0; (i+32) <= adlen; i += 32) {
		morus_enc_aut_step(ad+i, ciphertextblock, morus_state);
	}

	//deal with the partial block of associated data
	//in this program, we assume that the message length is multiple of bytes.
	if (  (adlen & 0x1f) != 0 )  {
		morus_enc_aut_partialblock(ad+i, ciphertextblock, adlen & 0x1f, morus_state);
	}

	//decrypt the ciphertext  
	*mlen = clen - 16; 
	for (i = 0; (i+32) <= *mlen; i += 32) {
		morus_dec_aut_step(m+i, c+i, morus_state);
	}

	// Deal with the partial block
	// In this program, we assume that the message length is multiple of bytes.
	if (  (*mlen & 0x1f) != 0 )  {
		morus_dec_aut_partialblock(m+i, c+i, (*mlen) & 0x1f, morus_state);  
	}

	//we assume that the tag length is multiple of bytes
	//verification
	return morus_tag_verification(*mlen, adlen, c, morus_state);
}


