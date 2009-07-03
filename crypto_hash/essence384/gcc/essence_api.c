/* FILE: essence_api.c
 *
 * AUTHOR: Jason Worth Martin <jason.worth.martin@gmail.com>
 *
 * DESCRIPTION:  This file implements the NIST API for ESSENCE.
 *
 * COPYRIGHT (2008) Jason Worth Martin
 *
 * LICENSE: Please see the file LICENSE.TXT for license details.
 */
#include "essence.h"


/*
 * Expansion of the fractional part of pi given as
 * 64-bit unsigned integers.
 *
 */
uint64_t expansion_of_pi_64[8] = {
  0x243f6a8885a308d3LL,
  0x13198a2e03707344LL,
  0xa4093822299f31d0LL,
  0x082efa98ec4e6c89LL,
  0x452821e638d01377LL,
  0xbe5466cf34e90c6cLL,
  0xc0ac29b7c97c50ddLL,
  0x3f84d5b5b5470917LL
};

/*
 * Expansion of the fractional part of pi give as 32-bit unsigned
 * integers.  Note that the ESSENCE standard uses Little Endian
 * ordering, so we have ordered these entries to match the 64-bit
 * version.
 */
uint32_t expansion_of_pi_32[8] = {
  0x85a308d3,
  0x243f6a88,
  0x03707344,
  0x13198a2e,
  0x299f31d0,
  0xa4093822,
  0xec4e6c89,
  0x082efa98
};


/* *******************************************************************
 *
 * HashReturn Init(hashState *state,
 *                 int hashbitlen)
 *
 * state -- a structure that holds the hashState information
 *
 * hashbitlen -- an integer value that indicates the length of the
 *               hash output in bits.
 *
 * Initializes the hash state structure.
 *
 * ******************************************************************/
HashReturn Init(hashState *state,
		int hashbitlen)
{
  uint64_t tmp_64;
  uint32_t tmp_32;
  uint64_t *qw_array;
  uint32_t *dw_array;
  byte *byte_array;
  int i;

  if ((hashbitlen < 128) ||
      (hashbitlen > 512))
    {
      /*
       * If we have an invalid hashbitlen, then
       * return the error condition.
       */
      return(BAD_HASHBITLEN);
    }

  /*
   * Initialize the running_hash to digits of pi.
   */
  if (hashbitlen > 256)
    {
      for(i=0;i<8;i++)
	{
	  state->running_hash[i] = expansion_of_pi_64[i];
	}
    }
  else
    {
      for(i=0;i<8;i++)
	{
	  ((uint32_t*)(state->running_hash))[i] = expansion_of_pi_32[i];
	}
      /*
       * This isn't actually necessary, but we want to make
       * debugging easier, so we initialize the rest to zero.
       */
      for(i=4;i<8;i++)
	{
	  state->running_hash[i] = 0LL;
	}      
    }



  /*
   * BEGIN: initialize MDBIV_init.
   *
   * See essence_api.h for a description of this variable.
   *
   * We go through some contortions here to deal with endian issues.
   * The standard defines all our values in LITTLE ENDIAN terms,
   * but we want this code to run on big endian machines as well,
   * so we force the issue by setting up the MDBIV_init array
   * appropriately for the target architecture.  This way, within
   * the update function we can simply copy the array using the
   * native byte ordering.
   *
   * Since the byte ordering will depend up if we are using 32-bit
   * or 64-bit registers for the compression function, we will
   * have separate cases for using the 256-bit compression function
   * and the 512-bit compression function.
   *
   * We use the qw_array (qw stands for quadword which is the Intel
   * terminology for a 64-bit integer) to alias the MDBIV_init
   * array in the 512-bit case.
   *
   * We use the dw_array (dw stands for doubleword which is the Intel
   * terminology for a 32-bit integer) to alias the MDBIV_init
   * array in the 256-bit case.
   */

  if (hashbitlen > 256)
    {
      /*
       * Using the 512-bit compression function, so construct
       * array for 64-bit registers.
       */
      qw_array = (uint64_t *)(state->MDBIV_init);

      /*
       * Bytes 0-7: The current block number, which we initialize to
       * zero.  The Update function must set it as necessary.
       */
      qw_array[0] = 0LL;
      

      /*
       * Bytes 8-15: ESSENCE_MD_BLOCK_SIZE_IN_BYTES
       */
      qw_array[1] = (uint64_t)(ESSENCE_MD_BLOCK_SIZE_IN_BYTES);
      
      /*
       * Bytes 16-17: hasbitlen
       */
      tmp_32 = (uint32_t)hashbitlen;
      tmp_64 = ((uint64_t)tmp_32) & 0x000000000000ffffLL;

      
      /*
       * Byte 18: ESSENCE_COMPRESS_NUM_STEPS
       */
      tmp_64 |= ( (((uint64_t)(ESSENCE_COMPRESS_NUM_STEPS)) << 16) & 
		  0x0000000000ff0000LL);
      
      /*
       * Byte 19: ESSENCE_HASH_TREE_LEVEL
       */
      tmp_64 |= ( (((uint64_t)(ESSENCE_HASH_TREE_LEVEL)) << 24) & 
		  0x00000000ff000000LL);

      
      /*
       * Bytes 20-23: ESSENCE_ORGANIZATIONAL_SMALL_CONSTANT
       */
      tmp_32 = (uint32_t)(ESSENCE_ORGANIZATIONAL_SMALL_CONSTANT);
      tmp_64 |= ( (((uint64_t)tmp_32) << 32) &
		  0xffffffff00000000LL);

      qw_array[2] = tmp_64;
      
      /*
       * Bytes 24-31: ESSENCE_ORGANIZATIONAL_BIG_CONSTANT
       */
      qw_array[3] = (uint64_t)(ESSENCE_ORGANIZATIONAL_BIG_CONSTANT);
      
      /*
       * The remaining bytes are set to the default values.
       */
      qw_array[4] = expansion_of_pi_64[4];
      qw_array[5] = expansion_of_pi_64[5];
      qw_array[6] = expansion_of_pi_64[6];
      qw_array[7] = expansion_of_pi_64[7];
    }
  else
    {
      /*
       * Using the 256-bit compression function, so construct
       * array for 32-bit registers.
       */
      dw_array = (uint32_t *)(state->MDBIV_init);

      /*
       * Bytes 0-7: The current block number, which we initialize to
       * zero.  The Update function must set it as necessary.
       */
      dw_array[0] = 0;
      dw_array[1] = 0;
      

      /*
       * Bytes 8-15: ESSENCE_MD_BLOCK_SIZE_IN_BYTES
       */
      tmp_64 = (uint64_t)(ESSENCE_MD_BLOCK_SIZE_IN_BYTES);
      dw_array[2] = (uint32_t)tmp_64;
      dw_array[3] = (uint32_t)(tmp_64 >> 32);

      /*
       * Bytes 16-17: hasbitlen
       */
      tmp_32 = (uint32_t)hashbitlen;
      
      /*
       * Byte 18: ESSENCE_COMPRESS_NUM_STEPS
       */
      tmp_32 |= ( (((uint32_t)(ESSENCE_COMPRESS_NUM_STEPS)) << 16) & 
		  0x00ff0000);
      
      /*
       * Byte 19: ESSENCE_HASH_TREE_LEVEL
       */
      tmp_32 |= ( (((uint32_t)(ESSENCE_HASH_TREE_LEVEL)) << 24) & 
		  0xff000000);

      dw_array[4] = tmp_32;

      /*
       * Bytes 20-23: ESSENCE_ORGANIZATIONAL_SMALL_CONSTANT
       */
      dw_array[5] = (uint32_t)(ESSENCE_ORGANIZATIONAL_SMALL_CONSTANT);

      
      /*
       * Bytes 24-31: ESSENCE_ORGANIZATIONAL_BIG_CONSTANT
       */
      tmp_64 = (uint64_t)(ESSENCE_ORGANIZATIONAL_BIG_CONSTANT);
      dw_array[6] = (uint32_t)tmp_64;
      dw_array[7] = (uint32_t)(tmp_64 >> 32);

      /*
       * Here we zero out the remaining space.
       */
      for(i=8;i<16;i++)
	{
	  dw_array[i] = 0;
	}
    }
  /*
   * END: initialize MDBIV_init
   */
  

  /*
   * Note: Since state->last_md_block_number is a 64-bit value, it is
   * critical to specify the constant as a "long long" type.
   */
  state->last_md_block_number = 0xffffffffffffffffLL;
  state->residual_data_bitlen = 0;
  state->hashbitlen = hashbitlen;
  state->within_md_block = 0;
  state->current_md_block_datalen = 0;

  /*
   * The following initializations are not actually
   * needed since they will be over written.  However
   * it makes the debugging output look much nicer
   * if we start off with cleared variables.
   */
  for(i=0;i<8;i++)
    {
      state->chain_vars[i] = 0LL;
      state->residual_data[i] = 0LL;
    }



#if ESSENCE_DEBUG_LEVEL & 1
  printf("\n\n\n\n******** ******** ******** ");
  printf("******** ******** ******** LEAVING Init\n");
  PrintState(state);
#endif
  return(SUCCESS);
}


/* *******************************************************************
 *
 * void Join_512(uint64_t *hash_a,
 *               uint64_t *hash_b)
 *
 * Sets hash_a to be the JOIN of hash_a with hash_b.
 *
 * ******************************************************************/
