#include "crypto_aead.h"


/** SILVER using rijndael-alg-fstplus
*  @author Daniel Penazzi,@author Miguel Montes
      April, 2014.
*=======================================================
*!!!!!!!!!!!!this version works well only on Big Endian Machines!!!!!!!!!!
*======================================================
* This code is hereby placed in the public domain.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHORS ''AS IS'' AND ANY EXPRESS
 * OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHORS OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
 * BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 * OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

 /*thanks to Brian Gladman for the following header*/ 
#include "brg_endian.h"
#if PLATFORM_BYTE_ORDER!=IS_BIG_ENDIAN 
#error "This code produces standard results only on BE machines"
#endif
 
 
 
 /*change the following if a truncated tag is wanted. The default is 16 bytes
 DO NOT USE DIFFERENT TAG LENGTHS WITH THE SAME KEY UNLESS YOUR APPLICATION
FORCES THE INCLUSION OF THE TAG LENGTH IN THE ASSOCIATED DATA*/  
#define TAGLENGTH 16 


#include "rijndael-alg-fstplusminus.h"



/*u32 and u8 defined in rijndael-alg-fstplusminus.h
we should define u32 using uint also, but we did not want
to mess too much with rijndael-alg-fst.h
*/
	
#if __GNUC__ || (__STDC_VERSION__ >= 199901L)
#include <stdint.h>
typedef uint64_t u64;
#else
typedef unsigned long long u64;
#endif


typedef union{
unsigned char b[16];
u64 s[2];
u32 t[4];
}bst128;


#define ROT32L_8(x) ((x<<8)^(x>>24))
#define ROT32R_8(x) ((x<<24)^(x>>8))


#define SWAP(x) ((ROT32L_8(x) & 0x00ff00ff) |( ROT32R_8(x) & 0xff00ff00))

#define SWAP128(A,R) \
	R.t[0]=SWAP(A.t[1]);\
	R.t[1]=SWAP(A.t[0]);\
	R.t[2]=SWAP(A.t[3]);\
	R.t[3]=SWAP(A.t[2]);

#define XOR128(A,B) \
	A.s[0]^=B.s[0];\
	A.s[1]^=B.s[1];


/*this converts the BE sum into a LE sum*/
bst128 NADD64(bst128 A,bst128 B){
	bst128 R,tmp;
	SWAP128(A,R)
	SWAP128(B,tmp)
	tmp.s[0]+=R.s[0];
	tmp.s[1]+=R.s[1];
	SWAP128(tmp,R)
	return R;
}	
	
void XORADD(u64* checksum,bst128 update,bst128 mask){
	bst128 tmp=NADD64(update,mask);
	checksum[0]^=tmp.s[0];
	checksum[1]^=tmp.s[1];
}
		  
		  
		  
void AES_128_KEY_EXPANSION(bst128 userKey,u32 rk[]){
  rijndaelKeySetupEnc(rk,userKey.b); 
 }



 
void CONVERT2DECKEY(u32* erk,u32* rk){
     int i;
 /*restore rkeys 1,5,9 */
	 for(i=0;i<4;i++){
		erk[4+i]=erk[44+i];
		erk[20+i]=erk[48+i];
		erk[36+i]=erk[52+i];
	}

	 
    /* invert the order of the round keys: */
	for (i = 0; i < 44; i += 4) {
		rk[i]= erk[40-i];
		rk[i + 1]= erk[41-i];
		rk[i + 2]= erk[42- i];
		rk[i + 3] = erk[43-i];
	}
	/* apply the inverse MixColumn transform to all round keys but the first and the last: */
	for (i = 1; i < 10; i++) {
		rk[4*i] =INVERT(rk[4*i]);
		rk[4*i+1] =INVERT(rk[4*i+1]);
		rk[4*i+2] =INVERT(rk[4*i+2]);
		rk[4*i+3] =INVERT(rk[4*i+3]);
	}
	/*copy round keys 1,5,9 in higher memory for reuse*/
	for(i=0;i<4;i++){
		rk[44+i]=rk[4+i];/*copy r1*/
		rk[48+i]=rk[20+i];/*copy r5*/
		rk[52+i]=rk[36+i];/*copy r9*/
	}
	
}	  
		  
		  
  
   
   
