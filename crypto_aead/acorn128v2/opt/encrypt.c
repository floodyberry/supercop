/*
  This is the optimized implementation of ACORN-128.

  In the implementation, we store the 293-bit register into 7 64-bit registers:
  293-bit register R:  r292 r291 r290 r289 r288 r287 r286 r285 ...... r5 r4 r3 r2 r1 r0

  state[0]:  r60  r59  r58  r57  ...... r2   r1   r0     (61 bits) (lsb: r0)
  state[1]:  r106 r105 r104 r103 ...... r63  r62  r61    (46 bits) (lsb: r61)
  state[2]:  r153 r152 r151 r150 ...... r109 r108 r107   (47 bits) (lsb: r107)
  state[3]:  r192 r191 r190 r189 ...... r156 r155 r154   (39 bits) (lsb: r154)
  state[4]:  r229 r228 r227 r226 ...... r195 r194 r193   (37 bits) (lsb: r193)
  state[5]:  r288 r287 r286 r285 ...... r232 r231 r230   (59 bits) (lsb: r230)
  state[6]:  r292 r291 r290 r289                         (4  bits) (lsb: r289)
*/

#include <string.h>
#include <stdio.h>
#include "crypto_aead.h"

#define maj(x,y,z)     (  ((x) & (y)) ^ ((x) & (z)) ^ ((y) & (z))  )
//#define ch32(x,y,z)    (  ((x) & (y)) | ( ((x) ^ 0xffffffff) & (z))  )
#define ch32(x,y,z)    ( ((x) & (y)) ^ ((~x) & (z)) )

//encrypt 32 bit
void encrypt_32bits(unsigned long long *state, unsigned int plaintextword, unsigned int *ciphertextword, unsigned int *ks, unsigned int ca, unsigned int cb)
{
    unsigned long long f;
    unsigned long long word_244, word_23, word_160, word_111, word_66, word_196, word_0, word_107, word_230;
    unsigned long long word_12,word_154,word_235,word_61,word_193;


	word_235 = state[5] >> 5;
	word_196 = state[4] >> 3;
	word_160 = state[3] >> 6;
	word_111 = state[2] >> 4;
	word_66  = state[1] >> 5;
	word_23  = state[0] >> 23;
    word_244 = state[5] >> 14;
	word_12  = state[0] >> 12;

    //update using those 6 LFSRs
	state[6] ^= (state[5] ^ word_235) & 0xffffffff;
	state[5] ^= (state[4] ^ word_196) & 0xffffffff;
	state[4] ^= (state[3] ^ word_160) & 0xffffffff;
	state[3] ^= (state[2] ^ word_111) & 0xffffffff;
	state[2] ^= (state[1] ^ word_66)  & 0xffffffff;
	state[1] ^= (state[0] ^ word_23)  & 0xffffffff;

	/*
    word_0   = state[0];
    word_107 = state[2];
    word_230 = state[5];
    word_154 = state[3];
    word_61  = state[1];
    word_193 = state[4];
    */

	//compute keystream
	*ks = word_12 ^ state[3] ^ maj(word_235, state[1], state[4]);

    //f  = state[0] ^ (state[107] ^ 1) ^ maj(state[244], state[23], state[160]) ^ ch(state[230], state[111], state[66]) ^ (ca & state[196]) ^ (cb & (*ks));
	f = state[0] ^ (state[2] ^ 0xffffffff) ^ maj(word_244, word_23, word_160) ^ ch32(state[5], word_111, word_66) ^ (word_196 & ca) ^ (cb & *ks);
    *ciphertextword = plaintextword ^ *ks;
	f = (f ^ plaintextword) & 0xffffffff;
	state[6] = state[6] ^ (f << 4);

    //shift by 32 bits
    state[0] = (state[0] >> 32) | ((state[1] & 0xffffffff) << 29);  //32-(64-61) = 29
    state[1] = (state[1] >> 32) | ((state[2] & 0xffffffff) << 14);  //32-(64-46) = 14
    state[2] = (state[2] >> 32) | ((state[3] & 0xffffffff) << 15);  //32-(64-47) = 15
    state[3] = (state[3] >> 32) | ((state[4] & 0xffffffff) << 7);   //32-(64-39) = 7
    state[4] = (state[4] >> 32) | ((state[5] & 0xffffffff) << 5);   //32-(64-37) = 5
    state[5] = (state[5] >> 32) | ((state[6] & 0xffffffff) << 27);  //32-(64-59) = 27
    state[6] =  state[6] >> 32;

    //perform encryption

    return;
}


