/* FILE: essence_compress_256.c
 *
 * AUTHOR: Jason Worth Martin <jason.worth.martin@gmail.com>
 *
 * DESCRIPTION: This file implements the ESSENCE-256 compression
 * function.  The vector data structures are used to attempt to get
 * some compilers (e.g. gcc) to emit SIMD instructions where
 * applicable.
 *
 */
#include "essence.h"

void essence_compress_256_dual(uint32_t *Chaining_Variables1,
			       uint32_t *Chaining_Variables2,
			       BitSequence *input1,
			       BitSequence *input2,
			       uint64_t input_size_in_256_bit_blocks,
			       uint64_t num_steps)
{
  vec_128 r[8];
  vec_128 r_orig[8];
  vec_128 r_tmp;
  vec_128 F;
  uint32_t i,j;
  uint32_t tmp_r1, tmp_k1;
  uint32_t tmp_r2, tmp_k2;
  int k;

  /*
   * Load the chaining variables into the most significant bytes of
   * the vectors.  (So, for the block cipher, the key is in the least
   * significant bytes.)  The setup looks like this:
   *
   * MSB                   LSB
   *   | r2 | k2 | r1 | k1 |
   */
  for(i=0;i<8;i++)
    {
      r[i].array_ui32[1] = Chaining_Variables1[i];
      r[i].array_ui32[3] = Chaining_Variables2[i];
    }

  /*
   * Main compression loop
   */
  while(input_size_in_256_bit_blocks>0)
    {
      /*
       * Read in the input
       */
      for(i=0;i<8;i++)
	{
	  /*
	   * Here we go through some contortions to deal with Endian
	   * issues.  Our standard defines the data as Little Endian,
	   * but we force it just in case we are on a Big Endian
	   * machine.
	   */
	  for(k=0;k<4;k++)
	    {
	      r[i].array_ui8[k] = *input1;
	      ++input1;
	      r[i].array_ui8[8+k] = *input2;
	      ++input2;
	    }
	}
      /*
       * Store the values of r for the xor at
       * the end of the stepping.
       */
      for(i=0;i<8;i++)
	{
	  r_orig[i].array_ui32[1] = r[i].array_ui32[1];
	  r_orig[i].array_ui32[0] = 0;
	  r_orig[i].array_ui32[3] = r[i].array_ui32[3];
	  r_orig[i].array_ui32[2] = 0;
	}

      /*
       * Now step the shift register system.
       */
      for(i=0;i<num_steps;i++)
	{
	  tmp_r1 = r[0].array_ui32[1];
	  tmp_k1 = r[0].array_ui32[0];
	  tmp_r2 = r[0].array_ui32[3];
	  tmp_k2 = r[0].array_ui32[2];
	  /*
	   * This implements L_32
	   */
	  tmp_r1 = L_32_table[tmp_r1 >> 24] ^ (tmp_r1 << 8);
	  tmp_k1 = L_32_table[tmp_k1 >> 24] ^ (tmp_k1 << 8);

	  tmp_r2 = L_32_table[tmp_r2 >> 24] ^ (tmp_r2 << 8);
	  tmp_k2 = L_32_table[tmp_k2 >> 24] ^ (tmp_k2 << 8);

	  tmp_r1 = L_32_table[tmp_r1 >> 24] ^ (tmp_r1 << 8);
	  tmp_k1 = L_32_table[tmp_k1 >> 24] ^ (tmp_k1 << 8);

	  tmp_r2 = L_32_table[tmp_r2 >> 24] ^ (tmp_r2 << 8);
	  tmp_k2 = L_32_table[tmp_k2 >> 24] ^ (tmp_k2 << 8);

	  tmp_r1 = L_32_table[tmp_r1 >> 24] ^ (tmp_r1 << 8);
	  tmp_k1 = L_32_table[tmp_k1 >> 24] ^ (tmp_k1 << 8);

	  tmp_r2 = L_32_table[tmp_r2 >> 24] ^ (tmp_r2 << 8);
	  tmp_k2 = L_32_table[tmp_k2 >> 24] ^ (tmp_k2 << 8);

	  tmp_r1 = L_32_table[tmp_r1 >> 24] ^ (tmp_r1 << 8);
	  tmp_k1 = L_32_table[tmp_k1 >> 24] ^ (tmp_k1 << 8);

	  tmp_r2 = L_32_table[tmp_r2 >> 24] ^ (tmp_r2 << 8);
	  tmp_k2 = L_32_table[tmp_k2 >> 24] ^ (tmp_k2 << 8);
	  /*
	   * Done with L_32.
	   *
	   * At this point:
	   *
	   *     tmp_r = L_32(r[0])
	   *     tmp_k = L_32(k[0])
	   */
	  F.v4ui32 = F_func_Boyar_Peralta(r[6].v4ui32,
					  r[5].v4ui32,
					  r[4].v4ui32,
					  r[3].v4ui32,
					  r[2].v4ui32,
					  r[1].v4ui32,
					  r[0].v4ui32);
	  
	  r_tmp.v4ui32 = r[7].v4ui32;
	  
	  for(j=7;j>0;j--)
	    {
	      r[j].v4ui32 = r[j-1].v4ui32;
	    }

	  r[0].v4ui32 = r_tmp.v4ui32 ^ F.v4ui32;

	  r[0].array_ui32[1] ^= r_tmp.array_ui32[0];
	  r[0].array_ui32[3] ^= r_tmp.array_ui32[2];

	  r[0].array_ui32[0] ^= tmp_k1;
	  r[0].array_ui32[1] ^= tmp_r1;
	  r[0].array_ui32[2] ^= tmp_k2;
	  r[0].array_ui32[3] ^= tmp_r2;
	}

      /*
       * Final xor
       */
      for(j=0;j<8;j++)
	{
	  r[j].v4ui32 ^= r_orig[j].v4ui32;
	}

      --input_size_in_256_bit_blocks;
    }

  /*
   * Write out the chaining variables.
   */
  for(i=0;i<8;i++)
    {
      Chaining_Variables1[i] = r[i].array_ui32[1];
      Chaining_Variables2[i] = r[i].array_ui32[3];
    }
}
