#include "crypto_aead.h"


/** SILVER byte oriented
*  @author Daniel Penazzi,@author Miguel Montes
      April, 2014.
*  Silver, using a byte oriented endian neutral implementation of Rijndael
* This code is not intended to be fast, only endian neutral and capable of running
* on a variety of machines.

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
 
#include "rijndaelEndianNeutral.h" 
 
/*change the following if a truncated tag is wanted. The default is 16 bytes
DO NOT USE DIFFERENT TAG LENGTHS WITH THE SAME KEY UNLESS YOUR APPLICATION
FORCES THE INCLUSION OF THE TAG LENGTH IN THE ASSOCIATED DATA*/  
#define TAGLENGTH 16   
 
/*u8 defined in .h Next is to define u64, preferably with
uint, but some compilers of MS seem not to accept it*/

#if __GNUC__ || (__STDC_VERSION__ >= 199901L)
#include <stdint.h>
typedef uint64_t u64;
#else
typedef unsigned long long u64;
#endif

 

void LESTOREu64inbytearray(u64 Rv,u8* R){
	u8 i;
	for(i=0;i<8;i++) {
		R[i]=Rv&0xff;
		Rv=Rv>>8;
	} 
} 



	
void XOR128(u8* A,const u8* B){
	u8 i;
	for(i=0;i<16;i++) A[i]^=B[i];
}	
	

void NADD64(const u8* A,const u8* B,u8* R){
	u64 Av1=(u64)A[0];
	u64 Av2=(u64)A[8];
	u64 Bv1=(u64)B[0];
	u64 Bv2=(u64)B[8];
	u64 Rv;
	u8 i;
	u64 H=256;
	for(i=1;i<8;i++){ 
		Av1+=H*((u64)A[i]);
		Av2+=H*((u64)A[i+8]);
		Bv1+=H*((u64)B[i]);
		Bv2+=H*((u64)B[i+8]);
		H=H*256;
	}
	Rv=Av1+Bv1;
	for(i=0;i<8;i++) {
		R[i]=Rv&0xff;
		Rv=Rv>>8;
	}
	Rv=Av2+Bv2;
	for(i=8;i<16;i++) {
		R[i]=Rv&0xff;
		Rv=Rv>>8;
	}
}/*end NADD*/
	
void XORADD(u8* checksum,const u8*update,u8* mask){
	u8 R[16];
	NADD64(update,mask,R);\
	XOR128(checksum,R);
}

 
   
void Obtain_sessionrkeys(u8* kappa,u8* rkey,u8* counter){
 
	u8 tempkeys[11*16];
	int i,j;
 
	rijndaelexpandKey(kappa,tempkeys);
  
  
  /*keys 1,9 remain as they are  */
   for(i=0;i<16;i++){
		rkey[i]^=tempkeys[i+16];/*0 xor 1*/
		for(j=2;j<9;j++){
			rkey[16*j+i]^=tempkeys[16*j+i];/*j xor j*/
		}
		counter[i]=tempkeys[16*9+i];/*9th rkey  */
		rkey[160+i]^=tempkeys[160+i];/*10 xor 10*/
	}
	/*above is normal key expansion.
	 in locations 16*11 through 16*14-1 we will hold a copy of the round keys 1,5,9.
	 so we can change the ones in 1,5,9 and then restore them*/
	 for(i=0;i<16;i++){
		rkey[16*11+i]=rkey[16+i];/*copy r1*/
		rkey[16*12+i]=rkey[16*5+i];/*copy r5*/
		rkey[16*13+i]=rkey[16*9+i];/*copy r9*/
	}
	/*now make counter odd on both halves*/
	counter[0]|=(0x1U);
	counter[8]|=(0x1U);

 
}/*========================= end Obtain_rkeys===============*/   




void TAES_ENCRYPT(const u8* in,u8* out,u8* rkey,u8* counter){
	 int i;
	 u8 tempcount;
	 /*set rkeys 1,5,9 using the backups*/
	
	

	 for(i=0;i<16;i++){
		tempcount=counter[i];
		rkey[16+i]=rkey[16*11+i]^tempcount;
		rkey[16*5+i]=rkey[16*12+i]^tempcount;
		rkey[16*9+i]=rkey[16*13+i]^tempcount;
	}
	
 rijndaelEncrypt(rkey,in,out);


}




void TAES_DECRYPT(const u8* in,u8* out,u8* rk,u8* counter){
	 int i;
	 u8 tempcounter;
	
	 /*set rkeys 1,5,9 using the backups*/

	 for(i=0;i<16;i++){
		tempcounter =counter[i];
		rk[16+i]=rk[16*11+i]^tempcounter;
		rk[16*5+i]=rk[16*12+i]^tempcounter;
		rk[16*9+i]=rk[16*13+i]^tempcounter;
	}

 rijndaelDecrypt(rk,in,out);


}



	 
	
