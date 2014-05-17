
/*macros using AES instructions   */

#include <stdlib.h>

#include <wmmintrin.h>
/* AES_NI*/



typedef __m128i w128;


#define XOR128(A,B) (_mm_xor_si128(A,B))

#define createzero128() _mm_setzero_si128();



static __m128i aes_128_key_expansion(__m128i key, __m128i keygened)
{
	keygened = _mm_shuffle_epi32(keygened, 0xff);
	key = _mm_xor_si128(key, _mm_slli_si128(key, 4));
	key = _mm_xor_si128(key, _mm_slli_si128(key, 4));
	key = _mm_xor_si128(key, _mm_slli_si128(key, 4));
	return _mm_xor_si128(key, keygened);
}

#define AES_128_key_exp(K, RCON) aes_128_key_expansion(K,_mm_aeskeygenassist_si128(K, RCON))

void AES_128_KEY_EXPANSION(w128 userkey,w128* kp){
	kp[0] =  userkey;
	kp[1]  = AES_128_key_exp(kp[0], 0x01);
	kp[2]  = AES_128_key_exp(kp[1], 0x02);
	kp[3]  = AES_128_key_exp(kp[2], 0x04);
	kp[4]  = AES_128_key_exp(kp[3], 0x08);
	kp[5]  = AES_128_key_exp(kp[4], 0x10);
	kp[6]  = AES_128_key_exp(kp[5], 0x20);
	kp[7]  = AES_128_key_exp(kp[6], 0x40);
	kp[8]  = AES_128_key_exp(kp[7], 0x80);
	kp[9]  = AES_128_key_exp(kp[8], 0x1B);
	kp[10] = AES_128_key_exp(kp[9], 0x36);

}

/*the following allows to expand and encrypt at the same time*/

w128 AESEXPANDandENCRYPT(w128 userkey,w128 Nonce,w128* kp){
	w128 kappa;
	kp[0] =  userkey;
	kappa = _mm_xor_si128 (Nonce,kp[0]);
	kp[1]  = AES_128_key_exp(kp[0], 0x01);
	kappa = _mm_aesenc_si128 (kappa,kp[1]);
	kp[2]  = AES_128_key_exp(kp[1], 0x02);
	kappa = _mm_aesenc_si128 (kappa,kp[2]);
	kp[3]  = AES_128_key_exp(kp[2], 0x04);
	kappa = _mm_aesenc_si128 (kappa,kp[3]);
	kp[4]  = AES_128_key_exp(kp[3], 0x08);
	kappa = _mm_aesenc_si128 (kappa,kp[4]);
	kp[5]  = AES_128_key_exp(kp[4], 0x10);
	kappa = _mm_aesenc_si128 (kappa,kp[5]);
	kp[6]  = AES_128_key_exp(kp[5], 0x20);
	kappa = _mm_aesenc_si128 (kappa,kp[6]);
	kp[7]  = AES_128_key_exp(kp[6], 0x40);
	kappa = _mm_aesenc_si128 (kappa,kp[7]);
	kp[8]  = AES_128_key_exp(kp[7], 0x80);
	kappa = _mm_aesenc_si128 (kappa,kp[8]);
	kp[9]  = AES_128_key_exp(kp[8], 0x1B);
	kappa = _mm_aesenc_si128 (kappa,kp[9]);
	kp[10] = AES_128_key_exp(kp[9], 0x36);
	 return  _mm_aesenclast_si128(kappa,kp[10]);



}






/*===================================
this assumes in, out, rkey already in 128, because that is the way we will use it
=============================================*/



#define AESENCRYPT(plain,out,rkey)\
	out = _mm_xor_si128 (plain,rkey[0]); \
	out = _mm_aesenc_si128 (out,rkey[1]);\
	out = _mm_aesenc_si128 (out,rkey[2]);\
	out = _mm_aesenc_si128 (out,rkey[3]);\
	out = _mm_aesenc_si128 (out,rkey[4]);\
	out = _mm_aesenc_si128 (out,rkey[5]);\
	out = _mm_aesenc_si128 (out,rkey[6]);\
	out = _mm_aesenc_si128 (out,rkey[7]);\
	out = _mm_aesenc_si128 (out,rkey[8]);\
	out = _mm_aesenc_si128 (out,rkey[9]);\
	out = _mm_aesenclast_si128 (out,rkey[10]);


#define TAES_ENCRYPT(plain,out,rkey,counter)\
	out = _mm_xor_si128(plain,rkey[0]);\
	out = _mm_aesenc_si128(out,rkey[1]);\
	out=XOR128(out,counter);\
	out = _mm_aesenc_si128(out,rkey[2]);\
	out = _mm_aesenc_si128(out,rkey[3]);\
	out = _mm_aesenc_si128(out,rkey[4]);\
	out = _mm_aesenc_si128(out,rkey[5]);\
	out = XOR128(out,counter);\
	out = _mm_aesenc_si128 (out,rkey[6]);\
	out = _mm_aesenc_si128 (out,rkey[7]);\
	out = _mm_aesenc_si128 (out,rkey[8]);\
	out = _mm_aesenc_si128 (out,rkey[9]);\
	out = XOR128(out,counter);\
	out = _mm_aesenclast_si128 (out,rkey[10]);