bst128 Obtain_sessionrkeys(bst128 kappa,u32* rkey_enc){ /*rkey_enc must be 44+4*3 */
	u32 tempkeys[44];
	int i,j;
	bst128 counter;
     
	rijndaelKeySetupEnc(tempkeys,kappa.b);

  
  /*keys 1,9 remain as they are  */
   for(i=0;i<4;i++){
		rkey_enc[i]^=tempkeys[i+4];/*0 xor 1*/
		for(j=2;j<9;j++){
			rkey_enc[4*j+i]^=tempkeys[4*j+i];/*j xor j*/
		}
		counter.t[i]=tempkeys[36+i];/*9th rkey 
		      we will use it not as key. */
		rkey_enc[40+i]^=tempkeys[40+i];/*10 xor 10*/
	}
	/*above is normal key expansion.
	 in locations 44-55 we will hold a copy of the round keys 1,5,9.
	 so we can change the ones in 1,5,9 and then restore them*/
	 for(i=0;i<4;i++){
		rkey_enc[44+i]=rkey_enc[4+i];/*copy r1*/
		rkey_enc[48+i]=rkey_enc[20+i];/*copy r5*/
		rkey_enc[52+i]=rkey_enc[36+i];/*copy r9*/
	}
	
	/*now internal state in BE machine would be the same as the internal
	state under LE machine in ref version, except for the counter.
	Now we make  odd the bytes a LE machine would when fixing it to be odd*/
	counter.b[0]|=(unsigned char)(0x1U);
	counter.b[8]|=(unsigned char)(0x1U);
return counter;
 
}
/*========================= end Obtain_rkeys===============
============================================================
*/   




bst128 TAES_ENCRYPT(bst128 in,u32* rkey_enc,bst128 counter){
     bst128 out;
	 int i;
	 u32 tempcount;
	 /*set rkeys 1,5,9 using the backups*/
	 
	 for(i=0;i<4;i++){
		tempcount=counter.t[i];
		rkey_enc[4+i]=rkey_enc[44+i]^tempcount;
		rkey_enc[20+i]=rkey_enc[48+i]^tempcount;
		rkey_enc[36+i]=rkey_enc[52+i]^tempcount;
	}
	
 rijndaelEncrypt(rkey_enc,in.b,out.b);

 return out;
}




bst128 TAES_DECRYPT(bst128 in,u32* rkd,bst128 counter){
     bst128 out;
	 int i;
	 u32 tempcounter;
	 /*apply the inverse matrix mult to counter */
	 
	 for(i=0;i<4;i++){
		tempcounter=INVERT(counter.t[i]);
	 /*set rkeys 1,5,9 using the backups*/
		rkd[4+i]=rkd[44+i]^tempcounter;
		rkd[20+i]=rkd[48+i]^tempcounter;
		rkd[36+i]=rkd[52+i]^tempcounter;
	}
	
 rijndaelDecrypt(rkd,in.b,out.b);

 return out;
}



		  
	
bst128 TAG(bst128 checksum,
         u64 adlen,u64 mlen,u32* rkey_enc,bst128 kappa){
		 /* returns the tag, i.e., the encryption of the checksum*/
	int i;
	bst128 tmp1;	
	u32 tempkey;
	bst128 tmp;
	SWAP128(kappa,tmp1)
	tmp1.s[0]+=adlen;
	tmp1.s[1]+=mlen;
	SWAP128(tmp1,tmp)
	for(i=0;i<4;i++) {
		tempkey=rkey_enc[i];
		rkey_enc[i]=rkey_enc[i+8];
		rkey_enc[i+8]=rkey_enc[i+12];
		rkey_enc[i+12]=rkey_enc[i+16];
		rkey_enc[i+16]=rkey_enc[i+24];
		rkey_enc[i+24]=rkey_enc[i+28];
		rkey_enc[i+28]=rkey_enc[i+32];
		rkey_enc[i+32]=rkey_enc[i+40];
		rkey_enc[i+40]=tempkey;
		tempkey=rkey_enc[i+48];/*changing the rkeys 1,5,9 is 
		               irrelevant because Taesencypt rewrites them.
					   We have to change the order of the keys 11,12,13,
					   which are the ones that are going to be put in rounds
					   1,5,9 by taes  */
		rkey_enc[i+48]=rkey_enc[i+44];
		rkey_enc[i+44]=rkey_enc[i+52];
		rkey_enc[i+52]=tempkey;
	}

    return TAES_ENCRYPT(checksum,rkey_enc,tmp);
		
		 


		
}/*====================== end TAG=====================  */

 




