/**
 * The implementation of omdsha256 mode
 */

#include "omdsha256.h"
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

void
xor_block (hashblock res, const hashblock in1, const hashblock in2)
{
	int i;
	for(i=0;i<32;i++)
	    res[i] = in1[i] ^ in2[i];
}

void
double_block (hashblock res, const hashblock in)
{
    /* create bitmask from msb using signed shift */
    uint8_t carry = (uint8_t) (((char) in[0]) >> 7);
    
    /* shift with carry from next block */
	int i;
	for(i=0;i<31;i++)
    	res[i] = (in[i] << 1) | (in[i+1] >> 7);

    /* xor P(x) if msb */
    res[30] = res[30] ^ (carry & 0x04); //OMD_n-2 = 30
    /* shift and xor P(x) if msb */
    res[31] = (in[31] << 1) ^ (carry & 0x25);   //OMD_n-1 = 31
}

void
triple_block (hashblock res, const hashblock in)
{
    /* create bitmask from msb using signed shift */
    uint8_t carry = (uint8_t) (((char) in[0]) >>7);
    
    /* shift and xor */
	int i;
	for(i=0;i<31;i++)
    	res[i] = in[i] ^ ((in[i] << 1) | (in[i+1] >> 7));

    /* xor P(x) if msb */
    res[30] = res[30] ^ (carry & 0x04); //OMD_n-2 = 30
    /* shift and xor and xor P(x) if msb */
    res[31] = (in[31] ^ (in[31] << 1)) ^ (carry & 0x25);  //OMD_n-1 = 31
}

/*void
key_func (hashblock res, const hashblock hash, const hashblock key,
	  const hashblock message)*/
void
key_func (hashblock res, const hashblock hash, const hashblock message)
{
    /* K,M -> K||M */
    memcpy (&keyblk[OMD_n] , message, OMD_n );
    
    /*call the underlying compression function*/
    OMD_COMP (res, hash, keyblk);
}

inline int
ntz (int v)
{
    int c = 0;
    for (; (v & 1) == 0 ; v >>= 1) ++c;
    return c;
}


inline void
precompute (const uint8_t* key, int k_len) {		
	int i;
	/* copy key into the messagelock array */
	memcpy (keyblk, key, k_len );
	/* comp lstar according to v2 spec*/
	key_func (Lstar, block0s, taublk);
	/* compute l values */
	double_block(L[0],Lstar);
	double_block(L[0],L[0]);
	for (i=1;i<LCOUNT;i++) {
		double_block(L[i],L[i-1]);
	} 
}


/* Tag_a = 0^n has to be provided when hash is called*/
void
hash (hashblock taga, const uint8_t *ad,
      uint64_t adlen)
{
    /*b = n+m*/
    const size_t b = 64;   // OMD_n + OMD_m = 64
    
    /* A_1 || A_2 ··· A_{l−1} || A_l = A, where |A_i| = b for 1 ≤ i ≤ l−1
     and |A_l| ≤ b */
    /* l=ceil(adlen/b) */
    int32_t l = (adlen + 63)/b; // b - 1 = 63
    unsigned int modlen = adlen % b;
    
	/*initial Delta*/
	/* \bar{\delta}_{0,0} = 0^n */
    hashblock Delta={
      0,0,0,0,0,0,0,0,
      0,0,0,0,0,0,0,0,
      0,0,0,0,0,0,0,0,
      0,0,0,0,0,0,0,0
    };

    hashblock xor_res, key_func_res;
    
    /** for i = 1 to l-1 **/
    /**********************/
    int32_t i = 0;
    for (; i < l - 1; i++){
        /* Tag_a = Tag_a ^ F_K(A_l[b-1...m] ^ \delta_{i, 0}, A_l[m-1...0]) */
		NEXTDEL(Delta,i+1);
        xor_block (xor_res, Delta, &ad[i*b]);
        key_func (key_func_res, xor_res, &ad[(i*b) + OMD_n]);
        xor_block (taga, taga, key_func_res);
    }
    /**************************/
    /******* endfor ***********/
    
    /* we process last ad block*/    
    /* |A_l| = b then */
    if (modlen == 0 && adlen > 0){
		NEXTDEL(Delta,l);
        xor_block(xor_res, Delta, &ad[(l-1)*b]);
        key_func(key_func_res, xor_res, &ad[((l-1)*b) + OMD_n]);
    } /* |A_l| < b then */
    else {      
		LASTDELA(Delta);  
        if (modlen < OMD_n){
            /* pad last block */
            hashblock left = {0x00};
            hashblock right = {0x00};
            memcpy (left, &ad[(l-1)*b], modlen);
            left[modlen] = 0x80;
            
            xor_block(xor_res, Delta, left);
            key_func(key_func_res, xor_res, right);
        }
        else{
            hashblock right = {0x00};
            memcpy (right, &ad[((l-1)*b) + OMD_n], modlen - OMD_n);
            right[modlen - OMD_n] = 0x80;
            
            xor_block(xor_res, Delta, &ad[(l-1)*b]);
            key_func(key_func_res, xor_res, right);
        }
    }
    
    /* Tag_a = Tag_a ^ F_K(Left ^ \delta_{l, 0 or 1}, right) */
    xor_block(taga, taga, key_func_res);
}

