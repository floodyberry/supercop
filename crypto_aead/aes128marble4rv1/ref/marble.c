#include <string.h>
#include "aes.h"
#include "marble.h"

/* doubling, multiple by 2 in GF field */
void Time2(byte s[SLEN])
{
	byte msb = s[0] & 0x80;
	int i;
	for(i = 0; i < SLEN-1; i++)
		s[i] = (s[i] << 1)^(s[i+1] >> 7);
	s[i] = (s[i] << 1);
	if(msb) s[i] ^= GFPOLY;
}

/* division by 2, inverse operation of doubling */
void Division2(byte s[SLEN])
{
	byte lsb = s[SLEN-1] & 0x01;
	if(lsb) s[SLEN-1] ^= GFPOLY;
	int i;
	for(i = SLEN - 1; i >0; i--)
		s[i] = (s[i] >> 1) ^ (s[i-1] << 7);
	s[i] = (s[i] >> 1) ^ (lsb << 7);
}

void Time3(byte s[SLEN])
{
	byte temp[SLEN];
	memcpy(temp, s, SLEN);
	Time2(s);
	xor_bytes(s, temp, SLEN);
}

void Time7(byte s[SLEN])
{
	byte temp[SLEN];
	memcpy(temp, s, SLEN);
	Time3(s);
	Time2(s);
	xor_bytes(s, temp, SLEN);
}

void Trans(byte* x, byte* y)
{
	byte temp[SLEN];
	memcpy(temp, x, SLEN);
	xor_bytes(x, y, SLEN);
	Time2(temp);
	xor_bytes2(y, temp, x, SLEN);
}

void invTrans(byte* x, byte* y)
{
	byte tx[SLEN];
	memcpy(tx, x, SLEN);
	Time2(x);
	xor_bytes(x, y, SLEN);
	xor_bytes2(y, x, tx, SLEN);
}

/* encrypt one block */
void Enc(const byte* pt, byte* ct, ae_cxt* cxt)
{
	xor_bytes2(ct, pt, cxt->iMask, SLEN);
	AES_encrypt_4round(ct, ct, &(cxt->ekey0));
	Trans(cxt->S1, ct);
	AES_encrypt_4round(ct, ct, &(cxt->ekey1));
	Trans(cxt->S2, ct);
	AES_encrypt_4round(ct, ct, &(cxt->ekey2));
	xor_bytes(ct, cxt->oMask, SLEN);
}

/* decrypt one block */
void Dec(const byte* ct, byte* pt, ae_cxt* cxt)
{
	xor_bytes2(pt, ct, cxt->oMask, SLEN);
	AES_decrypt_4round(pt, pt, &(cxt->dkey2));
	invTrans(cxt->S2, pt);
	AES_decrypt_4round(pt, pt, &(cxt->dkey1));
	invTrans(cxt->S1, pt);
	AES_decrypt_4round(pt, pt, &(cxt->dkey0));
	xor_bytes(pt, cxt->iMask, SLEN);
}

/* initialize the key and L */
int ae_init(ae_cxt* cxt, const byte* userkey, int keylen)
{
	memset(cxt, 0, sizeof(ae_cxt));

	cxt->S1[SLEN-1] = 0x01;
	cxt->S2[SLEN-1] = 0x02;

	AES_set_encrypt_key(userkey, 128, &(cxt->ekey0));		// set ekey0
	AES_set_4round_decrypt_key(&(cxt->ekey0), &(cxt->dkey0)); 	// set dkey0

	memcpy(cxt->ekey1.rd_key, ((byte*)(cxt->ekey0.rd_key))+SLEN*4, SLEN*4); // set ekey1
	AES_set_4round_decrypt_key(&(cxt->ekey1), &(cxt->dkey1));	// set dkey1

	memcpy(cxt->ekey2.rd_key, ((byte*)(cxt->ekey0.rd_key))+SLEN*8, SLEN*3); // set ekey2
	memcpy(((byte*)(cxt->ekey2.rd_key))+SLEN*3, cxt->ekey0.rd_key, SLEN);
	AES_set_4round_decrypt_key(&(cxt->ekey2), &(cxt->dkey2));	// set dkey2

	Enc(cxt->L, cxt->L, cxt);

	memcpy(cxt->iMask, cxt->L, SLEN);

	Time3(cxt->iMask); Time3(cxt->iMask); 	// set the input mask to 3^2 L

	return SUCCESS;
}