// encrypt 8 bits
// it is used if the length of associated data is not multiple of 32 bits;
// it is also used if the length of plaintext is not multiple of 32 bits;
void encrypt_8bits(unsigned long long *state, unsigned int plaintextword, unsigned int *ciphertextword, unsigned int *ks, unsigned int ca, unsigned int cb)
{
    unsigned long long f;
    unsigned long long word_244, word_23, word_160, word_111, word_66, word_196, word_0, word_107, word_230;
    unsigned long long word_12,word_154,word_235,word_61,word_193;


    //f  = state[0] ^ (state[107] ^ 1) ^ maj(state[244], state[23], state[160]) ^ ch(state[230], state[111], state[66]) ^ (ca & state[196]) ^ (cb & (*ks));
    word_12  = state[0] >> 12;
    word_235 = state[5] >> 5;
    word_244 = state[5] >> 14;
    word_23  = state[0] >> 23;
    word_160 = state[3] >> 6;
    word_111 = state[2] >> 4;
    word_66  = state[1] >> 5;
    word_196 = state[4] >> 3;

	state[6] ^= (state[5] ^ word_235) & 0xff;
	state[5] ^= (state[4] ^ word_196) & 0xff;
	state[4] ^= (state[3] ^ word_160) & 0xff;
	state[3] ^= (state[2] ^ word_111) & 0xff;
	state[2] ^= (state[1] ^ word_66)  & 0xff;
	state[1] ^= (state[0] ^ word_23)  & 0xff;

	*ks = word_12 ^ state[3] ^ maj(word_235, state[1], state[4]);
    *ks &= 0xff;
    //f  = state[0] ^ (state[107] ^ 1) ^ maj(state[244], state[23], state[160]) ^ ch(state[230], state[111], state[66]) ^ state[196];
	f = state[0] ^ (state[2] ^ 0xffffffff) ^ maj(word_244, word_23, word_160) ^ ch32(state[5], word_111, word_66) ^ (word_196 & ca) ^ (cb & *ks);
    f  = (f ^ plaintextword) & 0xff;
    state[6] =  state[6] ^ (f << 4);

    state[0] = (state[0] >> 8) | ((state[1] & 0xff) << (29+24));   //32-(64-61) = 29
    state[1] = (state[1] >> 8) | ((state[2] & 0xff) << (14+24));   //32-(64-46) = 14
    state[2] = (state[2] >> 8) | ((state[3] & 0xff) << (15+24));   //32-(64-47) = 15
    state[3] = (state[3] >> 8) | ((state[4] & 0xff) << (7+24));    //32-(64-39) = 7
    state[4] = (state[4] >> 8) | ((state[5] & 0xff) << (5+24));    //32-(64-37) = 5
    state[5] = (state[5] >> 8) | ((state[6] & 0xff) << (27+24));    //32-(64-59) = 27
    state[6] =  state[6] >> 8;

    *ciphertextword = plaintextword ^ *ks;
    return;
}


