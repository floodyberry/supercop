/**
 * The implementation of the omdsha512 mode
 */

#include "omdsha512.h"
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

void
xor_block (hashblock res, const hashblock in1, const hashblock in2)
{
    res[0] = in1[0] ^ in2[0];
    res[1] = in1[1] ^ in2[1];
    res[2] = in1[2] ^ in2[2];
    res[3] = in1[3] ^ in2[3];
    res[4] = in1[4] ^ in2[4];
    res[5] = in1[5] ^ in2[5];
    res[6] = in1[6] ^ in2[6];
    res[7] = in1[7] ^ in2[7];
    res[8] = in1[8] ^ in2[8];
    res[9] = in1[9] ^ in2[9];
    
    res[10] = in1[10] ^ in2[10];
    res[11] = in1[11] ^ in2[11];
    res[12] = in1[12] ^ in2[12];
    res[13] = in1[13] ^ in2[13];
    res[14] = in1[14] ^ in2[14];
    res[15] = in1[15] ^ in2[15];
    res[16] = in1[16] ^ in2[16];
    res[17] = in1[17] ^ in2[17];
    res[18] = in1[18] ^ in2[18];
    res[19] = in1[19] ^ in2[19];
    
    res[20] = in1[20] ^ in2[20];
    res[21] = in1[21] ^ in2[21];
    res[22] = in1[22] ^ in2[22];
    res[23] = in1[23] ^ in2[23];
    res[24] = in1[24] ^ in2[24];
    res[25] = in1[25] ^ in2[25];
    res[26] = in1[26] ^ in2[26];
    res[27] = in1[27] ^ in2[27];
    res[28] = in1[28] ^ in2[28];
    res[29] = in1[29] ^ in2[29];
    
    res[30] = in1[30] ^ in2[30];
    res[31] = in1[31] ^ in2[31];
    res[32] = in1[32] ^ in2[32];
    res[33] = in1[33] ^ in2[33];
    res[34] = in1[34] ^ in2[34];
    res[35] = in1[35] ^ in2[35];
    res[36] = in1[36] ^ in2[36];
    res[37] = in1[37] ^ in2[37];
    res[38] = in1[38] ^ in2[38];
    res[39] = in1[39] ^ in2[39];
    
    res[40] = in1[40] ^ in2[40];
    res[41] = in1[41] ^ in2[41];
    res[42] = in1[42] ^ in2[42];
    res[43] = in1[43] ^ in2[43];
    res[44] = in1[44] ^ in2[44];
    res[45] = in1[45] ^ in2[45];
    res[46] = in1[46] ^ in2[46];
    res[47] = in1[47] ^ in2[47];
    res[48] = in1[48] ^ in2[48];
    res[49] = in1[49] ^ in2[49];
    
    res[50] = in1[50] ^ in2[50];
    res[51] = in1[51] ^ in2[51];
    res[52] = in1[52] ^ in2[52];
    res[53] = in1[53] ^ in2[53];
    res[54] = in1[54] ^ in2[54];
    res[55] = in1[55] ^ in2[55];
    res[56] = in1[56] ^ in2[56];
    res[57] = in1[57] ^ in2[57];
    res[58] = in1[58] ^ in2[58];
    res[59] = in1[59] ^ in2[59];
    
    res[60] = in1[60] ^ in2[60];
    res[61] = in1[61] ^ in2[61];
    res[62] = in1[62] ^ in2[62];
    res[63] = in1[63] ^ in2[63];
}

