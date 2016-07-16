#include "crypto_aead.h"

/** SILVER optimized without the use of AESNI instructions
* using a modification of rijndael-alg-fst 
* This works correctly only on Litle Endian Machines
*  @author Daniel Penazzi,@author Miguel Montes
      April, 2014.

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
#if PLATFORM_BYTE_ORDER!=IS_LITTLE_ENDIAN 
#error "This code produces standard results only on LE machines"
#endif
 
 
 
/*change the following if a truncated tag is wanted. The default is 16 bytes
DO NOT USE DIFFERENT TAG LENGTHS WITH THE SAME KEY UNLESS YOUR APPLICATION
FORCE THE INCLUSION OF THE TAG LENGTH IN THE ASSOCIATED DATA*/  
#define TAGLENGTH 16   
 
 
#include "AES-128TS.h"

typedef union{
unsigned char b[16];
u64 s[2];
u32 t[4];
}bst128;
	
/*when both are bst*/
#define XOR128(A,B) \
	A.s[0]^=B.s[0];\
	A.s[1]^=B.s[1];



	
#define NADD64(A,B,R) \
	R.s[0]=A.s[0]+B.s[0];\
	R.s[1]=A.s[1]+B.s[1];
	
	
#define XORADD(checksum,update,mask) \
	checksum.s[0]^=(update.s[0]+mask.s[0]);\
	checksum.s[1]^=(update.s[1]+mask.s[1]);


   
bst128 Obtain_sessionrkeys(bst128 kappa,u32* rkey_enc){ /*rkey_enc must be 44*/
	u32 tempkeys[44];
	int i,j;
	bst128 counter;
     
  rijndaelKeySetupEnc(tempkeys,kappa.t);
  
  
  /*keys 1,9 remain as they are  */
	for(i=0;i<4;i++){
		rkey_enc[i]^=tempkeys[i+4];/*0 xor 1*/
		for(j=2;j<9;j++){
			rkey_enc[4*j+i]^=tempkeys[4*j+i];/*j xor j*/
		}
		counter.t[i]=tempkeys[36+i];/*9th rkey  */
		rkey_enc[40+i]^=tempkeys[40+i];/*10 xor 10*/
	}
	/*make counter odd on both halves*/
	counter.s[0]|=(0x1U);
	counter.s[1]|=(0x1U);
return counter;
 
}
/*========================= end Obtain_rkeys===============
============================================================
*/   


bst128 TAG(bst128 checksum,
         u64 adlen,u64 mlen,u32* rkey_enc,bst128 kappa){
		 /* returns the tag, i.e., the encryption of the checksum*/
	int i;
	u32 tempkey;
	bst128 tag;
	bst128 tmp;
	tmp.s[0]=kappa.s[0]+adlen;
	tmp.s[1]=kappa.s[1]+mlen;
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
		tempkey=rkey_enc[i+20];
		rkey_enc[i+20]=rkey_enc[i+4];
		rkey_enc[i+4]=rkey_enc[i+36];
		rkey_enc[i+36]=tempkey;
	}

         SilverEncrypt(checksum.t,tag.t,rkey_enc,tmp.t);
		
		return tag;	
   }
   /*====================== end TAG=====================  */

 



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
 u32* adv=(u32*)ad;
 bst128 sout;
 bst128 counter;
 u64 kount=0;
 bst128 partial;
 bst128 checksum; 
bst128 initcounter=SETUPcounterLEFT(preIC);
 /*end variable declaration */
   checksum.s[0]=0;checksum.s[1]=0;
  
 if(adlen>0){
	NADD64(kappa,initcounter,counter);
	blockadlen=(adlen/16);/*number of ad full blocks*/
	j=0;	  
	while(j<blockadlen){
		SilverEncrypt(adv+4*j,sout.t,rkey_enc,counter.t);
		XOR128(checksum,sout);
		NADD64(counter,initcounter,counter);
		j++;
	}/*endwhile. Now only a possible partial block exists */
       
	 
	j=(j<<4);/*now it counts bytes since each block has 16 bytes*/
	if(j<adlen){ /*we DO have a partial block*/
		partial.s[0]=partial.s[1]=0;
		 
		while(j+kount<adlen){
		   partial.b[kount]=ad[j+kount];
		   kount++;
		}/*endwhile  */
		  
		partial.b[kount]=1;
		  
        	SilverEncrypt(partial.t,sout.t,rkey_enc,kappa.t);
		/*kappa is never used elsewhere*/
		XOR128(checksum,sout);
	}/* end if j<adlen. no need to update counter*/
	 
 }/*end if adlen*/	
    return checksum;
 }/*=================end ProcessAD ============*/
 
 
 
 /**==========================================
      next is    to process a partial plaintext block
		  return value is a 128 bit word to be xored to the checksum
		  side effects: encrypts, i.e., changes the ciphtxt stream
		  the flag is so we can use the code in both enc and dec
	===========================================**/
 
 
