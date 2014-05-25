#include <string.h>
#include <stdint.h>
#include "crypto_aead.h" 

#ifdef _MSC_VER
#define inline __inline
#endif

#define n1 13
#define n2 46
#define n3 38
#define n4 7
#define n5 4

#define rotl(x,n)      (((x) << (n)) | ((x) >> (64-n)))

/* print state
void printm(uint64_t state[][4])
{
    int i,j;
    for (i = 0; i < 5; i++) {
        for (j = 0; j < 4; j++) {
            printf("%16x  ", state[i][j]);
        }
        printf("\n");
    }
}
*/

void morus_stateupdate(const uint64_t* msgblk, uint64_t state[][4])   // call it as fun(state)
{
        uint64_t temp,temp1;

        state[0][0] ^= state[3][0]; state[0][1] ^= state[3][1]; state[0][2] ^= state[3][2]; state[0][3] ^= state[3][3];
        temp = state[3][3];    state[3][3] = state[3][2];  state[3][2] = state[3][1];  state[3][1] = state[3][0];  state[3][0] = temp;        
        state[0][0] ^= state[1][0] & state[2][0]; state[0][1] ^= state[1][1] & state[2][1]; state[0][2] ^= state[1][2] & state[2][2]; state[0][3] ^= state[1][3] & state[2][3];
        state[0][0] = rotl(state[0][0],n1);  state[0][1] = rotl(state[0][1],n1);       state[0][2] = rotl(state[0][2],n1);       state[0][3] = rotl(state[0][3],n1);
        
        state[1][0] ^= msgblk[0];   state[1][1] ^= msgblk[1];   state[1][2] ^= msgblk[2];   state[1][3] ^= msgblk[3];
        state[1][0] ^= state[4][0]; state[1][1] ^= state[4][1]; state[1][2] ^= state[4][2]; state[1][3] ^= state[4][3];
        temp = state[4][3];    state[4][3] = state[4][1];  state[4][1] = temp;
        temp1= state[4][2];    state[4][2] = state[4][0];  state[4][0] = temp1;
        state[1][0] ^= (state[2][0] & state[3][0]); state[1][1] ^= (state[2][1] & state[3][1]); state[1][2] ^= (state[2][2] & state[3][2]); state[1][3] ^= (state[2][3] & state[3][3]);
        state[1][0] = rotl(state[1][0],n2);  state[1][1] = rotl(state[1][1],n2);       state[1][2] = rotl(state[1][2],n2);       state[1][3] = rotl(state[1][3],n2);

        state[2][0] ^= msgblk[0];   state[2][1] ^= msgblk[1];   state[2][2] ^= msgblk[2];   state[2][3] ^= msgblk[3];
        state[2][0] ^= state[0][0]; state[2][1] ^= state[0][1]; state[2][2] ^= state[0][2]; state[2][3] ^= state[0][3];
        temp = state[0][0];    state[0][0] = state[0][1];  state[0][1] = state[0][2];  state[0][2] = state[0][3];  state[0][3] = temp;
        state[2][0] ^= state[3][0] & state[4][0]; state[2][1] ^= state[3][1] & state[4][1]; state[2][2] ^= state[3][2] & state[4][2]; state[2][3] ^= state[3][3] & state[4][3];
        state[2][0] = rotl(state[2][0],n3);  state[2][1] = rotl(state[2][1],n3);       state[2][2] = rotl(state[2][2],n3);       state[2][3] = rotl(state[2][3],n3);

        state[3][0] ^= msgblk[0];   state[3][1] ^= msgblk[1];   state[3][2] ^= msgblk[2];   state[3][3] ^= msgblk[3];
        state[3][0] ^= state[1][0]; state[3][1] ^= state[1][1]; state[3][2] ^= state[1][2]; state[3][3] ^= state[1][3];
        temp = state[1][3];    state[1][3] = state[1][1];  state[1][1] = temp;
        temp1= state[1][2];    state[1][2] = state[1][0];  state[1][0] = temp1;
        state[3][0] ^= state[4][0] & state[0][0]; state[3][1] ^= state[4][1] & state[0][1]; state[3][2] ^= state[4][2] & state[0][2]; state[3][3] ^= state[4][3] & state[0][3];
        state[3][0] = rotl(state[3][0],n4);  state[3][1] = rotl(state[3][1],n4);       state[3][2] = rotl(state[3][2],n4);       state[3][3] = rotl(state[3][3],n4);

        state[4][0] ^= msgblk[0];   state[4][1] ^= msgblk[1];   state[4][2] ^= msgblk[2];   state[4][3] ^= msgblk[3];
        state[4][0] ^= state[2][0]; state[4][1] ^= state[2][1]; state[4][2] ^= state[2][2]; state[4][3] ^= state[2][3];
        temp = state[2][3];    state[2][3] = state[2][2];  state[2][2] = state[2][1];  state[2][1] = state[2][0];  state[2][0] = temp;
        state[4][0] ^= state[0][0] & state[1][0]; state[4][1] ^= state[0][1] & state[1][1]; state[4][2] ^= state[0][2] & state[1][2]; state[4][3] ^= state[0][3] & state[1][3];
        state[4][0] = rotl(state[4][0],n5);  state[4][1] = rotl(state[4][1],n5);       state[4][2] = rotl(state[4][2],n5);       state[4][3] = rotl(state[4][3],n5);
}

