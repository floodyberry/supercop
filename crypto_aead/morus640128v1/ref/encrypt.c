#include "crypto_aead.h"
#include <string.h>
#include <stdint.h>

#ifdef _MSC_VER
#define inline __inline
#endif

#define n1 5 
#define n2 31
#define n3 7
#define n4 22
#define n5 13

#define rotl(x,n)   (((x) << (n)) | ((x) >> (32-n)))  

static inline void morus_stateupdate(uint32_t* msgblk, uint32_t state[][4])   // call it as fun(state)    
{   
        uint32_t temp;  

        state[0][0] ^= state[3][0]; state[0][1] ^= state[3][1]; state[0][2] ^= state[3][2]; state[0][3] ^= state[3][3]; 
        state[0][0] ^= state[1][0] & state[2][0]; state[0][1] ^= state[1][1] & state[2][1]; state[0][2] ^= state[1][2] & state[2][2]; state[0][3] ^= state[1][3] & state[2][3];     
        state[0][0] = rotl(state[0][0],n1);  state[0][1] = rotl(state[0][1],n1);       state[0][2] = rotl(state[0][2],n1);       state[0][3] = rotl(state[0][3],n1);  
        temp = state[3][3];    state[3][3] = state[3][2];  state[3][2] = state[3][1];  state[3][1] = state[3][0];  state[3][0] = temp;  

        state[1][0] ^= msgblk[0];   state[1][1] ^= msgblk[1];   state[1][2] ^= msgblk[2];   state[1][3] ^= msgblk[3];
        state[1][0] ^= state[4][0]; state[1][1] ^= state[4][1]; state[1][2] ^= state[4][2]; state[1][3] ^= state[4][3]; 
        state[1][0] ^= (state[2][0] & state[3][0]); state[1][1] ^= (state[2][1] & state[3][1]); state[1][2] ^= (state[2][2] & state[3][2]); state[1][3] ^= (state[2][3] & state[3][3]);     
        state[1][0] = rotl(state[1][0],n2);  state[1][1] = rotl(state[1][1],n2);       state[1][2] = rotl(state[1][2],n2);       state[1][3] = rotl(state[1][3],n2); 
        temp = state[4][3];    state[4][3] = state[4][1];  state[4][1] = temp;     
        temp = state[4][2];    state[4][2] = state[4][0];  state[4][0] = temp;     

        state[2][0] ^= msgblk[0];   state[2][1] ^= msgblk[1];   state[2][2] ^= msgblk[2];   state[2][3] ^= msgblk[3];
        state[2][0] ^= state[0][0]; state[2][1] ^= state[0][1]; state[2][2] ^= state[0][2]; state[2][3] ^= state[0][3]; 
        state[2][0] ^= state[3][0] & state[4][0]; state[2][1] ^= state[3][1] & state[4][1]; state[2][2] ^= state[3][2] & state[4][2]; state[2][3] ^= state[3][3] & state[4][3];     
        state[2][0] = rotl(state[2][0],n3);  state[2][1] = rotl(state[2][1],n3);       state[2][2] = rotl(state[2][2],n3);       state[2][3] = rotl(state[2][3],n3);  
        temp = state[0][0];    state[0][0] = state[0][1];  state[0][1] = state[0][2];  state[0][2] = state[0][3];  state[0][3] = temp;  

        state[3][0] ^= msgblk[0];   state[3][1] ^= msgblk[1];   state[3][2] ^= msgblk[2];   state[3][3] ^= msgblk[3];
        state[3][0] ^= state[1][0]; state[3][1] ^= state[1][1]; state[3][2] ^= state[1][2]; state[3][3] ^= state[1][3]; 
        state[3][0] ^= state[4][0] & state[0][0]; state[3][1] ^= state[4][1] & state[0][1]; state[3][2] ^= state[4][2] & state[0][2]; state[3][3] ^= state[4][3] & state[0][3];     
        state[3][0] = rotl(state[3][0],n4);  state[3][1] = rotl(state[3][1],n4);       state[3][2] = rotl(state[3][2],n4);       state[3][3] = rotl(state[3][3],n4);  
        temp = state[1][3];    state[1][3] = state[1][1];  state[1][1] = temp;     
        temp = state[1][2];    state[1][2] = state[1][0];  state[1][0] = temp;     

        state[4][0] ^= msgblk[0];   state[4][1] ^= msgblk[1];   state[4][2] ^= msgblk[2];   state[4][3] ^= msgblk[3];
        state[4][0] ^= state[2][0]; state[4][1] ^= state[2][1]; state[4][2] ^= state[2][2]; state[4][3] ^= state[2][3]; 
        state[4][0] ^= state[0][0] & state[1][0]; state[4][1] ^= state[0][1] & state[1][1]; state[4][2] ^= state[0][2] & state[1][2]; state[4][3] ^= state[0][3] & state[1][3];     
        state[4][0] = rotl(state[4][0],n5);  state[4][1] = rotl(state[4][1],n5);       state[4][2] = rotl(state[4][2],n5);       state[4][3] = rotl(state[4][3],n5);  
        temp = state[2][3];    state[2][3] = state[2][2];  state[2][2] = state[2][1];  state[2][1] = state[2][0];  state[2][0] = temp;  
}