void Join_512(uint64_t *hash_a,
	      uint64_t *hash_b)
{
  uint64_t chain_vars[8];
  uint64_t num_steps;
  uint64_t i;
#if ESSENCE_ASSUME_LITTLE_ENDIAN == 0
  /*
   * If we aren't little endian, then we need
   * to copy the hashes into a temporary buffer.
   */
  byte data_buffer[128];
  int j;

  for(i=0;i<8;i++)
    {
      for(j=0;j<8;j++)
	{
	  data_buffer[i*8+j] = (byte)(hash_a[i] >> (j*8));
	}
    }

  for(i=0;i<8;i++)
    {
      for(j=0;j<8;j++)
	{
	  data_buffer[64+i*8+j] = (byte)(hash_b[i] >> (j*8));
	}
    }

  for(i=0;i<8;i++)
    {
      chain_vars[i] = expansion_of_pi_64[i];
    }

  num_steps = ESSENCE_COMPRESS_NUM_STEPS;
  ESSENCE_COMPRESS_512(chain_vars,
		       data_buffer,
		       2LL,
		       num_steps);  
#else /* ESSENCE_ASSUME_LITTLE_ENDIAN */
  for(i=0;i<8;i++)
    {
      chain_vars[i] = expansion_of_pi_64[i];
    }
  num_steps = ESSENCE_COMPRESS_NUM_STEPS;
  ESSENCE_COMPRESS_512(chain_vars,
		       (byte*)hash_a,
		       1LL,
		       num_steps);  
  ESSENCE_COMPRESS_512(chain_vars,
		       (byte*)hash_b,
		       1LL,
		       num_steps);  
#endif
  /*
   * Now we copy the results out of the chain_vars
   * and into the hash_a localtion.
   */
  for(i=0;i<8;i++)
    {
      hash_a[i] = chain_vars[i];
    }


}




/* *******************************************************************
 *
 * void Join_256(uint32_t *hash_a,
 *               uint32_t *hash_b)
 *
 * Sets hash_a to be the JOIN of hash_a with hash_b.
 *
 * ******************************************************************/
void Join_256(uint32_t *hash_a,
	      uint32_t *hash_b)
{
  uint32_t chain_vars[8];
  uint64_t num_steps;
  uint64_t i;
#if ESSENCE_ASSUME_LITTLE_ENDIAN == 0
  /*
   * If we aren't little endian, then we need
   * to copy the hashes into a temporary buffer.
   */
  byte data_buffer[32];
  int j;

  for(i=0;i<8;i++)
    {
      for(j=0;j<4;j++)
	{
	  data_buffer[i*4+j] = (byte)(hash_a[i] >> (j*8));
	}
    }

  for(i=0;i<8;i++)
    {
      for(j=0;j<4;j++)
	{
	  data_buffer[32+i*4+j] = (byte)(hash_b[i] >> (j*8));
	}
    }

  for(i=0;i<8;i++)
    {
      chain_vars[i] = expansion_of_pi_32[i];
    }

  num_steps = (uint64_t)(ESSENCE_COMPRESS_NUM_STEPS);
  ESSENCE_COMPRESS_256(chain_vars,
		       data_buffer,
		       2LL,
		       num_steps);  
#else /* ESSENCE_ASSUME_LITTLE_ENDIAN */
  for(i=0;i<8;i++)
    {
      chain_vars[i] = expansion_of_pi_32[i];
    }
  num_steps = ESSENCE_COMPRESS_NUM_STEPS;
  ESSENCE_COMPRESS_256(chain_vars,
		       (byte*)hash_a,
		       1LL,
		       num_steps);  
  ESSENCE_COMPRESS_256(chain_vars,
		       (byte*)hash_b,
		       1LL,
		       num_steps);  
#endif
  /*
   * Now we copy the results out of the chain_vars
   * and into the hash_a localtion.
   */
  for(i=0;i<8;i++)
    {
      hash_a[i] = chain_vars[i];
    }

}




/* *******************************************************************
 *
 * void Merge_Tree_512(hashState *state, uint64_t *chain_vars)
 *
 * state -- a structure that holds the hashState information
 *
 * This function should be called exactly when a Merkle-Damgaard block
 * has been completed.  It will update the current Merkle hash tree
 * and the running hash as needed.  It will also reset the state
 * variables: within_md_block, current_md_block_datalen, and
 * last_md_block_number
 *
 * If the ESSENCE_HASH_TREE_LEVEL parameter is set to zero, then
 * the input chain_vars are JOINed with running hash.
 *
 * Otherwise, the input chain_vars are merged into the current
 * Merkle hash tree based on the following rules:
 *
 * Rule 1: A leaf node exists if the block that it correspons to has
 *         been hashed, in which case the value of the leaf is just
 *         the resulting hash.
 *
 * Rule 2: A node is defined to exist if at least one of its children
 *         exist.
 *
 * Rule 3: If both children of a node exists, then it's value is the JOIN
 *         of the values of its children.  If only one child of a node exists
 *         then its value is simple equal to the value of its child.
 *
 * 
 * Serial Implementation
 * ---------------------
 *
 * The following pseudo-code describes the serial algorithm used in
 * this function.  It uses ESSENCE_HASH_TREE_LEVEL storage locations
 * for intermediate tree hashes, and it has the property that every
 * fully populated subtree has a correct top-node value according to
 * the rules above.  The remaining partially populated subtrees may
 * easily have their correct hash values computed by the Final
 * function.  This algorithm assumes that the block hashes are
 * provided sequentially and in order of block number.
 *
 * The variables:
 *
 * merkle_tree_hashes -- An array of ESSENCE_HASH_TREE_LEVEL
 *                       intermediate storage locations.
 *
 * block_num -- the block number whose hash is being merged into the
 *              tree.
 *
 * blocks_per_tree -- The number of blocks used for each fully
 *                    populated Merkle hash tree, which is just
 *                    2^ESSENCE_HASH_TREE_LEVEL.
 *
 * hash -- The hash of the Merkle-Damgaard block.
 *
 * The algorithm:
 *
 * level_mask = 1
 * if block_num & level_mask then
 *   merkle_tree_hashes[0] = JOIN(merkle_tree_hashes[0],hash)
 *   for level in 1 to ESSENCE_HASH_TREE_LEVEL - 1 do
 *      level_mask <<= 1
 *      if block_num & level_mask then
 *         merkle_tree_hashes[level] = JOIN(merkle_tree_hashes[level],
 *                                          merkle_tree_hashes[level-1])
 *      else
 *         merkle_tree_hashes[level] = merkle_tree_hashes[level-1]
 *         return
 *      end if
 *   end for
 * else
 *    merkle_tree_hashes[0] = hash
 *    return
 * end if
 *
 * 
 * The way the algorithm works is that each fully populated subtree
 * gets computed and has its hash stored in its parent.  When only
 * one child has been fully populated, it's value is stored in the
 * parent which clears up the lower level storage locations for the
 * next child's subtrees.  When both children are fully populated, then
 * the results are Joined and the result is propigated up one level.
 *
 * ******************************************************************/
void Merge_Tree_512(hashState *state, uint64_t *chain_vars)
{
  uint64_t num_steps;
  uint64_t *root_hash;
  int i,j, blocks_per_tree, leaf_num, level, level_mask;
  byte byte_array[64];
  
  state->last_md_block_number += 1;
  state->within_md_block = 0;
  state->current_md_block_datalen = 0;

  num_steps = (uint64_t)(ESSENCE_COMPRESS_NUM_STEPS);

#if ESSENCE_HASH_TREE_LEVEL == 0
  /*
   * If the hash tree level is zero, then we just
   * compress the most recent hash with the running
   * hash.
   */
#if ESSENCE_ASSUME_LITTLE_ENDIAN == 0
  for(i=0;i<8;i++)
    {
      for(j=0;j<8;j++)
	{
	  byte_array[i*8+j] = (byte)(chain_vars[i] >> (8*j));
	}
    }
  ESSENCE_COMPRESS_512(state->running_hash,
		       byte_array,
		       1LL,
		       num_steps);
#else
  ESSENCE_COMPRESS_512(state->running_hash,
		       (byte *)chain_vars,
		       1LL,
		       num_steps);
#endif /* ESSENCE_ASSUME_LITTLE_ENDIAN */
  
#else /* ESSENCE_HASH_TREE_LEVEL > 0 */
  /*
   * Now we figure out which leaf our last_md_block was
   * in, and where in the tree to join it.
   */
  blocks_per_tree = (1 << ESSENCE_HASH_TREE_LEVEL);
  leaf_num = ((int)(state->last_md_block_number)) % blocks_per_tree;
  
  level_mask = 1;
  level = 0;
  if (leaf_num & level_mask)
    {
      Join_512(((uint64_t *)(state->merkle_tree_hashes))+8*level,
	       chain_vars);
#if ESSENCE_DEBUG_LEVEL & 4
      printf("\n\n\n\n******** ******** ******** ");
      printf("******** ******** ******** LEAVING Join_512\n");
      PrintState(state);
#endif
      for(level=1; level < ESSENCE_HASH_TREE_LEVEL; level++)
	{
	  level_mask <<= 1;
	  if (leaf_num & level_mask)
	    {
	      Join_512(((uint64_t *)(state->merkle_tree_hashes))+8*level,
		       ((uint64_t *)(state->merkle_tree_hashes))+8*(level-1));
#if ESSENCE_DEBUG_LEVEL & 4
	      printf("\n\n\n\n******** ******** ******** ");
	      printf("******** ******** ******** LEAVING Join_512\n");
	      PrintState(state);
#endif
	    }
	  else
	    {
	      for(i=0;i<8;i++)
		{
		  (((uint64_t *)(state->merkle_tree_hashes))+8*level)[i] =
		    (((uint64_t *)(state->merkle_tree_hashes))+8*(level-1))[i];
		}
	      break;
	    }
	}
      /*
       * If we get to the root of the tree, then we need to
       * Join it with the running hash.
       */
      if (leaf_num == (blocks_per_tree - 1))
	{
	  root_hash = ( ((uint64_t *)(state->merkle_tree_hashes)) + 
			8*(ESSENCE_HASH_TREE_LEVEL-1) );
	  /*
	   * Now, we have to setup for a call to the compression function.
	   */
#if ESSENCE_ASSUME_LITTLE_ENDIAN == 0
	  for(i=0;i<8;i++)
	    {
	      for(j=0;j<8;j++)
		{
		  byte_array[i*8+j] = (byte)(root_hash[i] >> (8*j));
		}
	    }
	  ESSENCE_COMPRESS_512(state->running_hash,
			       byte_array,
			       1LL,
			       num_steps);
#else /* LITTLE_ENDIAN Target*/
	  ESSENCE_COMPRESS_512(state->running_hash,
			       (byte *)root_hash,
			       1LL,
			       num_steps);
#endif /* ESSENCE_ASSUME_LITTLE_ENDIAN */
	}
    }
  else
    {
      for(i=0;i<8;i++)
	{
	  (((uint64_t *)(state->merkle_tree_hashes))+8*level)[i] =
	    chain_vars[i];
	}
    }
#endif /* ESSENCE_HASH_TREE_LEVEL > 0 */

#if ESSENCE_DEBUG_LEVEL & 2
  printf("\n\n\n\n******** ******** ******** ");
  printf("******** ******** ******** LEAVING Merge_Tree_512\n");
  PrintState(state);
#endif

}