/*The input to the initialization is the 128/256-bit key; 128-bit IV;*/
void morus_initialization(const uint8_t *key, const uint8_t *iv, uint64_t state[][4])
{
        int i;
        uint64_t temp[4]  = {0,0,0,0};
        uint8_t con[32] = {0x0,0x1,0x01,0x02,0x03,0x05,0x08,0x0d,0x15,0x22,0x37,0x59,0x90,0xe9,0x79,0x62, 0xdb, 0x3d, 0x18, 0x55, 0x6d, 0xc2, 0x2f, 0xf1, 0x20, 0x11, 0x31, 0x42, 0x73, 0xb5, 0x28, 0xdd};
	uint64_t ekey[4];

	memcpy(ekey, key, 16);
	ekey[3] = ekey[1]; ekey[2] = ekey[0];
	memcpy(state[0], iv, 16);   memset(state[0]+2, 0, 16);
        memcpy(state[1], ekey, 32);
	memset(state[2], 0xff, 32);
        memset(state[3], 0, 32);
        memcpy(state[4], con, 32);

        for (i = 0; i < 4;  i++) temp[i] = 0;
        for (i = 0; i < 16; i++) morus_stateupdate(temp, state);
        for (i = 0; i < 4;  i++) state[1][i] ^= ((uint64_t*)ekey)[i];
}


//the finalization state of MORUS
void morus_tag_generation(uint64_t msglen, uint64_t adlen, uint8_t *c, uint64_t state[][4])
{
        int i,j;
        uint8_t t[32];

        memcpy(t, state[3], 32);

        ((uint64_t*)t)[0] ^= (adlen << 3);
        ((uint64_t*)t)[1] ^= (msglen << 3);

	state[4][0] ^= state[0][0]; state[4][1] ^= state[0][1]; state[4][2] ^= state[0][2]; state[4][3] ^= state[0][3];

        for (i = 0; i < 8; i++) morus_stateupdate((uint64_t*)t, state);

        for (i = 2; i < 5; i++) {
        for (j = 0; j < 4; j++) {
            state[1][j] ^= state[i][j];
        }}

        //in this program, the mac length is assumed to be a multiple of bytes
        memcpy(c+msglen,state[1], 16);
}

int morus_tag_verification(uint64_t msglen, uint64_t adlen, const uint8_t *c, uint64_t state[][4])
{
	int i,j;
	uint8_t t[32];  
	int check = 0;  

	memcpy(t, state[3], 32);  

	((uint64_t*)t)[0] ^= (adlen << 3);  
	((uint64_t*)t)[1] ^= (msglen << 3); 

	state[4][0] ^= state[0][0]; state[4][1] ^= state[0][1]; state[4][2] ^= state[0][2]; state[4][3] ^= state[0][3];

	for (i = 0; i < 8; i++) morus_stateupdate((uint64_t*)t, state);

        for (i = 2; i < 5; i++) { 
        for (j = 0; j < 4; j++) { 
            state[1][j] ^= state[i][j];
        }}

	//in this program, the mac length is assumed to be a multiple of bytes
	//verification
	for (i = 0; i  < 16; i++) check |= (c[msglen + i] ^ ((uint8_t *)state[1])[i]);
	if (0 == check) return 0;  
	else return -1;

}


