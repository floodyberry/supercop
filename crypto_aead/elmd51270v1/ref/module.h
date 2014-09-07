#include "crypto_uint64.h"
typedef crypto_uint64 u64;

/* ========== Various Modules, used in all the reference implementations of ELmD ============= */


#define alpha_128 0x87 // Denotes the primitive polynomial x^128+x^7+x^2+x+1
#define AD 0
#define MESSAGE 1
#define CIPHERTEXT 2
#define ENCRYPT 1
#define DECRYPT 0
#define IT_MAX 32  // This denotes the maximum no. of intermediate tag blocks generated. It is required for  intermediated tag versions only.  We provide intermediate tags upto message length of 2^16 bytes. As we generate intermediate tags after 127 blocks, maximum floor(2^12/127) = 32 blocks of intermediate tags can be generated. So, corresponding ABYTES value will be 536 (= 2^4*32+24) for fixed versions using intermediate tags and 552 (= 2^4*32+40) for flexible version. 


typedef unsigned char block[16];


/* ========================= General Modules =============================== */

/* ===== Xor of two block =====*/
static void xor_block(block d, const block s1, const block s2) {int i; for(i=0; i<16; i++) d[i] = s1[i] ^ s2[i];}

/* ===== Copy the content of one block to another ======= */
static void copy_block(block out, block in){int i; for(i=0; i <16; i++) {out[i] = in[i];}}

/* ==== Implement Field multiplication by 2 in GF(2^128) using x^128+x^7+x^2+x+1 as primitive polynomial ==== */
static void mult_2(block b, block s) {int i; block d; unsigned char temp = s[0]>>7;
   	for (i=0; i<15; i++)	{d[i] = (s[i] << 1) | (s[i+1] >> 7);}
 	d[15] = (s[15] << 1); if(temp==1){d[15] ^= alpha_128;} 
	copy_block(b,d);}

/*== Implement Field multiplication by 2^{-1} in GF(2^128) using x^128+x^7+x^2+x+1 as primitive polynomial ==*/
static void mult_inv2(block b, block s) {int i; block d; unsigned char temp = s[15]&1;
   	for (i=1; i<16; i++)	{d[i] = (s[i-1] << 7) | (s[i] >> 1) ;}
   	d[0] = (s[0] >> 1); if(temp==1){d[15] ^= 0x43; d[0] ^= 0x80;}
	copy_block(b,d);}  

/* ==== Implement Field multiplication by 3 in GF(2^128) using x^128+x^7+x^2+x+1 as primitive polynomial ==== */
static void mult_3(block d, block s){ block res; mult_2(res, s); xor_block(res, res, s); copy_block(d,res); }

/* ==== Implement Field multiplication by 7 in GF(2^128) using x^128+x^7+x^2+x+1 as primitive polynomial ==== */
static void mult_7(block d, block s){ block res; mult_2(res, s); mult_3(res, res); xor_block(res, res, s); copy_block(d,res); }

/* == Load len1 bits of a1, followed by len2 bits of a2 in the block L. If L is not full, use 10* padding ==*/
static void load_block(block L, const u8 *a1, const u8 *a2, u8 len1, u8 len2){
	int i; for(i=0; i<len1; i++)	{L[i] = a1[i];}	
	for(i=0; i<len2; i++)	{L[i+len1] = a2[i];}
	if(len1 + len2 < 16)	{L[len1+len2]=0x80; for(i=len2+len1+1; i<16; i++) L[i]=0x00;}  }

/* ===== Store the value of block in a character array ======= */
static void store_bytes(u8 *b, block Blk, int first, int last){int i; 
for(i=first;i<=last;i++){b[i-first] = Blk[i];}}


/* ======== Check equality of two blocks ========= */
int is_equal_block(block blk1, block blk2){
	int i; 
	for(i=0; i<16; i++){
		if(blk1[i] != blk2[i]) return -1;
	} 
	return 0;
}