/* *******************************************************************
 *
 * void Merge_Tree_256(hashState *state, uint32_t *chain_vars)
 *
 * state -- a structure that holds the hashState information
 *
 * This function should be called exactly when a Merkle-Damgaard block
 * has been completed.  It will update the current Merkle hash tree
 * and the running hash as needed.  It will also reset the state
 * variables: within_md_block, current_md_block_datalen, and
 * last_md_block_number
 *
 * If the ESSENCE_HASH_TREE_LEVEL parameter is set to zero, then
 * the input chain_vars are JOINed with running hash.
 *
 * Otherwise, the input chain_vars are merged into the current
 * Merkle hash tree based on the following rules:
 *
 * Rule 1: A leaf node exists if the block that it correspons to has
 *         been hashed, in which case the value of the leaf is just
 *         the resulting hash.
 *
 * Rule 2: A node is defined to exist if at least one of its children
 *         exist.
 *
 * Rule 3: If both children of a node exists, then it's value is the JOIN
 *         of the values of its children.  If only one child of a node exists
 *         then its value is simple equal to the value of its child.
 *
 * 
 * Serial Implementation
 * ---------------------
 *
 * The following pseudo-code describes the serial algorithm used in
 * this function.  It uses ESSENCE_HASH_TREE_LEVEL storage locations
 * for intermediate tree hashes, and it has the property that every
 * fully populated subtree has a correct top-node value according to
 * the rules above.  The remaining partially populated subtrees may
 * easily have their correct hash values computed by the Final
 * function.  This algorithm assumes that the block hashes are
 * provided sequentially and in order of block number.
 *
 * The variables:
 *
 * merkle_tree_hashes -- An array of ESSENCE_HASH_TREE_LEVEL
 *                       intermediate storage locations.
 *
 * block_num -- the block number whose hash is being merged into the
 *              tree.
 *
 * blocks_per_tree -- The number of blocks used for each fully
 *                    populated Merkle hash tree, which is just
 *                    2^ESSENCE_HASH_TREE_LEVEL.
 *
 * hash -- The hash of the Merkle-Damgaard block.
 *
 * The algorithm:
 *
 * level_mask = 1
 * if block_num & level_mask then
 *   merkle_tree_hashes[0] = JOIN(merkle_tree_hashes[0],hash)
 *   for level in 1 to ESSENCE_HASH_TREE_LEVEL - 1 do
 *      level_mask <<= 1
 *      if block_num & level_mask then
 *         merkle_tree_hashes[level] = JOIN(merkle_tree_hashes[level],
 *                                          merkle_tree_hashes[level-1])
 *      else
 *         merkle_tree_hashes[level] = merkle_tree_hashes[level-1]
 *         return
 *      end if
 *   end for
 * else
 *    merkle_tree_hashes[0] = hash
 *    return
 * end if
 *
 * 
 * The way the algorithm works is that each fully populated subtree
 * gets computed and has its hash stored in its parent.  When only
 * one child has been fully populated, it's value is stored in the
 * parent which clears up the lower level storage locations for the
 * next child's subtrees.  When both children are fully populated, then
 * the results are Joined and the result is propigated up one level.
 *
 * ******************************************************************/
void Merge_Tree_256(hashState *state, uint32_t *chain_vars)
{
  uint64_t num_steps;
  uint32_t *root_hash;
  int i,j, blocks_per_tree, leaf_num, level, level_mask;
  byte byte_array[32];
  
  state->last_md_block_number += 1;
  state->within_md_block = 0;
  state->current_md_block_datalen = 0;

  num_steps = (uint64_t)(ESSENCE_COMPRESS_NUM_STEPS);

#if ESSENCE_HASH_TREE_LEVEL == 0
  /*
   * If the hash tree level is zero, then we just
   * compress the most recent hash with the running
   * hash.
   */
#if ESSENCE_ASSUME_LITTLE_ENDIAN == 0
  for(i=0;i<8;i++)
    {
      for(j=0;j<4;j++)
	{
	  byte_array[i*4+j] = (byte)(chain_vars[i] >> (8*j));
	}
    }
  ESSENCE_COMPRESS_256((uint32_t *)(state->running_hash),
		       byte_array,
		       1LL,
		       num_steps);
#else
  ESSENCE_COMPRESS_256((uint32_t *)(state->running_hash),
		       (byte *)chain_vars,
		       1LL,
		       num_steps);
#endif /* ESSENCE_ASSUME_LITTLE_ENDIAN */
  
#else /* ESSENCE_HASH_TREE_LEVEL > 0 */
  /*
   * Now we figure out which leaf our last_md_block was
   * in, and where in the tree to join it.
   */
  blocks_per_tree = (1 << ESSENCE_HASH_TREE_LEVEL);
  leaf_num = ((int)(state->last_md_block_number)) % blocks_per_tree;
  
  level_mask = 1;
  level = 0;
  if (leaf_num & level_mask)
    {
      Join_256(((uint32_t *)(state->merkle_tree_hashes))+8*level,
	       chain_vars);
#if ESSENCE_DEBUG_LEVEL & 4
      printf("\n\n\n\n******** ******** ******** ");
      printf("******** ******** ******** LEAVING Join_256\n");
      PrintState(state);
#endif

      for(level=1; level < ESSENCE_HASH_TREE_LEVEL; level++)
	{
	  level_mask <<= 1;
	  if (leaf_num & level_mask)
	    {
	      Join_256(((uint32_t *)(state->merkle_tree_hashes))+8*level,
		       ((uint32_t *)(state->merkle_tree_hashes))+8*(level-1));
#if ESSENCE_DEBUG_LEVEL & 4
	      printf("\n\n\n\n******** ******** ******** ");
	      printf("******** ******** ******** LEAVING Join_256\n");
	      PrintState(state);
#endif

	    }
	  else
	    {
	      for(i=0;i<8;i++)
		{
		  (((uint32_t *)(state->merkle_tree_hashes))+8*level)[i] =
		    (((uint32_t *)(state->merkle_tree_hashes))+8*(level-1))[i];
		}
	      break;
	    }
	}
      /*
       * If we get to the root of the tree, then we need to
       * Join it with the running hash.
       */
      if (leaf_num == (blocks_per_tree - 1))
	{
	  root_hash = ( ((uint32_t *)(state->merkle_tree_hashes)) + 
			8*(ESSENCE_HASH_TREE_LEVEL-1) );
	  /*
	   * Now, we have to setup for a call to the compression function.
	   */
#if ESSENCE_ASSUME_LITTLE_ENDIAN == 0
	  for(i=0;i<8;i++)
	    {
	      for(j=0;j<4;j++)
		{
		  byte_array[i*4+j] = (byte)(root_hash[i] >> (8*j));
		}
	    }
	  ESSENCE_COMPRESS_256((uint32_t *)(state->running_hash),
			       byte_array,
			       1LL,
			       num_steps);
#else /* LITTLE_ENDIAN Target*/
	  ESSENCE_COMPRESS_256((uint32_t *)(state->running_hash),
			       (byte *)root_hash,
			       1LL,
			       num_steps);
#endif /* ESSENCE_ASSUME_LITTLE_ENDIAN */
	}
    }
  else
    {
      for(i=0;i<8;i++)
	{
	  (((uint32_t *)(state->merkle_tree_hashes))+8*level)[i] =
	    chain_vars[i];
	}
    }
#endif /* ESSENCE_HASH_TREE_LEVEL > 0 */
  
#if ESSENCE_DEBUG_LEVEL & 2
  printf("\n\n\n\n******** ******** ******** ");
  printf("******** ******** ******** LEAVING Merge_Tree_256\n");
  PrintState(state);
#endif

}













/* *******************************************************************
 *
 * HashReturn Update_256(hashState *state,
 *                       const BitSequence *data,
 *                       DataLength databitlen)
 *
 * state -- a structure that holds the hashState information
 *
 * data -- the data to be hashed
 *
 * databitlen -- the length, in bits, of the data to be hashed
 *
 * Updates the hash state structure with the given data.
 * Assumes that we will be using the 256-bit compression function.
 * This function should only be called by Update.
 * ******************************************************************/