// one step of encryption: it encrypts a 32-byte block
void morus_enc_aut_step(const uint8_t *plaintextblock, uint8_t *ciphertextblock, uint64_t state[5][4])
{
        uint64_t temp,temp1;

        //encryption
        ((uint64_t*)ciphertextblock)[0] = ((uint64_t*)plaintextblock)[0] ^ state[0][0] ^ state[1][1] ^ (state[2][0] & state[3][0]);
        ((uint64_t*)ciphertextblock)[1] = ((uint64_t*)plaintextblock)[1] ^ state[0][1] ^ state[1][2] ^ (state[2][1] & state[3][1]);
        ((uint64_t*)ciphertextblock)[2] = ((uint64_t*)plaintextblock)[2] ^ state[0][2] ^ state[1][3] ^ (state[2][2] & state[3][2]);
        ((uint64_t*)ciphertextblock)[3] = ((uint64_t*)plaintextblock)[3] ^ state[0][3] ^ state[1][0] ^ (state[2][3] & state[3][3]);

        state[0][0] ^= state[3][0]; state[0][1] ^= state[3][1]; state[0][2] ^= state[3][2]; state[0][3] ^= state[3][3];
        temp = state[3][3];    state[3][3] = state[3][2];  state[3][2] = state[3][1];  state[3][1] = state[3][0];  state[3][0] = temp;        
        state[0][0] ^= state[1][0] & state[2][0]; state[0][1] ^= state[1][1] & state[2][1]; state[0][2] ^= state[1][2] & state[2][2]; state[0][3] ^= state[1][3] & state[2][3];
        state[0][0] = rotl(state[0][0],n1);  state[0][1] = rotl(state[0][1],n1);       state[0][2] = rotl(state[0][2],n1);       state[0][3] = rotl(state[0][3],n1);
        
        state[1][0] ^= ((uint64_t*)plaintextblock)[0];   state[1][1] ^= ((uint64_t*)plaintextblock)[1];   state[1][2] ^= ((uint64_t*)plaintextblock)[2];   state[1][3] ^= ((uint64_t*)plaintextblock)[3];
        state[1][0] ^= state[4][0]; state[1][1] ^= state[4][1]; state[1][2] ^= state[4][2]; state[1][3] ^= state[4][3];
        temp = state[4][3];    state[4][3] = state[4][1];  state[4][1] = temp;
        temp1= state[4][2];    state[4][2] = state[4][0];  state[4][0] = temp1;
        state[1][0] ^= (state[2][0] & state[3][0]); state[1][1] ^= (state[2][1] & state[3][1]); state[1][2] ^= (state[2][2] & state[3][2]); state[1][3] ^= (state[2][3] & state[3][3]);
        state[1][0] = rotl(state[1][0],n2);  state[1][1] = rotl(state[1][1],n2);       state[1][2] = rotl(state[1][2],n2);       state[1][3] = rotl(state[1][3],n2);

        state[2][0] ^= ((uint64_t*)plaintextblock)[0];   state[2][1] ^= ((uint64_t*)plaintextblock)[1];   state[2][2] ^= ((uint64_t*)plaintextblock)[2];   state[2][3] ^= ((uint64_t*)plaintextblock)[3];
        state[2][0] ^= state[0][0]; state[2][1] ^= state[0][1]; state[2][2] ^= state[0][2]; state[2][3] ^= state[0][3];
        temp = state[0][0];    state[0][0] = state[0][1];  state[0][1] = state[0][2];  state[0][2] = state[0][3];  state[0][3] = temp;
        state[2][0] ^= state[3][0] & state[4][0]; state[2][1] ^= state[3][1] & state[4][1]; state[2][2] ^= state[3][2] & state[4][2]; state[2][3] ^= state[3][3] & state[4][3];
        state[2][0] = rotl(state[2][0],n3);  state[2][1] = rotl(state[2][1],n3);       state[2][2] = rotl(state[2][2],n3);       state[2][3] = rotl(state[2][3],n3);

        state[3][0] ^= ((uint64_t*)plaintextblock)[0];   state[3][1] ^= ((uint64_t*)plaintextblock)[1];   state[3][2] ^= ((uint64_t*)plaintextblock)[2];   state[3][3] ^= ((uint64_t*)plaintextblock)[3];
        state[3][0] ^= state[1][0]; state[3][1] ^= state[1][1]; state[3][2] ^= state[1][2]; state[3][3] ^= state[1][3];
        temp = state[1][3];    state[1][3] = state[1][1];  state[1][1] = temp;
        temp1= state[1][2];    state[1][2] = state[1][0];  state[1][0] = temp1;
        state[3][0] ^= state[4][0] & state[0][0]; state[3][1] ^= state[4][1] & state[0][1]; state[3][2] ^= state[4][2] & state[0][2]; state[3][3] ^= state[4][3] & state[0][3];
        state[3][0] = rotl(state[3][0],n4);  state[3][1] = rotl(state[3][1],n4);       state[3][2] = rotl(state[3][2],n4);       state[3][3] = rotl(state[3][3],n4);

        state[4][0] ^= ((uint64_t*)plaintextblock)[0];   state[4][1] ^= ((uint64_t*)plaintextblock)[1];   state[4][2] ^= ((uint64_t*)plaintextblock)[2];   state[4][3] ^= ((uint64_t*)plaintextblock)[3];
        state[4][0] ^= state[2][0]; state[4][1] ^= state[2][1]; state[4][2] ^= state[2][2]; state[4][3] ^= state[2][3];
        temp = state[2][3];    state[2][3] = state[2][2];  state[2][2] = state[2][1];  state[2][1] = state[2][0];  state[2][0] = temp;
        state[4][0] ^= state[0][0] & state[1][0]; state[4][1] ^= state[0][1] & state[1][1]; state[4][2] ^= state[0][2] & state[1][2]; state[4][3] ^= state[0][3] & state[1][3];
        state[4][0] = rotl(state[4][0],n5);  state[4][1] = rotl(state[4][1],n5);       state[4][2] = rotl(state[4][2],n5);       state[4][3] = rotl(state[4][3],n5);

}