/* This does 1 round of encryption, 8 blocks in paralell, with the same key
for all blocks  */

#define PARALELL_ROUND(out,rkey)\
	out[0] = _mm_aesenc_si128 (out[0],rkey);\
	out[1] = _mm_aesenc_si128 (out[1],rkey);\
	out[2] = _mm_aesenc_si128 (out[2],rkey); \
	out[3] = _mm_aesenc_si128 (out[3],rkey); \
	out[4] = _mm_aesenc_si128 (out[4],rkey); \
	out[5] = _mm_aesenc_si128 (out[5],rkey);\
	out[6] = _mm_aesenc_si128 (out[6],rkey);\
	out[7] = _mm_aesenc_si128 (out[7],rkey); 
   
	
#define PARALELL_LASTROUND(out,rkey)\
	out[0] = _mm_aesenclast_si128 (out[0],rkey);\
	out[1] = _mm_aesenclast_si128 (out[1],rkey); \
	out[2] = _mm_aesenclast_si128 (out[2],rkey); \
	out[3] = _mm_aesenclast_si128 (out[3],rkey); \
	out[4] = _mm_aesenclast_si128 (out[4],rkey); \
	out[5] = _mm_aesenclast_si128 (out[5],rkey); \
	out[6] = _mm_aesenclast_si128 (out[6],rkey);\
	out[7] = _mm_aesenclast_si128 (out[7],rkey); 
	
	
	
#define PARALELL_INITIALWHITENING(in,out,rkey)\
	out[0] = _mm_xor_si128 (in[0],rkey);\
	out[1] = _mm_xor_si128 (in[1],rkey);\
	out[2] = _mm_xor_si128 (in[2],rkey); \
	out[3] = _mm_xor_si128 (in[3],rkey); \
	out[4] = _mm_xor_si128 (in[4],rkey);\
	out[5] = _mm_xor_si128 (in[5],rkey);\
	out[6] = _mm_xor_si128 (in[6],rkey);\
	out[7] = _mm_xor_si128 (in[7],rkey);
        
	
	
#define PARALELL_XORS(out,paralellcounters)\
		out[0] = _mm_xor_si128 (out[0],paralellcounters[0]);\
		out[1] = _mm_xor_si128 (out[1],paralellcounters[1]);\
		out[2] = _mm_xor_si128 (out[2],paralellcounters[2]);\
		out[3] = _mm_xor_si128 (out[3],paralellcounters[3]);\
		out[4] = _mm_xor_si128 (out[4],paralellcounters[4]);\
		out[5] = _mm_xor_si128 (out[5],paralellcounters[5]);\
		out[6] = _mm_xor_si128 (out[6],paralellcounters[6]);\
		out[7] = _mm_xor_si128 (out[7],paralellcounters[7]);
	
	


#define TAES_PARALLEL_ENCRYPT(plain,out,rkey,paralellcounters)\
    PARALELL_INITIALWHITENING(plain,out,rkey[0]);\
	PARALELL_ROUND(out,rkey[1]);\
	PARALELL_XORS(out,paralellcounters);\
    PARALELL_ROUND(out,rkey[2]);\
    PARALELL_ROUND(out,rkey[3]);\
    PARALELL_ROUND(out,rkey[4]) ;\
	PARALELL_ROUND(out,rkey[5]) ;\
	PARALELL_XORS(out,paralellcounters);\
    PARALELL_ROUND(out,rkey[6]);  \
    PARALELL_ROUND(out,rkey[7]);    \
    PARALELL_ROUND(out,rkey[8]) ;\
    PARALELL_ROUND(out,rkey[9]) ;\
	PARALELL_XORS(out,paralellcounters);\
    PARALELL_LASTROUND(out,rkey[10]) ;  



/*

============================================================
============================================================
============================================================

                             DECRYPT MACROS
							 
============================================================
============================================================
============================================================
========================*/


void CONVERT2DECKEY(w128* ekey,w128* dkey){
      dkey[0]=ekey[10]; 
	  dkey[1]=_mm_aesimc_si128(ekey[9]); 
	  dkey[2]=_mm_aesimc_si128(ekey[8]); 
	  dkey[3]=_mm_aesimc_si128(ekey[7]); 
	  dkey[4]=_mm_aesimc_si128(ekey[6]); 
	  dkey[5]=_mm_aesimc_si128(ekey[5]); 
	  dkey[6]=_mm_aesimc_si128(ekey[4]); 
	  dkey[7]=_mm_aesimc_si128(ekey[3]); 
	  dkey[8]=_mm_aesimc_si128(ekey[2]); 
	  dkey[9]=_mm_aesimc_si128(ekey[1]); 
	  dkey[10]=ekey[0]; 
	  }


 

	  

