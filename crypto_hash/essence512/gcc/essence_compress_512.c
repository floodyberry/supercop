/* FILE: essence_compress_512
 *
 * AUTHOR: Jason Worth Martin <jason.worth.martin@gmail.com>
 *
 * DESCRIPTION:  This file implements the ESSENCE-512 compression
 * function.  The vector data structures are used to attempt to
 * get some compilers (e.g. gcc) to emit SIMD instructions where
 * applicable.
 */
#include "essence.h"


void essence_compress_512(uint64_t *Chaining_Variables,
			  BitSequence *input,
			  uint64_t input_size_in_512_bit_blocks,
			  uint64_t num_steps)
{
  vec_128 r[8];
  vec_128 r_orig[8];
  vec_128 r_tmp;
  vec_128 F;
  uint64_t i,j;
  uint64_t tmp_r, tmp_k;

  /*
   * Load the chaining variables into Most Significant Bytes of the
   * vectors.
   */
  for(i=0;i<8;i++)
    {
      r[i].array_ui64[1] = Chaining_Variables[i];
    }

  /*
   * Main compression loop
   */
  while(input_size_in_512_bit_blocks>0)
    {
      /*
       * Read in the input into the Least Significant Bytes of the
       * vectors.
       */
      for(i=0;i<8;i++)
	{
	  for(j=0;j<8;j++)
	    {
	      r[i].array_ui8[j] = *input;
	      ++input;
	    }
	}

      /*
       * Save r0-r7 for final xor
       */
      for(i=0;i<8;i++)
	{
	  r_orig[i].v2ui64 = r[i].v2ui64;
	}
      for(i=0;i<num_steps;i++)
	{
	  tmp_r = r[0].array_ui64[1];
	  tmp_k = r[0].array_ui64[0];

	  /*
	   * This implements L_64 on r0 and k0
	   */
	  tmp_r = L_64_table[tmp_r >> 56] ^ (tmp_r << 8);
	  tmp_k = L_64_table[tmp_k >> 56] ^ (tmp_k << 8);

	  tmp_r = L_64_table[tmp_r >> 56] ^ (tmp_r << 8);
	  tmp_k = L_64_table[tmp_k >> 56] ^ (tmp_k << 8);

	  tmp_r = L_64_table[tmp_r >> 56] ^ (tmp_r << 8);
	  tmp_k = L_64_table[tmp_k >> 56] ^ (tmp_k << 8);

	  tmp_r = L_64_table[tmp_r >> 56] ^ (tmp_r << 8);
	  tmp_k = L_64_table[tmp_k >> 56] ^ (tmp_k << 8);

	  tmp_r = L_64_table[tmp_r >> 56] ^ (tmp_r << 8);
	  tmp_k = L_64_table[tmp_k >> 56] ^ (tmp_k << 8);

	  tmp_r = L_64_table[tmp_r >> 56] ^ (tmp_r << 8);
	  tmp_k = L_64_table[tmp_k >> 56] ^ (tmp_k << 8);

	  tmp_r = L_64_table[tmp_r >> 56] ^ (tmp_r << 8);
	  tmp_k = L_64_table[tmp_k >> 56] ^ (tmp_k << 8);

	  tmp_r = L_64_table[tmp_r >> 56] ^ (tmp_r << 8);
	  tmp_k = L_64_table[tmp_k >> 56] ^ (tmp_k << 8);
	  /*
	   * Done with L_64.
	   *
	   * At this point:
	   *
	   *     tmp_r = L_64(r[0])
	   *     tmp_k = L_64(k[0])
	   */

	  F.v2ui64 = F_func_Boyar_Peralta(r[6].v2ui64,
					  r[5].v2ui64,
					  r[4].v2ui64,
					  r[3].v2ui64,
					  r[2].v2ui64,
					  r[1].v2ui64,
					  r[0].v2ui64);

	  r_tmp.v2ui64 = r[7].v2ui64;

	  for(j=7;j>0;j--)
	    {
	      r[j].v2ui64 = r[j-1].v2ui64;
	    }

	  r[0].v2ui64 = r_tmp.v2ui64 ^ F.v2ui64;
	  r[0].array_ui64[1] ^= r_tmp.array_ui64[0];
	  r[0].array_ui64[1] ^= tmp_r;
	  r[0].array_ui64[0] ^= tmp_k;
	}

      /*
       * Final xor
       */
      for(i=0;i<8;i++)
	{
	  r[i].v2ui64 ^= r_orig[i].v2ui64;
	}

      --input_size_in_512_bit_blocks;
    }

  /*
   * Write out the chaining variables.
   */
  for(i=0;i<8;i++)
    {
      Chaining_Variables[i] = r[i].array_ui64[1];
    }
}
