/* ==========   Reference Implementation of COLM_0 ============= */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "crypto_aead.h"
#include <openssl/aes.h>
typedef unsigned char u8;
//#include "aes_round_10.h"    
#include "module.h"

static void process_AD(
	block W, block Delta_1, const block npub, block param, 
	const u8 *ad, u64 adlen) {	

	block Delta_2, blk, result;
	u8 Is_Final = 0, ozs[16];
	int i; for(i=1; i<16; i++){ozs[i]=0x00;} ozs[0] = 0x80; 

	

	/* ===== make the first block blk based on npub and param ===== */
	load_block(blk, npub, param, 8, 8);
	
	while(1){ 
		
		/* ============= Process the current Block ==================== */
		process_block(Delta_1, Delta_2, result, blk, W, 1, Is_Final, ENCRYPT, AD);
				
		/* === Compute the next Block and updating the pointers and counters ===*/
		if(adlen==0) break; 
		
		else if(adlen <= 16) {
			load_block(blk, ad, ozs, adlen, 16-adlen); 
			if(adlen != 16) Is_Final = 1;
			adlen = 0; 
		}

		else {load_block(blk, ad, ozs, 16, 0); ad +=16; adlen -=16;}
	}

}

/* ===================   COLM_0 Authenticated Encryption Function =================== */

int crypto_aead_encrypt(
unsigned char *c,unsigned long long *clen,
const unsigned char *m,unsigned long long mlen,
const unsigned char *ad,unsigned long long adlen,
const unsigned char *nsec,
const unsigned char *npub,
const unsigned char *k
)
{
	u8 param[]={0,0,0,0,0,0,0,0}; 
	
	block L, W, Delta_0, Delta_1, Delta_2, blk, result, CS;
	int i; u8 zeroes[16], ozs[16], blen = 16, Is_Final = 0, Is_complete =1;
	for(i=0; i<16; i++)	{zeroes[i]=0x00;}   	
	for(i=1; i<16; i++)	{ozs[i]=0x00;} ozs[0] = 0x80; 	

	*clen = mlen + 16; 

	key_schedule(k);

	/* ==========  Generate the Masks =========== */
	AES(ENCRYPT, L, zeroes, &aes_key1);

	mult_3(Delta_0, L); 
	mult_inv2(Delta_0, Delta_0); 
	
	copy_block(Delta_1, L);
	//mult_inv2(Delta_1, L); 	

	mult_3(Delta_2, L); 
	mult_3(Delta_2, Delta_2); 
	//mult_inv2(Delta_2, Delta_2);

	/* ======  Process Associated Data ======== */
	for(i=0; i<16; i++)
		W[i]=0x00;
	process_AD(W, Delta_0, npub, param, ad, adlen);
	Is_Final = 0;

	/* ================  Process Successive Message Blocks ==================== */

	
	/* ====== Process the first Message block ===== */
	
	if(mlen < 16){ Is_complete = 0; Is_Final = 1; blen = mlen; }
	if(mlen == 16){ Is_Final = 1;}
	// if(mlen <= 16) { blen = 8 + mlen; }
	//load_block(blk, m, ozs, mlen, 16-mlen); copy_block(CS, blk); 
	load_block(blk, m, ozs, blen, 0); copy_block(CS, blk);
	process_block(Delta_1, Delta_2, result, blk, W, Is_complete, Is_Final, ENCRYPT,  MESSAGE);
	store_bytes(c, result, 0, 15); c +=16;
	if(mlen >= 16)  {mlen -= 16; m +=16;}
	else mlen = 0;

	/* ============= Process Message blocks ================== */
	while(mlen > 0){
		if(mlen >= 16){
			load_block(blk, m, ozs, 16, 0); 
			if(mlen == 16){ Is_Final = 1; xor_block(blk, CS, blk); }
			else xor_block(CS, CS, blk);
			blen = 16; mlen -= 16; m+=16; 
		}
		else 	{Is_complete = 0; Is_Final = 1; blen = mlen; mlen = 0; 
			load_block(blk, m, ozs, blen, 0); xor_block(blk, CS, blk);
			
		}	
		process_block(Delta_1, Delta_2, result, blk, W, Is_complete, Is_Final, ENCRYPT, MESSAGE); 
		store_bytes(c, result, 0, 15); c +=16;
	}

	/* ================ Process checksum block ====================== */
	process_block(Delta_1, Delta_2, result, blk, W, 1, 0, ENCRYPT, MESSAGE); 
	store_bytes(c, result, 0, blen-1);

	return 0;
}

