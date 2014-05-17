/*
 * jhae.h
 *
 * This file contains definitions of JHAE related functions
 * used in Artemia-256.
 */

#ifndef JHAE_H
#define JHAE_H

#define BLOCK_BIT_SIZE 256
#define BLOCK_BYTE_SIZE 32

/**
 * @brief encrypts and authenticates
 * @param c resulted ciphertext will store in this parameter. Required memory should be alocated before calling the function.
 * @param clen length of resulted ciphertext will be stored in this variable.
 * @param t resulted tag will store in this. Required memory should be alocated before calling the function.
 * @param key key value.
 * @param noc nonce value.
 * @param msg message value.
 * @param msglen length of message in bytes.
 * @param ad associated data value.
 * @param adlen length of associated data in bytes. This parameter should be zero if there is no AD.
 * @return 0 if sucess and a negaitve value if fail.
 */
int jhae_encryption_authentication(unsigned char *c, unsigned long long *clen,
                                   unsigned char *t,
                                   const unsigned char *key,
                                   const unsigned char *noc,
                                   const unsigned char *msg, unsigned long long msglen,
                                   const unsigned char *ad, unsigned long long adlen);

/**
 * @brief decrypts and verifies
 * @param msg resulted message will store in this parameter. Required memory should be alocated before calling the function.
 * @param msglen length of resulted message will be stored in this variable. Value will not consider padded bytes.
 * @param key key value.
 * @param noc nonce value.
 * @param cpt ciphertext value.
 * @param cptlen length of ciphertext value in bytes.
 * @param ad associated data value.
 * @param adlen length of associated data in bytes. This parameter should be zero if there is no AD.
 * @return 0 if success, -1 if fail (authentication fail) and other negative values if fial by another reason.
 */
int jhae_decryption_verification(unsigned char *msg, unsigned long long *msglen,
                                 const unsigned char *key,
                                 const unsigned char *noc,
                                 const unsigned char *cpt, unsigned long long cptlen,
                                 const unsigned char *ad, unsigned long long adlen,
                                 const unsigned char *t);

/**
 * @brief Artemia permutation 512 that use in Artemia-256
 *
 * This function executes Artemia permutation 512 that use in Artemia-256.
 * The function gets X (512 bit) as input and generates permuted input in Y (512 bit).
 * Note that the function does not change the X. Required memory for Y should be allocated
 * before calling the function.
 *
 * @param X 512-bit input that its first half contains xprim and its second half contains x
 * @param Y 512-bit output that its first half contains yprim and its second half contains y
 */
void artemia_permutation(unsigned char *X,
                         unsigned char *Y);


/**
 * @brief appends specific sequence to the message block.
 * @param block data block that should be padded.
 * @param length length of block in bytes.
 * @param mlen length of message in bytes.
 * @param nonce value of nonce in little endian format.
 * @param ad value of associated data in little endian format.
 * @param adlen length of associated data in bytes.
 * @param paddedLen total length of data after padding in bytes.
 * @return resulted padded data. Required memory will be alocated in the function.
 */
unsigned char* padding_message(const unsigned char *block, int length,
                               unsigned long long mlen,
                               const unsigned char *nonce,
                               const unsigned char* ad, unsigned long long adlen,
                               int *paddedLen);

/**
 * @brief appends specific sequence to the associated data block.
 * @param adBlock associated data block that should be padded.
 * @param length length of block in bytes.
 * @param paddedLen total length of data after padding in bytes.
 * @return resulted padded data. Required memory will alocated in function.
 */
unsigned char* padding_associated_data(const unsigned char *adBlock,
                                       int length,
                                       int *paddedLen);

/**
 * @brief Removes padded sequences from message
 *
 * This function unpads message and returns unpadded message.
 * Note that message remains unchanged. Memory of returned unpadded message
 * is seprated from original message.
 *
 * @param message value of padded message
 * @param msglen length of padded message in bytes
 * @param unpaddedLen total length of unpadded message after padding in bytes.
 * @return resulted unpadded data.
 */
unsigned char* unpadding_message(unsigned char* message,
                                 unsigned long long msglen,
                                 unsigned long long *unpaddedLen);

/**
 * @brief Removes padded sequences from message
 *
 * This function unpads message and returns real length of message.
 * Note that this function will change message and will not get seperate memory.
 *
 * @param message value of padded message that should be unpadded.
 * @param msglen length of padded message in bytes
 * @return total length of unpadded message after padding in bytes.
 */
unsigned long long unpadding_message_inplace(unsigned char* message,
                                             unsigned long long msglen);

#endif // JHAE_H
