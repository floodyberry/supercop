/******************************************************************************
 * Blue Midnight Wish SHA-3 candidate SUPERCOP API include file.
 *
 * Derived from the Sep 15 2009 NIST API submission by
 * Danilo Gligoroski <danilog@item.ntnu.no>. Citations refer to Danilo
 * Gligoroski er.al., "Cryptographic Hash Function Blue Midnight Wish", NTNU,
 * September 2009.
 *
 * Prepared for SUPERCOP API by Jorn Amundsen <jorn.amundsen@ntnu.no>.
 *-----------------------------------------------------------------------------
 * $Id: BlueMidnightWish.h 82 2010-05-30 21:46:23Z joern $
 ******************************************************************************/

/* tacitly assume ISO/IEC 9899:1999 <stdint.h> is present */
#include <stdint.h>

/* ANSI C header header for memory operations (move/copy) */
#include <string.h>

/* big endian support, provides no-op's if run on little endian hosts */
#include "byteorder.h"

/* generic definitions */
#define N_BLOCK_WORDS           16
#define N_DOUBLEBLOCK_WORDS     32
#define N_BYTES_2_BITS           3
#define N_PAD_BIT0          (0x80)

/* tunable parameters (ch 3.6) */
#define EXPAND_1_ROUNDS  2
#define EXPAND_2_ROUNDS 14


/* shift and rotate shortcuts */

#define shl(x,n)    ((x) << n)
#define shr(x,n)    ((x) >> n)

#define rotl32(x,n) (((x) << (n)) | ((x) >> (32 - (n))))
#define rotr32(x,n) (((x) >> (n)) | ((x) << (32 - (n))))

#define rotl64(x,n) (((x) << (n)) | ((x) >> (64 - (n))))
#define rotr64(x,n) (((x) >> (n)) | ((x) << (64 - (n))))

/* specific algorithm definitions */
/*256*/
#define N_BMW256_WORD_BITS      32
#define N_BMW256_BYTES_2_WORDS   2
#define N_BMW256_BLOCK_BYTES    64
#define N_BMW256_BLOCK_BYTES_2   6
#define N_BMW256_DIGEST_BYTES   32
/*512*/
#define N_BMW512_WORD_BITS      64
#define N_BMW512_BYTES_2_WORDS   3
#define N_BMW512_BLOCK_BYTES   128
#define N_BMW512_BLOCK_BYTES_2   7
#define N_BMW512_DIGEST_BYTES   64

/* constants to support alternate implementations */
/*256*/
#define N_BMW256_DP_INIT 0x40414243ul
#define N_BMW256_DP_INCR 0x04040404ul
#define N_BMW256_C_FIN_0 0xaaaaaaa0ul
/*512*/
#define N_BMW512_DP_INIT 0x8081828384858687ull
#define N_BMW512_DP_INCR 0x0808080808080808ull
#define N_BMW512_C_FIN_0 0xaaaaaaaaaaaaaaa0ull
