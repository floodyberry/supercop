#include "crypto_encrypt.h"

#define NB_ERRORS 32
#define EXT_DEGREE 11

// number of bytes to store the length of a bloc
#define LENGTH_BYTES 2

#define LENGTH (1 << EXT_DEGREE)
#define CODIMENSION (NB_ERRORS * EXT_DEGREE)
#define DIMENSION (LENGTH - CODIMENSION)

// number of bytes needed for storing nb_bits bits
#define BITS_TO_BYTES(nb_bits) (((nb_bits) - 1) / 8 + 1)
// number bits in one long
#define BIT_SIZE_OF_LONG (8 * sizeof(long))
// number of long needed for storing nb_bits bits
#define BITS_TO_LONG(nb_bits) (((nb_bits) - 1) / BIT_SIZE_OF_LONG + 1)

// assumes EXT_DEGREE <= 16, so that a field elements takes 2 bytes
#define SECRETKEY_BYTES ((LENGTH + 1 + (LENGTH + NB_ERRORS + 1) * NB_ERRORS) * 2)
#define PUBLICKEY_BYTES (BITS_TO_LONG(CODIMENSION) * sizeof(long) * DIMENSION)
// apparently we have to be able to handle blocs of small size. So we
// have to save LENGTH_BYTES for that
#define SHORTPLAINTEXT_BYTES ((DIMENSION / 8) - LENGTH_BYTES)
#define ENCRYPTION_BYTES BITS_TO_BYTES(LENGTH)