void TAG(u8* checksum,
         u64 adlen,u64 mlen,u8* rkey,u8* tag,u8* kappa){
		 /* returns the tag, i.e., the encryption of the checksum*/
	u8 i;
	u8 tempkey;
	u8 tmp[16];
	u64 L=(u64)kappa[0];
	u64 R=(u64)kappa[8];
	u64 H=256;
	for(i=1;i<8;i++){ 
		L+=H*((u64)kappa[i]);
		R+=H*((u64)kappa[i+8]);
		H=H*256;
	}/*this is needed for endian neutralness, in LE a cast would suffice*/
	L+=adlen;
	R+=mlen;
	LESTOREu64inbytearray(L,tmp);
	LESTOREu64inbytearray(R,tmp+8);

	for(i=0;i<16;i++) {
		tempkey=rkey[i];
		rkey[i]=rkey[i+16*2];
		rkey[i+16*2]=rkey[i+16*3];
		rkey[i+16*3]=rkey[i+16*4];
		rkey[i+16*4]=rkey[i+16*6];
		rkey[i+16*6]=rkey[i+16*7];
		rkey[i+16*7]=rkey[i+16*8];
		rkey[i+16*8]=rkey[i+160];
		rkey[i+160]=tempkey;
		tempkey=rkey[i+16*12];/*changing the rkeys 1,5,9 is 
		               irrelevant because Taesencypt rewrites them.
					   We have to change the order of the keys 11,12,13,
					   which are the ones that are going to be put in rounds
					   1,5,9 by taes  */
		rkey[i+16*12]=rkey[i+16*11];
		rkey[i+16*11]=rkey[i+16*13];
		rkey[i+16*13]=tempkey;
	}


         TAES_ENCRYPT(checksum,tag,rkey,(tmp));
		
		 

		
   }
   /*====================== end TAG=====================  */

 




void SETUPcounterLEFT(u8* input,u8* counter){
	u8 i;
	for(i=0;i<8;i++) counter[i]=input[i];
	for(i=8;i<16;i++) counter[i]=0;
}



   
void ProcessAD(u64 adlen,const unsigned char *ad,
               u8* rkey,u8* kappa,u8* preIC,u8* checksum){
			   
  /*variable declarations */
	u64 j,blockadlen;
	u8 sout[16];
	u8 initcounter[16];
	u8 counter[16];
	u8 kount=0;
	u8 partial[16]={0};
 /*end variable declaration */
 for(j=0;j<16;j++) checksum[j]=0;
 if(adlen>0){
	SETUPcounterLEFT(preIC,initcounter);
	NADD64(kappa,initcounter,counter);
	blockadlen=(adlen/16);/*number of ad full blocks

	  */
	j=0;	  
	while(j<blockadlen){
		TAES_ENCRYPT(ad,sout,rkey,counter);
		XOR128(checksum,sout);
		NADD64(counter,initcounter,counter);
		j++;ad+=16;
      }/*endwhile. Now only a possible partial block exists */
       
	 
	j=(j<<4);/*now it counts bytes since each block has 16 bytes*/
	if(j<adlen){ /*we DO have a partial block*/

		 
		while(j+kount<adlen){
		   partial[kount]=ad[kount];
		   kount++;
		}/*endwhile  */
		
		partial[kount]=1; 
		TAES_ENCRYPT(partial,sout,rkey,kappa);
		/*kappa is never used elsewhere*/
		XOR128(checksum,sout);
	}/* end if j<adlen. no need to update counter*/
	 
 }/*end if adlen*/	
   
 }/*=================end ProcessAD ============*/
 
 
 
 /**==========================================
      next function is  to process a partial plaintext block
		  "retvalue" is to be xored to the checksum.
		  j is the number of bytes processed so far.
		  side effects: encrypts/decrypts, i.e., changes the 
		  ciphtxt/plaintxt stream.
		  the flag is so we can use the code in both enc and dec
		  this probably is slightly slower than having two codes
		  but is better if one needs to make changes
	===========================================**/
 
 
void PartialBlock(u64 msglen,u8* rkey,u64 j,
              const unsigned char *inb,unsigned char *outb,
			  int flag,u8* initcounter,u8* counter,u8* retvalue){
	u8 i;
	u8 sout[16];
	u8 in[16];
	
	
	LESTOREu64inbytearray(msglen,in);
	for(i=0;i<8;i++) in[i+8]=in[i];

	
	
	TAES_ENCRYPT(in,sout,rkey,counter);

			 /*in this case the plain cannot be incorporated into
				the checksum since it is counter mode,
				so silver does one more process
			  */
 

		i=0;
		if(flag){ /*enc */
			while(i<msglen-j){
				outb[i]=inb[i]^sout[i];
				sout[i]^=outb[i];/*this writes the original inb[i] into sout.
						we do not write sout[i]=inb[i] directly
						since outb may have rewritten inb[i]*/
				i++;
			}/*endwhile   */
		}/*end if*/
		else {/*dec */
			while(i<msglen-j){
				sout[i]=outb[i]=inb[i]^sout[i];/*dec is easier than enc*/
				 i++;
			}/*endwhile   */
		}/*end else*/
		sout[15]=i;
		

			/*first bytes of sout have the last bytes of plain, rest
				is  encryption of the length and number of bytes at the end*/
		NADD64(counter,initcounter,counter);
		
	
		TAES_ENCRYPT(sout,retvalue,rkey,counter);

		
 }/*==============END partial block */
 
 
 

   

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
      
      /*start: initialize auxiliary variables*/
       
      
	u8 checksum[16];
	u8 kappa[16];
	u8 rkey[16*14];
	u8 sout[16];
	u64 j;
	u8 tag[16];
	u8 initcounter[16];
	u8 counter[16];
	u64 blockmlen=(mlen/16); /*number of plain full blocks*/

	  
	  
	(void) nsec;			/* avoid warning*/

	
	
	rijndaelexpandKey(k,rkey);/*expand user key   */
       
  /*=========get kappa======  */
  rijndaelEncrypt(rkey,npub,kappa);

	 	  