HashReturn Update_256(hashState *state,
		      const BitSequence *data,
		      DataLength databitlen)
{
  uint32_t *chain_vars;
  uint32_t *intermediate_tree_hashes;
  uint32_t *MDBIV_init;
  uint64_t current_md_block_num;
  uint64_t tmp_64;
  uint64_t data_bytelen;
  uint64_t num_steps;
  uint64_t orig_md_block_num;
  uint64_t residual_data_byte_index;
  uint64_t residual_data_byte_offset;
  uint64_t num_blocks;
  uint64_t essence_md_block_size_in_256bit_blocks;
  uint64_t tmp_buffer[8];
  byte *residual_data;
  int i, j, num_bytes_to_copy, tmp, num_complete_md_blocks, start_point;


  /*
   * If we aren't getting enough new data to call the
   * compression function, then just copy it in and
   * exit
   */
  if ((state->residual_data_bitlen + databitlen) < 256)
    {
      residual_data = (byte *)(state->residual_data);
      residual_data_byte_index = state->residual_data_bitlen >> 3;
      data_bytelen = databitlen >>3;
      if (databitlen%8 != 0)
	{
	  data_bytelen++;
	}
      for (i=0;i<data_bytelen;i++)
	{
	  residual_data[residual_data_byte_index + i] = data[i];
	}
      state->residual_data_bitlen += databitlen;
      if ((state->residual_data_bitlen % 8) != 0)
	{
	  /*
	   * If the residual data doesn't end on a byte boundary, then
	   * we zero out the remaining bit positions.
	   */
	  residual_data_byte_index = ((state->residual_data_bitlen) >> 3);
	  residual_data[residual_data_byte_index] =
	    (residual_data[residual_data_byte_index] & 
	     ((byte)(0xff) << (8 - ((state->residual_data_bitlen) % 8))) );
	}
      return(SUCCESS);
    }


  /*
   * If we make it to this point, then we know that we will be
   * calling the compression function, so we need to setup for
   * it.
   *
   * We set a variable to the number of steps of the compression
   * function.  While this might seem superfluous, it is actually
   * necessary to ensure that the constant ESSENCE_COMPRESS_NUM_STEPS
   * is correctly expanded by some compilers (e.g Apple's gcc version
   * 4.0.1 in 32-bit mode) for function calls.
   */

  num_steps = (uint64_t)(ESSENCE_COMPRESS_NUM_STEPS);


  if (state->residual_data_bitlen > 0)
    {
      /*
       * If we have any residual data from the last call, we
       * deal with it here:
       *
       */
      
      /*
       * If we are beginning a new Merkle-Damgaard block, then we must
       * set the chaining variables to the correct Merkle-Damgaard
       * Block Initialization Vector (MDBIV).
       */
      if (! state->within_md_block)
	{
	  current_md_block_num = state->last_md_block_number + 1;
	  state->within_md_block = 1;
	  chain_vars = (uint32_t *)(state->chain_vars);
	  MDBIV_init = (uint32_t *)(state->MDBIV_init);
	  chain_vars[0] = (uint32_t)current_md_block_num;
	  chain_vars[1] = (uint32_t)(current_md_block_num >> 32);
	  for(i=2;i<8;i++)
	    {
	      chain_vars[i] = MDBIV_init[i];
	    }
	  state->current_md_block_datalen = 0;
	}
      
      
      /*
       * We copy enough of the input data here to fill up
       * the residual data block and then we call the
       * compression function once to deal with it.
       * Recall that from the NIST standard, our current
       * residual data is byte aligned.
       *
       * We adjust our data pointer and our databitlen
       * to account for the data we have just hashed.
       */
      residual_data = (byte *)(state->residual_data);
      residual_data_byte_index = state->residual_data_bitlen >> 3;
      num_bytes_to_copy = 32 - residual_data_byte_index;
      for(i=0;i<num_bytes_to_copy;i++)
	{
	  residual_data[residual_data_byte_index + i] = data[i];
	}
      data += num_bytes_to_copy;
      databitlen -= 8*num_bytes_to_copy;
      ESSENCE_COMPRESS_256((uint32_t *)(state->chain_vars),
			   (byte*)(state->residual_data),
			   1LL,
			   num_steps);
      state->current_md_block_datalen += 256;
      state->residual_data_bitlen = 0;
      if ( (state->current_md_block_datalen >> 3) == 
	   ESSENCE_MD_BLOCK_SIZE_IN_BYTES )
	{
	  /*
	   * If we just finished off a MD block, then we
	   * need to deal with it.
	   */
	  Merge_Tree_256(state,(uint32_t *)(state->chain_vars));
	}
    }
  

  /*
   * Here we copy over any data that won't be
   * hashed into the residual_data area.
   */
  tmp = databitlen % 256;
  if (tmp != 0)
    {
      databitlen -= tmp;
      residual_data_byte_offset = databitlen >> 3;
      residual_data = (byte *)(state->residual_data);
      for(i=0;i<(tmp >> 3);i++)
	{
	  residual_data[i] = data[residual_data_byte_offset + i];
	}
      /*
       * If the databitlen % 8 != 0, then we copy one more byte and
       * clear the non-data bits of the last byte of data.  Recall
       * that the NIST standard says that the data in the last byte
       * will be BIG ENDIAN justified (i.e. located at the most
       * significant end of the byte rather than the least significant
       * end).
       */
      if ((tmp % 8) != 0)
	{
	  residual_data[i] = ( data[residual_data_byte_offset + i] & 
			       ((byte)(0xff) << (8 - (tmp % 8))) );
	}
      state->residual_data_bitlen = tmp;
    }


  /*
   * If we have already dealt with all the data, then exit.
   */
  if (databitlen == 0)
    {
      return(SUCCESS);
    }



  /*
   * At this point, we no longer have to worry about the
   * residual data from the last call, and the remaining
   * databitlen is positive and divisible by 256.
   */
  if (state->current_md_block_datalen + databitlen >= (ESSENCE_MD_BLOCK_SIZE_IN_BYTES*8) )
    {
      /*
       * In this case, we have at least one complete MD block to deal
       * with including the data that has already been hashed in the
       * current block.
       */
      
      
      /*
       * If we are in the middle of a MD block, then we finish the
       * current block first.
       */
      num_blocks = (ESSENCE_MD_BLOCK_SIZE_IN_BYTES*8 - 
		    state->current_md_block_datalen)/256;
      if (state->within_md_block)
	{
	  ESSENCE_COMPRESS_256((uint32_t *)(state->chain_vars),
			       (byte *)data,
			       num_blocks,
			       num_steps);
	  data += num_blocks*32;
	  databitlen -= num_blocks*256;
	  Merge_Tree_256(state,(uint32_t *)(state->chain_vars));
	}
      
      
      /*
       * At this point we are at th beginning of a new MD block.
       */
      
      /*
       * Figure out how many complete MD blocks of data we have
       * available.
       */
      data_bytelen = databitlen >> 3;
      num_complete_md_blocks = (int)(data_bytelen -
				     (data_bytelen % (ESSENCE_MD_BLOCK_SIZE_IN_BYTES)) );
      num_complete_md_blocks = num_complete_md_blocks/(ESSENCE_MD_BLOCK_SIZE_IN_BYTES);
      
      if (num_complete_md_blocks > 0)
 	{
	  /*
	   * Setup some variables.
	   */
	  orig_md_block_num = state->last_md_block_number + 1;
	  essence_md_block_size_in_256bit_blocks = ESSENCE_MD_BLOCK_SIZE_IN_BYTES;
	  essence_md_block_size_in_256bit_blocks >>= 5;
	  MDBIV_init = (uint32_t *)(state->MDBIV_init);
	  
#if ESSENCE_USE_PARALLEL_CODE == 1
	  /*
	   * Allocate space to store separate chaining variables for all
	   * the blocks that we will be hashing in parallel.
	   */
	  chain_vars = (uint32_t *)malloc(num_complete_md_blocks*8*sizeof(uint32_t));


	  /* *** *** *** BEGIN PARALLELIZABLE CODE *** *** *** */
	  /*
	   * If the number of MD blocks is odd, we have to deal
	   * with the first block by itself.
	   */
	  start_point = 0;
	  if (num_complete_md_blocks % 2 == 1)
	    {
	      /*
	       * Initialize the chaining variables with the MDBIV
	       */
	      chain_vars[0] = (uint32_t)(orig_md_block_num);
	      chain_vars[1] = (uint32_t)((orig_md_block_num + 1) >> 32);
	      for(j=2;j<8;j++)
		{
		  chain_vars[j] = MDBIV_init[j];
		}
	      /*
	       * Now hash.
	       */
	      ESSENCE_COMPRESS_256(chain_vars,
				   (byte *)data,
				   essence_md_block_size_in_256bit_blocks,
				   num_steps);
	      start_point = 1;
	    }
#pragma omp parallel for private(j)
	  for(i=start_point;i<num_complete_md_blocks;i+=2)
	    {
	      /*
	       * Initialize the chaining variables with the MDBIV
	       */
	      chain_vars[i*8] = (uint32_t)(orig_md_block_num + (uint64_t)i);
	      chain_vars[i*8+1] = (uint32_t)((orig_md_block_num + (uint64_t)i) >> 32);
	      chain_vars[(i+1)*8] = (uint32_t)(orig_md_block_num + (uint64_t)(i+1));
	      chain_vars[(i+1)*8+1] = (uint32_t)((orig_md_block_num + (uint64_t)(i+1)) >> 32);
	      for(j=2;j<8;j++)
		{
		  chain_vars[i*8+j] = MDBIV_init[j];
		  chain_vars[(i+1)*8+j] = MDBIV_init[j];
		}
	      /*
	       * Now hash.
	       */
	      ESSENCE_COMPRESS_256_DUAL(chain_vars+i*8,
					chain_vars+(i+1)*8,
					(byte *)(data+i*(ESSENCE_MD_BLOCK_SIZE_IN_BYTES)),
					(byte *)(data+(i+1)*(ESSENCE_MD_BLOCK_SIZE_IN_BYTES)),
					essence_md_block_size_in_256bit_blocks,
					num_steps);
	    }
	  
	  /* *** *** *** END PARALLELIZABLE CODE *** *** *** */
	  
	  /*
	   * The merges must be done in serial since they
	   * are order dependent.
	   */
	  for(i=0;i<num_complete_md_blocks;i++)
	    {
	      Merge_Tree_256(state,chain_vars+i*8);
	    }

	  /*
	   * Free up the allocated space.
	   */
	  free(chain_vars);
#else /* ESSENCE_USE_PARALLEL_CODE == 0 */
	  /*
	   * This is the serial code version.
	   */
	  chain_vars = (uint32_t *)tmp_buffer;
	  /*
	   * If the number of MD blocks is odd, we have to deal
	   * with the first block by itself.
	   */
	  start_point = 0;
	  if (num_complete_md_blocks % 2 == 1)
	    {
	      /*
	       * Initialize the chaining variables with the MDBIV
	       */
	      chain_vars[0] = (uint32_t)(orig_md_block_num);
	      chain_vars[1] = (uint32_t)((orig_md_block_num + 1) >> 32);
	      for(j=2;j<8;j++)
		{
		  chain_vars[j] = MDBIV_init[j];
		}
	      /*
	       * Now hash.
	       */
	      ESSENCE_COMPRESS_256(chain_vars,
				   (byte *)data,
				   essence_md_block_size_in_256bit_blocks,
				   num_steps);
	      Merge_Tree_256(state,chain_vars);
	      start_point = 1;
	    }
	  for(i=start_point;i<num_complete_md_blocks;i+=2)
	    {
	      /*
	       * Initialize the chaining variables with the MDBIV
	       */
	      chain_vars[0] = (uint32_t)(orig_md_block_num + (uint64_t)i);
	      chain_vars[1] = (uint32_t)((orig_md_block_num + (uint64_t)i) >> 32);
	      chain_vars[8] = (uint32_t)(orig_md_block_num + (uint64_t)(i+1));
	      chain_vars[8+1] = (uint32_t)((orig_md_block_num + (uint64_t)(i+1)) >> 32);
	      for(j=2;j<8;j++)
		{
		  chain_vars[j] = MDBIV_init[j];
		  chain_vars[8+j] = MDBIV_init[j];
		}
	      /*
	       * Now hash.
	       */
	      ESSENCE_COMPRESS_256_DUAL(chain_vars,
					chain_vars+8,
					(byte *)(data+i*(ESSENCE_MD_BLOCK_SIZE_IN_BYTES)),
					(byte *)(data+(i+1)*(ESSENCE_MD_BLOCK_SIZE_IN_BYTES)),
					essence_md_block_size_in_256bit_blocks,
					num_steps);
	      Merge_Tree_256(state,chain_vars);
	      Merge_Tree_256(state,chain_vars+8);
	    }
#endif /* ESSENCE_USE_PARALLEL CODE */
	  databitlen -= (uint64_t)(num_complete_md_blocks * 
				   ESSENCE_MD_BLOCK_SIZE_IN_BYTES * 8);
	  data += num_complete_md_blocks * ESSENCE_MD_BLOCK_SIZE_IN_BYTES;
	}
    }
  
  /*
   * At this point, we have less than one MD block to deal with.
   */
  if (databitlen > 0)
    {
      /*
       * If we are beginning a new Merkle-Damgaard block, then we must
       * set the chaining variables to the correct Merkle-Damgaard
       * Block Initialization Vector (MDBIV).
       */
      if (! state->within_md_block)
	{
	  current_md_block_num = state->last_md_block_number + 1;
	  state->within_md_block = 1;
	  chain_vars = (uint32_t *)(state->chain_vars);
	  MDBIV_init = (uint32_t *)(state->MDBIV_init);
	  chain_vars[0] = (uint32_t)current_md_block_num;
	  chain_vars[1] = (uint32_t)(current_md_block_num >> 32);
	  for(i=2;i<8;i++)
	    {
	      chain_vars[i] = MDBIV_init[i];
	    }
	  state->current_md_block_datalen = 0;
	}
      ESSENCE_COMPRESS_256((uint32_t *)(state->chain_vars),
			   (byte *)data,
			   (databitlen >> 8),
			   num_steps);
      state->current_md_block_datalen += databitlen;
    }
  return(SUCCESS);
}