/*The input to the initialization is the 128-bit key; 128-bit IV;*/
void morus_initialization(const uint8_t *key, const uint8_t *iv, uint32_t state[][4])
{
        int i;
        uint32_t temp[4]  = {0,0,0,0}; 
        uint8_t con0[16] = {0x0,0x1,0x01,0x02,0x03,0x05,0x08,0x0d,0x15,0x22,0x37,0x59,0x90,0xe9,0x79,0x62}; 
		uint8_t con1[16] = {0xdb, 0x3d, 0x18, 0x55, 0x6d, 0xc2, 0x2f, 0xf1, 0x20, 0x11, 0x31, 0x42, 0x73, 0xb5, 0x28, 0xdd}; 

		memcpy(state[0], iv, 16);
        memcpy(state[1], key, 16);  
        memset(state[2],0xff,16);   
        memcpy(state[3], con0, 16);  
        memcpy(state[4], con1, 16);  

        for (i = 0; i < 4;  i++) temp[i] = 0;  
        for (i = 0; i < 16; i++) morus_stateupdate(temp, state); 
        for (i = 0; i < 4;  i++) state[1][i] ^= ((uint32_t*)key)[i]; 
}


//the finalization state of MORUS
void morus_tag_generation(uint64_t msglen, uint64_t adlen, uint8_t *c, uint32_t state[][4])
{
        int i,j;
        uint8_t t[16]; 

        memcpy(t, state[3], 16); 

        ((uint64_t*)t)[0] ^= (adlen << 3);
        ((uint64_t*)t)[1] ^= (msglen << 3);

		state[4][0] ^= state[0][0]; state[4][1] ^= state[0][1]; state[4][2] ^= state[0][2]; state[4][3] ^= state[0][3]; 

        for (i = 0; i < 8; i++) morus_stateupdate((uint32_t*)t, state);  

        for (i = 2; i < 5; i++) {
        for (j = 0; j < 4; j++) { 
            state[1][j] ^= state[i][j];             
        }}
		//in this program, the mac length is assumed to be a multiple of bytes
		memcpy(c+msglen, state[1], 16);
}

int morus_tag_verification(uint64_t msglen, uint64_t adlen, const uint8_t *c, uint32_t state[][4])
{
	int i,j;
	uint8_t t[16]; 
	int check = 0; 

	memcpy(t, state[3], 16); 

	((uint64_t*)t)[0] ^= adlen << 3;
	((uint64_t*)t)[1] ^= msglen << 3;

	state[4][0] ^= state[0][0]; state[4][1] ^= state[0][1]; state[4][2] ^= state[0][2]; state[4][3] ^= state[0][3]; 

	for (i = 0; i < 8; i++) morus_stateupdate((uint32_t*)t, state);  

	for (i = 2; i < 5; i++) {
		for (j = 0; j < 4; j++) { 
			state[1][j] ^= state[i][j];             
		}}
	//in this program, the mac length is assumed to be a multiple of bytes
	for (i = 0; i  < 16; i++) check |= (c[msglen+i] ^ ((unsigned char *)state[1])[i]);
	if (0 == check) return 0; else return -1;
}

// one step of encryption: it encrypts a 16-byte block 
static inline void morus_enc_aut_step(const uint8_t *plaintextblock, uint8_t *ciphertextblock, uint32_t state[][4])  
{  

        //encryption   
        ((uint32_t*)ciphertextblock)[0] = ((uint32_t*)plaintextblock)[0] ^ state[0][0] ^ state[1][1] ^ (state[2][0] & state[3][0]); 
        ((uint32_t*)ciphertextblock)[1] = ((uint32_t*)plaintextblock)[1] ^ state[0][1] ^ state[1][2] ^ (state[2][1] & state[3][1]); 
        ((uint32_t*)ciphertextblock)[2] = ((uint32_t*)plaintextblock)[2] ^ state[0][2] ^ state[1][3] ^ (state[2][2] & state[3][2]); 
        ((uint32_t*)ciphertextblock)[3] = ((uint32_t*)plaintextblock)[3] ^ state[0][3] ^ state[1][0] ^ (state[2][3] & state[3][3]); 

        morus_stateupdate(((uint32_t*)plaintextblock), state);     
}


