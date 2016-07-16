/**
 * The implementation of the omdsha512 mode
 */

#include <omdsha512.h>
#include <string.h>

void
xor_block (hashblock res, const hashblock in1, const hashblock in2)
{
    unsigned int i;

    for (i = 0; i < OMD_n ; i++)
       {
	  res[i] = in1[i] ^ in2[i];
       }
}

void
double_block (hashblock res, const hashblock in)
{
    unsigned int i;
    /* create bitmask from msb using signed shift */
    unsigned char carry = in[0] & 0x80;

    for (i = 0; i < OMD_n-1; i++)
       {
	  /* shift with carry from next block */
	  res[i] = (in[i] << 1) | (in[i+1] >> 7);
       }
	
	res[OMD_n -1] = (in[OMD_n -1] << 1);

    /* xor P(x) if msb */
	if(carry) {
	    res[OMD_n -2] = res[OMD_n -2] ^ 0x01;
	    res[OMD_n -1] = res[OMD_n -1] ^ 0x25;
	}
}

void
triple_block (hashblock res, const hashblock in)
{
    unsigned int i;
    /* create bitmask from msb using signed shift */
    unsigned char carry = in[0] & 0x80;

    for (i = 0; i < OMD_n -1; i++)
       {
	  /* shift and xor */
	  res[i] = in[i] ^ ((in[i] << 1) | (in[i+1] >> 7));
       }

	res[OMD_n -1] = in[OMD_n -1] ^ (in[OMD_n -1] << 1);

    /* xor P(x) if msb */
	if(carry) {
	    res[OMD_n -2] = res[OMD_n -2] ^ 0x01;
	    res[OMD_n -1] = res[OMD_n -1] ^ 0x25;
	}
}

void
l2b (hashblock bit_string, int value)
{
   int ptr = value*8;
   unsigned int i = OMD_n;

   memset(bit_string, 0x00, OMD_n);

   while (i--)
      {   /* write the bytes of value into tau */
	 bit_string[i] = ptr & 0xff;
	 ptr >>= 8;
      }
}

void
key_func (hashblock res, const hashblock hash, const hashblock key,
	  const hashblock message)
{
   messageblock glue;

   memcpy (glue, key, OMD_n);
   /* K,M -> K||M */
   memcpy (&glue[OMD_n], message, OMD_n);
   /*call the underlying compression function*/
   OMD_COMP (res, hash, glue);
}

void
calc_L_i (hashblock l, const hashblock lzero, unsigned int i)
{
   /* i==0 => l=lzero */
   if (i == 0)
      {
	 memcpy (l, lzero, OMD_n );
	 return;
      }

   double_block (l,lzero);

   /* L[i]=2.L[i-1] */
   while (--i)
      {
	 double_block (l,l);
      }
}

int
ntz (int v)
{
   int c;

   /* Set v's trailing 0s to 1s and zero rest */
   v = (v ^ (v - 1)) >> 1;

   for (c = 0; v; c++)
      {
	 v >>= 1;
      }

   return c;
}

void
increment_masking_message (hashblock delta_n, const hashblock delta_o,
			   const hashblock lzero, int i)
{
   hashblock l;

   if (i < 1)
      {
	 return;
      }

   /* \delta_{N, i, 0} = \delta_{N, i-1, 0} ^ L[ntz(i)]  */
   calc_L_i (l, lzero, ntz(i));
   xor_block (delta_n, delta_o, l);

}

void
final_masking_message (hashblock delta_n, const hashblock delta_o,
		       const hashblock lstar, int j)
{
   hashblock l;

   switch (j)
      {
	 /* \delta_{N, i, 1} = \delta_{N, i, 0} ^ 2*L_*  */
	 case 1: double_block (l, lstar); break;

	 /* \delta_{N, i, 2} = \delta_{N, i, 0} ^ 3*L_*  */
	 case 2: triple_block (l, lstar); break;
      }

	xor_block (delta_n, delta_o, l);
}

void
increment_masking_associated_data (hashblock delta_n, const hashblock delta_o,
				   const hashblock lzero, int i)
{
   hashblock l;

   /* \delta_{i, 0} = \delta_{i-1, 0} ^ L[ntz(i)]  */
   calc_L_i (l, lzero, ntz(i));
   xor_block (delta_n, delta_o, l);
}

void
final_masking_associated_data (hashblock delta_n, const hashblock delta_o,
			       const hashblock lstar)
{
   /* \delta_{i, 0} = \delta_{i-1, 0} ^ L[ntz(i)]  */
   xor_block (delta_n, delta_o, lstar);
}

