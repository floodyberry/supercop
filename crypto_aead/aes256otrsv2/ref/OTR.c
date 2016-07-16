/* Copyright (c) 2014, NEC Corporation. All rights reserved.
*
* LICENSE
*
* 1. NEC Corporation ("NEC") hereby grants users to use and reproduce
*AES-OTR program ("Software") for testing and evaluation purpose for
*CAESAR (Competition for Authenticated Encryption: Security, Applicability,
*and Robustness). The users must not use the Software for any other purpose
*or distribute it to any third party.
*
* 2. THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
*OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
*FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL NEC
*BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, OR CONSEQUENTIAL
*DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
*ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OF THE
*SOFTWARE.
*
* 3. In the event of an user's failure to comply with any term of this License
*or wrongful act, NEC may terminate such user's use of the Software. Upon such
*termination the user must cease all use of the Software and destroy all copies
*of the Software.
*
* 4. The users shall comply with all applicable laws and regulations, including
*export and import control laws, which govern the usage of the Software.
*/
/* 
* A reference C code for AES-OTR v2 
*/
#include <string.h>
#include "t-aes_define.h"
#include "OTR.h"

//#define INTERMEDIATE //intermediate test vectors, use with main_test.c

#ifdef INTERMEDIATE
extern void printbseq(uint8 * in, int length);
#endif

/* AES functions */
extern int KeySchedule(int skeylen, int mode, const uint8 *skey);
extern int Encryption(int skeylen, uint8 *plain, uint8 *cipher);

/* basic internal functions */
static void ozp(uint32 length, const uint8 *in, uint8 *out);
static void mul2(const uint8 *in, uint8 *out);
static void xor(const uint8 *x, const uint8 *y, uint8 *z);
static void xorp(uint32 length, const uint8 *x, const uint8 *y, uint8 *z);

/* internal variables */
uint8	gamma[BLOCK]={0}, gamma2[BLOCK]={0}, Q[BLOCK]={0};
uint8	TE[BLOCK]={0}, TA[BLOCK]={0};
uint8	delta[BLOCK]={0}, L[BLOCK]={0};

/*
 Setup : AES (enc) key schedule and generate authentication masks
*/
int Setup(const uint8 *skey)
{
	uint8 cst[16] = {0};

	KeySchedule(KeyLen, ENC, skey);
	Encryption(KeyLen, cst, gamma);
	mul2(gamma, gamma2); 
	mul2(gamma2, Q); /* Q = 4gamma */
	return SUCCESS;
}
/*
 nEnc : nonce encryption and mask generation (delta, L)
 needs TA when ADP=s
 using tag-length encoding
 */
int nEnc(const uint8 *nonce, uint32 nonce_len, uint32 t_len){
	uint8 tmp[BLOCK]={0};

	memcpy(&tmp[BLOCK-nonce_len],nonce,nonce_len);
	tmp[0]=(uint8)((t_len*8)%(BLOCK*8)<<1);
	tmp[BLOCK-nonce_len-1] |= 0x01;
#ifdef INTERMEDIATE
	printf("(Format(tau,N)||0*||1||N) :\n"); printbseq(tmp,BLOCK);
#endif
	Encryption(KeyLen, tmp, delta);	// delta = E(Format(tau,N))
	if(ADP==Seri){
		xor(delta, TA, delta); // delta ^= TA
	}
	mul2(delta, L);
	mul2(L, L); //L = 4delta
	return SUCCESS;
}

/*
 EFunc : OTR Core Encryption Function
*/
int EFunc(
		  const uint8 *nonce,
		  uint32 nonce_len,
		  const uint8 *plaintext,
		  uint32 pl_len,
		  uint32 t_len,
		  uint8 *ciphertext)
{
	uint32 i,j = 0;
	uint32 ell=0; //number of 2BLOCK-byte chunks, excl. last one
	uint32 last=0; //number of bytes in the last chunks

	uint8 tmp[BLOCK], LdL[BLOCK], Llast[BLOCK], Z[BLOCK];
	uint8 Sum[BLOCK]={0};

	if(pl_len != 0){
		last = pl_len % DBLOCK;
		if(last == 0) last = DBLOCK;
		ell = (pl_len-last) / DBLOCK; // plaintext length = 2BLOCK*ell + last (non-zero)
	}

	nEnc(nonce, nonce_len, t_len);

	/* 2-round Feistel for the full chunks */
	for(i = 0; i < ell; i++, j = j+DBLOCK){
		xor(L,plaintext+j,tmp);
		Encryption(KeyLen, tmp, tmp);
		xor(tmp,plaintext+(j+BLOCK),ciphertext+j);
		xor(L,delta,LdL);
		xor(LdL,ciphertext+j,tmp);
		Encryption(KeyLen, tmp, tmp);
		xor(tmp,plaintext+j,ciphertext+(j+BLOCK));
		xor(Sum,plaintext+(j+BLOCK),Sum);
		mul2(L,L); // L <- 2L
	}
	/* Last chunk */
	if(last <= BLOCK){ 	//odd block, including the case pl_len = 0 (no plaintext)
		Encryption(KeyLen, L, Z);
		xorp(last, Z,plaintext+j,ciphertext+j);
		ozp(last,plaintext+j,tmp);
		xor(tmp,Sum,Sum);
		memcpy(Llast,L,BLOCK); //Llast=L
	}
	else{//even blocks, last > BLOCK always holds. 2-round Feistel with last swap
		xor(L,plaintext+j,tmp);
		Encryption(KeyLen,tmp,Z);
		xorp(last-BLOCK,Z,plaintext+(j+BLOCK),ciphertext+(j+BLOCK));
		xor(L,delta,Llast); // Llast = L xor delta
		ozp(last-BLOCK,ciphertext+(j+BLOCK),tmp);
		xor(Sum,tmp,Sum);
		xor(Sum,Z,Sum);
		xor(Llast,tmp,tmp);
		Encryption(KeyLen,tmp,tmp);
		xor(tmp,plaintext+j,ciphertext+j);
	}
	/* TE generation */
	mul2(Llast,tmp);
	xor(Llast,tmp,Llast); //Llast = 3Llast
	xor(Sum,Llast,Sum);	//Sum = 3Llast xor Sum
	if(last == BLOCK || last == DBLOCK){//last = 16 or 32
		xor(Sum,delta,Sum);
	}
	Encryption(KeyLen,Sum,TE);
	return SUCCESS;
}