/* there will be no nonce */
int process_ad(ae_cxt* cxt, const byte* ad, unsigned long long adlen, const byte* nonce, unsigned long long nlen)
{
	unsigned long long i;
	byte temp[SLEN], lastblock[SLEN];
	for(i = 0; i < adlen/SLEN; i++)
	{
		Enc(ad+i*SLEN, temp, cxt);
		Time2(cxt->iMask);
		xor_bytes(cxt->Tau, temp, SLEN);
	}
	memset(lastblock, 0, SLEN);
	unsigned long long lastblocklen = adlen % SLEN;
	if(lastblocklen)
		memcpy(lastblock, ad+i*SLEN, lastblocklen);
	lastblock[lastblocklen] = 0x80;
	Enc(lastblock, temp, cxt);
	xor_bytes(cxt->Tau, temp, SLEN);

	return SUCCESS;
}

/* rotate to the left by 1 bit */
void rotate1(byte* x, int nbytes)
{
	byte msb = x[0] & 0x80;
	int i;
	for(i = 0; i < nbytes-1; i++)
	{
		x[i] = (x[i] << 1) ^ (x[i+1] >> 7);
	}
	x[i] = (x[i] << 1) ^ (msb>>7);
}
void mix(byte* A, byte* B, int nbytes)
{
	byte temp[SLEN];
	xor_bytes2(temp, A, B, nbytes);
	rotate1(temp, nbytes);
	xor_bytes(A, temp, nbytes);
	xor_bytes(B, temp, nbytes);
}

/* in this stage cxt->S1 and cxt->S2 are NOT updated */
void XLS(ae_cxt* cxt, byte* out, const byte* M, int nbytes, const byte* block)
{
	byte bs1[SLEN], bs2[SLEN];
	memcpy(bs1, cxt->S1, SLEN);		// backup S1
	memcpy(bs2, cxt->S2, SLEN);		// backup S2

	memset(cxt->iMask, 0, SLEN);	// remove input mask
	memset(cxt->oMask, 0, SLEN);	// remove output mask

	byte temp[2*SLEN];
	memcpy(temp, M, nbytes);
	memcpy(temp+nbytes, block, SLEN);

	Enc(temp, temp, cxt);
	mix(temp+SLEN-nbytes, temp+SLEN, nbytes);
	temp[SLEN-nbytes-1] ^= 0x01;
	memcpy(cxt->S1, bs1, SLEN);		// store S1
	memcpy(cxt->S2, bs2, SLEN);		// store S2

	Enc(temp, temp, cxt);
	mix(temp+SLEN-nbytes, temp+SLEN, nbytes);
	temp[SLEN-nbytes-1] ^= 0x01;
	memcpy(cxt->S1, bs1, SLEN);		// store S1
	memcpy(cxt->S2, bs2, SLEN);		// store S2

	Enc(temp, temp, cxt);

	memcpy(out, temp, SLEN+nbytes);
}

void invXLS(ae_cxt* cxt, byte* out, const byte* C, int nbytes, byte* tag)
{
	byte bs1[SLEN], bs2[SLEN];
	memcpy(bs1, cxt->S1, SLEN);		// backup S1
	memcpy(bs2, cxt->S2, SLEN);		// backup S2

	memset(cxt->iMask, 0, SLEN);	// remove input mask
	memset(cxt->oMask, 0, SLEN);	// remove output mask

	byte temp[2*SLEN];
	memcpy(temp, C, SLEN+nbytes);

	Dec(temp, temp, cxt);
	temp[SLEN-nbytes-1] ^= 0x01;
	mix(temp+SLEN-nbytes, temp+SLEN, nbytes);
	memcpy(cxt->S1, bs1, SLEN);		// store S1
	memcpy(cxt->S2, bs2, SLEN);		// store S2

	Dec(temp, temp, cxt);
	temp[SLEN-nbytes-1] ^= 0x01;
	mix(temp+SLEN-nbytes, temp+SLEN, nbytes);
	memcpy(cxt->S1, bs1, SLEN);		// store S1
	memcpy(cxt->S2, bs2, SLEN);		// store S2

	Dec(temp, temp, cxt);

	memcpy(out, temp, nbytes);
	memcpy(tag, temp+nbytes, SLEN);
}