void
double_block (hashblock res, const hashblock in)
{
    /* create bitmask from msb using signed shift */
    uint8_t carry = (uint8_t) (((char) in[0]) >> 7);

    /* shift with carry from next block */
    res[0] = (in[0] << 1) | (in[1] >> 7);
    res[1] = (in[1] << 1) | (in[2] >> 7);
    res[2] = (in[2] << 1) | (in[3] >> 7);
    res[3] = (in[3] << 1) | (in[4] >> 7);
    res[4] = (in[4] << 1) | (in[5] >> 7);
    res[5] = (in[5] << 1) | (in[6] >> 7);
    res[6] = (in[6] << 1) | (in[7] >> 7);
    res[7] = (in[7] << 1) | (in[8] >> 7);
    res[8] = (in[8] << 1) | (in[9] >> 7);
    res[9] = (in[9] << 1) | (in[10] >> 7);
    
    res[10] = (in[10] << 1) | (in[11] >> 7);
    res[11] = (in[11] << 1) | (in[12] >> 7);
    res[12] = (in[12] << 1) | (in[13] >> 7);
    res[13] = (in[13] << 1) | (in[14] >> 7);
    res[14] = (in[14] << 1) | (in[15] >> 7);
    res[15] = (in[15] << 1) | (in[16] >> 7);
    res[16] = (in[16] << 1) | (in[17] >> 7);
    res[17] = (in[17] << 1) | (in[18] >> 7);
    res[18] = (in[18] << 1) | (in[19] >> 7);
    res[19] = (in[19] << 1) | (in[20] >> 7);
    
    res[20] = (in[20] << 1) | (in[21] >> 7);
    res[21] = (in[21] << 1) | (in[22] >> 7);
    res[22] = (in[22] << 1) | (in[23] >> 7);
    res[23] = (in[23] << 1) | (in[24] >> 7);
    res[24] = (in[24] << 1) | (in[25] >> 7);
    res[25] = (in[25] << 1) | (in[26] >> 7);
    res[26] = (in[26] << 1) | (in[27] >> 7);
    res[27] = (in[27] << 1) | (in[28] >> 7);
    res[28] = (in[28] << 1) | (in[29] >> 7);
    res[29] = (in[29] << 1) | (in[30] >> 7);
    
    res[30] = (in[30] << 1) | (in[31] >> 7);
    res[31] = (in[31] << 1) | (in[32] >> 7);
    res[32] = (in[32] << 1) | (in[33] >> 7);
    res[33] = (in[33] << 1) | (in[34] >> 7);
    res[34] = (in[34] << 1) | (in[35] >> 7);
    res[35] = (in[35] << 1) | (in[36] >> 7);
    res[36] = (in[36] << 1) | (in[37] >> 7);
    res[37] = (in[37] << 1) | (in[38] >> 7);
    res[38] = (in[38] << 1) | (in[39] >> 7);
    res[39] = (in[39] << 1) | (in[40] >> 7);
    
    res[40] = (in[40] << 1) | (in[41] >> 7);
    res[41] = (in[41] << 1) | (in[42] >> 7);
    res[42] = (in[42] << 1) | (in[43] >> 7);
    res[43] = (in[43] << 1) | (in[44] >> 7);
    res[44] = (in[44] << 1) | (in[45] >> 7);
    res[45] = (in[45] << 1) | (in[46] >> 7);
    res[46] = (in[46] << 1) | (in[47] >> 7);
    res[47] = (in[47] << 1) | (in[48] >> 7);
    res[48] = (in[48] << 1) | (in[49] >> 7);
    res[49] = (in[49] << 1) | (in[50] >> 7);
    
    res[50] = (in[50] << 1) | (in[51] >> 7);
    res[51] = (in[51] << 1) | (in[52] >> 7);
    res[52] = (in[52] << 1) | (in[53] >> 7);
    res[53] = (in[53] << 1) | (in[54] >> 7);
    res[54] = (in[54] << 1) | (in[55] >> 7);
    res[55] = (in[55] << 1) | (in[56] >> 7);
    res[56] = (in[56] << 1) | (in[57] >> 7);
    res[57] = (in[57] << 1) | (in[58] >> 7);
    res[58] = (in[58] << 1) | (in[59] >> 7);
    res[59] = (in[59] << 1) | (in[60] >> 7);
    
    res[60] = (in[60] << 1) | (in[61] >> 7);
    res[61] = (in[61] << 1) | (in[62] >> 7);
    res[62] = (in[62] << 1) | (in[63] >> 7);

    /* xor P(x) if msb */
    res[62] = res[62] ^ (carry & 0x01); // OMD_n-2 = 62
    /* shift and xor P(x) if msb */
    res[63] = (in[63] << 1) ^ (carry & 0x25);   // OMD_n-1 = 63
}