int
omdsha256_process(uint8_t *data, const uint8_t *key,
                  const uint8_t *data_process,
                  uint64_t data_processlen,
                  const uint8_t *ad, uint64_t adlen,
                  const uint8_t *nonce,
                  const enum mode encrypting)
{
    /* if |K| > n => return -1  */
    if (10 > OMD_k || OMD_k > OMD_n)
        return -1;

    /* if |N| > n-1 => return -1 */
    if ((12 > OMD_lnonce) || (OMD_lnonce > 31)) //OMD_n-1 = 31
        return -1;

    /* if |C| < tau => return -1 */
    if ((encrypting == OMD_DECRYPT) && (data_processlen < OMD_tau))
        return -1;
    
    int32_t l = 0;
    if (encrypting == OMD_ENCRYPT)
    {
        /* M_1 || M_2 ··· M_{l−1} || M_l = M, where |M_i| = m for 1 ≤ i ≤ l−1
         and |M_l| ≤ m */
        /* l = ceil(|M|/m) */
        l = (data_processlen + 31)/OMD_m;   //OMD_m-1 = 31
    }
    else if (encrypting == OMD_DECRYPT)
    {
        /* C_1 || C_2 ··· C_{l−1} || C_l || Tag = \mathbb{C},
         where |C_i| = m for 1 ≤ i ≤ l−1 and |C_l| ≤ m and |Tag| = \tau*/
        data_processlen = data_processlen - OMD_tau;
        /* l = ceil(|C|/m) */
        l = (data_processlen + 31)/OMD_m;   //OMD_m-1 = 31
    }
    
    precompute(key, OMD_k);

    unsigned int data_process_modlen = data_processlen % OMD_m;

    /* pad nonce */
    NONCE_BLK_MACRO
    memcpy (nonce_block, nonce, OMD_lnonce);
    
	/* Delta_N,0,0=F_K(N||10*,0) */
    hashblock Delta;
	key_func (Delta, nonce_block, block0s);

    /* Tag_a computed here to handle the case when the the buffers ad=c overlap
     * This does not have any impact on the security, as Tag_e and Tag_a are
     * computed independently */
    /* Tag_a = HASH_k(ad)  */
    hashblock taga = {0x00};
    hash(taga, ad, adlen);
    
    /* H = 0^n */
    hashblock h = {0x00};
     /* H = F_K(H ^ \delta_{N, 1, 0}, <tau>_m)  */
	NEXTDEL(Delta,1);
    key_func (h, Delta, taublk);


    hashblock xor_res;
    int32_t i = 0;
    /* for i = 1 to l-1 do  */
    /************************/
    for (; i < l-1; i++){
        /* C_i = H ^ M_i */
        /* M_i = H ^ C_i */
        xor_block(xor_res, h, &data_process[i*OMD_m]);
		  /* \Delta_{N,i+1,0} */
		  NEXTDEL(Delta,i+2);
		  /* H = F_K(H ^ \delta{N, i, 0}, M_i) */
        xor_block(h, Delta, h);
      if (encrypting == OMD_ENCRYPT)
		{
		   /* M_i in data_process*/
         key_func(h, h, &data_process[i*OMD_m]);
			memcpy(&data[i*OMD_m],xor_res,OMD_m);
		}
      else if (encrypting == OMD_DECRYPT)
		{
         /* M_i in xor_res */
			memcpy(&data[i*OMD_m],xor_res,OMD_m);
         key_func(h, h, &data[i*OMD_m]);
		}
    }
    /************************/
    /******** endfor ********/

    unsigned int statedelta;
    hashblock tage;
    hashblock res2;
	 hashblock res = {0x00};
    /* |M|>0 */
    if (data_processlen > 0){
        /* C_l = H ^ M_l */
        /* M_l = H ^ C_l *//* |M_l| = m then */
        
        memcpy(res, &data_process[(l-1)*OMD_m], (data_process_modlen == 0
                                                 ? OMD_m : data_process_modlen));
		  xor_block(res2, h, res);
        memcpy(&data[(l-1)*OMD_m], res2, (data_process_modlen==0
					   ? OMD_m : data_process_modlen));
	}
     /* if |M_\ell|=m */
     if (data_process_modlen == 0 && data_processlen > 0 ){
         statedelta = 1;
		/* Delta_N,l,1 */
		LASTDELM1(Delta);
     /* else if |M_\ell|<m*/
     }else{
      statedelta = 2;
		/* Delta_N,l,2 */
		LASTDELM2(Delta);
     }

     /* Tag_e = F_K(H ^ \delta{N, l, j}, M_l)  */
     xor_block(h, h, Delta);

     if (encrypting == OMD_ENCRYPT){
         /* if |M_\ell|<m, we pad*/
         if (statedelta==2)
             res[data_process_modlen]=0x80;

         key_func(tage, h, res);        /* res  = M_i */
     } else if (encrypting == OMD_DECRYPT){
         if(statedelta==2){
             /* if |M_\ell|<m, we pad*/
             res2[data_process_modlen]=0x80;
             memset(&res2[data_process_modlen+1], 0x00, 31 - data_process_modlen);  // OMD_m-1 = 31
         }
         key_func(tage, h, res2);      /* res2 = M_i */
     }



    hashblock tag;
    /* Tag = (Tag_e ^ Tag_a)[n-1 ... n- tau]  */
    xor_block(tag, taga, tage);

    /*ENCRYPT => output tag and return 0*/
    if (encrypting == OMD_ENCRYPT){
        memcpy (&data[data_processlen], tag, OMD_tau);
        return 0;
    }

    /* or check tag */
    if (memcmp (tag,&data_process[data_processlen],OMD_tau) == 0)
        return 0;
    return -1;
}
