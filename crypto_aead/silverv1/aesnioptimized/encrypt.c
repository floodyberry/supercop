
/** SILVER optimized for INTEL AESNI instructions
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

#include "crypto_aead.h"
#include "api.h"

 
#define TAGLENGTH 16  
/*====================================
change the above line 
 if a truncated tag is wanted. The default is 16 bytes.
DO NOT USE DIFFERENT TAG LENGTHS WITH THE SAME KEY UNLESS YOUR APPLICATION
FORCES THE INCLUSION OF THE TAG LENGTH IN THE ASSOCIATED DATA 
 ==================================
 */ 


 
#include "macs4AESNI.h"

#define ALIGN(n) __attribute__ ((aligned(n)))


#if __GNUC__ || (__STDC_VERSION__ >= 199901L)
#include <stdint.h>
typedef uint64_t u64;
#else
typedef unsigned long long u64;
#endif


typedef union{
__m128i w;
ALIGN(16) unsigned char b[16];
u64 u[2];
}wunion128;
	
#define XORADD(checksum,update,mask) XOR128(checksum,(ADD64(update,mask)))		

	
w128 TAG(w128 checksum,u64 adlen,u64 mlen,w128* rkey_enc,w128 kappa){
		 /* returns the tag, i.e., the encryption of the checksum*/
	w128 tag;	
	w128 tmp=_mm_set_epi64((__m64)mlen,(__m64)adlen);
	/*WARNING: above puts mlen on the RIGHT and temp on the LEFT*/
	w128 tempkey=rkey_enc[0];
	rkey_enc[0]=rkey_enc[2];
	rkey_enc[2]=rkey_enc[3];
	rkey_enc[3]=rkey_enc[4];
	rkey_enc[4]=rkey_enc[6];
	rkey_enc[6]=rkey_enc[7];
	rkey_enc[7]=rkey_enc[8];
	rkey_enc[8]=rkey_enc[10];
	rkey_enc[10]=tempkey;
	tempkey=rkey_enc[5];
	rkey_enc[5]=rkey_enc[1];
	rkey_enc[1]=rkey_enc[9];
	rkey_enc[9]=tempkey;
	tmp=ADD64(kappa,tmp);
         TAES_ENCRYPT(checksum,tag,rkey_enc,tmp);
		 return tag;
		 

   }
   /*====================== end TAG=====================  */

   
   
   
void Obtain_sessionrkeys(const unsigned char *npub, const unsigned char *k,w128* rkey_enc,	w128* kappaandIC){
  
	w128 tempkeys[11];
	wunion128 mask;
	__m128i* kv=(__m128i*)k;
	__m128i* npubv=(__m128i*)npub;
	w128 userkey= _mm_loadu_si128(&kv[0]); /*get user key*/
	w128 Nonce= _mm_loadu_si128(&npubv[0]);/*get nonce*/
		

	

   
  /*=========get kappa and rkeys(userkey) ======  */

  kappaandIC[0]=AESEXPANDandENCRYPT(userkey,Nonce,rkey_enc);
  
  
 /*get definitive rkeys and preIC*/
  AES_128_KEY_EXPANSION(kappaandIC[0],tempkeys);
  
  /*keys 1,5 remain as they are  */
	rkey_enc[0]=XOR128(rkey_enc[0],tempkeys[1]);
	rkey_enc[2]=XOR128(rkey_enc[2],tempkeys[2]);
	rkey_enc[3]=XOR128(rkey_enc[3],tempkeys[3]);
	rkey_enc[4]=XOR128(rkey_enc[4],tempkeys[4]);
	rkey_enc[5]=XOR128(rkey_enc[5],tempkeys[5]);
	rkey_enc[6]=XOR128(rkey_enc[6],tempkeys[6]);
	rkey_enc[7]=XOR128(rkey_enc[7],tempkeys[7]);
	rkey_enc[8]=XOR128(rkey_enc[8],tempkeys[8]);
	rkey_enc[10]=XOR128(rkey_enc[10],tempkeys[10]);
	/*modify tempkey9 to make each half odd*/
 	  mask.u[0]=0x1U;mask.u[1]=0x1U;
	  kappaandIC[1]=_mm_or_si128(tempkeys[9],mask.w);
}
/*========================= end Obtain_rkeys===============
============================================================
*/   