void
triple_block (hashblock res, const hashblock in)
{
    /* create bitmask from msb using signed shift */
    uint8_t carry = (uint8_t) (((char) in[0]) >>7);

    /* shift and xor */
    res[0] = in[0] ^ ((in[0] << 1) | (in[1] >> 7));
    res[1] = in[1] ^ ((in[1] << 1) | (in[2] >> 7));
    res[2] = in[2] ^ ((in[2] << 1) | (in[3] >> 7));
    res[3] = in[3] ^ ((in[3] << 1) | (in[4] >> 7));
    res[4] = in[4] ^ ((in[4] << 1) | (in[5] >> 7));
    res[5] = in[5] ^ ((in[5] << 1) | (in[6] >> 7));
    res[6] = in[6] ^ ((in[6] << 1) | (in[7] >> 7));
    res[7] = in[7] ^ ((in[7] << 1) | (in[8] >> 7));
    res[8] = in[8] ^ ((in[8] << 1) | (in[9] >> 7));
    res[9] = in[9] ^ ((in[9] << 1) | (in[10] >> 7));
    
    res[10] = in[10] ^ ((in[10] << 1) | (in[11] >> 7));
    res[11] = in[11] ^ ((in[11] << 1) | (in[12] >> 7));
    res[12] = in[12] ^ ((in[12] << 1) | (in[13] >> 7));
    res[13] = in[13] ^ ((in[13] << 1) | (in[14] >> 7));
    res[14] = in[14] ^ ((in[14] << 1) | (in[15] >> 7));
    res[15] = in[15] ^ ((in[15] << 1) | (in[16] >> 7));
    res[16] = in[16] ^ ((in[16] << 1) | (in[17] >> 7));
    res[17] = in[17] ^ ((in[17] << 1) | (in[18] >> 7));
    res[18] = in[18] ^ ((in[18] << 1) | (in[19] >> 7));
    res[19] = in[19] ^ ((in[19] << 1) | (in[20] >> 7));
    
    res[20] = in[20] ^ ((in[20] << 1) | (in[21] >> 7));
    res[21] = in[21] ^ ((in[21] << 1) | (in[22] >> 7));
    res[22] = in[22] ^ ((in[22] << 1) | (in[23] >> 7));
    res[23] = in[23] ^ ((in[23] << 1) | (in[24] >> 7));
    res[24] = in[24] ^ ((in[24] << 1) | (in[25] >> 7));
    res[25] = in[25] ^ ((in[25] << 1) | (in[26] >> 7));
    res[26] = in[26] ^ ((in[26] << 1) | (in[27] >> 7));
    res[27] = in[27] ^ ((in[27] << 1) | (in[28] >> 7));
    res[28] = in[28] ^ ((in[28] << 1) | (in[29] >> 7));
    res[29] = in[29] ^ ((in[29] << 1) | (in[30] >> 7));
    
    res[30] = in[30] ^ ((in[30] << 1) | (in[31] >> 7));
    res[31] = in[31] ^ ((in[31] << 1) | (in[32] >> 7));
    res[32] = in[32] ^ ((in[32] << 1) | (in[33] >> 7));
    res[33] = in[33] ^ ((in[33] << 1) | (in[34] >> 7));
    res[34] = in[34] ^ ((in[34] << 1) | (in[35] >> 7));
    res[35] = in[35] ^ ((in[35] << 1) | (in[36] >> 7));
    res[36] = in[36] ^ ((in[36] << 1) | (in[37] >> 7));
    res[37] = in[37] ^ ((in[37] << 1) | (in[38] >> 7));
    res[38] = in[38] ^ ((in[38] << 1) | (in[39] >> 7));
    res[39] = in[39] ^ ((in[39] << 1) | (in[40] >> 7));
    
    res[40] = in[40] ^ ((in[40] << 1) | (in[41] >> 7));
    res[41] = in[41] ^ ((in[41] << 1) | (in[42] >> 7));
    res[42] = in[42] ^ ((in[42] << 1) | (in[43] >> 7));
    res[43] = in[43] ^ ((in[43] << 1) | (in[44] >> 7));
    res[44] = in[44] ^ ((in[44] << 1) | (in[45] >> 7));
    res[45] = in[45] ^ ((in[45] << 1) | (in[46] >> 7));
    res[46] = in[46] ^ ((in[46] << 1) | (in[47] >> 7));
    res[47] = in[47] ^ ((in[47] << 1) | (in[48] >> 7));
    res[48] = in[48] ^ ((in[48] << 1) | (in[49] >> 7));
    res[49] = in[49] ^ ((in[49] << 1) | (in[50] >> 7));
    
    res[50] = in[50] ^ ((in[50] << 1) | (in[51] >> 7));
    res[51] = in[51] ^ ((in[51] << 1) | (in[52] >> 7));
    res[52] = in[52] ^ ((in[52] << 1) | (in[53] >> 7));
    res[53] = in[53] ^ ((in[53] << 1) | (in[54] >> 7));
    res[54] = in[54] ^ ((in[54] << 1) | (in[55] >> 7));
    res[55] = in[55] ^ ((in[55] << 1) | (in[56] >> 7));
    res[56] = in[56] ^ ((in[56] << 1) | (in[57] >> 7));
    res[57] = in[57] ^ ((in[57] << 1) | (in[58] >> 7));
    res[58] = in[58] ^ ((in[58] << 1) | (in[59] >> 7));
    res[59] = in[59] ^ ((in[59] << 1) | (in[60] >> 7));
    
    res[60] = in[60] ^ ((in[60] << 1) | (in[61] >> 7));
    res[61] = in[61] ^ ((in[61] << 1) | (in[62] >> 7));
    res[62] = in[62] ^ ((in[62] << 1) | (in[63] >> 7));

    /* xor P(x) if msb */
    res[62] = res[62] ^ (carry & 0x01); // OMD_n-2 = 62
    /* shift and xor and xor P(x) if msb */
    res[63] = (in[63] ^ (in[63] << 1)) ^ (carry & 0x25);  // OMD_n-1 = 63
}