//decrypt 32 bit
void decrypt_32bits(unsigned long long *state, unsigned int *plaintextword, unsigned int ciphertextword, unsigned int *ks, unsigned int ca, unsigned int cb)
{
    unsigned long long f;
    unsigned long long word_244, word_23, word_160, word_111, word_66, word_196, word_0, word_107, word_230;
    unsigned long long word_12,word_154,word_235,word_61,word_193;

    //f  = state[0] ^ (state[107] ^ 1) ^ maj(state[244], state[23], state[160]) ^ ch(state[230], state[111], state[66]) ^ (ca & state[196]) ^ (cb & (*ks));

    word_12  = state[0] >> 12;
    word_235 = state[5] >> 5;
    word_244 = state[5] >> 14;
    word_23  = state[0] >> 23;
    word_160 = state[3] >> 6;
    word_111 = state[2] >> 4;
    word_66  = state[1] >> 5;
    word_196 = state[4] >> 3;

	state[6] ^= (state[5] ^ word_235) & 0xffffffff;
	state[5] ^= (state[4] ^ word_196) & 0xffffffff;
	state[4] ^= (state[3] ^ word_160) & 0xffffffff;
	state[3] ^= (state[2] ^ word_111) & 0xffffffff;
	state[2] ^= (state[1] ^ word_66)  & 0xffffffff;
	state[1] ^= (state[0] ^ word_23)  & 0xffffffff;

	/*
    word_0   = state[0];
    word_107 = state[2];
    word_230 = state[5];
    word_154 = state[3];
    word_61  = state[1];
    word_193 = state[4];
    */

	*ks = word_12 ^ state[3] ^ maj(word_235, state[1], state[4]);
    //f  = state[0] ^ (state[107] ^ 1) ^ maj(state[244], state[23], state[160]) ^ ch(state[230], state[111], state[66]) ^ state[196];
	f = state[0] ^ (state[2] ^ 0xffffffff) ^ maj(word_244, word_23, word_160) ^ ch32(state[5], word_111, word_66) ^ (word_196 & ca) ^ (cb & *ks);
    *plaintextword = ciphertextword ^ *ks;
    f  = (f ^ *plaintextword) & 0xffffffff;
    state[6] =  state[6] ^ (f << 4);

    state[0] = (state[0] >> 32) | ((state[1] & 0xffffffff) << 29);  //32-(64-61) = 29
    state[1] = (state[1] >> 32) | ((state[2] & 0xffffffff) << 14);  //32-(64-46) = 14
    state[2] = (state[2] >> 32) | ((state[3] & 0xffffffff) << 15);  //32-(64-47) = 15
    state[3] = (state[3] >> 32) | ((state[4] & 0xffffffff) << 7);   //32-(64-39) = 7
    state[4] = (state[4] >> 32) | ((state[5] & 0xffffffff) << 5);   //32-(64-37) = 5
    state[5] = (state[5] >> 32) | ((state[6] & 0xffffffff) << 27);  //32-(64-59) = 27
    state[6] =  state[6] >> 32;

    return;
}


void decrypt_8bits(unsigned long long *state, unsigned int *plaintextword, unsigned int ciphertextword, unsigned int *ks, unsigned int ca, unsigned int cb)
{
    unsigned long long f;
    unsigned long long word_244, word_23, word_160, word_111, word_66, word_196, word_0, word_107, word_230;
    unsigned long long word_12,word_154,word_235,word_61,word_193;

    //f  = state[0] ^ (state[107] ^ 1) ^ maj(state[244], state[23], state[160]) ^ ch(state[230], state[111], state[66]) ^ (ca & state[196]) ^ (cb & (*ks));

    word_12  = state[0] >> 12;
    word_235 = state[5] >> 5;
    word_244 = state[5] >> 14;
    word_23  = state[0] >> 23;
    word_160 = state[3] >> 6;
    word_111 = state[2] >> 4;
    word_66  = state[1] >> 5;
    word_196 = state[4] >> 3;

	state[6] ^= (state[5] ^ word_235) & 0xff;
	state[5] ^= (state[4] ^ word_196) & 0xff;
	state[4] ^= (state[3] ^ word_160) & 0xff;
	state[3] ^= (state[2] ^ word_111) & 0xff;
	state[2] ^= (state[1] ^ word_66)  & 0xff;
	state[1] ^= (state[0] ^ word_23)  & 0xff;

    word_0   = state[0];
    word_107 = state[2];
    word_230 = state[5];
    word_154 = state[3];
    word_61  = state[1];
    word_193 = state[4];

	*ks = word_12 ^ state[3] ^ maj(word_235, state[1], state[4]);
    *ks &= 0xff;
    //f  = state[0] ^ (state[107] ^ 1) ^ maj(state[244], state[23], state[160]) ^ ch(state[230], state[111], state[66]) ^ state[196];
	f = state[0] ^ (state[2] ^ 0xffffffff) ^ maj(word_244, word_23, word_160) ^ ch32(state[5], word_111, word_66) ^ (word_196 & ca) ^ (cb & *ks);
    *plaintextword = ciphertextword ^ *ks;
    f  = (f ^ *plaintextword) & 0xff;
    state[6] =  state[6] ^ (f << 4);

    state[0] = (state[0] >> 8) | ((state[1] & 0xff) << (29+24));   //32-(64-61) = 29
    state[1] = (state[1] >> 8) | ((state[2] & 0xff) << (14+24));   //32-(64-46) = 14
    state[2] = (state[2] >> 8) | ((state[3] & 0xff) << (15+24));   //32-(64-47) = 15
    state[3] = (state[3] >> 8) | ((state[4] & 0xff) << (7+24));    //32-(64-39) = 7
    state[4] = (state[4] >> 8) | ((state[5] & 0xff) << (5+24));    //32-(64-37) = 5
    state[5] = (state[5] >> 8) | ((state[6] & 0xff) << (27+24));    //32-(64-59) = 27
    state[6] =  state[6] >> 8;

    return;
}