bst128 PartialBlock(u64 msglen,u32* rkey_enc,u64 j,
              const unsigned char *inb,unsigned char *outb,
			  int flag,bst128 initcounter,bst128 counter){
	u8 i;
	bst128 sin,sout;

    sin.s[0]=sin.s[1]=msglen;
	
	SilverEncrypt(sin.t,sout.t,rkey_enc,counter.t);
	
	i=0;
	if(flag){ /*enc */
		while(j<msglen){
			outb[j]=inb[j]^sout.b[i];
			sout.b[i]^=outb[j];/* this is equivalent to sout.b[i]=inb[j]
			                   except that in the previous line outb may 
							   rewrite inb if they point to the same area
							   so this is safer*/
			j++;i++;
		}/*endwhile   */
	}/*end if*/
	else {/*dec */
		while(j<msglen){
			sout.b[i]=outb[j]=inb[j]^sout.b[i];/*dec is easier than enc*/
			j++;i++;
		}/*endwhile   */
	}/*end else*/
	sout.b[15]=i;
	
	NADD64(counter,initcounter,counter);
	SilverEncrypt(sout.t,sin.t,rkey_enc,counter.t);
return sin;
 }/*==============END partial block  */
 
 
 

   

/*
                                ********************************************
=============================================================================================
                                        
										ENCRYPT and AUTENTICATE

=============================================================================================

*/


	

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
	u32 rkey_enc[44];
	bst128 sin,sout;
	u64 j;
	u64 blockmlen=(mlen/16); /*number of plain full blocks*/
	u64* mv=(u64*)m;
	u64* cv=(u64*)c;
	u32* kv=(u32*)k;
	u32* npubv=(u32*)npub;
	bst128 tag; 
	bst128 initcounter;
	bst128 counter;
	

	(void) nsec;	/* avoid warning*/

	rijndaelKeySetupEnc(rkey_enc,kv);/*expand user key   */
       
  /*=========get kappa======  */
  rijndaelEncrypt(rkey_enc,npubv,kappa.t);
 

/*=============get session rkeys and mask=====*/
	 
 initcounter=Obtain_sessionrkeys(kappa,rkey_enc);
  
/*===============================
              associated data 
=================================*/   

	checksum=ProcessAD(adlen,ad,rkey_enc,kappa,initcounter);

  
 
/*===========================================
              ENCRYPT PLAINTEXT
==============================================  */
	NADD64(kappa,initcounter,counter);
	*clen=mlen+TAGLENGTH; 
	j=0;
	if(mlen>0){

		while(j<blockmlen){
			sin.s[0]=mv[2*j];
			sin.s[1]=mv[2*j+1];
			XOR128(checksum,sin);
			SilverEncrypt(sin.t,sout.t,rkey_enc,counter.t);
			cv[2*j]=sout.s[0];
			cv[2*j+1]=sout.s[1];
			XORADD(checksum,sout,counter);
			NADD64(counter,initcounter,counter);
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

tag=TAG(checksum,adlen,mlen,rkey_enc,kappa);

/*we could have written TAG different so as to store directly into c
 in the default taglength=16
but we do it this way just in case truncation is wanted*/

c+=mlen;

for(j=0;j<TAGLENGTH;j++) c[j]=tag.b[j];


return 0;

}/*end AEAD encrypt*/







/*
                                ********************************************
=============================================================================================                     
			DECRYPT-VERIFY

=============================================================================================

*/

int crypto_aead_decrypt(
    unsigned char *m,unsigned long long *mlen,
    unsigned char *nsec,
    const unsigned char *c,unsigned long long clen,
    const unsigned char *ad,unsigned long long adlen,
    const unsigned char *npub,
    const unsigned char *k){
	

	/* declaration of variables */
	bst128 checksum;
	bst128 kappa; /*session (nonce-dependent) key*/
	u32 rkey_enc[44];
	u32 rkey_dec[44];/* decryption round keys*/
	bst128 sin,sout;
	u64 i,j;
	u64 kount=clen-TAGLENGTH;
	u64 blockclen=(kount/16);/*number of ciphertext full blocks, excluding tag*/
 	u64* mv=(u64*)m;
	u64* cv=(u64*)c;
	u32* kv=(u32*)k;
	u32* npubv=(u32*)npub;
	bst128 initcounter;
	bst128 counter;
	bst128 tag;
	
	(void) nsec;	/* avoid warning*/
	if(clen<TAGLENGTH) return -1;
	
	
	rijndaelKeySetupEnc(rkey_enc,kv);/*expand user key   */
       
  /*=========get kappa======  */
  rijndaelEncrypt(rkey_enc,npubv,kappa.t);
 
	 	  
/*=============get session rkeys and mask=====*/
	 
 initcounter=Obtain_sessionrkeys(kappa,rkey_enc);
  
/*===============================
              associated data 
=================================*/   

	checksum=ProcessAD(adlen,ad,rkey_enc,kappa,initcounter);


 /*==========================================================
                  DECRYPT CIPHERTEXT 
				  
=======================================================*/
	NADD64(kappa,initcounter,counter);

	*mlen=clen-TAGLENGTH;
	j=0;
    	if(clen>TAGLENGTH){
		/*obtain decryption keys*/
		CONVERT2DECKEY(rkey_enc,rkey_dec);

		while(j<blockclen){	
			sin.s[0]=cv[2*j];sin.s[1]=cv[2*j+1];
			XORADD(checksum,sin,counter);			
			SilverDecrypt(sin.t,sout.t,rkey_dec,counter.t);
			mv[2*j]=sout.s[0];mv[2*j+1]=sout.s[1];
			XOR128(checksum,sout);
			NADD64(counter,initcounter,counter);
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

	tag=TAG(checksum,adlen,kount,rkey_enc,kappa);


j=0;
/*to avoid side attacks and to try to fool the compiler into not optimizing too much*/
for(i=0;i<TAGLENGTH;i++) {
	if(tag.b[i]!=c[kount+i]) j+=2;
		else j++;
	}
	
	if(j>TAGLENGTH) return -1;
	

	return 0;
}/*  ===============END aead decrypt ========================*/








   