messageblock glue = {0x00};

void
key_func (hashblock res, const hashblock hash, const hashblock key,
	  const hashblock message)
{
   /* K,M -> K||M */
   memcpy (&glue[OMD_n], message, OMD_n);
   /*call the underlying compression function*/
   OMD_COMP (res, hash, glue);
}

inline int
ntz (int v)
{
    int c = 0;
    for (; (v & 1) == 0 ; v >>= 1) ++c;
    return c;
}

#define CHECK_KEY(key)                                 \
    if(memcmp(key, key_initial, OMD_k) != 0){          \
        memcpy (glue, key, OMD_n );                    \
        key_func (lstar[0], block0s, key, block0s);    \
        memcpy(key_initial, key, OMD_k);               \
        OMD_L_size = 0;                                \
                                                       \
        /* 3.L_* = L_* . 3 */                          \
        triple_block (lstar[2], lstar[0]);             \
        /* 2.L_* = L_* . 2 */                          \
        double_block (lstar[1], lstar[0]);             \
                                                       \
        /* L[0] = 4.L* */                              \
        double_block (L[0], lstar[1]);                 \
    }                                                  \

#define PRECOMPUTE_L(start, l)                    \
    if(l > OMD_L_size){                           \
        uint32_t m_i = 0;                         \
        for (; m_i < 64; m_i++){                  \
            if(l < log2l[m_i][1])                 \
                break;                            \
        }                                         \
        uint32_t m_j = 0;                         \
        for (m_j = start; m_j < m_i; m_j++)       \
            double_block (L[m_j], L[m_j - 1]);    \
        OMD_L_size = log2l[m_i][0];               \
    }

