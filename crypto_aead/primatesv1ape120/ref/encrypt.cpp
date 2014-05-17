//  -----------------------------------------------------------------------------
//                             Design Information
//  -----------------------------------------------------------------------------
//
//           Description: PRIMATEs v1 - APE-120 instantiation.
//
//    Authors: Elena Andreeva, Beg�l Bilgin, Andrey Bogdanov, Atul Luykx,
//            Florian Mendel, Bart Mennink, Nicky Mouha, Qingju Wang,  
//                             and Kan Yasuda
//
//    Please contact primates@esat.kuleuven.be 
//              regarding any questions/comments of this reference code
//       
//  -----------------------------------------------------------------------------

#include "primate.h"
#include "parameters.h"
#include <stdlib.h>
#include "crypto_aead.h"

int crypto_aead_encrypt(
    unsigned char *c,unsigned long long *clen,
    const unsigned char *m,unsigned long long mlen,
    const unsigned char *ad,unsigned long long adlen,
    const unsigned char *nsec,
    const unsigned char *npub,
    const unsigned char *k
 )
 {
    /*...
    ... generating a ciphertext c[0],c[1],...,c[*clen-1]
    ... from a plaintext m[0],m[1],...,m[mlen-1]
    ... and associated data ad[0],ad[1],...,ad[adlen-1]
    ... and secret message number nsec[0],nsec[1],...
    ... and public message number npub[0],npub[1],...
    ... and secret key k[0],k[1],...
    ...*/
	unsigned char V[StateSize]; //the state represented in Elements
	//Temp variables represented as elements
	unsigned char key[KeySizeElements];
	unsigned char nonce[NonceSizeElements];
	unsigned char tag[TagSizeElements];
	unsigned char data[RateSizeElements];
	unsigned char cipher[RateSizeElements];
   
	Bytes2Element(key,k,0,KeySizeElements); //representing k  as elements
	Bytes2Element(nonce,npub,0,NonceSizeElements); //representing npub as elements

	// V <-- O||K
	InitializeState(V,key);
	// Treating the nonce as the first part of the associated data
	for(int i=0; i<(NonceSizeElements/RateSizeElements); i++)
	{
		// V <-- p_1 (N[i]^V_r || V_c)
		for(int j=0; j<RateSizeElements; j++)
			V[j]^=nonce[RateSizeElements*i+j];
		p_1(V);
	}
	if(adlen!=0)
	{ 
		// for i=1 to u-1 (except the last block which needs padding)
		if(adlen>RateSizeBytes)
		{ 
			for(unsigned long long i=0; i<adlen-RateSizeBytes; i=i+RateSizeBytes)
			{
				Bytes2Element(data,ad,i,RateSizeElements); // representing a block of ad as elements
				// V <-- p_1 (A[i]^V_r || V_c)
				for(int j=0; j<RateSizeElements; j++)
					V[j]^=data[j];
				p_1(V);
			}
		}
		// V <-- A[u]^v_r || V_c
		int l = adlen%RateSizeBytes;
		if(l==0){ //do padding with spill over			
			Bytes2Element(data,ad,adlen-RateSizeBytes,RateSizeElements); // representing last block of ad as elements
			for(int i=0; i<RateSizeElements; i++)
				V[i]^=data[i];
			V[RateSizeElements]^=16; //padding spills over to capacity
		}
		else{ //do standard padding
			unsigned char dataP[RateSizeBytes];
			for(int i=0; i< l; i++)
				dataP[i]=ad[adlen-l+i];
			dataP[l]=128; //padding over bytes
			for(int i=l+1; i<RateSizeBytes; i++)
				dataP[i]=0;
			Bytes2Element(data,dataP,0,RateSizeElements); // representing last padded block of ad as elements
			for(int i=0; i<RateSizeElements; i++)
				V[i]^=data[i];
		}
		// V <-- p_1(V)
		p_1(V);	
	}	
	// V <-- V ^ (0..01)
	V[StateSize-1]^=1;
	//for i=1 to w-1 (except the last block which needs padding)
	if(mlen>RateSizeBytes)
	{
		for(unsigned long long i=0; i<mlen-RateSizeBytes; i=i+RateSizeBytes)
		{ 
			Bytes2Element(data,m,i,RateSizeElements); //representing a block of m as elements
			//V <-- p_1 (M[i]^V_r || V_c)
			for(int j=0; j<RateSizeElements; j++)
				V[j]^=data[j];
			p_1(V);
			// C[i] <-- V_r
			for(int j=0; j<RateSizeElements; j++)
				cipher[j]=V[j];
			Element2Bytes(c,cipher,i,RateSizeBytes); //representing a block of c as bytes
		}
	}
	
	//for i=w
	int l = mlen%RateSizeBytes;
	// //V <-- p_1 (M[i]^V_r || V_c)
	if((l==0) && (mlen!=0)){ //do padding with spill over			
		Bytes2Element(data,m,mlen-RateSizeBytes,RateSizeElements); // representing last block of m as elements
		for(int i=0; i<RateSizeElements; i++)
			V[i]^=data[i];
		V[RateSizeElements]^=16; //padding spills over to capacity
	}
	else{ //do standard padding
		unsigned char dataP[RateSizeBytes];
		for(int i=0; i< l; i++)
			dataP[i]=m[mlen-l+i];
		dataP[l]=128; //padding over bytes
		for(int i=l+1; i<RateSizeBytes; i++)
			dataP[i]=0;
		Bytes2Element(data,dataP,0,RateSizeElements);  // representing last block of m as elements
		for(int i=0; i<RateSizeElements; i++)
			V[i]^=data[i];
	}	
	p_1(V);
	// C[i] <-- V_r
	for(int j=0; j<RateSizeElements; j++)
		cipher[j]=V[j];
	if(mlen<RateSizeBytes)
		Element2Bytes(c,cipher,0,RateSizeBytes); //representing last block of c as bytes
	else
		Element2Bytes(c,cipher,mlen-RateSizeBytes,RateSizeBytes); //representing last block of c as bytes

	// T <-- (V_c)_c/2 ^ K
	for(int i=0; i<TagSizeElements; i++)
		tag[i]=V[RateSizeElements+i]^key[i]; 
	if ((mlen>0)&&(mlen<RateSizeBytes)){
		Element2Bytes(c,tag,RateSizeBytes,TagSizeBytes) ;
		*clen=TagSizeBytes+RateSizeBytes;
	}
	else{
		Element2Bytes(c,tag,mlen,TagSizeBytes) ;
		*clen=mlen+TagSizeBytes;
	}
	
    return 0;
}