/* *******************************************************************
 *
 * HashReturn Update_512(hashState *state,
 *                       const BitSequence *data,
 *                       DataLength databitlen)
 *
 * state -- a structure that holds the hashState information
 *
 * data -- the data to be hashed
 *
 * databitlen -- the length, in bits, of the data to be hashed
 *
 * Updates the hash state structure with the given data.
 * Assumes that we will be using the 512-bit compression function.
 * This function should only be called by Update.
 * ******************************************************************/
HashReturn Update_512(hashState *state,
		      const BitSequence *data,
		      DataLength databitlen)
{
  uint64_t *chain_vars;
  uint64_t *intermediate_tree_hashes;
  uint64_t *MDBIV_init;
  uint64_t current_md_block_num;
  uint64_t tmp_64;
  uint64_t data_bytelen;
  uint64_t num_steps;
  uint64_t orig_md_block_num;
  uint64_t residual_data_byte_index;
  uint64_t residual_data_byte_offset;
  uint64_t num_blocks;
  uint64_t essence_md_block_size_in_512bit_blocks;
  byte *residual_data;
  int i, j, num_bytes_to_copy, tmp, num_complete_md_blocks;


  /*
   * If we aren't getting enough new data to call the
   * compression function, then just copy it in and
   * exit
   */
  if ((state->residual_data_bitlen + databitlen) < 512)
    {
      residual_data = (byte *)(state->residual_data);
      residual_data_byte_index = state->residual_data_bitlen >> 3;
      data_bytelen = databitlen >>3;
      if (databitlen%8 != 0)
	{
	  data_bytelen++;
	}
      for (i=0;i<data_bytelen;i++)
	{
	  residual_data[residual_data_byte_index + i] = data[i];
	}
      state->residual_data_bitlen += databitlen;
      if ((state->residual_data_bitlen % 8) != 0)
	{
	  /*
	   * If the residual data doesn't end on a byte boundary, then
	   * we zero out the remaining bit positions.
	   */
	  residual_data_byte_index = ((state->residual_data_bitlen) >> 3);
	  residual_data[residual_data_byte_index] =
	    (residual_data[residual_data_byte_index] & 
	     ((byte)(0xff) << (8 - ((state->residual_data_bitlen) % 8))) );
	}
      return(SUCCESS);
    }


  /*
   * If we make it to this point, then we know that we will be
   * calling the compression function, so we need to setup for
   * it.
   *
   * We set a variable to the number of steps of the compression
   * function.  While this might seem superfluous, it is actually
   * necessary to ensure that the constant ESSENCE_COMPRESS_NUM_STEPS
   * is correctly expanded by some compilers (e.g Apple's gcc version
   * 4.0.1 in 32-bit mode) for function calls.
   */

  num_steps = (uint64_t)(ESSENCE_COMPRESS_NUM_STEPS);


  if (state->residual_data_bitlen > 0)
    {
      /*
       * If we have any residual data from the last call, we
       * deal with it here:
       *
       */
      
      /*
       * If we are beginning a new Merkle-Damgaard block, then we must
       * set the chaining variables to the correct Merkle-Damgaard
       * Block Initialization Vector (MDBIV).
       */
      if (! state->within_md_block)
	{
	  current_md_block_num = state->last_md_block_number + 1;
	  state->within_md_block = 1;
	  chain_vars = (uint64_t *)(state->chain_vars);
	  MDBIV_init = (uint64_t *)(state->MDBIV_init);
	  chain_vars[0] = current_md_block_num;
	  for(i=1;i<8;i++)
	    {
	      chain_vars[i] = MDBIV_init[i];
	    }
	  state->current_md_block_datalen = 0;
	}
      
      
      /*
       * We copy enough of the input data here to fill up
       * the residual data block and then we call the
       * compression function once to deal with it.
       * Recall that from the NIST standard, our current
       * residual data is byte aligned.
       *
       * We adjust our data pointer and our databitlen
       * to account for the data we have just hashed.
       */
      residual_data = (byte *)(state->residual_data);
      residual_data_byte_index = state->residual_data_bitlen >> 3;
      num_bytes_to_copy = 64 - residual_data_byte_index;
      for(i=0;i<num_bytes_to_copy;i++)
	{
	  residual_data[residual_data_byte_index + i] = data[i];
	}
      data += num_bytes_to_copy;
      databitlen -= 8*num_bytes_to_copy;
      ESSENCE_COMPRESS_512(state->chain_vars,
			   (byte*)(state->residual_data),
			   1LL,
			   num_steps);
      state->current_md_block_datalen += 512;
      state->residual_data_bitlen = 0;
      if ( (state->current_md_block_datalen >> 3) == 
	   ESSENCE_MD_BLOCK_SIZE_IN_BYTES )
	{
	  /*
	   * If we just finished off a MD block, then we
	   * need to deal with it.
	   */
	  Merge_Tree_512(state,state->chain_vars);
	}
    }
  

  /*
   * Here we copy over any data that won't be
   * hashed into the residual_data area.
   */
  tmp = databitlen % 512;
  if (tmp != 0)
    {
      databitlen -= tmp;
      residual_data_byte_offset = databitlen >> 3;
      residual_data = (byte *)(state->residual_data);
      for(i=0;i<(tmp >> 3);i++)
	{
	  residual_data[i] = data[residual_data_byte_offset + i];
	}
      /*
       * If the databitlen % 8 != 0, then we copy one more byte and
       * clear the non-data bits of the last byte of data.  Recall
       * that the NIST standard says that the data in the last byte
       * will be BIG ENDIAN justified (i.e. located at the most
       * significant end of the byte rather than the least significant
       * end).
       */
      if ((tmp % 8) != 0)
	{
	  residual_data[i] = ( data[residual_data_byte_offset + i] & 
			       ((byte)(0xff) << (8 - (tmp % 8))) );
	}
      state->residual_data_bitlen = tmp;
    }


  /*
   * If we have already dealt with all the data, then exit.
   */
  if (databitlen == 0)
    {
      return(SUCCESS);
    }



  /*
   * At this point, we no longer have to worry about the
   * residual data from the last call, and the remaining
   * databitlen is positive and divisible by 512.
   */
  if (state->current_md_block_datalen + databitlen >= (ESSENCE_MD_BLOCK_SIZE_IN_BYTES*8) )
    {
      /*
       * In this case, we have at least one complete block to deal
       * with including the data that has already been hashed in the
       * current block.
       */
      
      
      /*
       * If we are in the middle of a MD block, then we finish the
       * current block first.
       */
      num_blocks = (ESSENCE_MD_BLOCK_SIZE_IN_BYTES*8 - 
		    state->current_md_block_datalen)/512;
      if (state->within_md_block)
	{
	  ESSENCE_COMPRESS_512(state->chain_vars,
			       (byte *)data,
			       num_blocks,
			       num_steps);
	  data += num_blocks*64;
	  databitlen -= num_blocks*512;
	  Merge_Tree_512(state,state->chain_vars);
	}
      
      
      /*
       * At this point we are at th beginning of a new MD block.
       */
      
      /*
       * Figure out how many complete MD blocks of data we have
       * available.
       */
      data_bytelen = databitlen >> 3;
      num_complete_md_blocks = (int)(data_bytelen -
				     (data_bytelen % (ESSENCE_MD_BLOCK_SIZE_IN_BYTES)) );
      num_complete_md_blocks = num_complete_md_blocks/(ESSENCE_MD_BLOCK_SIZE_IN_BYTES);
      
      if (num_complete_md_blocks > 0)
 	{
	  /*
	   * Setup some variables.
	   */
	  orig_md_block_num = state->last_md_block_number + 1;
	  essence_md_block_size_in_512bit_blocks = ESSENCE_MD_BLOCK_SIZE_IN_BYTES;
	  essence_md_block_size_in_512bit_blocks >>= 6;
	  MDBIV_init = (uint64_t *)(state->MDBIV_init);
	  
#if ESSENCE_USE_PARALLEL_CODE == 1
	  /*
	   * Allocate space to store separate chaining variables for all
	   * the blocks that we will be hashing in parallel.
	   */
	  chain_vars = (uint64_t *)malloc(num_complete_md_blocks*8*sizeof(uint64_t));

	  /* BEGIN PARALLELIZABLE CODE */
#pragma omp parallel for private(j)
	  for(i=0;i<num_complete_md_blocks;i++)
	    {
	      /*
	       * Initialize the chaining variables with the MDBIV
	       */
	      chain_vars[i*8] = orig_md_block_num + (uint64_t)i;
	      for(j=1;j<8;j++)
		{
		  chain_vars[i*8+j] = MDBIV_init[j];
		}
	      /*
	       * Now hash.
	       */
	      ESSENCE_COMPRESS_512(chain_vars+i*8,
				   (byte *)(data+i*(ESSENCE_MD_BLOCK_SIZE_IN_BYTES)),
				   essence_md_block_size_in_512bit_blocks,
				   num_steps);
	    }
	  /* END PARALLELIZABLE CODE */
	  
	  
	  /*
	   * The merges must be done in serial since they
	   * are order dependent.
	   */
	  for(i=0;i<num_complete_md_blocks;i++)
	    {
	      Merge_Tree_512(state,chain_vars+i*8);
	    }

	  /*
	   * Free up the allocated space.
	   */
	  free(chain_vars);
#else /* ESSENCE_USE_PARALLEL_CODE == 0 */
	  /*
	   * This is the serial code version.
	   */
	  chain_vars = (uint64_t *)(state->chain_vars);
	  for(i=0;i<num_complete_md_blocks;i++)
	    {
	      /*
	       * Initialize the chaining variables with the MDBIV
	       */
	      chain_vars[0] = orig_md_block_num + i;
	      for(j=1;j<8;j++)
		{
		  chain_vars[j] = MDBIV_init[j];
		}
	      /*
	       * Now hash.
	       */
	      ESSENCE_COMPRESS_512(chain_vars,
				   (byte *)(data+i*(ESSENCE_MD_BLOCK_SIZE_IN_BYTES)),
				   essence_md_block_size_in_512bit_blocks,
				   num_steps);
	      /*
	       * Now Merge
	       */
	      Merge_Tree_512(state,chain_vars);
	    }
#endif /* ESSENCE_USE_PARALLEL CODE */
	  databitlen -= (uint64_t)(num_complete_md_blocks * 
				   ESSENCE_MD_BLOCK_SIZE_IN_BYTES * 8);
	  data += num_complete_md_blocks * ESSENCE_MD_BLOCK_SIZE_IN_BYTES;
	}
    }
  
  /*
   * At this point, we have less than one MD block to deal with.
   */
  if (databitlen > 0)
    {
      /*
       * If we are beginning a new Merkle-Damgaard block, then we must
       * set the chaining variables to the correct Merkle-Damgaard
       * Block Initialization Vector (MDBIV).
       */
      if (! state->within_md_block)
	{
	  current_md_block_num = state->last_md_block_number + 1;
	  state->within_md_block = 1;
	  chain_vars = (uint64_t *)(state->chain_vars);
	  MDBIV_init = (uint64_t *)(state->MDBIV_init);
	  chain_vars[0] = current_md_block_num;
	  for(i=1;i<8;i++)
	    {
	      chain_vars[i] = MDBIV_init[i];
	    }
	  state->current_md_block_datalen = 0;
	}
      ESSENCE_COMPRESS_512(state->chain_vars,
			   (byte *)data,
			   (databitlen >> 9),
			   num_steps);
      state->current_md_block_datalen += databitlen;
    }
  return(SUCCESS);
}