w128 SETUPcounterLEFT(w128 input){
      w128 counter=input;
	  wunion128 mask;
	  mask.u[0]=0xFFFFFFFFFFFFFFFFU;
	  mask.u[1]=0;
	  counter=_mm_and_si128(counter,mask.w);
	  return counter;
}


   
w128 ProcessAD(unsigned long long adlen,const unsigned char *ad,
               w128* rkey_enc,w128 kappa,w128 IC){
			   
  /*variable declarations */
 w128 checksum=createzero128();
 u64 i,j,blockadlen;
 w128 paralellcounter[8];
 __m128i* adv=(__m128i*)ad;
 w128 pin[8];/* for multiple block enc*/
 w128 pout[8];
 w128 sin,sout;
 u64 kount=0;
 wunion128 partial;
 w128 adinitcounter=SETUPcounterLEFT(IC);
 w128 initcounterx8=adinitcounter;
 w128 counter=ADD64(kappa,adinitcounter);
 /*end variable declaration */
 
 if(adlen>0){
      blockadlen=(adlen/16);/*number of ad full blocks
	  
	  */
	  j=0;
	  /*now set up the paralell counters, but only if needed*/
	  if(blockadlen>7) {
	  
	    paralellcounter[0]=counter;
	    for(j=1;j<8;j++){
			paralellcounter[j]=ADD64(paralellcounter[j-1],adinitcounter);
			initcounterx8=ADD64(initcounterx8,adinitcounter);
		}
		
		for(j=0;j+7<blockadlen;j=j+8){  	     
	     /*load 8 blocks of associated data  */
			for(i=0;i<8;i++) {
					pin[i]=_mm_loadu_si128(&adv[j+i]);
			}

		/*encrypt them and xor the 8 outs into the checksum  */
 
        TAES_PARALLEL_ENCRYPT(pin,pout,rkey_enc,paralellcounter);
		for(i=0;i<8;i++) checksum=XOR128(checksum,pout[i]);
        
		 PARALLELINCR(paralellcounter,initcounterx8);
		 
		}/*endforj.*/
        counter=paralellcounter[0];		
	  }/* end if. In particular if we didn't enter, counter is initial counter.
	   now from 0 to 7 blocks remain, one of which can be partial.*/
      
	  
	  while(j<blockadlen){
	    sin=_mm_loadu_si128(&adv[j]);
        TAES_ENCRYPT(sin,sout,rkey_enc,counter);
        checksum=XOR128(checksum,sout);
		counter=ADD64(counter,adinitcounter);
		j++;
      }/*endwhile. Now only a possible partial block exists */
       
	 
	 j=(j<<4);/*now it counts bytes since each block has 16 bytes*/
	 if(j<adlen){ /*we DO have a partial block*/

		partial.w=createzero128();
		 
		 while(j+kount<adlen){
		   partial.b[kount]=ad[j+kount];
		   kount++;
		  }/*endwhile  */
		  partial.b[kount]=1;
		  
        TAES_ENCRYPT(partial.w,sout,rkey_enc,kappa);
		/*kappa is never used elsewhere. This is equivalent to use
		S=0 in the Silver document, page 7*/
		checksum=XOR128(checksum,sout);
    }/* end if j<adlen. no need to update counter*/
	 
 }/*end if adlen*/	
   
   return checksum;
 }
 /*=================end ProcessAD ============*/
 
 
 
 /**==========================================
      next is    to process a partial plaintext block
		  return value is a 128 bit word to be xored to the checksum
		  side effects: encrypts, i.e., changes the ciphtxt stream
		  the flag is so we can use the code in both enc and dec
	===========================================**/
 
 