// The initialization state of ACORN
/* The input to initialization is the 128-bit key; 128-bit IV;*/
void acorn128_initialization_32bitversion(const unsigned char *key, const unsigned char *iv, unsigned long long *state)
{
        int i, j;
        unsigned int m;
        unsigned int ks=0, tem=0;

        //initialize the state to 0
        for (j = 0; j <= 6; j++) state[j] = 0;

        //run the cipher for 1792 steps
        for (j = 0;  j <= 3;  j++)
        {
            encrypt_32bits(state, ((unsigned int*)key)[j], &tem, &ks, 0xffffffff, 0xffffffff);
        }
        for (j = 4;  j <= 7;  j++)
        {
            encrypt_32bits(state, ((unsigned int*)iv)[j-4], &tem, &ks, 0xffffffff, 0xffffffff);
        }
        for (j = 8;  j <= 8; j++)
        {
            encrypt_32bits(state, ((unsigned int*)key)[j&3] ^ 1, &tem, &ks, 0xffffffff, 0xffffffff);
        }
        for (j = 9;  j <= 55; j++)
        {
            encrypt_32bits(state, ((unsigned int*)key)[j&3], &tem, &ks, 0xffffffff, 0xffffffff);
        }

}


//the finalization state of acorn
void acorn128_tag_generation_32bits_version(unsigned long long msglen, unsigned long long adlen, unsigned char maclen, unsigned char *mac, unsigned long long *state)
{
    int i;
    unsigned int plaintextword  = 0;
    unsigned int ciphertextword = 0;
    unsigned int ksword = 0;

    for (i = 0; i < 768/32; i++)
    {
        encrypt_32bits(state, plaintextword, &ciphertextword, &ksword, 0xffffffff, 0xffffffff);
        if ( i >= (768/32 - 4) ) { ((unsigned int*)mac)[i-(768/32-4)] = ksword; }
    }
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
    unsigned char mac[16];
    unsigned int plaintextword, ciphertextword, ksword;

    unsigned long long state[7];
    unsigned int ca, cb;

    //initialization stage
    acorn128_initialization_32bitversion(k, npub, state);

    //process the associated data
    ca = 0xffffffff;
    cb = 0xffffffff;
    for (i = 0; i < adlen/4; i = i+1)
    {
        encrypt_32bits(state, ((unsigned int*)ad)[i], &ciphertextword, &ksword, ca, cb);
    }

    // if adlen is not a multiple of 4, we process the remaining bytes
    for (i = adlen & 0xfffffffffffffffcULL; i < adlen; i++)
    {
        ca = 0xff;
        cb = 0xff;
        plaintextword = ad[i];
        encrypt_8bits(state, plaintextword, &ciphertextword, &ksword, ca, cb);
    }

    //256bits padding after the associated data
    for (i = 0; i < 256/32; i++)
    {
        if (i == 0) plaintextword = 0x1;
        else plaintextword = 0;

        if ( i < 128/32) ca = 0xffffffff;
        else ca = 0;

        cb = 0xffffffff;

        encrypt_32bits(state, plaintextword, &ciphertextword, &ksword, ca, cb);
    }

    //process the plaintext
    ca = 0xffffffff;
    cb = 0;
    for (i = 0; i < mlen/4; i=i+1)
    {
        encrypt_32bits(state, ((unsigned int*)m)[i], &(((unsigned int*)c)[i]), &ksword, ca, cb);  //&c[i], &ksword, ca, cb);
    }

    //if mlen is not a multiple of 32 bits, we process the remaining bytes.
    for (i = mlen & 0xfffffffffffffffcULL; i < mlen; i++)
    {
        ca = 0xff;
        cb = 0x0;
        plaintextword = m[i];
        encrypt_8bits(state, plaintextword, &ciphertextword, &ksword, ca, cb);
        c[i] = ciphertextword;
    }

    //256 bits padding after the plaintext
    for (i = 0; i < 256/32; i++)
    {
        if ( i == 0 ) plaintextword = 0x1;
        else plaintextword = 0;

        if ( i < 128/32)   ca = 0xffffffff;
        else ca = 0;

        cb = 0;

        encrypt_32bits(state, plaintextword, &ciphertextword, &ksword, ca, cb);
    }

    //finalization stage, we assume that the tag length is a multiple of bytes
    acorn128_tag_generation_32bits_version(mlen, adlen, 16, mac, state);
    *clen = mlen + 16;
    memcpy(c+mlen, mac, 16);

    return 0;
}