/* *******************************************************************
 * HashReturn Update(hashState *state,
 *                   const BitSequence *data,
 *                   DataLength databitlen)
 *
 * state -- a structure that holds the hashState information
 *
 * data -- the data to be hashed
 *
 * databitlen -- the length, in bits, of the data to be hashed
 *
 * Updates the hash state structure with the given data.
 *
 * NOTE:  We may assume that the databitlen will be divisible
 * by 8 except, possibly, for the last call to Update.  Therefore
 * the data will be byte aligned.
 *
 * ******************************************************************/
HashReturn Update(hashState *state,
		  const BitSequence *data,
		  DataLength databitlen)
{
  HashReturn exit_code;
  if (databitlen == 0)
    {
      /*
       * If we don't have any data, then do nothing.
       */
      exit_code = SUCCESS;
    }
  else if ((state->residual_data_bitlen)%8 != 0)
    {
      /*
       * If we have already received a call with datalength
       * not a multiple of 8, then we should not have been
       * called again, so return a data alignment error.
       */
      exit_code = DATA_ALIGNMENT_ERROR;
    }
  else if (state->hashbitlen > 256)
    {
      exit_code = Update_512(state,data,databitlen);
    }
  else
    {
      exit_code = Update_256(state,data,databitlen);
    }

#if ESSENCE_DEBUG_LEVEL & 1
  printf("\n\n\n\n******** ******** ******** ");
  printf("******** ******** ******** LEAVING Update\n");
  PrintState(state);
#endif
  return(exit_code);
}










/* *******************************************************************
 * HashReturn Final_512(hashState *state,
 *                      BitSequence *hashval)
 *
 * state -- a structure that holds the hashState information
 *
 * hashval -- the storage for the final hash value to be
 *            returned.
 *
 * This function is for hash lengths over greater than 256 bits.
 * It does the following:
 *
 * 1. Complete the hashing of any residual data.
 *
 * 2. Complete the last Merkle Hash Tree.
 *
 * 3. Incorporate the top hash from the last hash tree into
 *    the running hash.
 *
 * 4. Form the "final block" with the strenghtening padding and
 *    hash it with the running hash.
 *
 * 5. Return the desired hash in the space pointed to by hashval. 
 *
 * ******************************************************************/