// one step of decryption: it decrypts a 32-byte block
void morus_dec_aut_step(uint8_t *plaintextblock,
                   const uint8_t *ciphertextblock, uint64_t state[][4])
{
        uint64_t temp,temp1;

        //decryption
        ((uint64_t*)plaintextblock)[0] = ((uint64_t*)ciphertextblock)[0] ^ state[0][0] ^ state[1][1] ^ (state[2][0] & state[3][0]);
        ((uint64_t*)plaintextblock)[1] = ((uint64_t*)ciphertextblock)[1] ^ state[0][1] ^ state[1][2] ^ (state[2][1] & state[3][1]);
        ((uint64_t*)plaintextblock)[2] = ((uint64_t*)ciphertextblock)[2] ^ state[0][2] ^ state[1][3] ^ (state[2][2] & state[3][2]);
        ((uint64_t*)plaintextblock)[3] = ((uint64_t*)ciphertextblock)[3] ^ state[0][3] ^ state[1][0] ^ (state[2][3] & state[3][3]);

        state[0][0] ^= state[3][0]; state[0][1] ^= state[3][1]; state[0][2] ^= state[3][2]; state[0][3] ^= state[3][3];
        temp = state[3][3];    state[3][3] = state[3][2];  state[3][2] = state[3][1];  state[3][1] = state[3][0];  state[3][0] = temp;        
        state[0][0] ^= state[1][0] & state[2][0]; state[0][1] ^= state[1][1] & state[2][1]; state[0][2] ^= state[1][2] & state[2][2]; state[0][3] ^= state[1][3] & state[2][3];
        state[0][0] = rotl(state[0][0],n1);  state[0][1] = rotl(state[0][1],n1);       state[0][2] = rotl(state[0][2],n1);       state[0][3] = rotl(state[0][3],n1);
        
        state[1][0] ^= ((uint64_t*)plaintextblock)[0];   state[1][1] ^= ((uint64_t*)plaintextblock)[1];   state[1][2] ^= ((uint64_t*)plaintextblock)[2];   state[1][3] ^= ((uint64_t*)plaintextblock)[3];
        state[1][0] ^= state[4][0]; state[1][1] ^= state[4][1]; state[1][2] ^= state[4][2]; state[1][3] ^= state[4][3];
        temp = state[4][3];    state[4][3] = state[4][1];  state[4][1] = temp;
        temp1= state[4][2];    state[4][2] = state[4][0];  state[4][0] = temp1;
        state[1][0] ^= (state[2][0] & state[3][0]); state[1][1] ^= (state[2][1] & state[3][1]); state[1][2] ^= (state[2][2] & state[3][2]); state[1][3] ^= (state[2][3] & state[3][3]);
        state[1][0] = rotl(state[1][0],n2);  state[1][1] = rotl(state[1][1],n2);       state[1][2] = rotl(state[1][2],n2);       state[1][3] = rotl(state[1][3],n2);

        state[2][0] ^= ((uint64_t*)plaintextblock)[0];   state[2][1] ^= ((uint64_t*)plaintextblock)[1];   state[2][2] ^= ((uint64_t*)plaintextblock)[2];   state[2][3] ^= ((uint64_t*)plaintextblock)[3];
        state[2][0] ^= state[0][0]; state[2][1] ^= state[0][1]; state[2][2] ^= state[0][2]; state[2][3] ^= state[0][3];
        temp = state[0][0];    state[0][0] = state[0][1];  state[0][1] = state[0][2];  state[0][2] = state[0][3];  state[0][3] = temp;
        state[2][0] ^= state[3][0] & state[4][0]; state[2][1] ^= state[3][1] & state[4][1]; state[2][2] ^= state[3][2] & state[4][2]; state[2][3] ^= state[3][3] & state[4][3];
        state[2][0] = rotl(state[2][0],n3);  state[2][1] = rotl(state[2][1],n3);       state[2][2] = rotl(state[2][2],n3);       state[2][3] = rotl(state[2][3],n3);

        state[3][0] ^= ((uint64_t*)plaintextblock)[0];   state[3][1] ^= ((uint64_t*)plaintextblock)[1];   state[3][2] ^= ((uint64_t*)plaintextblock)[2];   state[3][3] ^= ((uint64_t*)plaintextblock)[3];
        state[3][0] ^= state[1][0]; state[3][1] ^= state[1][1]; state[3][2] ^= state[1][2]; state[3][3] ^= state[1][3];
        temp = state[1][3];    state[1][3] = state[1][1];  state[1][1] = temp;
        temp1= state[1][2];    state[1][2] = state[1][0];  state[1][0] = temp1;
        state[3][0] ^= state[4][0] & state[0][0]; state[3][1] ^= state[4][1] & state[0][1]; state[3][2] ^= state[4][2] & state[0][2]; state[3][3] ^= state[4][3] & state[0][3];
        state[3][0] = rotl(state[3][0],n4);  state[3][1] = rotl(state[3][1],n4);       state[3][2] = rotl(state[3][2],n4);       state[3][3] = rotl(state[3][3],n4);

        state[4][0] ^= ((uint64_t*)plaintextblock)[0];   state[4][1] ^= ((uint64_t*)plaintextblock)[1];   state[4][2] ^= ((uint64_t*)plaintextblock)[2];   state[4][3] ^= ((uint64_t*)plaintextblock)[3];
        state[4][0] ^= state[2][0]; state[4][1] ^= state[2][1]; state[4][2] ^= state[2][2]; state[4][3] ^= state[2][3];
        temp = state[2][3];    state[2][3] = state[2][2];  state[2][2] = state[2][1];  state[2][1] = state[2][0];  state[2][0] = temp;
        state[4][0] ^= state[0][0] & state[1][0]; state[4][1] ^= state[0][1] & state[1][1]; state[4][2] ^= state[0][2] & state[1][2]; state[4][3] ^= state[0][3] & state[1][3];
        state[4][0] = rotl(state[4][0],n5);  state[4][1] = rotl(state[4][1],n5);       state[4][2] = rotl(state[4][2],n5);       state[4][3] = rotl(state[4][3],n5);
} 


