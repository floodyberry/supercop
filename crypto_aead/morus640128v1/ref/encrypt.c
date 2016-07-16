#include "crypto_aead.h"
#include <string.h>

#ifdef _MSC_VER
#define inline __inline
#endif

#define n1 5 
#define n2 31
#define n3 7
#define n4 22
#define n5 13

#define rotl(x,n)   (((x) << (n)) | ((x) >> (32-n)))  

inline void morus_stateupdate(unsigned int msgblk[], unsigned int state[][4])    
{   
        unsigned int temp;  

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
void morus_initialization(const unsigned char *key, const unsigned char *iv, unsigned int state[][4])
{
        int i;
        unsigned int temp[4]  = {0,0,0,0}; 
        unsigned char con0[16] = {0x0,0x1,0x01,0x02,0x03,0x05,0x08,0x0d,0x15,0x22,0x37,0x59,0x90,0xe9,0x79,0x62}; 
	unsigned char con1[16] = {0xdb, 0x3d, 0x18, 0x55, 0x6d, 0xc2, 0x2f, 0xf1, 0x20, 0x11, 0x31, 0x42, 0x73, 0xb5, 0x28, 0xdd}; 

	memcpy(state[0], iv,   16);
        memcpy(state[1], key,  16);  
        memset(state[2], 0xff, 16);   
        memcpy(state[3], con0, 16);  
        memcpy(state[4], con1, 16);  

        for (i = 0; i < 4;  i++) temp[i] = 0;  
        for (i = 0; i < 16; i++) morus_stateupdate(temp, state); 
        for (i = 0; i < 4;  i++) state[1][i] ^= ((unsigned int*)key)[i]; 
}

//the finalization state of MORUS
void morus_tag_generation(unsigned long long msglen, unsigned long long adlen, unsigned char *c, unsigned int state[][4])
{
        int i,j;
        unsigned char t[16]; 

        memcpy(t, state[3], 16); 

        ((unsigned long long*)t)[0] ^= (adlen << 3);
        ((unsigned long long*)t)[1] ^= (msglen << 3);

	state[4][0] ^= state[0][0]; state[4][1] ^= state[0][1]; state[4][2] ^= state[0][2]; state[4][3] ^= state[0][3]; 

        for (i = 0; i < 8; i++) morus_stateupdate((unsigned int*)t, state);  

        for (i = 2; i < 5; i++) {
        for (j = 0; j < 4; j++) { 
            state[1][j] ^= state[i][j];             
        }}
	//in this program, the mac length is assumed to be a multiple of bytes
	memcpy(c+msglen, state[1], 16);  
}

int morus_tag_verification(unsigned long long msglen, unsigned long long adlen, const unsigned char *c, unsigned int state[][4])
{
	int i,j;
	unsigned char t[16]; 
	int check = 0; 

	memcpy(t, state[3], 16); 

	((unsigned long long*)t)[0] ^= adlen << 3;
	((unsigned long long*)t)[1] ^= msglen << 3;

	state[4][0] ^= state[0][0]; state[4][1] ^= state[0][1]; state[4][2] ^= state[0][2]; state[4][3] ^= state[0][3]; 

        for (i = 0; i < 8; i++) morus_stateupdate((unsigned int*)t, state);  

        for (i = 2; i < 5; i++) {
        for (j = 0; j < 4; j++) { 
             state[1][j] ^= state[i][j];             
        }}
	//in this program, the mac length is assumed to be a multiple of bytes
	for (i = 0; i < 16; i++)  check |= (c[msglen+i] ^ ((unsigned char *)state[1])[i]);
	if (check == 0) return 0; 
        else return -1;
}

// one step of encryption: it encrypts a 16-byte block 
inline void morus_enc_aut_step(const unsigned char *plaintextblock, unsigned char *ciphertextblock, unsigned int state[][4])  
{  

        //encryption   
        ((unsigned int*)ciphertextblock)[0] = ((unsigned int*)plaintextblock)[0] ^ state[0][0] ^ state[1][1] ^ (state[2][0] & state[3][0]); 
        ((unsigned int*)ciphertextblock)[1] = ((unsigned int*)plaintextblock)[1] ^ state[0][1] ^ state[1][2] ^ (state[2][1] & state[3][1]); 
        ((unsigned int*)ciphertextblock)[2] = ((unsigned int*)plaintextblock)[2] ^ state[0][2] ^ state[1][3] ^ (state[2][2] & state[3][2]); 
        ((unsigned int*)ciphertextblock)[3] = ((unsigned int*)plaintextblock)[3] ^ state[0][3] ^ state[1][0] ^ (state[2][3] & state[3][3]); 

        morus_stateupdate(((unsigned int*)plaintextblock), state);     
}


// one step of decryption: it decrypts a 16-byte block 
inline void morus_dec_aut_step(unsigned char *plaintextblock, const unsigned char *ciphertextblock, unsigned int state[][4])  
{  
        //decryption   
        ((unsigned int*)plaintextblock)[0] = ((unsigned int*)ciphertextblock)[0] ^ state[0][0] ^ state[1][1] ^ (state[2][0] & state[3][0]); 
        ((unsigned int*)plaintextblock)[1] = ((unsigned int*)ciphertextblock)[1] ^ state[0][1] ^ state[1][2] ^ (state[2][1] & state[3][1]); 
        ((unsigned int*)plaintextblock)[2] = ((unsigned int*)ciphertextblock)[2] ^ state[0][2] ^ state[1][3] ^ (state[2][2] & state[3][2]); 
        ((unsigned int*)plaintextblock)[3] = ((unsigned int*)ciphertextblock)[3] ^ state[0][3] ^ state[1][0] ^ (state[2][3] & state[3][3]); 

        morus_stateupdate(((unsigned int*)plaintextblock), state);     
}


// encrypt a partial block  
void morus_enc_aut_partialblock(const unsigned char *plaintext, unsigned char *ciphertext, unsigned long long len, unsigned int state[][4])
{
        unsigned char plaintextblock[16], ciphertextblock[16];   

        memset(plaintextblock, 0, 16);
        memcpy(plaintextblock, plaintext, len);  

        //encryption   
        ((unsigned int*)ciphertextblock)[0] = ((unsigned int*)plaintextblock)[0] ^ state[0][0] ^ state[1][1] ^ (state[2][0] & state[3][0]); 
        ((unsigned int*)ciphertextblock)[1] = ((unsigned int*)plaintextblock)[1] ^ state[0][1] ^ state[1][2] ^ (state[2][1] & state[3][1]); 
        ((unsigned int*)ciphertextblock)[2] = ((unsigned int*)plaintextblock)[2] ^ state[0][2] ^ state[1][3] ^ (state[2][2] & state[3][2]); 
        ((unsigned int*)ciphertextblock)[3] = ((unsigned int*)plaintextblock)[3] ^ state[0][3] ^ state[1][0] ^ (state[2][3] & state[3][3]); 

        morus_stateupdate(((unsigned int*)plaintextblock), state);     

        memcpy(ciphertext, ciphertextblock, len);
}


// decrypt a partial block  
void morus_dec_aut_partialblock(unsigned char *plaintext, const unsigned char *ciphertext, unsigned long long len, unsigned int state[][4])
{
        unsigned char plaintextblock[16], ciphertextblock[16],pb[16];   

        memset(ciphertextblock, 0, 16); 
        memcpy(ciphertextblock, ciphertext, len);  

        //decryption   
        ((unsigned int*)plaintextblock)[0] = ((unsigned int*)ciphertextblock)[0] ^ state[0][0] ^ state[1][1] ^ (state[2][0] & state[3][0]); 
        ((unsigned int*)plaintextblock)[1] = ((unsigned int*)ciphertextblock)[1] ^ state[0][1] ^ state[1][2] ^ (state[2][1] & state[3][1]); 
        ((unsigned int*)plaintextblock)[2] = ((unsigned int*)ciphertextblock)[2] ^ state[0][2] ^ state[1][3] ^ (state[2][2] & state[3][2]); 
        ((unsigned int*)plaintextblock)[3] = ((unsigned int*)ciphertextblock)[3] ^ state[0][3] ^ state[1][0] ^ (state[2][3] & state[3][3]); 

        memcpy(plaintext, plaintextblock, len);
        memset(plaintextblock, 0, 16);   
        memcpy(plaintextblock, plaintext, len);  
         
        morus_stateupdate(((unsigned int*)plaintextblock), state);  
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
        unsigned long long i;
        unsigned char plaintextblock[16], ciphertextblock[16];
        unsigned int morus_state[5][4];

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
        unsigned char check = 0;
        unsigned int morus_state[5][4];

        if (clen < 16) return -1; 

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
        if (  ((*mlen) & 0xf) != 0 )  { 
              morus_dec_aut_partialblock(m+i, c+i, (*mlen) & 0xf, morus_state);
        }

        //we assume that the tag length is a multiple of bytes  
        //verification  
        return morus_tag_verification(*mlen, adlen, c, morus_state); 
}