//decrypt a message
int crypto_aead_decrypt(
	unsigned char *m,unsigned long long *mlen,
	unsigned char *nsec,
	const unsigned char *c,unsigned long long clen,
	const unsigned char *ad,unsigned long long adlen,
	const unsigned char *npub,
	const unsigned char *k
	)
{
    unsigned long long i;
    unsigned char tag[16],check=0;
    unsigned int plaintextword, ciphertextword, ksword;

    unsigned long long state[7];
    unsigned int ca, cb;

    //initialization stage
    acorn128_initialization_32bitversion(k, npub, state);

    //process the associated data
    ca = 0xffffffff;
    cb = 0xffffffff;
    for (i = 0; i < adlen/4; i = i+1)
    {
        encrypt_32bits(state, ((unsigned int*)ad)[i], &ciphertextword, &ksword, ca, cb);
    }

    for (i = adlen & 0xfffffffffffffffcULL; i < adlen; i++)
    {
        ca = 0xff;
        cb = 0xff;
        plaintextword = ad[i];
        encrypt_8bits(state, plaintextword, &ciphertextword, &ksword, ca, cb);
    }

    //256bits padding after the associated data
    for (i = 0; i < 256/32; i++)
    {
        if (i == 0) plaintextword = 0x1;
        else plaintextword = 0;

        if ( i < 128/32) ca = 0xffffffff;
        else ca = 0;

        cb = 0xffffffff;

        encrypt_32bits(state, plaintextword, &ciphertextword, &ksword, ca, cb);
    }

    //process the plaintext
    ca = 0xffffffff;
    cb = 0;
    *mlen = clen - 16;

    for (i = 0; i < *mlen/4; i=i+1)
    {
        decrypt_32bits(state, &(((unsigned int*)m)[i]), ((unsigned int*)c)[i], &ksword, ca, cb);  //&c[i], &ksword, ca, cb);
    }

    for (i = *mlen & 0xfffffffffffffffcULL; i < *mlen; i++)
    {
        ca = 0xff;
        cb = 0x0;
        ciphertextword = c[i];
        decrypt_8bits(state, &plaintextword, ciphertextword, &ksword, ca, cb);
        m[i] = plaintextword;
    }

    //256 bits padding after the plaintext
    for (i = 0; i < 256/32; i++)
    {
        if ( i == 0 ) plaintextword = 0x1;
        else plaintextword = 0;

        if ( i < 128/32)   ca = 0xffffffff;
        else ca = 0;

        cb = 0;

        encrypt_32bits(state, plaintextword, &ciphertextword, &ksword, ca, cb);
    }

    //finalization stage, we assume that the tag length is a multiple of bytes
    acorn128_tag_generation_32bits_version(*mlen, adlen, 16, tag, state);

    for (i = 0; i  < 16; i++) check |= (tag[i] ^ c[clen - 16 + i]);
    if (check == 0) return 0;
    else return -1;
}