void
hash (hashblock taga, const hashblock key, const unsigned char *ad,
      unsigned long long int adlen)
{
   hashblock lstar, lzero;
   hashblock delta;
   hashblock left, right;
   hashblock xor_res, key_func_res;
   hashblock taures;
   unsigned int  modlen;
   long long int i, l;
   size_t b;

   /* CHANGE FROM V1 TO V2 HERE */
   /* L_* = F_K(0^n, <tau>_m) */
   l2b (taures, OMD_tau);
   key_func (lstar, block0s, key, taures);
   /* L[0] = 4.L* */
   double_block (lzero, lstar);
   double_block (lzero, lzero);

   /*b = n+m*/
   b = OMD_n + OMD_m;

   /* A_1 || A_2 ··· A_{l−1} || A_l = A, where |A_i| = b for 1 ≤ i ≤ l−1
      and |A_l| ≤ b */
   /* l=ceil(adlen/b) */
   l = (adlen + b - 1)/b;

   /* Tag_a = 0^n  */
   memset (taga, 0x00, OMD_n);
   /* If AD="" => Tag_a = 0^n */
   if (adlen == 0)
      {
	 return;
      }

   /* \bar{\delta}_{0,0} = 0^n */
   memset (delta, 0x00, OMD_n);

   /** for i = 1 to l-1 **/
   /**********************/
   for (i = 1; i < l; i++)
      {
	 /*  \bar{\delta}_{i, 0} =  \bar{\delta}{i-1, 0} ^ L[ntz(i)]  */
	 increment_masking_associated_data (delta, delta, lzero, i);

	 /* Left = A_l[b-1...m]; */
	 memcpy (left, &ad[(i-1)*b],  OMD_n);
	 /* Right = A_l[m-1...0]  */
	 memcpy (right,&ad[(i-1)*b+OMD_n],OMD_m);

	 /* Tag_a = Tag_a ^ F_K(Left ^ \delta_{i, 0}, right) */
	 xor_block (xor_res, delta, left);
	 key_func (key_func_res, xor_res, key, right);
	 xor_block (taga, taga, key_func_res);
      }
   /**************************/
   /******* endfor ***********/

   /* here adlen!=0, we process last ad block*/

   modlen = adlen%b;

   /* |A_l| = b then */
   if (modlen == 0)
      {
	 /* last mask = \bar{\delta}{l,0}  */
	 increment_masking_associated_data (delta, delta, lzero,l);

	 memcpy (left, &ad[(l-1)*b],      OMD_n);
	 memcpy (right,&ad[(l-1)*b+OMD_n],OMD_m);
      }
   /* |A_l| < b then */
   else
      {
	 /* last mask = \bar{\delta}{l-1,1}  */
	 final_masking_associated_data (delta, delta, lstar);

	 memset (left , 0x00, OMD_n);
	 memset (right, 0x00, OMD_m);

	 memcpy (left, &ad[(l-1)*b], (modlen < OMD_n ? modlen : OMD_n));
	 memcpy (right, &ad[(l-1)*b+OMD_n], (modlen < OMD_n
					     ? 0
					     : modlen - OMD_n));

	 if (modlen < OMD_n)
	    /* pad last block */
	    left[modlen] = 0x80;
	 else
	    right[modlen-OMD_n] = 0x80;
   }

   /* Tag_a = Tag_a ^ F_K(Left ^ \delta_{l, 0 or 1}, right) */
   xor_block (xor_res, delta, left);
   key_func (key_func_res, xor_res, key, right);
   xor_block (taga, taga, key_func_res);
}

