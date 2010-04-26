/*******************************************************************/
/*  SHA3api_ref.h -- Definitions required by the API               */
/*                                                                 */
/*  Written by Eli Biham and Orr Dunkelman                         */
/*                                                                 */
/*******************************************************************/

/* definitions imposed by the API */

#ifndef SHA3API_H
#define SHA3API_H
typedef unsigned char BitSequence;

typedef unsigned long long DataLength;

typedef enum {SUCCESS=0, FAIL=1, BAD_HASHBITLEN=2} HashReturn;

/* SHAvite-3 definition */

typedef struct {
   DataLength bitcount;            /* The number of bits compressed so far   */
   BitSequence chaining_value[64]; /* An array containing the chaining value */
   BitSequence buffer[128];        /* A buffer storing bytes until they are  */
				   /* compressed			     */
   BitSequence partial_byte;       /* A byte to store a fraction of a byte   */
				   /* in case the input is not fully byte    */
				   /* alligned				     */
   BitSequence salt[64];           /* The salt used in the hash function     */ 
   int DigestSize;		   /* The requested digest size              */
   int BlockSize;		   /* The message block size                 */
} hashState;

/* Function calls imposed by the API */

HashReturn Init (hashState *state, int hashbitlen);

HashReturn Update (hashState *state, const BitSequence *data, DataLength
                   databitlen);

HashReturn Final (hashState *state, BitSequence *hashval);

HashReturn Hash (int hashbitlen, const BitSequence *data, 
		 DataLength databitlen, BitSequence *hashval);

#endif
