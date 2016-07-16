/* ==========   Reference Implementation of ELmD(10,127,0) ============= */


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "crypto_aead.h"
#include <openssl/aes.h>

#define rd 10 // Denotes the no. of rounds of 1st layer AES encryption. 
#define IT_GAP 127 // Denotes the no. of blocks after which intermediate tags are generated.


#include "aes_round_6.h"    
#include "module.h"



/* ============================== Process Associated Data =================================*/
static void process_AD(
	block W, block Delta_1, const block npub, block param, 
	const u8 *ad, u64 adlen) {	

	block Delta_2, blk, result;
	u8 Is_complete = 1, ozs[16];
	int i; for(i=1; i<16; i++){ozs[i]=0x00;} ozs[0] = 0x80; 

	

	/* ===== make the first block blk based on npub and param ===== */
	load_block(blk, npub, param, 8, 8);
	
	while(1){ 
		
		/* ============= Process the current Block ==================== */
		process_block(Delta_1, Delta_2, result, blk, W, Is_complete, ENCRYPT, 0, AD);
				
		/* === Compute the next Block and updating the pointers and counters ===*/
		if(adlen==0) break; 
		
		else if(adlen <= 16) {
			load_block(blk, ad, ozs, adlen, 16-adlen); 
			if(adlen != 16) Is_complete = 0;
			adlen = 0; 
		}

		else {load_block(blk, ad, ozs, 16, 0); ad +=16; adlen -=16;}
	}

}

/* ===================   ELmD(10,127,0) Authenticated Encryption Function =================== */

int crypto_aead_encrypt(
unsigned char *c,unsigned long long *clen,
const unsigned char *m,unsigned long long mlen,
const unsigned char *ad,unsigned long long adlen,
const unsigned char *nsec,
const unsigned char *npub,
const unsigned char *k
)
{
	u8 param[]={0x0a,0,0x7f,0x80,0x80,0,0,0}; 
	
	block L, W, Delta_0, Delta_1, Delta_2, blk, result, CS;
	int i; 
	unsigned long long h, cnt, blk_ctr=0, blk_ctr1=0 ;
	u8 zeroes[16], ozs[16], blen = 16, Is_final = 0, Is_complete =1;
	for(i=0; i<16; i++)	{zeroes[i]=0x00;}   	
	for(i=1; i<16; i++)	{ozs[i]=0x00;} ozs[0] = 0x80; 	

	cnt = (8+mlen-1)/16 + 1;
	h = (mlen+8-1) / (IT_GAP * 16);
	if(h > IT_MAX)
		h = IT_MAX;
	*clen = (cnt +1)* 16 + 1 + h*16 ;  

	if((mlen+8)%16 == 0) 
		c[*clen-1] = 0x00; 
	else 
		c[*clen-1] = 0x01; 

	key_schedule(k);

	/* ==========  Generate the Masks =========== */
	AES(10, ENCRYPT, L, zeroes, &aes_key1);
	//AES(6, ENCRYPT, blk, zeroes, &aes_key1);
	//AES(6, ENCRYPT, L, blk, &aes_key1);

	mult_3(Delta_0, L); 
	mult_inv2(Delta_0, Delta_0); 

	mult_inv2(Delta_1, L); 	

	mult_3(Delta_2, L); 
	mult_3(Delta_2, Delta_2); 
	mult_inv2(Delta_2, Delta_2);

	/* ======  Process Associated Data ======== */
	for(i=0; i<16; i++)
		W[i]=0x00;
	process_AD(W, Delta_0, npub, param, ad, adlen);


	/* ================  Process Message Blocks ==================== */

	
	/* ====== Process the first Message block, whose first 8 byte is the secret message number ===== */
	
	if(mlen < 8){ Is_complete = 0; }
	if(mlen <= 8) { blen = 8 + mlen; }
	load_block(blk, nsec, m, 8, blen-8); copy_block(CS, blk); 
	process_block(Delta_1, Delta_2, result, blk, W, Is_complete, ENCRYPT, Is_final, MESSAGE);
	
	store_bytes(c, result, 0, 15); c +=16; blk_ctr++; 
	if(mlen >= 8)  {mlen -= 8; m +=8;}
	else mlen = 0;

	/* ============= Process Successive Message blocks ================== */
	while(mlen > 0){
		if(mlen >= 16){
			load_block(blk, m, ozs, 16, 0); 
			if(mlen == 16) {xor_block(blk, blk, CS); }
			else xor_block(CS, CS, blk);
			blen = 16; mlen -= 16; m+=16; 
		}
		else 	{Is_complete = 0; blen = mlen; mlen = 0; 
			load_block(blk, m, ozs, blen, 0); xor_block(blk, CS, blk);
			
		}	
		process_block(Delta_1, Delta_2, result, blk, W, Is_complete, ENCRYPT, Is_final, MESSAGE); 
		store_bytes(c, result, 0, 15); c +=16; blk_ctr++; 
		
		if(blk_ctr == IT_GAP && blk_ctr1 < IT_MAX && mlen>0) {
			AES(10, DECRYPT, result, W, &aes_key2); 	
			mask(Delta_2, result, result, 1); 
			store_bytes(c, result, 0, 15); c +=16; blk_ctr =0; blk_ctr1++;
		}
	}

	/* ================ Process checksum block ====================== */
	process_block(Delta_1, Delta_2, result, blk, W, 1, ENCRYPT, 1, MESSAGE); 
	
	store_bytes(c, result, 0, 15);

	return 0;
}