w128 TAES_DECRYPT(w128 plain,w128* rkey,w128 counter)
    {w128 deccounter=_mm_aesimc_si128(counter);
	w128 out = _mm_xor_si128 (plain,rkey[0]);
	out = _mm_aesdec_si128 (out,rkey[1]);
	out=XOR128(out,deccounter);	
	out = _mm_aesdec_si128 (out,rkey[2]);
	out = _mm_aesdec_si128 (out,rkey[3]);
	out = _mm_aesdec_si128 (out,rkey[4]);
	out = _mm_aesdec_si128 (out,rkey[5]);
	out=XOR128(out,deccounter);
	out = _mm_aesdec_si128 (out,rkey[6]);
	out = _mm_aesdec_si128 (out,rkey[7]);
	out = _mm_aesdec_si128 (out,rkey[8]);
	out = _mm_aesdec_si128 (out,rkey[9]);
	out=XOR128(out,deccounter);
	out = _mm_aesdeclast_si128 (out,rkey[10]);
	return out;
    }

			

/*             PARALLEL DECRYPTION  */

#define PARALELL_DECROUND(out,rkey)\
	out[0] = _mm_aesdec_si128 (out[0],rkey);\
	out[1] = _mm_aesdec_si128 (out[1],rkey);\
	out[2] = _mm_aesdec_si128 (out[2],rkey);\
	out[3] = _mm_aesdec_si128 (out[3],rkey);\
	out[4] = _mm_aesdec_si128 (out[4],rkey);\
	out[5] = _mm_aesdec_si128 (out[5],rkey);\
	out[6] = _mm_aesdec_si128 (out[6],rkey);\
	out[7] = _mm_aesdec_si128 (out[7],rkey);
	
 
#define PARALELL_DECLASTROUND(out,rkey)\
	out[0] = _mm_aesdeclast_si128 (out[0],rkey);\
	out[1] = _mm_aesdeclast_si128 (out[1],rkey);\
	out[2] = _mm_aesdeclast_si128 (out[2],rkey);\
	out[3] = _mm_aesdeclast_si128 (out[3],rkey);\
	out[4] = _mm_aesdeclast_si128 (out[4],rkey);\
	out[5] = _mm_aesdeclast_si128 (out[5],rkey);\
	out[6] = _mm_aesdeclast_si128 (out[6],rkey);\
	out[7] = _mm_aesdeclast_si128 (out[7],rkey);
	
 
 
 

/*  =====================  PARALLEL ============ 


paralellcounters has the normal counters, the function
multiplies them by the matrix
   */




void TAES_PARALLEL_DECRYPT(w128* in,w128* out,w128* rkey,w128* paralellcounter){
    w128 paralelldeccounters[8];
	paralelldeccounters[0]=_mm_aesimc_si128(paralellcounter[0]);
	paralelldeccounters[1]=_mm_aesimc_si128(paralellcounter[1]);
	paralelldeccounters[2]=_mm_aesimc_si128(paralellcounter[2]);
	paralelldeccounters[3]=_mm_aesimc_si128(paralellcounter[3]);
	paralelldeccounters[4]=_mm_aesimc_si128(paralellcounter[4]);
	paralelldeccounters[5]=_mm_aesimc_si128(paralellcounter[5]);
	paralelldeccounters[6]=_mm_aesimc_si128(paralellcounter[6]);
	paralelldeccounters[7]=_mm_aesimc_si128(paralellcounter[7]);
	PARALELL_INITIALWHITENING(in,out,rkey[0]);
	PARALELL_DECROUND(out,rkey[1]); 
	PARALELL_XORS(out,paralelldeccounters);  
    PARALELL_DECROUND(out,rkey[2]);  
    PARALELL_DECROUND(out,rkey[3]);  
    PARALELL_DECROUND(out,rkey[4]) ;
	PARALELL_DECROUND(out,rkey[5]) ; 	
	PARALELL_XORS(out,paralelldeccounters);
    PARALELL_DECROUND(out,rkey[6]);  
    PARALELL_DECROUND(out,rkey[7]);    
    PARALELL_DECROUND(out,rkey[8]) ; 
	PARALELL_DECROUND(out,rkey[9]) ; 	
	PARALELL_XORS(out,paralelldeccounters);
    PARALELL_DECLASTROUND(out,rkey[10]) ;  	 
	 }


#define ADD64(counter,incr) _mm_add_epi64(counter,incr)


 
 /*================PARALLELs=============*/
 
 
 
#define PARALLELINCR(paralellcounter,incr)\
	paralellcounter[0]=_mm_add_epi64(paralellcounter[0],incr);\
	paralellcounter[1]=_mm_add_epi64(paralellcounter[1],incr);\
	paralellcounter[2]=_mm_add_epi64(paralellcounter[2],incr);\
	paralellcounter[3]=_mm_add_epi64(paralellcounter[3],incr);\
	paralellcounter[4]=_mm_add_epi64(paralellcounter[4],incr);\
	paralellcounter[5]=_mm_add_epi64(paralellcounter[5],incr);\
	paralellcounter[6]=_mm_add_epi64(paralellcounter[6],incr);\
	paralellcounter[7]=_mm_add_epi64(paralellcounter[7],incr);




	