/*
 DFunc : OTR Core Decryption Function
 */
int DFunc(
		  const uint8 *nonce,
		  uint32 nonce_len,
		  const uint8 *ciphertext,
		  uint32 ci_len,
		  uint32 t_len,
		  uint8 *plaintext)
{
	uint32 i,j = 0;
	uint32 ell=0; //number of 2BLOCK-byte chunks, excl. last one
	uint32 last=0; //number of bytes in the last chunks

	uint8 tmp[BLOCK], LdL[BLOCK], Llast[BLOCK], Z[BLOCK];
	uint8 Sum[BLOCK]={0};

	if(ci_len != 0){
		last = ci_len % DBLOCK;
		if(last == 0) last = DBLOCK;
		ell = (ci_len-last) / DBLOCK; // plaintext length = 2BLOCK*ell + last (non-zero)
	}

	nEnc(nonce, nonce_len, t_len);

	/* 2-round Feistel for the full chunks */
	for(i = 0; i < ell; i++, j=j+DBLOCK){
		xor(L,delta,LdL);
		xor(LdL,ciphertext+j,tmp);
		Encryption(KeyLen, tmp, tmp);
		xor(tmp,ciphertext+(j+BLOCK),plaintext+j);
		xor(L,plaintext+j,tmp);
		Encryption(KeyLen, tmp, tmp);
		xor(tmp,ciphertext+j,plaintext+(j+BLOCK));
		xor(Sum,plaintext+(j+BLOCK),Sum);
		mul2(L,L); // L <- 2L
	}
	/* Last chunk */
	if(last <= BLOCK){ 	//odd block, including the case pl_len = 0 (no plaintext)
		Encryption(KeyLen, L, Z);
		xorp(last, Z,ciphertext+j,plaintext+j);
		ozp(last,plaintext+j,tmp);
		xor(tmp,Sum,Sum);
		memcpy(Llast,L,BLOCK); //Llast = L
	}
	else{//even blocks, last > BLOCK always holds. 2-round Feistel with last swap
		xor(L,delta,Llast); //Llast = L xor delta
		ozp(last-BLOCK,ciphertext+(j+BLOCK),tmp);
		xor(Sum,tmp,Sum);
		xor(Llast,tmp,tmp);
		Encryption(KeyLen,tmp,tmp);
		xor(tmp,ciphertext+j,plaintext+j);
		xor(L,plaintext+j,tmp);
		Encryption(KeyLen,tmp,Z);
		xorp(last-BLOCK,Z,ciphertext+(j+BLOCK),plaintext+(j+BLOCK));
		xor(Sum,Z,Sum);
	}
	/* TE generation */
	mul2(Llast,tmp);
	xor(Llast,tmp,Llast); //Llast = 3Llast
	xor(Sum,Llast,Sum);	//Sum = 3Llast xor Sum
	if(last == BLOCK || last == DBLOCK){//last = 16 or 32
		xor(Sum,delta,Sum);
	}
	Encryption(KeyLen,Sum,TE);
	return SUCCESS;
}//end of DFunc
/*
 AFunc : OTR Core Authentication Function (ADP=p)
*/
int AFunc(
		  const uint8 *header,
		  uint32 h_len)
{
	uint32 i,j = 0;
	uint32 m, last;
	uint8 ASum[BLOCK]={0}, tmp[BLOCK], mask[BLOCK];

	last = h_len % BLOCK;
	if(last == 0) last = BLOCK;
	m = (h_len-last) / BLOCK; //header = m blocks + last bytes

	memcpy(mask,Q,BLOCK);
	/* XE */
	for(i = 0; i < m; i++, j=j+BLOCK){
		xor(mask,header+j,tmp);
		Encryption(KeyLen,tmp,tmp);
		xor(ASum,tmp,ASum);
		mul2(mask,mask);
	}
	/* last block */
	ozp(last,header+j,tmp);
	xor(ASum,tmp,ASum);

	if(last != BLOCK ){
		xor(mask, gamma, mask);
	}
	else{
		xor(mask,gamma2,mask);
	}
	xor(ASum,mask,ASum);
	Encryption(KeyLen,ASum,TA);
    return SUCCESS;
}
/*
 AFuncS : OTR Core Authentication Function (ADP=s)
*/
int AFuncS(
		  const uint8 *header,
		  uint32 h_len)
{
	uint32 i,j = 0;
	uint32 m, last;
	uint8 tmp[BLOCK], chain[BLOCK]={0};

	last = h_len % BLOCK;
	if(last == 0) last = BLOCK;
	m = (h_len-last) / BLOCK; //header = m blocks + last bytes

	/* CBC */
	for(i = 0; i < m; i++, j=j+BLOCK){
		xor(chain,header+j,chain);
		Encryption(KeyLen,chain,chain);
	}
	/* last block */
	ozp(last,header+j,tmp);
	xor(tmp,chain,chain);
	if(last != BLOCK ){
		xor(chain,gamma2,chain);
	}
	else{
		xor(chain,Q,chain);
	}
	Encryption(KeyLen,chain,TA);
    return SUCCESS;
}
/*
 AE_Encrypt : OTR Encryption
*/
int AE_Encrypt(
	      const uint8 *nonce,
		  uint32 nonce_len,
		  const uint8 *plaintext,
		  uint32 pl_len,
		  const uint8 *header,
		  uint32 h_len,
		  uint32 t_len,
		  uint8 *ciphertext,
		  uint8 *tag)
{
	if(ADP==Para)
	{
		if(h_len==0){
			memset(TA,0,BLOCK);
		}
		else{
			AFunc(header,h_len);
		}
		EFunc(nonce,nonce_len,plaintext,pl_len,t_len,ciphertext);
		xorp(t_len,TE,TA,tag);
	}
	else if(ADP==Seri)
	{
		if(h_len==0){
			memset(TA,0,BLOCK);
		}
		else{
			AFuncS(header,h_len);
		}
			EFunc(nonce,nonce_len,plaintext,pl_len,t_len,ciphertext);
			memcpy(tag,TE,t_len);
	}
	return SUCCESS;
}
/*
 AE_Decrypt : OTR Decryption
*/
int AE_Decrypt(
	      const uint8 *nonce,
		  uint32 nonce_len,
		  const uint8 *ciphertext,
		  uint32 ci_len,
		  const uint8 *header,
		  uint32 h_len,
		  uint32 t_len,
  		  const uint8 *tag,
		  uint8 *plaintext)
{
	uint32 i;
	uint8 loctag[BLOCK];

	if(ADP==Para)
	{
		if(h_len==0){
			memset(TA,0,BLOCK);
		}
		else{
			AFunc(header,h_len);
		}
			DFunc(nonce,nonce_len,ciphertext,ci_len,t_len,plaintext);
			xorp(t_len,TE,TA,loctag);
	}
	else if(ADP==Seri)
	{
		if(h_len==0){
			memset(TA,0,BLOCK);
		}
		else{
			AFuncS(header,h_len);
		}
			DFunc(nonce,nonce_len,ciphertext,ci_len,t_len,plaintext);
			memcpy(loctag,TE,t_len);
	}

	if(memcmp(loctag,tag,t_len)!=0){//verfication failure
		for(i=0; i<ci_len; i++)plaintext[i] = 0;// zeroing wrong plaintext
		return TAG_UNMATCH;
	}
	return TAG_MATCH;
}//end of AE_Decrypt

/*
 ozp: 100...0 padding for length (<=16) bytes (when n = 16 nothing is done)
*/
static void ozp(uint32 length, const uint8 *in, uint8 *out){
	memset(out,0,BLOCK);
	memcpy(out,in,length);
	if(length<BLOCK){
		out[length] = 0x80;
	}
}

 /*
 mul2 : mutiply 2 over GF(2^n)
*/
static const uint8 cst_mul[2] = {0x00, 0x87};

static void mul2(const uint8 *in, uint8 *out)
{
	int i, t = in[0] >> 7;
    for(i = 0; i < 15; i++)
        out[i] = (in[i] << 1) | (in[i + 1] >> 7);
    out[15] = (in[15] << 1) ^ cst_mul[t];
}

static void xor(const uint8 *x, const uint8 *y, uint8 *z)
{
	uint32 i;
    for(i = 0; i < BLOCK; i++){
		z[i] = x[i]^y[i];
	}
}

static void xorp(uint32 length, const uint8 *x, const uint8 *y, uint8 *z){
	uint32 i;
    for(i = 0; i < length; i++){
		z[i] = x[i]^y[i];
	}
}