/* ===================   COLM_0 Verified Decryption Function =================== */
int crypto_aead_decrypt(
unsigned char *m,unsigned long long *mlen,
unsigned char *nsec,
const unsigned char *c, unsigned long long clen,
const unsigned char *ad, unsigned long long adlen,
const unsigned char *npub,
const unsigned char *k
)
{
	u8 param[]={0,0,0,0,0,0,0,0}; 
	
	block L, W, Delta_0, Delta_1, Delta_2, blk, result, CS;
	int i; u8 zeroes[16], ozs[16], blen = 16, Is_Final = 0, Is_complete =1;
	unsigned long long tlen, blk_ctr=0, blk_ctr1=0;	
	for(i=0; i<16; i++)	{zeroes[i]=0x00;}   		// all zero.
	for(i=1; i<16; i++)	{ozs[i]=0x00;} ozs[0] = 0x80; 	//useful for padding.
	
	if(clen < 16)
		return -1;

	*mlen = clen - 16; 
	
	key_schedule(k);
	
	/* =========== Generate the Masks ========== */
	AES(ENCRYPT, L, zeroes, &aes_key1);
	mult_3(Delta_0, L); 
	mult_inv2(Delta_0, Delta_0); 
	
	copy_block(Delta_1, L);
	//mult_inv2(Delta_1, L); 	

	mult_3(Delta_2, L); 
	mult_3(Delta_2, Delta_2); 
	//mult_inv2(Delta_2, Delta_2);

	
	/* =============  Process Associated Data  ================ */
	for(i=0; i<16; i++)
		W[i]=0x00;
	process_AD(W, Delta_0, npub, param, ad, adlen); 
	Is_Final = 0;
	
	 load_block(CS, zeroes, zeroes, 16, 0);

	 /* ================ Process Ciphertext Blocks ============ */
	 load_block(blk, c, zeroes, 16, 0);  

	 /* =================== Process 1st Block =================== */

	 if(clen<32){
	 	process_block(Delta_2, Delta_1, result, blk, W, 0, 1, DECRYPT, CIPHERTEXT); 
		store_bytes(m, result, 0, clen-17); m += clen - 16;
	 }
	 else {
		if(clen == 32) 
			Is_Final = 1;
		process_block(Delta_2, Delta_1, result, blk, W, 1, Is_Final, DECRYPT,  CIPHERTEXT);
		store_bytes(m, result, 0, 15);  m +=16;
	 }
	 xor_block(CS, CS, result); //store_bytes(nsec, result, 0, 7); 
	 clen -= 16; c+=16;

	 if(clen < 16){ 
		if(result[clen] != 0x80) return -1; 
		for(i=clen+1; i<16; i++) {if(result[i]!=0) return -1;} 
	 }

	/* ============= Process Successive Ciphertext Blocks ============== */
	while(clen > 16){
	   
	   load_block(blk, c, zeroes, 16, 0);  
	   if(clen < 32){ 
	   	process_block(Delta_2, Delta_1, result, blk, W, 0, 1, DECRYPT,  CIPHERTEXT); 
		xor_block(result, result, CS);
	   	store_bytes(m, result, 0, clen - 17);  
	   }
	   else{ 
		if(clen == 32)
			Is_Final = 1;
	        process_block(Delta_2, Delta_1, result, blk, W, 1, Is_Final, DECRYPT,  CIPHERTEXT); 
		if(clen == 32) {xor_block(result, result, CS);}
		store_bytes(m, result, 0, 15); 
	   } 

	   xor_block(CS, CS, result);
	   clen -= 16; c+=16;

	   
	   if(clen < 16){ 
		if(result[clen] != 0x80) return -1; 
		for(i=clen+1; i<16; i++) {if(result[i]!=0) return -1;} 
	   }
	   else
		   m +=16; 
	}

	/* ==========  Process checksum block  ============= */
	process_block(Delta_1, Delta_2, result, CS, W, 1, 0, ENCRYPT, MESSAGE); /* 2nd result was CS */
	for(i=0; i<clen; i++) {if(result[i]!=c[i]) { return -1; }} 

	return 0;
}

