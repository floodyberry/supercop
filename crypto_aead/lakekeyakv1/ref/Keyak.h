/*
The Keyak authenticated encryption scheme, designed by Guido Bertoni,
Joan Daemen, Michaël Peeters, Gilles Van Assche and Ronny Van Keer.
For more information, feedback or questions, please refer to our website:
http://keyak.noekeon.org/

Implementation by the designers,
hereby denoted as "the implementer".

To the extent possible under law, the implementer has waived all copyright
and related or neighboring rights to the source code in this file.
http://creativecommons.org/publicdomain/zero/1.0/
*/

#ifndef _Keyak_h_
#define _Keyak_h_

#include "NumberOfParallelInstances.h"

#if ((!defined(NumberOfParallelInstances)) || (NumberOfParallelInstances == 1))

#include "KeccakDuplex.h"

/**
  * Structure that contains the Keyak instance for use with the
  * Keyak functions.
  */
typedef struct {
    /** The underlying duplex instance. */
    Keccak_DuplexInstance duplex;

    /** The phase. */
    int phase;
} Keyak_Instance;

/**
  * Function that feeds the key and the nonce. The key is a bit strings and consist of a sequence of bytes.
  * The nonce is string of 16 bytes.
  *
  * @param  instance		Pointer to the Keyak instance structure.
  * @param  key             Pointer to the key.
  * @param  keySizeInBits   The size of the key in bits.
  * @param  nonce           Pointer to the nonce.
  *
  * @pre    phase == *
  * @pre    keySizeInBits <= 224
  *
  * @post   phase == feedingAssociatedData
  *
  * @return 0 if successful, 1 otherwise.
  */
int RiverKeyak_Initialize(Keyak_Instance *instance, const unsigned char *key, unsigned int keySizeInBits, const unsigned char *nonce);

/**
  * Function that feeds the key and the nonce. The key is a bit strings and consist of a sequence of bytes.
  * The nonce is string of 16 bytes.
  *
  * @param  instance		Pointer to the Keyak instance structure.
  * @param  key             Pointer to the key.
  * @param  keySizeInBits   The size of the key in bits.
  * @param  nonce           Pointer to the nonce.
  *
  * @pre    phase == *
  * @pre    keySizeInBits <= 224
  *
  * @post   phase == feedingAssociatedData
  *
  * @return 0 if successful, 1 otherwise.
  */
int LakeKeyak_Initialize(Keyak_Instance *instance, const unsigned char *key, unsigned int keySizeInBits, const unsigned char *nonce);

#else

#include "KeccakParallelDuplex.h"

/**
  * Structure that contains the Keyak instance for use with the
  * Keyak functions.
  */
typedef struct {
    /** The underlying array of duplex instance. */
    Keccak_ParallelDuplexInstances duplex;

    /** The phase. */
    int phase;
} Keyak_Instance;

/**
  * Function that feeds the key and the nonce. The key is a bit strings and consist of a sequence of bytes.
  * The nonce is string of 16 bytes.
  *
  * @param  instance		Pointer to the Keyak instance structure.
  * @param  key             Pointer to the key.
  * @param  keySizeInBits   The size of the key in bits.
  * @param  nonce           Pointer to the nonce.
  *
  * @pre    phase == *
  * @pre    keySizeInBits <= 224
  *
  * @post   phase == feedingAssociatedData
  *
  * @return 0 if successful, 1 otherwise.
  */
int ParallelKeyak_Initialize(Keyak_Instance *instance, const unsigned char *key, unsigned int keySizeInBits, const unsigned char *nonce);
#define SeaKeyak_Initialize ParallelKeyak_Initialize
#define OceanKeyak_Initialize ParallelKeyak_Initialize

#endif

/**
  * Function that feeds (partial) associated data that consists of a sequence
  * of bytes. Associated data may be fed in multiple calls to this function.
  * The end of it is indicated by a call to wrap or unwrap.
  *
  * @param  instance		    Pointer to the Ketje instance structure.
  * @param  data                Pointer to the (partial) associated data.
  * @param  dataSizeInBytes     The size of the (partial) associated data in bytes.
  *
  * @pre    phase == feedingAssociatedData
  *
  * @post   phase == feedingAssociatedData
  *
  * @return 0 if successful, 1 otherwise.
  */
int Keyak_FeedAssociatedData(Keyak_Instance *instance, const unsigned char *data, unsigned int dataSizeInBytes);

/**
  * Function that presents a (partial) plaintext body that consists of a
  * sequence of bytes for wrapping. A plaintext body may be wrapped in
  * multiple calls to wrap. The end of the plaintext body is indicated
  * by a call to Ketje_getTag.
  *
  * @param  instance		    Pointer to the Ketje instance structure.
  * @param  plaintext           The (partial) plaintext body.
  * @param  ciphertext          The buffer where enciphered data will be stored.
  *                             This can be equal to the plaintext buffer to save memory,
  *                             but otherwise the two buffers must not overlap.
  * @param  dataSizeInBytes     The size of the (partial) plaintext body.
  *
  * @pre    ( phase == feedingAssociatedData ) or ( phase == wrapping )
  *
  * @post   phase == wrapping
  *
  * @return 0 if successful, 1 otherwise.
  */
int Keyak_WrapPlaintext(Keyak_Instance *instance, const unsigned char *plaintext, unsigned char *ciphertext, unsigned int dataSizeInBytes);

/**
  * Function that presents a (partial) ciphertext body that consists of a
  * sequence of bytes for unwrapping. A ciphertext body may be wrapped in
  * multiple calls to unwrap. The end of the ciphertext body is indicated
  * by a call to Ketje_getTag.
  *
  * @param  instance		    Pointer to the Ketje instance structure.
  * @param  ciphertext          The (partial) ciphertext body.
  * @param  plaintext           The buffer where deciphered data will be stored.
  *                             This can be equal to the ciphertext buffer to save memory,
  *                             but otherwise the two buffers must not overlap.
  * @param  dataSizeInBytes     The size of the (partial) ciphertext body.
  *
  * @pre    ( phase == feedingAssociatedData ) or ( phase == unwrapping )
  *
  * @post   phase == unwrapping
  *
  * @return 0 if successful, 1 otherwise.
  */
int Keyak_UnwrapCiphertext(Keyak_Instance *instance, const unsigned char *ciphertext, unsigned char *plaintext, unsigned int dataSizeInBytes);

/**
  * Function that gets a tag of a requested size in bytes. The full tag must be retrieved
  * with a single call to getTag.
  *
  * @param  instance		    Pointer to the Ketje instance structure.
  * @param  tag                 The buffer where to store the tag.
  * @param  tagSizeInBytes      The length in bytes of the tag requested.
  *
  * @pre    ( phase == feedingAssociatedData) or ( phase == wrapping ) or ( phase == unwrapping )
  *
  * @post   phase == feedingAssociatedData
  *
  * @return 0 if successful, 1 otherwise.
  */
int Keyak_GetTag(Keyak_Instance *instance, unsigned char *tag, unsigned int tagSizeInBytes);

/**
  * Function that applies the forget operation on the Keyak object.
  *
  * @param  instance		    Pointer to the Ketje instance structure.
  *
  * @pre    ( phase == feedingAssociatedData) or ( phase == wrapping ) or ( phase == unwrapping )
  *
  * @post   phase == feedingAssociatedData
  *
  * @return 0 if successful, 1 otherwise.
  */
int Keyak_Forget(Keyak_Instance *instance);

#endif