// encrypt a partial block
void morus_enc_aut_partialblock(const uint8_t *plaintext,
       uint8_t *ciphertext, uint64_t len, uint64_t state[][4])
{
        uint8_t plaintextblock[32], ciphertextblock[32];

        memset(plaintextblock, 0, 32);
        memcpy(plaintextblock, plaintext, len);

        //encryption
        ((uint64_t*)ciphertextblock)[0] = ((uint64_t*)plaintextblock)[0] ^ state[0][0] ^ state[1][1] ^ (state[2][0] & state[3][0]);
        ((uint64_t*)ciphertextblock)[1] = ((uint64_t*)plaintextblock)[1] ^ state[0][1] ^ state[1][2] ^ (state[2][1] & state[3][1]);
        ((uint64_t*)ciphertextblock)[2] = ((uint64_t*)plaintextblock)[2] ^ state[0][2] ^ state[1][3] ^ (state[2][2] & state[3][2]);
        ((uint64_t*)ciphertextblock)[3] = ((uint64_t*)plaintextblock)[3] ^ state[0][3] ^ state[1][0] ^ (state[2][3] & state[3][3]);
	
        memcpy(ciphertext, ciphertextblock, len);

        morus_stateupdate(((uint64_t*)plaintextblock), state);
}


// decrypt a partial block
void morus_dec_aut_partialblock(uint8_t *plaintext,
       const uint8_t *ciphertext, unsigned long len, uint64_t state[][4])
{
        uint8_t plaintextblock[32], ciphertextblock[32];

        memset(ciphertextblock, 0, 32);
        memcpy(ciphertextblock, ciphertext, len);

        //decryption
        ((uint64_t*)plaintextblock)[0] = ((uint64_t*)ciphertextblock)[0] ^ state[0][0] ^ state[1][1] ^ (state[2][0] & state[3][0]);
        ((uint64_t*)plaintextblock)[1] = ((uint64_t*)ciphertextblock)[1] ^ state[0][1] ^ state[1][2] ^ (state[2][1] & state[3][1]);
        ((uint64_t*)plaintextblock)[2] = ((uint64_t*)ciphertextblock)[2] ^ state[0][2] ^ state[1][3] ^ (state[2][2] & state[3][2]);
        ((uint64_t*)plaintextblock)[3] = ((uint64_t*)ciphertextblock)[3] ^ state[0][3] ^ state[1][0] ^ (state[2][3] & state[3][3]);

	memcpy(plaintext, plaintextblock, len);
        memset(plaintextblock, 0, 32);
	memcpy(plaintextblock, plaintext, len);
   
        morus_stateupdate(((uint64_t*)plaintextblock), state);
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
        uint8_t plaintextblock[32], ciphertextblock[32];  
        uint64_t morus_state[5][4];

        //initialization
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
        morus_tag_generation(mlen, adlen, c, morus_state);
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
        uint8_t plaintextblock[32], ciphertextblock[32];
        uint8_t tag[16];
        uint8_t check = 0;
        uint64_t  morus_state[5][4];

        if (clen < 16) return -1; 

        morus_initialization(k, npub, morus_state);
 
        //process the associated data
        for (i = 0; (i+32) <= adlen; i += 32)
        {
              morus_enc_aut_step(ad+i, ciphertextblock, morus_state);
        }


        // deal with the partial block of associated data
        // in this program, we assume that the message length is a multiple of bytes.
        if (  (adlen & 0x1f) != 0 )
        {
              morus_enc_aut_partialblock(ad+i, ciphertextblock, adlen & 0x1f, morus_state);
        }

        // decrypt the ciphertext
	*mlen = clen - 16;
        for (i = 0; (i+32) <= *mlen; i += 32)
        {
              morus_dec_aut_step(m+i, c+i, morus_state);
        }

        // Deal with the partial block
        // In this program, we assume that the message length is a multiple of bytes.
        if (  (*mlen & 0x1f) != 0 )  {
              morus_dec_aut_partialblock(m+i, c+i, *mlen & 0x1f, morus_state);
        }

        // we assume that the tag length is a multiple of bytes
	// verification
        return morus_tag_verification(*mlen, adlen, c, morus_state);
}