int
omdsha512_process(unsigned char *data, const unsigned char* key,
                  const unsigned char *data_process,
                  unsigned long long int data_processlen,
                  const unsigned char *ad, unsigned long long int adlen,
                  const unsigned char *nonce,
                  const enum mode encrypting)
{
   hashblock key_block;
   hashblock lstar, lzero;
   hashblock nonce_block;
   hashblock delta;
   hashblock h;
   hashblock res, res2;
   hashblock taures;
   hashblock taga, tage, tag, tag_prime;
   hashblock xor_res;
   unsigned int statedelta, data_process_modlen;
   long long int i, l = 0;

   /* if |K| > n => return -1  */
   if (10 > OMD_k || OMD_k > OMD_n)
      return -1;

   /* if |N| > n-1 => return -1 */
   if ((12 > OMD_lnonce) || (OMD_lnonce > OMD_n-1))
      return -1;

   /* if |C| < tau => return -1 */
   if ((encrypting == OMD_DECRYPT) && (data_processlen < OMD_tau))
      return -1;

   memset (key_block, 0x00, OMD_n);
   memcpy (key_block, key, OMD_k);

   if (encrypting == OMD_ENCRYPT)
      {
    /* M_1 || M_2 ··· M_{l−1} || M_l = M, where |M_i| = m for 1 ≤ i ≤ l−1
	 and |M_l| ≤ m */
	 /* l = ceil(|M|/m) */
	 l = (data_processlen + (OMD_m-1))/OMD_m;
      }
   else if (encrypting == OMD_DECRYPT)
      {
      /* C_1 || C_2 ··· C_{l−1} || C_l || Tag = \mathbb{C},
	 where |C_i| = m for 1 ≤ i ≤ l−1 and |C_l| ≤ m and |Tag| = \tau*/
    data_processlen = data_processlen - OMD_tau;
    /* l = ceil(|C|/m) */
    l = (data_processlen +OMD_m-1)/OMD_m;
      }

   /* Tag_a computed here to handle a=c overlap */
   /* Tag_a = HASH_k(ad)  */
   hash(taga, key_block, ad, adlen);

   /* CHANGE FROM V1 TO V2 HERE */
   /* L* = F_K(0^n, <tau>_m) */
   l2b (taures, OMD_tau);
   key_func (lstar, block0s, key_block, taures);

   /* L[0] = 4.L* */
   double_block (lzero, lstar);   /* 2.L_* */
   double_block (lzero, lzero);   /* 2.(2.L_*) */

   /* pad nonce */
   memset (nonce_block, 0x00, OMD_n);
   memcpy (nonce_block, nonce, OMD_lnonce);
   nonce_block[OMD_lnonce] = 0x80;

   /* \delta{N,0,0} = F_K(N || 10^{n-1-|N|}, 0^m  */
   key_func (delta, nonce_block, key_block, block0s);

   /* H = 0^n */
   memset (h, 0x00, OMD_n);

   /* \delta{N,1,0} = \delta{N,0,0} ^ L[ntz(1)]  */
   increment_masking_message (delta, delta, lzero, 1);

   /* H = F_K(H ^ \delta_{N, 1, 0}, <tau>_m)  */
   xor_block (h, h, delta);
   key_func (h, h, key_block, taures);

   /* for i = 1 to l-1 do  */
   /************************/
   for (i = 1; i < l; i++)
      {
	 /* C_i = H ^ M_i */
	 /* M_i = H ^ C_i */
	 memcpy (res,&data_process[(i-1)*OMD_m],OMD_m);
	 xor_block (res2, h, res);
	 memcpy (&data[(i-1)*OMD_m],res2,OMD_m);

	 /* \delta_{N, i, 0} = \delta{N, i-1, 0} ^ L[ntz(i)]  */
	 increment_masking_message (delta, delta, lzero, i+1);

	 /* H = F_K(H ^ \delta{N, i, 0}, M_i) */
	 xor_block (xor_res, delta, h);

	 if (encrypting == OMD_ENCRYPT)
	    /* res  = M_i */
	    key_func(h, xor_res, key_block, res);
	 else if (encrypting == OMD_DECRYPT)
	    /* res2 = M_i */
	    key_func(h, xor_res, key_block, res2);
      }

   /************************/
   /******** endfor ********/


   /* |M|>0 */
   if (data_processlen !=0 )
      {
	 /* C_l = H ^ M_l */
	 /* M_l = H ^ C_l *//* |M_l| = m then */
	 data_process_modlen = data_processlen % OMD_m;
	 memset (res,0x00,OMD_m);
	 memcpy (res, &data_process[(l-1)*OMD_m], (data_process_modlen==0
						  		  ? OMD_m
						  		  : data_process_modlen));
	 xor_block (res2, h, res);
	 memcpy (&data[(l-1)*OMD_m], res2, (data_process_modlen==0
					   ? OMD_m : data_process_modlen));

      /* if |M_\ell|=m */
      if (data_process_modlen == 0)
         statedelta = 1;
      /* else if |M_\ell|<m*/
      else
         statedelta = 2;

      /* \delta{N, l, 1} = \delta{N, l, 0} ^ (2 or 3)*L_* */
      final_masking_message (delta, delta, lstar, statedelta);
      /* Tag_e = F_K(H ^ \delta{N, l, 1}, M_l)  */
      xor_block (h, h, delta);

      if (encrypting == OMD_ENCRYPT)
	 {
	    /* if |M_\ell|<m, we pad*/
	    if (statedelta==2)
	       res[data_process_modlen]=0x80;

		 /* res  = M_i */
	    key_func(tage, h, key_block, res);
	 }
      else if (encrypting == OMD_DECRYPT)
	 {
	    if(statedelta==2)
	       {
		  /* if |M_\ell|<m, we pad*/
		  res2[data_process_modlen] = 0x80;
		  memset (&res2[data_process_modlen+1], 0x00,
			   OMD_m - data_process_modlen - 1);
	       }

         /* res2 = M_i */
         key_func(tage, h, key_block, res2);
	 }

      }
   /* |M| = 0 => tage = H */
   else
      {
	 memcpy(tage,h,OMD_n);
      }

   /* Tag = (Tag_e ^ Tag_a)[n-1 ... n- tau]  */
   xor_block(tag, taga, tage);

   /*ENCRYPT => output tag and return 0*/
   if (encrypting == OMD_ENCRYPT)
      {
	 memcpy (&data[data_processlen], tag, OMD_tau);

	 return 0;
      }

   /* or check tag */
   memcpy(tag_prime, &data_process[data_processlen], OMD_tau);

   if (memcmp (tag,tag_prime,OMD_tau) == 0)
      {
	 return 0;
      }

   return -1;
}