/* ===========  AES Key Scheduling for 5 and 10 rounds ============ */
AES_KEY aes_key1, aes_key2, aes_key3, aes_key4;
static void key_schedule( const u8 *key)
{
	

	AES_set_encrypt_key(key, 128, &aes_key1);
	AES_set_decrypt_key(key, 128, &aes_key3);
	

	if(rd == 10)
	{
		AES_set_encrypt_key(key, 128, &aes_key2);
		AES_set_decrypt_key(key, 128, &aes_key4);
	}
	else if (rd == 5)
	{
		AES_set_encrypt_key_5(key, 128, &aes_key2);
		AES_set_decrypt_key_5(key, 128, &aes_key4);
	}

}

/*=== AES Function for round 5 and 10 : For 5 round AES, Full 5 round Encryption/Decryption is done. === */
static void AES(int r, u8 Is_Encrypt, block res, block inp, AES_KEY *key)
{
	if(r == 10)
	{
		if(Is_Encrypt == ENCRYPT)
			AES_encrypt(inp, res, key);
		else
			AES_decrypt(inp, res, key);
}
	else if(r == 5)
	{
		if(Is_Encrypt == ENCRYPT )
			AES_encrypt_r5(inp, res, key);
		else
			AES_decrypt_r5(inp, res, key);
	} 
} 


/* ========================== Modules Specific to ELmD ================================== */


/* ==== Updates mask Delta (depending on completeness of block) and mask the block ===== */
static void mask(block Delta, block XX, const block X, u8 Is_Complete){	
	if(Is_Complete == 1)	{mult_2(Delta, Delta);}
	else 			{mult_7(Delta, Delta);} 		
	xor_block(XX, X, Delta);}


/* ====  Linear Mix Operation for Encryption/Decryption and Final/Non-final blocks ===== */ 
static void linear_mix(block W, block Y, block X, u8 Is_Encrypt, u8 Is_final){
	block w_2, w_3; mult_3(w_3, W); mult_2(w_2, W); 	
	if((Is_final == 1)&&(Is_Encrypt == DECRYPT)) { X[15] = X[15]^1; }	
	xor_block(Y, X, w_3);
	if((Is_final == 1)&&(Is_Encrypt == ENCRYPT)) {Y[15] = Y[15]^1;}	
	if(Is_Encrypt == ENCRYPT)		{xor_block(W, X, w_2);}
	else if(Is_Encrypt == DECRYPT)	{xor_block(W, X, W);}
	
}


/* === Process a block : Mask --> Block Cipher Encrypt --> Linear Mix --> Block Cipher Decrypt --> Mask === */
/* =======  For AD process block, the Block cipher Decrypt and final Mask operations are not needed. ====== */
static void process_block(
	block Delta_1, block Delta_2, 
	block result, const block in_blk, block W,
	u8 Is_complete, u8 Is_Encrypt, u8 Is_final,  u8 type_block) {

	block YY, XX, Y, X; 
	int i;
	
	/* ==============   Mask  ================= */
	if(type_block == AD || type_block == MESSAGE)
		mask(Delta_1, XX, in_blk, Is_complete);	
	else
		mask(Delta_1, XX, in_blk, 1);	

	/* ==============  AES Encrypt =============== */
	if(type_block == AD)  { AES(rd, ENCRYPT, X, XX, &aes_key2); } 
	if(type_block == MESSAGE) { AES(rd, ENCRYPT, X, XX, &aes_key2); }				
	if(type_block == CIPHERTEXT){  AES(10, ENCRYPT, X, XX, &aes_key1); } 

	/* ============= Linear Mixing =============== */
	linear_mix(W, Y, X, Is_Encrypt, Is_final);
	
	/* ============= AES Decrypt ================== */
	if(type_block == MESSAGE) {  AES(10, DECRYPT, YY, Y, &aes_key3); }   
	if(type_block == CIPHERTEXT){  AES(rd, DECRYPT, YY, Y, &aes_key4); }
	
	/* =============== Mask ======================= */
	if(type_block == MESSAGE)
		mask(Delta_2, result, YY, 1);	
	if(type_block == CIPHERTEXT)
		mask(Delta_2, result, YY, Is_complete);

}