HashReturn Final_512(hashState *state,
		     BitSequence *hashval)
{
  uint64_t num_steps;
  uint64_t current_md_block_num;
  uint64_t last_block_data_bitlen;
  uint64_t *chain_vars;
  uint64_t *MDBIV_init;
  uint64_t *root_hash;
  uint64_t final_block[8];
  byte *residual_data;
  byte byte_array[64];
  int residual_data_byte_index;
  int blocks_per_tree;
  int leaf_num, level, level_mask;
  int num_bytes_to_copy;
  int i,j;

  num_steps = (uint64_t)(ESSENCE_COMPRESS_NUM_STEPS);

  /* **** **** **** **** **** **** **** **** **** **** **** ****
   * 1. Complete the hashing of any residual data.
   * **** **** **** **** **** **** **** **** **** **** **** ***/
  if (state->residual_data_bitlen > 0)
    {
      /*
       * As per the ESSENCE standard.  The residual data block is padded
       * out with all zeros.
       */
      residual_data_byte_index = (state->residual_data_bitlen) >> 3;
      residual_data = (byte*)(state->residual_data);
      if ((state->residual_data_bitlen % 8) != 0)
	{
	  /*
	   * If the data doesn't end on a byte boundary, then we
	   * zero out the remaining bits in the byte.  The NIST
	   * standard specifies that the data bits will be in the
	   * most significant bits of the byte.
	   */
	  residual_data[residual_data_byte_index] =
	    (residual_data[residual_data_byte_index] & 
	     ((byte)(0xff) << (8 - ((state->residual_data_bitlen) % 8))) );
	  residual_data_byte_index += 1;
	}
      while(residual_data_byte_index < 64)
	{
	  residual_data[residual_data_byte_index] = 0;
	  residual_data_byte_index++;
	}

      /*
       * If we are beginning a new Merkle-Damgaard block, then we must
       * set the chaining variables to the correct Merkle-Damgaard
       * Block Initialization Vector (MDBIV).
       */
      if (! state->within_md_block)
	{
	  current_md_block_num = state->last_md_block_number + 1;
	  state->within_md_block = 1;
	  chain_vars = (uint64_t *)(state->chain_vars);
	  MDBIV_init = (uint64_t *)(state->MDBIV_init);
	  chain_vars[0] = current_md_block_num;
	  for(i=1;i<8;i++)
	    {
	      chain_vars[i] = MDBIV_init[i];
	    }
	  state->current_md_block_datalen = 0;
	}
      ESSENCE_COMPRESS_512(state->chain_vars,
			   (byte *)(state->residual_data),
			   1LL,
			   num_steps);
      state->current_md_block_datalen += state->residual_data_bitlen;
    }

  last_block_data_bitlen = state->current_md_block_datalen;
  

  /* **** **** **** **** **** **** **** **** **** **** **** ****
   * 2. Complete the last Merkle Hash Tree.
   * **** **** **** **** **** **** **** **** **** **** **** ***/
  
  /*
   * At this point, all of the DM blocks have been hashed.
   * However, we may need to merge the last block into
   * the current hash tree.
   */
  if (state->within_md_block)
    {
      Merge_Tree_512(state,state->chain_vars);
    }
  
#if ESSENCE_HASH_TREE_LEVEL > 0
  /*
   * Since the Merge_Tree algorithm only ensures that
   * the fully populated subtrees are correct, we need
   * to fix any subtrees that aren't fully populated.
   */
  blocks_per_tree = (1 << ESSENCE_HASH_TREE_LEVEL);
  leaf_num = (state->last_md_block_number) % blocks_per_tree;
  level_mask = 1;
  for(level=1; level < ESSENCE_HASH_TREE_LEVEL; level++)
    {
      level_mask <<= 1;
      if (leaf_num & level_mask)
	{
	  Join_512(((uint64_t *)(state->merkle_tree_hashes))+8*level,
		   ((uint64_t *)(state->merkle_tree_hashes))+8*(level-1));
#if ESSENCE_DEBUG_LEVEL & 4
	  printf("\n\n\n\n******** ******** ******** ");
	  printf("******** ******** ******** LEAVING Join_512\n");
	  PrintState(state);
#endif
	}
      else
	{
	  for(i=0;i<8;i++)
	    {
	      (((uint64_t *)(state->merkle_tree_hashes))+8*level)[i] =
		(((uint64_t *)(state->merkle_tree_hashes))+8*(level-1))[i];
	    }
	}
    }


  /* **** **** **** **** **** **** **** **** **** **** **** ****
   * 3. Compress root of last tree into the running hash.
   * **** **** **** **** **** **** **** **** **** **** **** ***/
  root_hash = ( ((uint64_t *)(state->merkle_tree_hashes)) + 
		8*(ESSENCE_HASH_TREE_LEVEL-1) );
#if ESSENCE_ASSUME_LITTLE_ENDIAN == 0
  for(i=0;i<8;i++)
    {
      for(j=0;j<8;j++)
	{
	  byte_array[i*8+j] = (byte)(root_hash[i] >> (8*j));
	}
    }
  ESSENCE_COMPRESS_512(state->running_hash,
		       byte_array,
		       1LL,
		       num_steps);
#else /* LITTLE_ENDIAN Target*/
  ESSENCE_COMPRESS_512(state->running_hash,
		       (byte *)root_hash,
		       1LL,
		       num_steps);
#endif /* ESSENCE_ASSUME_LITTLE_ENDIAN */
#endif /* ESSENCE_HASH_TREE_LEVEL > 0 */


  /* **** **** **** **** **** **** **** **** **** **** **** ****
   * 4. Construct the final block and compress it.
   * **** **** **** **** **** **** **** **** **** **** **** ***/
  MDBIV_init = (uint64_t *)(state->MDBIV_init);
  for(i=0;i<8;i++)
    {
      final_block[i] = MDBIV_init[i];
    }
  final_block[0] = state->last_md_block_number;
  final_block[3] = last_block_data_bitlen;

#if ESSENCE_ASSUME_LITTLE_ENDIAN == 0
  for(i=0;i<8;i++)
    {
      for(j=0;j<8;j++)
	{
	  byte_array[i*8+j] = (byte)(final_block[i] >> (8*j));
	}
    }
  ESSENCE_COMPRESS_512(state->running_hash,
		       byte_array,
		       1LL,
		       num_steps);
#else /* LITTLE ENDIAN Target */
  ESSENCE_COMPRESS_512(state->running_hash,
		       (byte *)final_block,
		       1LL,
		       num_steps);
#endif /* ESSENCE_ASSUME_LITTLE_ENDIAN */
  

  /* **** **** **** **** **** **** **** **** **** **** **** ****
   * 5. Copy the final hash out to hashval.
   * **** **** **** **** **** **** **** **** **** **** **** ***/
  num_bytes_to_copy = (state->hashbitlen) >> 3;
  if ((state->hashbitlen) % 8 > 0 )
    {
      num_bytes_to_copy += 1;
    }
  for(i=0;i<num_bytes_to_copy;i++)
    {
      hashval[i] = (byte)((state->running_hash)[(i >> 3)] >> ((i % 8)*8));
    }
  if ((state->hashbitlen) % 8 > 0 )
    {
      /*
       * If the hashbitlen wasn't a multiple of 8, then we clear the
       * unused bits of the last byte.
       */
      hashval[i] = hashval[i] & (0xff << (8 - (state->hashbitlen % 8)) );
    }

#if ESSENCE_DEBUG_LEVEL & 1
  printf("\n\n\n\n******** ******** ******** ");
  printf("******** ******** ******** LEAVING Final\n");
  PrintState(state);
#endif

  return(SUCCESS);
}








/* *******************************************************************
 * HashReturn Final_256(hashState *state,
 *                      BitSequence *hashval)
 *
 * state -- a structure that holds the hashState information
 *
 * hashval -- the storage for the final hash value to be
 *            returned.
 *
 * This function is for hash lengths of 256 bits or less.
 * It does the following:
 *
 * 1. Complete the hashing of any residual data.
 *
 * 2. Complete the last Merkle Hash Tree.
 *
 * 3. Incorporate the top hash from the last hash tree into
 *    the running hash.
 *
 * 4. Form the "final block" with the strenghtening padding and
 *    hash it with the running hash.
 *
 * 5. Return the desired hash in the space pointed to by hashval. 
 *
 * ******************************************************************/
HashReturn Final_256(hashState *state,
		     BitSequence *hashval)
{
  uint64_t num_steps;
  uint64_t current_md_block_num;
  uint64_t last_block_data_bitlen;
  uint32_t *chain_vars;
  uint32_t *MDBIV_init;
  uint32_t *root_hash;
  uint32_t *running_hash;
  uint32_t final_block[8];
  byte *residual_data;
  byte byte_array[32];
  int residual_data_byte_index;
  int blocks_per_tree;
  int leaf_num, level, level_mask;
  int num_bytes_to_copy;
  int i,j;

  num_steps = (uint64_t)(ESSENCE_COMPRESS_NUM_STEPS);

  /* **** **** **** **** **** **** **** **** **** **** **** ****
   * 1. Complete the hashing of any residual data.
   * **** **** **** **** **** **** **** **** **** **** **** ***/
  if (state->residual_data_bitlen > 0)
    {
      /*
       * As per the ESSENCE standard.  The residual data block is padded
       * out with all zeros.
       */
      residual_data_byte_index = (state->residual_data_bitlen) >> 3;
      residual_data = (byte *)(state->residual_data);
      if ((state->residual_data_bitlen % 8) != 0)
	{
	  /*
	   * If the data doesn't end on a byte boundary, then we
	   * zero out the remaining bits in the byte.  The NIST
	   * standard specifies that the data bits will be in the
	   * most significant bits of the byte.
	   */
	  residual_data[residual_data_byte_index] =
	    (residual_data[residual_data_byte_index] & 
	     (((byte)(0xff)) << (8 - ((state->residual_data_bitlen) % 8))) );
	  residual_data_byte_index += 1;
	}
      while(residual_data_byte_index < 32)
	{
	  residual_data[residual_data_byte_index] = 0;
	  residual_data_byte_index++;
	}

      /*
       * If we are beginning a new Merkle-Damgaard block, then we must
       * set the chaining variables to the correct Merkle-Damgaard
       * Block Initialization Vector (MDBIV).
       */
      if (! state->within_md_block)
	{
	  current_md_block_num = state->last_md_block_number + 1;
	  state->within_md_block = 1;
	  chain_vars = (uint32_t *)(state->chain_vars);
	  MDBIV_init = (uint32_t *)(state->MDBIV_init);
	  chain_vars[0] = (uint32_t)current_md_block_num;
	  chain_vars[1] = (uint32_t)(current_md_block_num >> 32);
	  for(i=2;i<8;i++)
	    {
	      chain_vars[i] = MDBIV_init[i];
	    }
	  state->current_md_block_datalen = 0;
	}
      ESSENCE_COMPRESS_256((uint32_t *)(state->chain_vars),
			   (byte *)(state->residual_data),
			   1LL,
			   num_steps);
      state->current_md_block_datalen += state->residual_data_bitlen;
    }

  last_block_data_bitlen = state->current_md_block_datalen;


  /* **** **** **** **** **** **** **** **** **** **** **** ****
   * 2. Complete the last Merkle Hash Tree.
   * **** **** **** **** **** **** **** **** **** **** **** ***/
  
  /*
   * At this point, all of the DM blocks have been hashed.
   * However, we may need to merge the last block into
   * the current hash tree.
   */
  if (state->within_md_block)
    {
      Merge_Tree_256(state,(uint32_t *)(state->chain_vars));
    }
  
#if ESSENCE_HASH_TREE_LEVEL > 0
  /*
   * Since the Merge_Tree algorithm only ensures that
   * the fully populated subtrees are correct, we need
   * to fix any subtrees that aren't fully populated.
   */
  blocks_per_tree = (1 << ESSENCE_HASH_TREE_LEVEL);
  leaf_num = (state->last_md_block_number) % blocks_per_tree;
  level_mask = 1;
  for(level=1; level < ESSENCE_HASH_TREE_LEVEL; level++)
    {
      level_mask <<= 1;
      if (leaf_num & level_mask)
	{
	  Join_256(((uint32_t *)(state->merkle_tree_hashes))+8*level,
		   ((uint32_t *)(state->merkle_tree_hashes))+8*(level-1));
#if ESSENCE_DEBUG_LEVEL & 4
	  printf("\n\n\n\n******** ******** ******** ");
	  printf("******** ******** ******** LEAVING Join_256\n");
	  PrintState(state);
#endif

	}
      else
	{
	  for(i=0;i<8;i++)
	    {
	      (((uint32_t *)(state->merkle_tree_hashes))+8*level)[i] =
		(((uint32_t *)(state->merkle_tree_hashes))+8*(level-1))[i];
	    }
	}
    }


  /* **** **** **** **** **** **** **** **** **** **** **** ****
   * 3. Compress root of last tree into the running hash.
   * **** **** **** **** **** **** **** **** **** **** **** ***/
  root_hash = ( ((uint32_t *)(state->merkle_tree_hashes)) + 
		8*(ESSENCE_HASH_TREE_LEVEL-1) );
#if ESSENCE_ASSUME_LITTLE_ENDIAN == 0
  for(i=0;i<8;i++)
    {
      for(j=0;j<4;j++)
	{
	  byte_array[i*4+j] = (byte)(root_hash[i] >> (8*j));
	}
    }
  ESSENCE_COMPRESS_256((uint32_t *)(state->running_hash),
		       byte_array,
		       1LL,
		       num_steps);
#else /* LITTLE_ENDIAN Target*/
  ESSENCE_COMPRESS_256((uint32_t *)(state->running_hash),
		       (byte *)root_hash,
		       1LL,
		       num_steps);
#endif /* ESSENCE_ASSUME_LITTLE_ENDIAN */
#endif /* ESSENCE_HASH_TREE_LEVEL > 0 */


  /* **** **** **** **** **** **** **** **** **** **** **** ****
   * 4. Construct the final block and compress it.
   * **** **** **** **** **** **** **** **** **** **** **** ***/
  MDBIV_init = (uint32_t *)(state->MDBIV_init);
  for(i=0;i<8;i++)
    {
      final_block[i] = MDBIV_init[i];
    }
  final_block[0] = (uint32_t)(state->last_md_block_number);
  final_block[1] = (uint32_t)((state->last_md_block_number) >> 32);
  final_block[6] = (uint32_t)(last_block_data_bitlen);
  final_block[7] = (uint32_t)(last_block_data_bitlen >> 32);

#if ESSENCE_ASSUME_LITTLE_ENDIAN == 0
  for(i=0;i<8;i++)
    {
      for(j=0;j<4;j++)
	{
	  byte_array[i*4+j] = (byte)(final_block[i] >> (8*j));
	}
    }
  ESSENCE_COMPRESS_256((uint32_t *)(state->running_hash),
		       byte_array,
		       1LL,
		       num_steps);
#else /* LITTLE ENDIAN Target */
  ESSENCE_COMPRESS_256((uint32_t *)(state->running_hash),
		       (byte *)final_block,
		       1LL,
		       num_steps);
#endif /* ESSENCE_ASSUME_LITTLE_ENDIAN */
  

  /* **** **** **** **** **** **** **** **** **** **** **** ****
   * 5. Copy the final hash out to hashval.
   * **** **** **** **** **** **** **** **** **** **** **** ***/
  num_bytes_to_copy = (state->hashbitlen) >> 3;
  if ((state->hashbitlen) % 8 > 0 )
    {
      num_bytes_to_copy += 1;
    }
  running_hash = (uint32_t*)(state->running_hash);
  for(i=0;i<num_bytes_to_copy;i++)
    {
      hashval[i] = (byte)(running_hash[i>>2] >> ((i%4)*8));
    }
  if ((state->hashbitlen) % 8 > 0 )
    {
      /*
       * If the hashbitlen wasn't a multiple of 8, then we clear the
       * unused bits of the last byte.
       */
      hashval[i] = hashval[i] & (0xff << (8 - (state->hashbitlen % 8)) );
    }

#if ESSENCE_DEBUG_LEVEL & 1
  printf("\n\n\n\n******** ******** ******** ");
  printf("******** ******** ******** LEAVING Final\n");
  PrintState(state);
#endif

  return(SUCCESS);
}









