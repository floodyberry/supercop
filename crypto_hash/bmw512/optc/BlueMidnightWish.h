// We use this type definition to ensure that 
// "unsigned long" on 32-bit and 64-bit little-endian 
// operating systems are 4 bytes long.
#if defined( _MSC_VER )
typedef unsigned long u_int32_t;
typedef unsigned long long u_int64_t;
#else
#include <sys/types.h>
#endif

// General SHA-3 definitions
typedef unsigned char BitSequence;
typedef u_int64_t DataLength; // a typical 64-bit value
typedef enum { SUCCESS = 0, FAIL = 1, BAD_HASHLEN = 2, BAD_CONSECUTIVE_CALL_TO_UPDATE = 3 } HashReturn;
// Blue Midnight Wish allows to call Update() function consecutively only if the total length of stored 
// unprocessed data and the new supplied data is less than or equal to the BLOCK_SIZE on which the 
// compression functions operates. Otherwise BAD_CONSECUTIVE_CALL_TO_UPDATE is returned.


// Specific algorithm definitions
#define BlueMidnightWish224_DIGEST_SIZE  28
#define BlueMidnightWish224_BLOCK_SIZE   64
#define BlueMidnightWish256_DIGEST_SIZE  32
#define BlueMidnightWish256_BLOCK_SIZE   64
#define BlueMidnightWish384_DIGEST_SIZE  48
#define BlueMidnightWish384_BLOCK_SIZE  128
#define BlueMidnightWish512_DIGEST_SIZE  64
#define BlueMidnightWish512_BLOCK_SIZE  128


// Here we define the default Blue Midnight Wish tunable security parameters.
// The parameters are named EXPAND_1_ROUNDS and EXPAND_2_ROUNDS.
// Since Blue Midnight Wish has 16 rounds in its message expansion part, the 
// following relation for these parameters should be satisfied:
//
//          EXPAND_1_ROUNDS + EXPAND_2_ROUNDS = 16
//
// Blue Midnight Wish in its message expansion part uses 2 different functions: 
// expand_1 and expand_2.
//
// expand_1 is the more complex and more time consuming, but offers the fastest
// diffusion of bit differences and produces variables that have the most complex
// nonlinear relations with previous 16 variables in the message expansion part.
//
// expand_2 is faster than expand_1, and uses faster and simpler functions than 
// expand_1. The produced variables still have complex nonlinear relations with 
// previous 16 variables in the message expansion part.
//
#define EXPAND_1_ROUNDS 2
#define EXPAND_2_ROUNDS 14


typedef struct
{
	u_int32_t DoublePipe[32];
	BitSequence LastPart[BlueMidnightWish256_BLOCK_SIZE * 2];
} Data256;
typedef struct
{
	u_int64_t DoublePipe[32];
	BitSequence LastPart[BlueMidnightWish512_BLOCK_SIZE * 2];
} Data512;

typedef struct {
    int hashbitlen;

	// + algorithm specific parameters
	u_int64_t bits_processed;
	union
    { 
		Data256  p256[1];
		Data512  p512[1];
    } pipe[1];
	int unprocessed_bits;
} hashState;

HashReturn Init(hashState *state, int hashbitlen);
HashReturn Update(hashState *state, const BitSequence *data, DataLength databitlen);
HashReturn Final(hashState *state, BitSequence *hashval);
HashReturn Hash(int hashbitlen, const BitSequence *data, DataLength databitlen, BitSequence *hashval);
