/* Author: Peter Schwabe, based on the ebash reference implementation
 * 2009-06-02
 */

#include <stdio.h>

#define FSB256_N (1<<21)
#define FSB256_W (1<<7)
#define FSB256_R (1<<10)
#define FSB256_P 1061
#define FSB256_B (FSB256_N/FSB256_R)
#define FSB256_INPUTSIZE (FSB256_W * FSB256_BPC - FSB256_R )
#define FSB256_BPC 14 /* LD(FSB256_N/FSB256_W) */
#define FSB256_BFIV (FSB256_R/FSB256_W)
#define FSB256_BFM (FSB256_INPUTSIZE/FSB256_W)
#define FSB256_HASHBITLEN 256
#define FSB256_WEIGHT 128

#define LUI(a) (((a)-1)/(sizeof(int)<<3)+1)
#define LULL(a) (((a)-1)/(sizeof(long long)<<3)+1)
#define PUI(a) ((a)/(sizeof(int)<<3))
#define MUI ((sizeof(int)<<3)-1)

/*
typedef unsigned char BitSequence;
typedef unsigned long long DataLength;
*/

typedef enum {
  SUCCESS = 0,
  FAIL = 1,
  BAD_HASHBITLEN = 2
} HashReturn;

typedef struct {
  /* current syndrome */
  unsigned char *syndrome;
  /* space to store new syndrome */
  unsigned long long *new_syndrome;
  /* input buffer */
  unsigned char *buffer;
  /* number of bits in the buffer */
  /* [was: unsigned int count;] */
  unsigned int bufbits;
  /* number of bits hashed */
  /* [was: unsigned long long databitlen;] */
  unsigned long long nbitshashed;
} hashState;

HashReturn Init(hashState *state, int hashbitlen);
HashReturn Update(hashState *state, const unsigned char *data, unsigned long long databitlen);
HashReturn Final(hashState *state, unsigned char *hashval);
HashReturn Hash(int hashbitlen, const unsigned char *data, unsigned long long databitlen, unsigned char *hashval);

HashReturn HashFile(int hashbitlen, FILE* file_to_hash, unsigned char *hashval);
void printHash(unsigned char *hashval, int hashbitlen);
unsigned int * computeIndex(hashState * state, int i);
void performHash(hashState* state);
void printBuffer(hashState* state);