/* Tag_a = 0^n has to be provided when hash is called*/
void
hash (hashblock taga, const hashblock key, const uint8_t *ad,
      uint64_t adlen)
{

    /* If AD="" => Tag_a = 0^n */
    if (adlen == 0)
        return;

   /*b = n+m*/
   const size_t b = 128;   // OMD_n + OMD_m = 128

   /* A_1 || A_2 ··· A_{l−1} || A_l = A, where |A_i| = b for 1 ≤ i ≤ l−1
      and |A_l| ≤ b */
   /* l=ceil(adlen/b) */
   uint64_t l = (adlen + 127)/b;   //b-1 = 127
    
    CHECK_KEY(key)
    PRECOMPUTE_L(OMD_L_size == 0 ? OMD_L_size + 1 : OMD_L_size, l)

    /* \bar{\delta}_{0,0} = 0^n */
    hashblock delta = {0x00};
    hashblock xor_res, key_func_res;
    uint64_t i = 0;

   /** for i = 1 to l-1 **/
   /**********************/
   for (; i < l - 1; i++)
      {
          /*  \bar{\delta}_{i, 0} =  \bar{\delta}{i-1, 0} ^ L[ntz(i)]  */
          xor_block (delta, delta, L[ntz(i+1)]);
          
          /* Tag_a = Tag_a ^ F_K(A_l[b-1...m] ^ \delta_{i, 0}, A_l[m-1...0]) */
          xor_block (xor_res, delta, &ad[i*b]);
          key_func (key_func_res, xor_res, key, &ad[(i*b) + OMD_n]);
          xor_block (taga, taga, key_func_res);
      }
   /**************************/
   /******* endfor ***********/

   /* here adlen!=0, we process last ad block*/

   unsigned int modlen = adlen%b;

   /* |A_l| = b then */
   if (modlen == 0)
      {
          /* last mask = \bar{\delta}{l,0}  */
          xor_block (delta, delta, L[ntz(l)]);
          xor_block(xor_res, delta, &ad[(l-1)*b]);
          key_func(key_func_res, xor_res, key, &ad[((l-1)*b) + OMD_n]);
      }
   /* |A_l| < b then */
   else
      {
          /* last mask = \bar{\delta}{l-1,1}  */
          xor_block (delta, delta, lstar[0]);
          
          if (modlen < OMD_n){
              /* pad last block */
              hashblock left = {0x00};
              hashblock right = {0x00};
              memcpy (left, &ad[(l-1)*b], modlen);
              left[modlen] = 0x80;
              
              xor_block(xor_res, delta, left);
              key_func(key_func_res, xor_res, key, right);
          }
          else{
              hashblock right = {0x00};
              memcpy (right, &ad[((l-1)*b) + OMD_n], modlen - OMD_n);
              right[modlen - OMD_n] = 0x80;
              
              xor_block(xor_res, delta, &ad[(l-1)*b]);
              key_func(key_func_res, xor_res, key, right);
          }
   }

   /* Tag_a = Tag_a ^ F_K(Left ^ \delta_{l, 0 or 1}, right) */
   xor_block (taga, taga, key_func_res);
}

