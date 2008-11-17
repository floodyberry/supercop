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
// EdonR allows to call Update() function consecutively only if the total length of stored 
// unprocessed data and the new supplied data is less than or equal to the BLOCK_SIZE on which the 
// compression functions operates. Otherwise BAD_CONSECUTIVE_CALL_TO_UPDATE is returned.


// Specific algorithm definitions
#define EdonR224_DIGEST_SIZE  28
#define EdonR224_BLOCK_SIZE   64
#define EdonR256_DIGEST_SIZE  32
#define EdonR256_BLOCK_SIZE   64
#define EdonR384_DIGEST_SIZE  48
#define EdonR384_BLOCK_SIZE  128
#define EdonR512_DIGEST_SIZE  64
#define EdonR512_BLOCK_SIZE  128

typedef struct
{
	u_int32_t DoublePipe[32];
	BitSequence LastPart[EdonR256_BLOCK_SIZE * 2];
} Data256;
typedef struct
{
	u_int64_t DoublePipe[32];
	BitSequence LastPart[EdonR512_BLOCK_SIZE * 2];
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