int ae_encrypt(ae_cxt* cxt, byte* pt, unsigned long long mlen, byte* ct)
{
	memcpy(cxt->iMask, cxt->L, SLEN);
	Time2(cxt->iMask);
	memcpy(cxt->oMask, cxt->L, SLEN);
	Time3(cxt->oMask);

	byte temp[SLEN];
	byte otag[SLEN];
	unsigned long long i;

	if(mlen < SLEN){			// tag splitting
		Division2(cxt->iMask);	// iMask = L
		Division2(cxt->oMask);	// oMask = 2^-1*3*L
		byte mblock[SLEN];
		if(mlen){					// if message length is 0, do nothing
			memset(mblock, 0, SLEN);
			memcpy(mblock, pt, mlen);
			mblock[mlen] = 0x80;
			Enc(mblock, ct, cxt);
		}
		Time7(cxt->iMask);
		Time7(cxt->oMask);
		xor_bytes(cxt->MSum, pt, mlen);
		xor_bytes(cxt->MSum, cxt->Tau, SLEN);
		Enc(cxt->MSum, otag, cxt);
		if(mlen)
			memcpy(ct+SLEN, otag, mlen);
		else 
			memcpy(ct, otag, SLEN);
		return SUCCESS;
	}
	else{
		for(i = 0; i < mlen/SLEN; i++) // process the full blocks
		{
			xor_bytes(cxt->MSum, pt+i*SLEN, SLEN);
			Enc(pt+i*SLEN, ct+i*SLEN, cxt);
			if((i+1)*SLEN != mlen){ 	// not the last block
				Time2(cxt->iMask);
				Time2(cxt->oMask);
			}
		}

		/* process the tag */
		Time7(cxt->iMask);
		Time7(cxt->oMask);
		xor_bytes(cxt->MSum, cxt->Tau, SLEN);
		if(mlen % SLEN){			// apply XLS
			Enc(cxt->MSum, otag, cxt);
			XLS(cxt, ct+i*SLEN, pt+i*SLEN, mlen%SLEN, otag);
		}
		else{									// normal processing
			Enc(cxt->MSum, ct+i*SLEN, cxt);
		}
	}
	return SUCCESS;
}

int ae_decrypt(ae_cxt* cxt, byte* pt, unsigned long long clen, byte* ct, byte* tag)
{
	memcpy(cxt->iMask, cxt->L, SLEN);
	Time2(cxt->iMask);
	memcpy(cxt->oMask, cxt->L, SLEN);
	Time3(cxt->oMask);

	byte temp[SLEN];
	byte otag[SLEN];
	unsigned long long i;
	unsigned long long mlen = clen - SLEN;

	if(mlen < SLEN){			// tag splitting
		Division2(cxt->iMask);	// iMask = L
		Division2(cxt->oMask);	// oMask = 2^-1*3*L
		byte mblock[SLEN];
		if(mlen){					// if message length is 0, do nothing
			Dec(ct, mblock, cxt);
			memcpy(pt, mblock, mlen);
		}
		Time7(cxt->iMask);
		Time7(cxt->oMask);
		xor_bytes(cxt->MSum, pt, mlen);
		xor_bytes(cxt->MSum, cxt->Tau, SLEN);
		Enc(cxt->MSum, otag, cxt);
		if(mlen){
			memcpy(tag, ct+mlen, SLEN-mlen);
			memcpy(tag+SLEN-mlen, otag, mlen);
		}
		else
			memcpy(tag, otag, SLEN);
		return SUCCESS;
	}
	else{
		for(i = 0; i < mlen/SLEN; i++) // process the full blocks
		{
			Dec(ct+i*SLEN, pt+i*SLEN, cxt);
			xor_bytes(cxt->MSum, pt+i*SLEN, SLEN);
			if((i+1)*SLEN != mlen){ 	// not the last block
				Time2(cxt->iMask);
				Time2(cxt->oMask);
			}
		}

		/* process the tag */
		Time7(cxt->iMask);
		Time7(cxt->oMask);
		xor_bytes(cxt->MSum, cxt->Tau, SLEN);
		if(mlen % SLEN){			// apply XLS
			Enc(cxt->MSum, tag, cxt);
			invXLS(cxt, pt+i*SLEN, ct+i*SLEN, mlen%SLEN, otag);
			memcpy(tag+SLEN, otag, SLEN);
		}
		else{									// normal processing
			Enc(cxt->MSum, tag, cxt);
		}
	}
	return SUCCESS;
}