int
omdsha512_process(uint8_t *data, const uint8_t* key,
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
   if ((12 > OMD_lnonce) || (OMD_lnonce > 63)) // OMD_n-1 = 63
      return -1;

   /* if |C| < tau => return -1 */
   if ((encrypting == OMD_DECRYPT) && (data_processlen < OMD_tau))
      return -1;

   int64_t l = 0;
   if (encrypting == OMD_ENCRYPT)
      {
    /* M_1 || M_2 ··· M_{l−1} || M_l = M, where |M_i| = m for 1 ≤ i ≤ l−1
	 and |M_l| ≤ m */
	 /* l = ceil(|M|/m) */
	 l = (data_processlen + 63)/OMD_m;   // OMD_m-1 = 63
      }
   else if (encrypting == OMD_DECRYPT)
      {
      /* C_1 || C_2 ··· C_{l−1} || C_l || Tag = \mathbb{C},
	 where |C_i| = m for 1 ≤ i ≤ l−1 and |C_l| ≤ m and |Tag| = \tau*/
    data_processlen = data_processlen - OMD_tau;
    /* l = ceil(|C|/m) */
    l = (data_processlen + 63)/OMD_m;   // OMD_m-1 = 63
      }

    hashblock key_block = {0x00};
    memcpy (key_block, key, OMD_k);
    
    CHECK_KEY(key_block)
    PRECOMPUTE_L(OMD_L_size == 0 ? OMD_L_size + 1 : OMD_L_size, l)
    
    /* Tag_a computed here to handle the case when the the buffers ad=c overlap
     * This does not have any impact on the security, as Tag_e and Tag_a are
     * computed independently */
    /* Tag_a = HASH_k(ad)  */
    hashblock taga = {0x00};
    hash(taga, key_block, ad, adlen);


    /* pad nonce */
    hashblock nonce_block = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                             0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}; 
    memcpy (nonce_block, nonce, OMD_lnonce);
    
    hashblock delta;
   /* \delta{N,0,0} = F_K(N || 10^{n-1-|N|}, 0^m  */
    key_func (delta, nonce_block, key_block, block0s);
    
    /* \delta{N,1,0} = \delta{N,0,0} ^ L[ntz(1)]  */
    xor_block(delta, delta, L[ntz(1)]);

    /* H = 0^n */
    hashblock h = {0x00};
    hashblock tau = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80 }; 

   /* H = F_K(H ^ \delta_{N, 1, 0}, <tau>_m)  */
   xor_block (h, h, delta);
   key_func (h, h, key_block, tau);

    hashblock xor_res;
    int64_t i = 0;
   /* for i = 1 to l-1 do  */
   /************************/
   for (; i < l-1; i++)
      {
          /* C_i = H ^ M_i */
          /* M_i = H ^ C_i */
          xor_block(xor_res, h, &data_process[i*OMD_m]);

          /* \delta_{N, i+1, 0} = \delta{N, i, 0} ^ L[ntz(i+1)]  */
          xor_block(delta, delta, L[ntz(i+2)]);

	 /* H = F_K(H ^ \delta{N, i, 0}, M_i) */
	 xor_block (h, delta, h);

      if (encrypting == OMD_ENCRYPT){
	    /* res  = M_i */
	    key_func(h, h, key_block, &data_process[i*OMD_m]);
        memcpy(&data[i*OMD_m],xor_res,OMD_m);
      }
	   else if (encrypting == OMD_DECRYPT)
       {
	    /* res2 = M_i */
         memcpy(&data[i*OMD_m],xor_res,OMD_m);
	    key_func(h, h, key_block, &data[i*OMD_m]);
     }
   }
   /************************/
   /******** endfor ********/


    unsigned int statedelta, data_process_modlen;
    hashblock tage;
    hashblock res2;
   /* |M|>0 */
   if (data_processlen !=0 )
      {
	 /* C_l = H ^ M_l */
	 /* M_l = H ^ C_l *//* |M_l| = m then */
	 data_process_modlen = data_processlen % OMD_m;
	 hashblock res = {0x00};
	 memcpy (res, &data_process[(l-1)*OMD_m], (data_process_modlen==0
						  		  ? OMD_m
						  		  : data_process_modlen));
	 xor_block (res2, h, res);

      /* if |M_\ell|=m */
    if (data_process_modlen == 0){
        memcpy(&data[(l-1)*OMD_m], res2, OMD_m);
        
        /* \delta{N, l, 1} = \delta{N, l, 0} ^ 2.L_* */
        xor_block (delta, delta, lstar[1]);
         statedelta = 1;
      /* else if |M_\ell|<m*/
    } else{
        memcpy(&data[(l-1)*OMD_m], res2, data_process_modlen);
        /* \delta{N, l, 1} = \delta{N, l, 0} ^ 3.L_* */
        xor_block (delta, delta, lstar[2]);
         statedelta = 2;
    }

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

    hashblock tag;
   /* Tag = (Tag_e ^ Tag_a)[n-1 ... n- tau]  */
   xor_block(tag, taga, tage);

   /*ENCRYPT => output tag and return 0*/
   if (encrypting == OMD_ENCRYPT)
      {
	 memcpy (&data[data_processlen], tag, OMD_tau);

	 return 0;
      }

   /* or check tag */
   if (memcmp (tag,&data_process[data_processlen],OMD_tau) == 0)
      {
	 return 0;
      }

   return -1;
}
