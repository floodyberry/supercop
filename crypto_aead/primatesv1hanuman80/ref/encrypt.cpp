//  -----------------------------------------------------------------------------
//                             Design Information
//  -----------------------------------------------------------------------------
//
//           Description: PRIMATEs v1 - Hanuman-80 instantiation.
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

	// V <-- p_1(O||K||N)
	InitializeState(V,key,nonce);
	p_1(V); 
	
	if(adlen!=0)
	{ 
		// for i=1 to u-1
		if(adlen>RateSizeBytes)
		{ 
			for(unsigned long long i=0; i<adlen-RateSizeBytes; i=i+RateSizeBytes)
			{
				Bytes2Element(data,ad,i,RateSizeElements); // representing a block of ad as elements
				// V <-- p_4 (A[i]^V_r || V_c)
				for(int j=0; j<RateSizeElements; j++)
					V[j]^=data[j];
				p_4(V);
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
	//for i=1 to w-1 (except the last block which needs padding)
	if(mlen>RateSizeBytes)
	{
		for(unsigned long long i=0; i<mlen-RateSizeBytes; i=i+RateSizeBytes)
		{ 
			Bytes2Element(data,m,i,RateSizeElements); //representing a block of m as elements
			// C[i] <-- M[i]^V_r
			for(int j=0; j<RateSizeElements; j++)
				cipher[j]=V[j]^data[j];
			Element2Bytes(c,cipher,i,RateSizeBytes); //representing a block of c as bytes
			//V <-- p_1 (C[i] || V_c)
			for(int j=0; j<RateSizeElements; j++)
				V[j]=cipher[j];
			p_1(V);
		}
	}
	
	//for i=w
	int l = mlen%RateSizeBytes;
	// C[i] <-- M[i]^V_r
	if((l==0) && (mlen!=0)){ //do padding with spill over			
		Bytes2Element(data,m,mlen-RateSizeBytes,RateSizeElements); // representing last block of m as elements
		for(int i=0; i<RateSizeElements; i++)
			cipher[i]=V[i]^data[i];
		Element2Bytes(c,cipher,mlen-RateSizeBytes,RateSizeBytes); //representing last block of c as bytes
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
			cipher[i]=V[i]^data[i];
		unsigned char ct[RateSizeBytes];
		Element2Bytes(ct,cipher,0,RateSizeBytes); //representing last block of c as bytes
		for(int i=0; i< l; i++)
			c[mlen-l+i]=ct[i]; //storing only l bytes of c
	}	
	//V <-- p_1 (C[i] || V_c)
	for(int j=0; j<RateSizeElements; j++)
		V[j]=cipher[j];
	p_1(V);

	// T <-- (V_c)_c/2 ^ K
	for(int i=0; i<TagSizeElements; i++)
		tag[i]=V[RateSizeElements+i]^key[i]; 
	Element2Bytes(c,tag,mlen,TagSizeBytes) ;
	*clen=mlen+TagSizeBytes;
	
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
	
	*mlen=clen-TagSizeBytes;
	
	if(clen<TagSizeBytes) return -1; //invalid ciphertext
   
	//a temporary array for message
	unsigned char *mT = (unsigned char*) malloc(clen-TagSizeBytes);
    if (mT == NULL) return -2; // memory allocation failure
	
	Bytes2Element(key,k,0,KeySizeElements); //representing k as elements
	Bytes2Element(nonce,npub,0,NonceSizeElements); //representing npub as elements

	// V <-- p_1(O||K||N)
	InitializeState(V,key,nonce);
	p_1(V); 
	
	if(adlen!=0)
	{ 
		// for i=1 to u-1
		if(adlen>RateSizeBytes)
		{
			for(unsigned long long i=0; i<adlen-RateSizeBytes; i=i+RateSizeBytes)
			{
				Bytes2Element(data,ad,i,RateSizeElements); // representing a block of ad as elements
				// V <-- p_4 (A[i]^V_r || V_c)
				for(int j=0; j<RateSizeElements; j++)
					V[j]^=data[j];
				p_4(V);
			}
		}
		// V <-- A[u]^v_r || V_c
		int l = adlen%RateSizeBytes;
		if(l==0){ //do padding with spill over			
			Bytes2Element(data,ad,adlen-RateSizeBytes,RateSizeElements);
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
			Bytes2Element(data,dataP,0,RateSizeElements);
			for(int i=0; i<RateSizeElements; i++)
				V[i]^=data[i];
		}
		// V <-- p_1(V)
		p_1(V);	
	}

	//for i=1 to w-1 (except the last block which needs padding)
	if(clen-TagSizeBytes>RateSizeBytes)
	{
		for(unsigned long long i=0; i<clen-(TagSizeBytes+RateSizeBytes); i=i+RateSizeBytes)
		{ 
			Bytes2Element(cipher,c,i,RateSizeElements); //representing a block of c as elements
			// M[i] <-- C[i]^V_r
			for(int j=0; j<RateSizeElements; j++)
				data[j]=V[j]^cipher[j];
			Element2Bytes(mT,data,i,RateSizeBytes); //representing m as bytes
			//V <-- p_1 (C[i] || V_c)
			for(int j=0; j<RateSizeElements; j++)
				V[j]=cipher[j];
			p_1(V);
		}
	}
	//for i=w
	int l = clen%RateSizeBytes;
	// M[w] <-- C[w]^V_r
	// V <-- M[w]||10* ^ V
	if((l==0) && ((clen-TagSizeBytes)!=0)){ //do padding with spill over			
		Bytes2Element(cipher,c,clen-(TagSizeBytes+RateSizeBytes),RateSizeElements);
		for(int i=0; i<RateSizeElements; i++){
			data[i]=V[i]^cipher[i];
			V[i]=cipher[i];
		}
		Element2Bytes(mT,data,clen-(TagSizeBytes+RateSizeBytes),RateSizeBytes); //representing last block m as bytes
		V[RateSizeElements]^=16; //padding spills over to capacity
	}
	else{ //do standard padding
		unsigned char cipherP[RateSizeElements];
		unsigned char mtmp[RateSizeBytes];
		for(int i=0; i< RateSizeElements; i++)
			cipherP[i]=V[i];
		Element2Bytes(mtmp,cipherP,0,RateSizeBytes);
		for(int i=0; i< l; i++)
			mT[clen-TagSizeBytes-l+i]=mtmp[i]^c[clen-TagSizeBytes-l+i];		
		unsigned char dataP[RateSizeBytes];
		for(int i=0; i< l; i++)
			dataP[i]=mT[clen-TagSizeBytes-l+i];
		dataP[l]=128; //padding over bytes
		for(int i=l+1; i<RateSizeBytes; i++)
			dataP[i]=0;
		Bytes2Element(data,dataP,0,RateSizeElements);
		for(int i=0; i<RateSizeElements; i++)
			V[i]^=data[i];
	}
	//V <-- p_1 (V)
	p_1(V);

	// T <-- (V_c)_c/2 ^ K
	for(int i=0; i<TagSizeElements; i++)
		tag[i]=V[RateSizeElements+i]^key[i]; 
	unsigned char tagT[TagSizeBytes];
	Element2Bytes(tagT,tag,0,TagSizeBytes) ;

	unsigned char cor=0;
	for(int i=0; i<TagSizeBytes; i++) //check if tags match
		cor = cor || (tagT[i]^c[clen-TagSizeBytes+i]);

	if(cor==0) //if tags match release the message
		for(unsigned long long i=0; i<clen-TagSizeBytes; i++)
			m[i]=mT[i];

	free(mT);
    if(cor==0) return 0;
	else return -1;
}