/* ===================   ELmD(10,127,0) Verified Decryption Function =================== */
int crypto_aead_decrypt(
unsigned char *m,unsigned long long *mlen,
unsigned char *nsec,
const unsigned char *c, unsigned long long clen,
const unsigned char *ad, unsigned long long adlen,
const unsigned char *npub,
const unsigned char *k
)
{
	u8 param[]={0x0a,0,0x7f,0x80,0x80,0,0,0}; 

	block L, W, Delta_0, Delta_1, Delta_2, blk, result, CS;
	int i,j, flag = 0; u8 zeroes[16], ozs[16], blen = 16, Is_final = 0, Is_complete =1;
	unsigned long long outputmlen, blk_ctr=0, blk_ctr1=0;	
	for(i=0; i<16; i++)	{zeroes[i]=0x00;}   		// all zero.
	for(i=1; i<16; i++)	{ozs[i]=0x00;} ozs[0] = 0x80; 	//useful for padding.
	
	if(((clen % 16) != 1)||(clen < 33))
		return -1;
	
	key_schedule(k);
	
	/* =========== Generate the Masks ========== */
	AES(10, ENCRYPT, L, zeroes, &aes_key1);
	//AES(6, ENCRYPT, L, blk, &aes_key1);


	mult_3(Delta_0, L); 
	mult_inv2(Delta_0, Delta_0); 

	mult_inv2(Delta_1, L); 

	mult_3(Delta_2, L); 
	mult_3(Delta_2, Delta_2); 
	mult_inv2(Delta_2, Delta_2);

	/* =============  Process Associated Data  ================ */
	for(i=0; i<16; i++)
		W[i]=0x00;
	process_AD(W, Delta_0, npub, param, ad, adlen); 

	
	 load_block(CS, zeroes, zeroes, 16, 0);

	 /* ================ Process Ciphertext Blocks ============ */
	 load_block(blk, c, zeroes, 16, 0);  

	 /* =================== Process 1st Block =================== */

	if( (clen==33) && (c[clen-1]==0x01) ) {
	 	process_block(Delta_2, Delta_1, result, blk, W, 0, DECRYPT, Is_final, CIPHERTEXT); 
		for(i=15; i>7; i--) { if(result[i]==0x80) { flag = 1; break; } }
		if(flag == 0) {return -1; }
		for(j=i+1; j<16; j++) { if(result[j]!=0) {return -1; }}
		store_bytes(m, result, 8, i-1); 
		outputmlen = i-8;
	 }
	 else {
		process_block(Delta_2, Delta_1, result, blk, W, 1, DECRYPT, Is_final, CIPHERTEXT);
		store_bytes(m, result, 8, 15);  m +=8; outputmlen = 8;
	 }
	 xor_block(CS, CS, result); store_bytes(nsec, result, 0, 7); 
	 clen -= 16; c+=16; blk_ctr ++; 

	/* ============= Process Successive Ciphertext Blocks ============== */

	while(clen > 17){
	   
	   load_block(blk, c, zeroes, 16, 0);  
	   if((clen == 33) && (c[clen-1]==0x01)) { 
	   	process_block(Delta_2, Delta_1, result, blk, W, 0, DECRYPT, Is_final, CIPHERTEXT); 
		i = -1;
		xor_block(result, result, CS);
		for(i=15; i>0; i--) { if(result[i]==0x80) { flag = 1; break; } }
		if(flag == 0) {return -1; }
		for(j=i+1; j<16; j++) { if(result[j]!=0) {return -1; }}
	   	store_bytes(m, result, 0, i-1); outputmlen += i;
	   }
	   else{ 
	        process_block(Delta_2, Delta_1, result, blk, W, 1, DECRYPT, Is_final, CIPHERTEXT); 
		if(clen == 33) { xor_block(result, result, CS); }
		store_bytes(m, result, 0, 15); outputmlen += 16;
	   } 

	   xor_block(CS, CS, result);
	   clen -= 16; c+=16; blk_ctr ++; 

	   if(clen != 17)
		   m +=16; 
	
	   if(blk_ctr == IT_GAP && blk_ctr1 < IT_MAX && clen > 48){ 
		AES(10, DECRYPT, result, W, &aes_key2); 
		mask(Delta_2, result, result, 1); 
		for(i=0; i<16; i++) { if(c[i] != result[i]) {return -1; } }
		c +=16; clen -= 16; blk_ctr =0; blk_ctr1++;
	   }
	   
	}

	/* ==========  Process checksum block  ============= */
	Is_final = 1;
	process_block(Delta_2, Delta_1, result, c, W, 1, DECRYPT, Is_final, CIPHERTEXT); 	
	for(i=0; i<16; i++) {if(CS[i]!=result[i]) return -1; } 
	*mlen = outputmlen;
	return 0;
}