bst128 SETUPcounterLEFT(bst128 input){
      bst128 counter;
	  counter.s[0]=input.s[0];
	  counter.s[1]=0;
	  return counter;
}



   
bst128 ProcessAD(u64 adlen,const unsigned char *ad,
               u32* rkey_enc,bst128 kappa,bst128 preIC){
			   
  /*variable declarations */
	u64 j,blockadlen;
	u64* adv=(u64*)ad;
	bst128 sin,sout;
	bst128 partial;
	bst128 counter;
	u64 kount=0;
	bst128 initcounter=SETUPcounterLEFT(preIC);
 	bst128 checksum;
 /*end variable declaration */
  checksum.s[0]=0;checksum.s[1]=0;
  

 if(adlen>0){
	counter=NADD64(kappa,initcounter);
	blockadlen=(adlen/16);/*number of ad full blocks*/
	j=0;	  
	while(j<blockadlen){
		sin.s[0]=adv[2*j];
		sin.s[1]=adv[2*j+1];
        	sout=TAES_ENCRYPT(sin,rkey_enc,counter);
        	XOR128(checksum,sout);
		counter=NADD64(counter,initcounter);
		j++;
	}/*endwhile. Now only a possible partial block exists */
       
	 
	j=(j<<4);
	if(j<adlen){ /*we DO have a partial block*/

		partial.s[0]=partial.s[1]=0;
		 
		while(j+kount<adlen){
		   partial.b[kount]=ad[j+kount];
		   kount++;
		}/*endwhile  */
		partial.b[kount]=1;
        	sout=TAES_ENCRYPT(partial,rkey_enc,kappa);
		/*kappa is never used elsewhere*/
		XOR128(checksum,sout);
	}/* end if j<adlen. no need to update counter*/
	 
 }/*end if adlen*/	
   
   return checksum;
 }
 /*=================end ProcessAD ============*/
 
 
 
 /**==========================================
      next function is  to process a partial plaintext block
		  return value is a 128 bit word to be xored to the checksum.
		  side effects: encrypts/decrypts, i.e., changes the 
		  ciphtxt/plaintxt stream
		  the flag is so we can use the code in both enc and dec
		  this probably is slightly slower than having two codes
		  but is better if one needs to make changes
	===========================================**/
 
 
bst128 PartialBlock(u64 msglen,u32* rkey_enc,u64 j,
              const unsigned char *inb,unsigned char *outb,
			  int flag,bst128 initcounter,bst128 counter){
	u8 i;
	bst128 sin,sout;
	
	sout.s[0]=sout.s[1]=msglen;/*we write it temporarily in sout to swap it*/
	SWAP128(sout,sin);
	sout=TAES_ENCRYPT(sin,rkey_enc,counter);
	 		  
	i=0;
		while(j<msglen){
		outb[j]=inb[j]^sout.b[i];
		if(flag) sout.b[i]^=outb[j]; else sout.b[i]=outb[j];/*enc or dec*/
		j++;i++;
	}/*endwhile   */
	
	 
	sout.b[15]=i;
	
	counter=NADD64(counter,initcounter);
	return TAES_ENCRYPT(sout,rkey_enc,counter);

		

 }/*==============END partial block */
 
 
 

   

/*
                                ********************************************
=============================================================================
                                        
										ENCRYPT and AUTENTICATE

=============================================================================*/


	

int crypto_aead_encrypt(unsigned char *c,
       unsigned long long *clen,
       const unsigned char *m,
       unsigned long long mlen,
       const unsigned char *ad,
       unsigned long long adlen,
       const unsigned char *nsec,
       const unsigned char *npub,
       const unsigned char *k){   
      
	bst128 checksum;
	bst128 kappa;
	u32 rkey_enc[56];
	bst128 sin,sout;/*for single block enc and to process key*/
	u64 i,j;
	u64 blockmlen=(mlen/16); /*number of plain full blocks*/
	u64* mv=(u64*)m;
	u64* cv=(u64*)c;
	u64* kv=(u64*)k;
	u64* npubv=(u64*)npub;
	bst128 wout;
	bst128 initcounter;
	bst128 counter;
	
	
	
	(void) nsec; /*avoid warning*/
	initcounter.s[0]=npubv[0];
	initcounter.s[1]=npubv[1];/*initially holds nonce,later IC*/
	sin.s[0]=kv[0];
	sin.s[1]=kv[1];/*get user key*/
	rijndaelKeySetupEnc(rkey_enc,sin.b);/*expand user key   */
       
  /*=========get kappa======  */
  rijndaelEncrypt(rkey_enc,initcounter.b,kappa.b);
 
  
  
	 	  
/*=============get session rkeys and mask=====*/
	 
 initcounter=Obtain_sessionrkeys(kappa,rkey_enc);
 
 
 
 
 
 
/*===============================
              associated data 
=================================*/  

checksum=ProcessAD(adlen,ad,rkey_enc,kappa,initcounter);

  
 
/*===========================================
              ENCRYPT PLAINTEXT
==============================================  */

	counter=NADD64(kappa,initcounter);
	*clen=mlen+TAGLENGTH; 
	j=0;
	if(mlen>0){
		while(j<blockmlen){
			sin.s[0]=mv[2*j];
			sin.s[1]=mv[2*j+1];
			XOR128(checksum,sin);
			sout=TAES_ENCRYPT(sin,rkey_enc,counter);
			cv[2*j]=sout.s[0];
			cv[2*j+1]=sout.s[1];
			XORADD(checksum.s,sout,counter);
			counter=NADD64(counter,initcounter);
			j++;
		}/*endwhile. Now only a possible partial block exists */
		j=(j<<4);

		if(j<mlen){ /*last block is partial, then */  
			sout=PartialBlock(mlen,rkey_enc,j,m,c,1,initcounter,counter);
			XOR128(checksum,sout);
		}/*endif j<mlen  */
		
	}/*endif mlen>0, end encryption  */



/*=========================
             TAG
===========================*/



wout=TAG(checksum,adlen,mlen,rkey_enc,kappa);



for(i=0;i<TAGLENGTH;i++) c[mlen+i]=wout.b[i];



return 0;

}/*end AEAD encrypt*/