/*=============get session rkeys and mask=====*/
	 
 Obtain_sessionrkeys(kappa,rkey,initcounter);

  
/*===============================
              associated data 
=================================*/   

	ProcessAD(adlen,ad,rkey,kappa,initcounter,checksum);

  
 
/*===========================================
              ENCRYPT PLAINTEXT
==============================================  */

	NADD64(kappa,initcounter,counter);
 	*clen=mlen+TAGLENGTH; 
	 j=0;
	if(mlen>0){
	
		while(j<blockmlen){
			XOR128(checksum,m);
			TAES_ENCRYPT(m,c,rkey,counter);
			XORADD(checksum,c,counter);
			NADD64(counter,initcounter,counter);
			j++;m+=16;c+=16;
		}/*endwhile. Now only a possible partial block exists */
		  

		j=(j<<4);

		if(j<mlen){ /*last block is partial, then */
		
			PartialBlock(mlen,rkey,j,m,c,1,initcounter,counter,sout);
			 
			XOR128(checksum,sout);
			
			c+=(mlen-j);
		}/*endif j<mlen*/  
		
 }/*endif mlen>0, end encryption  */


 
 
/*=========================
             TAG
===========================*/



	TAG(checksum,adlen,mlen,rkey,tag,kappa);

/*we could store directly into c in the default taglength=16
but we do it this way in case truncation is wanted*/




for(j=0;j<TAGLENGTH;j++) c[j]=tag[j];


return 0;

}/*end AEAD encrypt*/







/*

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
	/*WARNING we assume from the CAESAR call that the person in charge of the call to this
	function will discard the plaintext if this function returns -1, and that
	any attacker will not have access to m unless the return value is not -1.
	*/
	
	if(clen<TAGLENGTH) return -1;
	/* declaration of variables */
	u8 checksum[16];
	u8 kappa[16]; 
	u8 rkey[16*14];
	u8 sout[16];
	u64 i,j;
	u8 tag[16];
	u8 initcounter[16];
	u8 counter[16];
	u64 kount=clen-TAGLENGTH;
	u64 blockclen=(kount/16);/*number of ciphertext full blocks, excluding tag*/

	
	(void) nsec;			/* avoid warning*/

	
	
	rijndaelexpandKey(k,rkey);/*expand user key   */
       
  /*=========get kappa======  */
  rijndaelEncrypt(rkey,npub,kappa);
 
 
 	 	  
/*=============get session rkeys and mask=====*/
	 
 Obtain_sessionrkeys(kappa,rkey,initcounter);
  
/*===============================
              associated data 
=================================*/   

	ProcessAD(adlen,ad,rkey,kappa,initcounter,checksum);


 /*==========================================================
                  DECRYPT CIPHERTEXT 
				  
=======================================================*/
	

	NADD64(kappa,initcounter,counter);
	*mlen=clen-TAGLENGTH;
	j=0;
	if(clen>TAGLENGTH){
		
		while(j<blockclen){				
			XORADD(checksum,c,counter);			
			TAES_DECRYPT(c,m,rkey,counter);
			XOR128(checksum,m);
			NADD64(counter,initcounter,counter);
			j++;c+=16;m+=16;
		}/*endwhile. */
		 
		j=(j<<4);
		 
		if(j<kount){ /*last block is partial, then */   
			PartialBlock(kount,rkey,j,c,m,0,initcounter,counter,sout);
			XOR128(checksum,sout);
			c+=(kount-j);
		}/*endif j  */
		  
		
    }/*end decryption  
	
	
	   ==========================
	          VERIFY TAG
	   ===========================*/

	
	
	

	TAG(checksum,adlen,kount,rkey,tag,kappa);

	
j=0;
/*to avoid side attacks and to try to fool the compiler into not optimizing too much*/
for(i=0;i<TAGLENGTH;i++) {
	if(tag[i]!=c[i]) j+=2;
		else j++;
	}
	
	if(j>TAGLENGTH) return -1;

	
	return 0;
}/*  ===============END aead decrypt ========================*/








   