/* *******************************************************************
 * HashReturn Final(hashState *state,
 *                  BitSequence *hashval)
 *
 * state -- a structure that holds the hashState information
 *
 * hashval -- the storage for the final hash value to be
 *            returned.
 *
 * ******************************************************************/
HashReturn Final(hashState *state,
		 BitSequence *hashval)
{
  HashReturn exit_code;

  if (state->hashbitlen > 256)
    {
      exit_code = Final_512(state,hashval);
    }
  else
    {
      exit_code = Final_256(state,hashval);
    }
  return(exit_code);
}







/* *******************************************************************
 * HashReturn Hash(int hashbitlen,
 *                 const BitSequence *data,
 *                 DataLength databitlen
 *                 BitSequence *hashval)
 *
 * hashbitlen -- The size of the hash to be returned in bits.
 *
 * data -- The data to be hashed.
 *
 * databitlen -- The length, in bits, of data to be hashed.
 *
 * hashval -- the storage for the final hash value to be
 *            returned.
 *
 * ******************************************************************/
HashReturn Hash(int hashbitlen,
		const BitSequence *data,
		DataLength databitlen,
		BitSequence *hashval)
{
  HashReturn exit_code;
  hashState the_hash_state;

  exit_code = Init(&the_hash_state, hashbitlen);
  if (exit_code == SUCCESS)
    {
      exit_code = Update(&the_hash_state,data,databitlen);
      if (exit_code == SUCCESS)
	{
	  exit_code = Final(&the_hash_state,hashval);
	}
    }
  return(exit_code);
}




#if ESSENCE_DEBUG_LEVEL > 0
/* *******************************************************************
 * PrintState(hashState *state)
 *
 * state -- the hash state
 *
 * DESCRIPTION: Print the hash state information to stdout.  All of
 * the arrays are treated as arrays of bytes, and they are printed
 * sequentially.  This function is provided for debugging purposes.
 *
 * ******************************************************************/
void PrintState(hashState *state)
{
  byte *byte_array;
  uint32_t *dword_array;
  uint64_t *qword_array;
  int i,j;

  printf("hashbitlen: %i\n",state->hashbitlen);
  if (state->hashbitlen > 256)
    {
      printf("Using 512-bit compression function values\n\n");
      for(i=0;i<8;i++)
	{
	  printf("running_hash[%i] = 0x%.16llx\n",i,
		 state->running_hash[i]);
	}

      printf("\n");
      for(i=0;i<8;i++)
	{
	  printf("chain_vars[%i] = 0x%.16llx\n",i,
		 state->chain_vars[i]);
	}

      printf("\nMDBIV_init:");
      byte_array = (byte*)(state->MDBIV_init);
      for(i=0;i<8;i++)
	{
	  printf("\n Bytes %.2i - %.2i:          ",8*i,8*i+7);
	  for(j=0;j<8;j++)
	    {
	      printf(" 0x%.2x",byte_array[i*8+j]);
	    }
	}

      printf("\nMDBIV_init (reversed, merged):");
      byte_array = (byte*)(state->MDBIV_init);
      for(i=7;i>=0;i--)
	{
	  printf("\n Quad Word %i:                 0x",i);
	  for(j=7;j>=0;j--)
	    {
	      printf("%.2x",byte_array[i*8+j]);
	    }
	}

#if ESSENCE_HASH_TREE_LEVEL > 0
      printf("\n\nmerkle_tree_hashes:\n");
      for(i=0;i<ESSENCE_HASH_TREE_LEVEL;i++)
	{
	  for(j=0;j<8;j++)
	    {
	      printf("merkle_tree_hashes[%i*8+%i] = 0x%.16llx\n",
		     i,j,
		     state->merkle_tree_hashes[i*8+j]);
	    }
	}
#endif /* ESSENCE_HASH_TREE_LEVEL > 0 */

      printf("\nlast_md_block_number = 0x%.16llx\n",
	     state->last_md_block_number);

      printf("\ncurrent_md_block_datalen = 0x%.16llx\n",
	     state->current_md_block_datalen);

      printf("\nresidual data:\n");
      byte_array = (byte*)(state->residual_data);
      for(i=0;i<8;i++)
	{
	  printf("\n Bytes %.2i - %.2i:          ",8*i,8*i+7);
	  for(j=0;j<8;j++)
	    {
	      printf(" 0x%.2x",byte_array[i*8+j]);
	    }
	}
      printf("\nresidual_data_bitlen = %i\n",
	     state->residual_data_bitlen);

      printf("\nhashbitlen = %i\n",
	     state->hashbitlen);

      printf("\nwithin_md_block = %i\n",
	     state->within_md_block);
    }
  else
    {
      printf("Using 256-bit compression function values\n\n");
      for(i=0;i<8;i++)
	{
	  printf("running_hash[%i] = 0x%.8x\n",i,
		 ((uint32_t *)(state->running_hash))[i]);
	}

      printf("\n");
      for(i=0;i<8;i++)
	{
	  printf("chain_vars[%i] = 0x%.8x\n",i,
		 ((uint32_t *)(state->chain_vars))[i]);
	}

      printf("\nMDBIV_init:");
      byte_array = (byte*)(state->MDBIV_init);
      for(i=0;i<8;i++)
	{
	  printf("\n Bytes %.2i - %.2i:          ",4*i,4*i+3);
	  for(j=0;j<4;j++)
	    {
	      printf(" 0x%.2x",byte_array[i*4+j]);
	    }
	}

      printf("\nMDBIV_init (reversed, merged):");
      byte_array = (byte*)(state->MDBIV_init);
      for(i=7;i>=0;i--)
	{
	  printf("\n Double Word %i:                 0x",i);
	  for(j=3;j>=0;j--)
	    {
	      printf("%.2x",byte_array[i*4+j]);
	    }
	}

#if ESSENCE_HASH_TREE_LEVEL > 0
      printf("\n\nmerkle_tree_hashes:\n");
      for(i=0;i<ESSENCE_HASH_TREE_LEVEL;i++)
	{
	  for(j=0;j<8;j++)
	    {
	      printf("merkle_tree_hashes[%i*8+%i] = 0x%.8x\n",
		     i,j,
		     ((uint32_t*)(state->merkle_tree_hashes))[i*8+j]);
	    }
	}
#endif /* ESSENCE_HASH_TREE_LEVEL > 0 */

      printf("\nlast_md_block_number = 0x%.16llx\n",
	     state->last_md_block_number);

      printf("\ncurrent_md_block_datalen = 0x%.16llx\n",
	     state->current_md_block_datalen);

      printf("\nresidual data:\n");
      byte_array = (byte*)(state->residual_data);
      for(i=0;i<8;i++)
	{
	  printf("\n Bytes %.2i - %.2i:          ",8*i,8*i+7);
	  for(j=0;j<8;j++)
	    {
	      printf(" 0x%.2x",byte_array[i*8+j]);
	    }
	}
      printf("\nresidual_data_bitlen = %i\n",
	     state->residual_data_bitlen);

      printf("\nhashbitlen = %i\n",
	     state->hashbitlen);

      printf("\nwithin_md_block = %i\n",
	     state->within_md_block);
    }
  fflush(stdout);
}
#endif /* ESSENCE_DEBUG_LEVEL > 0 */