/*
=============================================================================            
										DECRYPT-VERIFY

=============================================================================*/

int crypto_aead_decrypt(
    unsigned char *m,unsigned long long *mlen,
    unsigned char *nsec,
    const unsigned char *c,unsigned long long clen,
    const unsigned char *ad,unsigned long long adlen,
    const unsigned char *npub,
    const unsigned char *k){
	
	/* declaration of variables */
	bst128 checksum;
	bst128 kappa; 
	u32 rkey_enc[56];
	u32 rkey_dec[56];/* decryption round keys*/
	bst128 sin,sout;
	u64 i,j;
	u64* mv=(u64*)m;
	u64* cv=(u64*)c;
	u64* kv=(u64*)k;
	u64* npubv=(u64*)npub;
	bst128 wout;
	bst128 initcounter;
	bst128 counter;
	u64 kount=clen-TAGLENGTH;
	u64 blockclen=(kount/16);/*number of ciphertext full blocks,excluding tag*/
	
	(void) nsec; /*avoid warning*/
	if(clen<TAGLENGTH) return -1;
	
	initcounter.s[0]=npubv[0];
	initcounter.s[1]=npubv[1];/*initially holds pub msg number*/
	sin.s[0]=kv[0];
	sin.s[1]=kv[1];/*get user key*/
	rijndaelKeySetupEnc(rkey_enc,sin.b);/*expand user key   */

       
  /*=========get kappa======  */
  rijndaelEncrypt(rkey_enc,initcounter.b,kappa.b);
 

	 	  
/*=============get session rkeys and mask=====*/
	 
 initcounter=Obtain_sessionrkeys(kappa,rkey_enc);
  
/*===============================
              associated data 
=================================*/   

checksum=ProcessAD(adlen,ad,rkey_enc,kappa,initcounter);


 /*==========================================================
                  DECRYPT CIPHERTEXT 
				  
=======================================================*/
	
	counter=NADD64(kappa,initcounter);
	*mlen=clen-TAGLENGTH;
	j=0;
	if(clen>TAGLENGTH){
		 /*obtain decryption keys*/
		CONVERT2DECKEY(rkey_enc,rkey_dec);
	
		while(j<blockclen){
			sin.s[0]=cv[2*j];sin.s[1]=cv[2*j+1];				
			XORADD(checksum.s,sin,counter);			
			sout=TAES_DECRYPT(sin,rkey_dec,counter);
			XOR128(checksum,sout);
			mv[2*j]=sout.s[0];mv[2*j+1]=sout.s[1];
			counter=NADD64(counter,initcounter);
			j++;
		}/*endwhile. */
		 
		j=(j<<4);
		 
		if(j<kount){ /*last block is partial, then */   
			sout=PartialBlock(kount,rkey_enc,j,c,m,0,initcounter,counter);
			XOR128(checksum,sout);
		}/*endif j  */
		  
		
    }/*end decryption  
	
	
	   ==========================
	          VERIFY TAG
	   ===========================*/

	
	
	

wout=TAG(checksum,adlen,kount,rkey_enc,kappa);

j=0;
/*to avoid side attacks and to try to fool the compiler into not optimizing too much*/
for(i=0;i<TAGLENGTH;i++) {
	if(wout.b[i]!=c[kount+i]) j+=2;
		else j++;
	}
	if(j>TAGLENGTH) return -1;
	


	return 0;
}/*  ===============END aead decrypt ========================*/








   