w128 PartialBlock(unsigned long long msglen,w128* rkey_enc,u64 j,
              const unsigned char *inb,unsigned char *outb,
			  int flag,w128 initcounter,w128 counter){
	unsigned char i;
	wunion128 sin,sout;

	sin.w=_mm_set_epi64((__m64)msglen,(__m64)msglen);
	
	TAES_ENCRYPT(sin.w,sout.w,rkey_enc,counter);
	 

			  
		i=0;
	if(flag){ /*enc */
		while(j<msglen){
			outb[j]=inb[j]^sout.b[i];
			sout.b[i]^=outb[j]; /*this writes the original inb[j] into
					sout.b[i]. we do it this way instead of
					simply sout.b[i]=inb[j] since inb and outb may point to the
					 same area, and thus the previous line may have overwritten
					 inb[j]*/
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
	
			
			/*first bytes of sout.w have the last bytes of plain, rest
				is the encryption of the length*/
		counter=ADD64(counter,initcounter);
		TAES_ENCRYPT(sout.w,sin.w,rkey_enc,counter);
		return sin.w;
		
		

 }/*==============
    
	END partial block 
 
 ======================
 */
 
 
 

   

/*
				********************************************
=======================================================================================
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
       
    w128 checksum;
	w128 kappa;
    w128 rkey_enc[11];
    w128 pin[8];/* for multiple block enc*/
    w128 pout[8];
	w128 paralellcounter[8];
	w128 sin,sout;/*for single block enc and to process key*/
	wunion128 wout;/*for tag¨*/
    u64 i,j;
	u64 blockmlen=(mlen/16); /*number of plain full blocks*/
	__m128i* mv=(__m128i*)m;
	__m128i* cv=(__m128i*)c;
	w128 kapandIC[2];
	w128 initcounter,initcounterx8,counter;
	
	(void) nsec; /*avoid warning*/
	
	Obtain_sessionrkeys(npub,k,rkey_enc,kapandIC);
	kappa=kapandIC[0];
	initcounter=kapandIC[1];
	
/*===============================
              associated data 
=================================*/  

	checksum=ProcessAD(adlen,ad,rkey_enc,kappa,initcounter);

  
 
/*===========================================
              ENCRYPT PLAINTEXT
==============================================  */

 *clen=mlen+TAGLENGTH; 
	 j=0;
 if(mlen>0){
	counter=ADD64(kappa,initcounter);
	    
	if(blockmlen>7){
	    paralellcounter[0]=counter;
		initcounterx8=initcounter;
	    for(j=1;j<8;j++){
			paralellcounter[j]=ADD64(paralellcounter[j-1],initcounter);
			initcounterx8=ADD64(initcounterx8,initcounter);
		}
		  
		for(j=0;j+7<blockmlen;j=j+8){/*
			load 8 blocks, encrypt them and 
			xor the plaintexts AND ciphertexts into the checksum
							   */
					
			for(i=0;i<8;i++){ /*load and update checksum  */
			    pin[i]=_mm_loadu_si128(&mv[j+i]);
				checksum=XOR128(checksum,pin[i]);
			}
            TAES_PARALLEL_ENCRYPT(pin,pout,rkey_enc,paralellcounter); 
	             /* output ciphertext  */			
			for(i=0;i<8;i++){
			_mm_storeu_si128(&cv[i+j], pout[i]);
			checksum=XORADD(checksum,pout[i],paralellcounter[i]);
			}
		     PARALLELINCR(paralellcounter,initcounterx8);
		}/*end for j*/      
			
		  
		counter=paralellcounter[0];		
	}/* enf if. In particular if we didn't enter, counter is initial counter.
	   now from 0 to 7 blocks remain, one of which can be partial.*/
        
	
	while(j<blockmlen){
			sin=_mm_loadu_si128(&mv[j]);
			checksum=XOR128(checksum,sin);
		    TAES_ENCRYPT(sin,sout,rkey_enc,counter);
			_mm_storeu_si128(&cv[j], sout);
			checksum=XORADD(checksum,sout,counter);
			counter=ADD64(counter,initcounter);
		    j++;
	}/*endwhile. Now only a possible partial block exists */
		  

        j=(j<<4);

		if(j<mlen){ /*last block is partial, then */  
		
		sout=PartialBlock(mlen,rkey_enc,j,m,c,1,initcounter,counter);
			 
		checksum=XOR128(checksum,sout);
			
			
		}/*endif j<mlen  */
		
 }/*endif mlen>0, end encryption  */


/*=========================
             TAG
===========================*/



wout.w=TAG(checksum,adlen,mlen,rkey_enc,kappa);


/*cannot store directly into cv using _mm_storeu_si128 because 
it may no longer  be aligned since the last block 
may be incomplete	*/



for(i=0;i<TAGLENGTH;i++) c[mlen+i]=wout.b[i];



return 0;

}/*end AEAD encrypt*/







/*
        ********************************************

=============================================================================================				DECRYPT-VERIFY

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
    w128 checksum;
    w128 kappa; /*session (nonce-dependent) key*/
    w128 rkey_enc[11];/*will hold at first expansion of user key, later, the xor of it with expansion of kappa */
	w128 rkey_dec[11];/* decryption round keys*/
    w128 pin[8];/*for paralell dec */
    w128 pout[8];
	w128 paralellcounter[8];
	w128 sin,sout;
	wunion128 wout;
    u64 i,j;
	u64 kount=clen-TAGLENGTH;
	u64 blockclen=(kount/16);/*number of ciphertext full blocks,
                               	   excluding tag*/
	__m128i* mv=(__m128i*)m;
	__m128i* cv=(__m128i*)c;
	w128 kapandIC[2];
	w128 initcounter,initcounterx8,counter;
	/*end declaration*/
	
	(void) nsec; /*avoid warning*/
	if(clen<TAGLENGTH) return -1;

	
	Obtain_sessionrkeys(npub,k,rkey_enc,kapandIC);
	kappa=kapandIC[0];
	initcounter=kapandIC[1];
  
/*===============================
              associated data 
=================================*/   

checksum=ProcessAD(adlen,ad,rkey_enc,kappa,initcounter);


 /*==========================================================
                  DECRYPT CIPHERTEXT 
				  
=======================================================*/
	
		
     *mlen=clen-TAGLENGTH;
	 j=0;
     if(clen>TAGLENGTH){
		counter=ADD64(kappa,initcounter);
		 /*obtain decryption keys*/
		 CONVERT2DECKEY(rkey_enc,rkey_dec);
		if(blockclen>7){
	
			paralellcounter[0]=counter;
			initcounterx8=initcounter;
			for(j=1;j<8;j++){
				paralellcounter[j]=ADD64(paralellcounter[j-1],initcounter);
				initcounterx8=ADD64(initcounterx8,initcounter);
			}
			for(j=0;j+7<blockclen;j=j+8){/*
							   load 8 blocks, decrypt them and xor the
							    plaintexts 
							   AND ciphertexts into the checksum
								   */
				for(i=0;i<8;i++) {
					pin[i]=_mm_loadu_si128(&cv[j+i]);
					checksum=XORADD(checksum,pin[i],paralellcounter[i]);/*in has the cphtxt */
				}
				
				TAES_PARALLEL_DECRYPT(pin,pout,rkey_dec,paralellcounter);     
				for(i=0;i<8;i++){/*store pltxt and update checksum */
					_mm_storeu_si128(&mv[i+j], pout[i]);
					checksum=XOR128(checksum,pout[i]);/*out has the plain*/
				}/* end for i*/

  
				PARALLELINCR(paralellcounter,initcounterx8);
			}/*end for j*/      
			
		  
			counter=paralellcounter[0];		
		}/* enf if blocklen>j. In particular if we didn't enter, counter is initial counter.
	   now from 0 to 7 blocks remain, one of which can be partial.*/
        
		
		
		while(j<blockclen){ 
			sin=_mm_loadu_si128(&cv[j]);
            checksum=XORADD(checksum,sin,counter);			
			sout=TAES_DECRYPT(sin,rkey_dec,counter);
			checksum=XOR128(checksum,sout);
			_mm_storeu_si128(&mv[j],sout);
			counter=ADD64(counter,initcounter);
			j++;
		}/*endwhile. */
		 
		j=(j<<4);
		 
		if(j<kount){ /*last block is partial, then */   
			sout=PartialBlock(kount,rkey_enc,j,c,m,0,initcounter,counter);
			checksum=XOR128(checksum,sout);
		}/*endif j  */
		  
		
    }/*end decryption  
	
	
	
	
	   ==========================
	          VERIFY TAG
	   ===========================*/

	
	
	

wout.w=TAG(checksum,adlen,kount,rkey_enc,kappa);


j=0;
/*to avoid side attacks and to try to fool the compiler into not optimizing too much*/
for(i=0;i<TAGLENGTH;i++) {
	if(wout.b[i]!=c[kount+i]) j+=2;
		else j++;
	}
	
	if(j>TAGLENGTH) return -1;
	



	
	return 0;
}/*  ===============END aead decrypt ========================*/








   