// one step of decryption: it decrypts a 16-byte block 
static inline void morus_dec_aut_step(uint8_t *plaintextblock, const uint8_t *ciphertextblock, uint32_t state[][4])  
{  
        //decryption   
        ((uint32_t*)plaintextblock)[0] = ((uint32_t*)ciphertextblock)[0] ^ state[0][0] ^ state[1][1] ^ (state[2][0] & state[3][0]); 
        ((uint32_t*)plaintextblock)[1] = ((uint32_t*)ciphertextblock)[1] ^ state[0][1] ^ state[1][2] ^ (state[2][1] & state[3][1]); 
        ((uint32_t*)plaintextblock)[2] = ((uint32_t*)ciphertextblock)[2] ^ state[0][2] ^ state[1][3] ^ (state[2][2] & state[3][2]); 
        ((uint32_t*)plaintextblock)[3] = ((uint32_t*)ciphertextblock)[3] ^ state[0][3] ^ state[1][0] ^ (state[2][3] & state[3][3]); 

        morus_stateupdate(((uint32_t*)plaintextblock), state);     
}


// encrypt a partial block  
void morus_enc_aut_partialblock(const uint8_t *plaintext, uint8_t *ciphertext, uint64_t len, uint32_t state[][4])
{
        uint8_t plaintextblock[16], ciphertextblock[16];   

        memset(plaintextblock, 0, 16);
        memcpy(plaintextblock, plaintext, len);  

        //encryption   
        ((uint32_t*)ciphertextblock)[0] = ((uint32_t*)plaintextblock)[0] ^ state[0][0] ^ state[1][1] ^ (state[2][0] & state[3][0]); 
        ((uint32_t*)ciphertextblock)[1] = ((uint32_t*)plaintextblock)[1] ^ state[0][1] ^ state[1][2] ^ (state[2][1] & state[3][1]); 
        ((uint32_t*)ciphertextblock)[2] = ((uint32_t*)plaintextblock)[2] ^ state[0][2] ^ state[1][3] ^ (state[2][2] & state[3][2]); 
        ((uint32_t*)ciphertextblock)[3] = ((uint32_t*)plaintextblock)[3] ^ state[0][3] ^ state[1][0] ^ (state[2][3] & state[3][3]); 

        morus_stateupdate(((uint32_t*)plaintextblock), state);     

        memcpy(ciphertext, ciphertextblock, len);
}


// decrypt a partial block  
void morus_dec_aut_partialblock(uint8_t *plaintext, const uint8_t *ciphertext, unsigned long len, uint32_t state[][4])
{
        uint8_t plaintextblock[16], ciphertextblock[16];   

        memset(ciphertextblock, 0, 16);  
		memset(plaintext, 0, 16); 
        memcpy(ciphertextblock, ciphertext, len);  

        //decryption   
        ((uint32_t*)plaintextblock)[0] = ((uint32_t*)ciphertextblock)[0] ^ state[0][0] ^ state[1][1] ^ (state[2][0] & state[3][0]); 
        ((uint32_t*)plaintextblock)[1] = ((uint32_t*)ciphertextblock)[1] ^ state[0][1] ^ state[1][2] ^ (state[2][1] & state[3][1]); 
        ((uint32_t*)plaintextblock)[2] = ((uint32_t*)ciphertextblock)[2] ^ state[0][2] ^ state[1][3] ^ (state[2][2] & state[3][2]); 
        ((uint32_t*)plaintextblock)[3] = ((uint32_t*)ciphertextblock)[3] ^ state[0][3] ^ state[1][0] ^ (state[2][3] & state[3][3]); 

		memset(plaintextblock+len, 0, 16-len);

        morus_stateupdate(((uint32_t*)plaintextblock), state);     

        memcpy(plaintext, plaintextblock, len);
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
        uint8_t plaintextblock[16], ciphertextblock[16];
        uint32_t morus_state[5][4];

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
        uint8_t plaintextblock[16], ciphertextblock[16];
        uint8_t tag[16];
        uint8_t check = 0;
        uint32_t  morus_state[5][4];

        morus_initialization(k, npub, morus_state);

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