int crypto_aead_decrypt(
    unsigned char *m,unsigned long long *mlen,
    unsigned char *nsec,
    const unsigned char *c,unsigned long long clen,
    const unsigned char *ad,unsigned long long adlen,
    const unsigned char *npub,
    const unsigned char *k
)
{
	/*
    ... generating a plaintext m[0],m[1],...,m[*mlen-1]
    ... and secret message number nsec[0],nsec[1],...
    ... from a ciphertext c[0],c[1],...,c[clen-1]
    ... and associated data ad[0],ad[1],...,ad[adlen-1]
    ... and public message number npub[0],npub[1],...
    ... and secret key k[0],k[1],...
    ...
	*/
	unsigned char V[StateSize]; //the state represented in Elements
	//Temp variables represented as elements
	unsigned char key[KeySizeElements];
	unsigned char nonce[NonceSizeElements];
	unsigned char tag[TagSizeElements];
	unsigned char data[RateSizeElements];
	unsigned char cipher[RateSizeElements];
	unsigned char IV[StateSize]; //temp state represented in Elements
	
	if((clen<(TagSizeBytes+RateSizeBytes))&&(clen!=TagSizeBytes)) return -1; //invalid ciphertext
   
	//a temporary array for message
	unsigned char *mT = (unsigned char*) malloc(clen-TagSizeBytes);
    if (mT == NULL) return -2; // memory allocation failure
	
	Bytes2Element(key,k,0,KeySizeElements); //representing k as elements
	Bytes2Element(nonce,npub,0,NonceSizeElements); //representing npub as elements

	// IV <-- O||K
	InitializeState(IV,key);
	// Treating the nonce as the first part of the associated data
	for(int i=0; i<(NonceSizeElements/RateSizeElements); i++)
	{
		// IV <-- p_1 (N[i]^IV_r || IV_c)
		for(int j=0; j<RateSizeElements; j++)
			IV[j]^=nonce[RateSizeElements*i+j];
		p_1(IV);
	}
	if(adlen!=0)
	{ 
		// for i=1 to u-1 (except the last block which needs padding)
		if(adlen>RateSizeBytes)
		{ 
			for(unsigned long long i=0; i<adlen-RateSizeBytes; i=i+RateSizeBytes)
			{
				Bytes2Element(data,ad,i,RateSizeElements); // representing a block of ad as elements
				// IV <-- p_1 (A[i]^IV_r || IV_c)
				for(int j=0; j<RateSizeElements; j++)
					IV[j]^=data[j];
				p_1(IV);
			}
		}
		// IV <-- A[u]^IV_r || IV_c
		int l = adlen%RateSizeBytes;
		if(l==0){ //do padding with spill over			
			Bytes2Element(data,ad,adlen-RateSizeBytes,RateSizeElements); // representing last block of ad as elements
			for(int i=0; i<RateSizeElements; i++)
				IV[i]^=data[i];
			IV[RateSizeElements]^=16; //padding spills over to capacity
		}
		else{ //do standard padding
			unsigned char dataP[RateSizeBytes];
			for(int i=0; i< l; i++)
				dataP[i]=ad[adlen-l+i];
			dataP[l]=128; //padding over bytes
			for(int i=l+1; i<RateSizeBytes; i++)
				dataP[i]=0;
			Bytes2Element(data,dataP,0,RateSizeElements); // representing last padded block of ad as elements
			for(int i=0; i<RateSizeElements; i++)
				IV[i]^=data[i];
		}
		// IV <-- p_1(IV)
		p_1(IV);	
	}
	// IV <-- IV ^ (0..01)
	IV[StateSize-1]^=1;
	unsigned char tagT[TagSizeBytes];
	if(clen==TagSizeBytes){ //ciphertext length and hence the message length is 0
		*mlen=0;
		//do standard padding
		unsigned char dataP[RateSizeBytes];
		dataP[0]=128; //padding over bytes
		for(int i=1; i<RateSizeBytes; i++)
			dataP[i]=0;
		Bytes2Element(data,dataP,0,RateSizeElements);  // representing last block of m as elements
		// V <-- p_1 (M[1]^V_r || V_c)
		for(int i=0; i<RateSizeElements; i++)
			IV[i]^=data[i];
		p_1(IV);
		// T <-- (V_c)_c/2 ^ K 
		for(int i=0; i<TagSizeElements; i++)
			tag[i]=IV[RateSizeElements+i]^key[i]; 
		Element2Bytes(tagT,tag,0,TagSizeBytes) ;

		unsigned char cor=0;
		for(int i=0; i<TagSizeBytes; i++) //check if tags match
			cor = cor || (tagT[i]^c[i]);
		free(mT);
		if(cor==0) return 0;
		else return -1;
	}
	else{
		// V <-- p_1_inv(C[w] || K^T)
		Bytes2Element(cipher,c,clen-(TagSizeBytes+RateSizeBytes),RateSizeElements);
		Bytes2Element(tag,c,clen-(TagSizeBytes),TagSizeElements);
		for(int i=0; i<RateSizeElements; i++)
			V[i]=cipher[i];
		for(int i=0; i<CapacitySize; i++)
			V[RateSizeElements+i]=key[i]^tag[i];
		p_1_inv(V);
		
		if(clen==(TagSizeBytes+RateSizeBytes)){ //ciphertext is one block only hence plaintext length is less then or equal to RateSize
			// V <-- V ^ IV
			for(int i=0; i<StateSize; i++)
				V[i] ^= IV[i]; 
			unsigned char cor=0;
			for(int i=RateSizeElements+1; i<StateSize; i++) //check if IV_c matches with V_c
				cor = cor || V[i];
			cor = cor || (!((V[RateSizeElements]==0) || (V[RateSizeElements]==16)));
			if (cor==0)
			{
				for(int i=0; i<RateSizeElements; i++)
					data[i]=V[i];
				Element2Bytes(mT,data,0,RateSizeBytes); //representing m as bytes
				if(V[RateSizeElements]==16) *mlen=(unsigned long long) RateSizeBytes;
				else{ 
					unsigned char match=0;
					for(int i=0; i<RateSizeBytes; i++) {
						match |= (mT[i]==128);
					}
					if(match==0) { free(mT); return -1; }
					for(int i=RateSizeBytes-1; i>=0; i--)
						if(mT[i]==128) { *mlen=(unsigned long long) i; break;}
				}
				for(unsigned long long i=0; i<*mlen; i++)
					m[i]=mT[i];
				free(mT);
				return 0;
			}
			else { free(mT); return -1; }
		}
		else{
			*mlen=clen-TagSizeBytes;
			//for i=w (tha last block)
			int l = clen%RateSizeBytes;
			if (l==0){
				//M[w] <-- |V_r|_l^C[w-1]
				Bytes2Element(cipher,c,clen-(TagSizeBytes+2*RateSizeBytes),RateSizeElements);
				for(int i=0; i<RateSizeElements; i++)
					data[i]=V[i]^cipher[i];
				Element2Bytes(mT,data,clen-(TagSizeBytes+RateSizeBytes),RateSizeBytes); //representing last block m as bytes
				//V <-- V^M[w]10*
				for(int i=0; i<(RateSizeElements); i++)
					V[i]^=data[i];
				V[RateSizeElements]^=16;
			}
			else{
				//M[w] <-- |V_r|_l^C[w-1]
				unsigned char cipherP[RateSizeBytes];
				unsigned char mtmp[RateSizeBytes];
				Element2Bytes(cipherP,V,0,RateSizeBytes); //representing last block m as bytes
				for(int i=0; i<l; i++){
					mT[(clen-TagSizeBytes)-l+i]=cipherP[i]^c[clen-(TagSizeBytes+RateSizeBytes+l)+i];
					mtmp[i]=mT[(clen-TagSizeBytes)-l+i];
				}
				mtmp[l]=128;
				for(int i=l+1; i<RateSizeBytes; i++)
					mtmp[i]=0;
				Bytes2Element(data,mtmp,0,RateSizeElements);
				//V <-- V^M[w]10*
				for(int i=0; i<RateSizeElements; i++)
					V[i]^=data[i];	
			}
			l = (l==0) ? RateSizeBytes : l;
			//for i=w-1 to 2
			for(unsigned long long i=((clen-TagSizeBytes)-l); i>RateSizeBytes; i=i-5){
				// V <-- p_1_inv(V)
				p_1_inv(V);
				// M[i] <-- C[i-1]^V_r
				unsigned char mtmp[RateSizeElements];
				Bytes2Element(data,c,i-2*RateSizeBytes,RateSizeElements);
				for(int j=0; j<RateSizeElements; j++)
					mtmp[j]=data[j]^V[j];
				Element2Bytes(mT,mtmp,i-RateSizeBytes,RateSizeBytes); //representing last block m as bytes
				
				// V <-- C[i-1] || V_c
				for(int j=0; j<RateSizeElements; j++)
					V[j]=data[j];
			}
			//for i=1
			// V <-- p_1_inv(V)
			p_1_inv(V);
			// M[i] <-- C[i-1]^V_r
			for(int i=0; i<RateSizeElements; i++)
				data[i]=IV[i]^V[i];
			Element2Bytes(mT,data,0,RateSizeBytes); //representing last block m as bytes
			 //check if IV_c matches with V_c
			for(int j=0; j<RateSizeElements; j++)
				V[j]^=data[j];
			unsigned char cor=0;
			for(int i=RateSizeElements; i<StateSize; i++) 
				cor = cor || (V[i]^IV[i]);
			if(cor==0) {
				for(unsigned long long i=0; i<*mlen; i++)
					m[i]=mT[i];
			}
			free(mT);
			if (cor == 0) return 0;
			else return -1;
		}
	}
}