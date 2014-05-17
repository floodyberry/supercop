#include "jhae.h"
#include <stdio.h>
#include <stdlib.h>

unsigned char* padding_message(const unsigned char *block,
                               int length,
                               unsigned long long mlen,
                               const unsigned char *nonce,
                               const unsigned char *ad,
                               unsigned long long adlen,
                               int *paddedLen)
{
    int i;
    int len = length * 8 + 97; //In Artemia-128, 97 bit should be append to message
    if(len % BLOCK_BIT_SIZE != 0)
        len += BLOCK_BIT_SIZE - (len % BLOCK_BIT_SIZE);

    unsigned char* padded = (unsigned char*)calloc(len / 8, sizeof(unsigned char));
    if(padded == 0x0){
        *paddedLen = -1;
        return NULL; // Could not allocate required memory
    }

    // compute length of nonce
    int nonceLen;
    if(nonce == NULL){
        nonceLen = 0;
    }else{
        nonceLen = BLOCK_BYTE_SIZE * 8;
        for(i=BLOCK_BYTE_SIZE*8-1 ; i>=0 ; i--){
            if((nonce[i/8] & (0x1 << (i%8))) != 0)
                break;
            nonceLen--;
        }
        if(nonceLen == 0)
            nonceLen = 1; //  If data of nonce was zero then length of it will be one.
    }
    // compute length of assiciated data
    int associatedDataLen;
    if(ad == NULL){
        associatedDataLen = 0;
    }else{
        associatedDataLen = adlen * 8;
        for(i=adlen*8-1 ; i>=0 ; i--){
            if((ad[i/8] & (0x1 << (i%8))) != 0)
                break;
            associatedDataLen--;
        }
        if(associatedDataLen == 0)
            associatedDataLen = 1; // If associated data was entirly zero then length will be one
    }
    // compute length of message
    unsigned long messageLen;
    if(block == NULL)
        messageLen = 0;
    else
        messageLen = mlen * 8;

    // Order of filling padded message
    static const int order[32] =
    {
        15, 14, 13, 12, 11, 10,  9,  8,  7,  6,  5,  4,  3,  2,  1,  0,
        31, 30, 29, 28, 27, 26, 25, 24, 23, 22, 21, 20, 19, 18, 17, 16
    };

    // First: original data
    for(i=0 ; i<length ; i++)
        padded[order[i]] = block[length-1 - i];

    // Padding 8 bit of value of the nonce length
    padded[order[i++]] = nonceLen & 0xFF; // most significat eight bits

    // Padding 24 bit of value of length of assiciated data
    padded[order[i++]] = (unsigned char)((associatedDataLen >> 16) & 0xFF);
    padded[order[i++]] = (unsigned char)((associatedDataLen >> 8) & 0xFF);
    padded[order[i++]] = (unsigned char)(associatedDataLen & 0xFF);

    // Padding 64 bit of value of the message length
    padded[order[i++]] = (unsigned char)((messageLen >> 56) & 0xFF);
    padded[order[i++]] = (unsigned char)((messageLen >> 48) & 0xFF);
    padded[order[i++]] = (unsigned char)((messageLen >> 40) & 0xFF);
    padded[order[i++]] = (unsigned char)((messageLen >> 32) & 0xFF);
    padded[order[i++]] = (unsigned char)((messageLen >> 24) & 0xFF);
    padded[order[i++]] = (unsigned char)((messageLen >> 16) & 0xFF);
    padded[order[i++]] = (unsigned char)((messageLen >> 8) & 0xFF);
    padded[order[i++]] = (unsigned char)(messageLen & 0xFF);

    // Padding a bit '1' and a sequence of '0'
    padded[order[i++]] |= 0x80; // a bit '1' and a sequence of '0'

    *paddedLen = len / 8;
    return padded;
}

unsigned char* padding_associated_data(const unsigned char *adBlock,
                                       int length,
                                       int *paddedLen)
{

    int i;
    int len = length * 8 + 1; //In the Artemia, one bit (with value '1') should be append to associated data
    if(len % BLOCK_BIT_SIZE != 0)
        len += BLOCK_BIT_SIZE - (len % BLOCK_BIT_SIZE);

    unsigned char* padded = (unsigned char*)calloc(len / 8, sizeof(unsigned char));
    if(padded == 0x0){
        *paddedLen = -1;
        return NULL; // Could not allocate required memory
    }

    int lack;
    lack = len/8 - length;
    for(i=0 ; i<length ; i++)
        padded[lack + i] = adBlock[i]; // original data
    // Padding one bit '1'
    padded[lack-1] = 0x80;

    *paddedLen = len / 8;
    return padded;
}

unsigned char* unpadding_message(unsigned char* message,
                                 unsigned long long msglen,
                                 unsigned long long* unpaddedLen)
{
    /*
     * In Artemia-128, 97 bit is appended to message and a sequence of 0s is appended
     * in orther to complete blocks. To unpad message, all zero byte in the end of message
     * and 13 byte before zero bytes will be removed. It is because of that added 97 bits
     * fill 13 bytes.
     */
    int i;
    unsigned long extraBytesCount = 0;
    // Check last block to count zero bytes
    unsigned char* lastBlock = message + msglen - BLOCK_BYTE_SIZE;
    for(i=0 ; i<BLOCK_BYTE_SIZE ; i++){
        if(lastBlock[i] != 0)
            break;
        extraBytesCount++; // Count zero bytes that was padded to message
    }
    extraBytesCount += 13; // Count padded bytes
    unsigned long long originLen = msglen - extraBytesCount;

    unsigned char* unpaddedMessage = (unsigned char*) malloc(originLen * sizeof(unsigned char));
    if(unpaddedMessage == NULL){
        *unpaddedLen = -1;
        return NULL;
    }
    int remain = originLen % BLOCK_BYTE_SIZE;
    int extra = BLOCK_BYTE_SIZE - remain;
    // Copy original data exept last block of it
    for(i=0 ; i<originLen - remain ; i++)
        unpaddedMessage[i] = message[i];
    // Last block should be copied from the left side of block
    for( ; i<originLen ; i++)
        unpaddedMessage[i] = message[i + extra];

    *unpaddedLen = originLen;
    return unpaddedMessage;
}

unsigned long long unpadding_message_inplace(unsigned char* message,
                                             unsigned long long msglen)
{
    /*
     * In Artemia-128, 97 bit is appended to message and a sequence of 0s is appended
     * in orther to complete blocks. To unpad message, all zero byte in the end of message
     * and 13 byte before zero bytes will be removed. It is because of that added 97 bits
     * fill 13 bytes.
     */
    int i;
    unsigned long extraBytesCount = 0;
    // Check last block to count zero bytes
    unsigned char* lastBlock = message + msglen - BLOCK_BYTE_SIZE;
    for(i=0 ; i<BLOCK_BYTE_SIZE ; i++){
        if(lastBlock[i] != 0)
            break;
        extraBytesCount++; // Count zero bytes that was padded to message
    }
    extraBytesCount += 13; // Count padded bytes
    unsigned long long originLen = msglen - extraBytesCount;

    int remain = originLen % BLOCK_BYTE_SIZE;
    int extra = BLOCK_BYTE_SIZE - remain;
    // Shift original data of last block in order to remove padded data
    for(i = originLen - remain ; i<originLen ; i++)
        message[i] = message[i + extra];
    // Clear other data
    for( ; i<msglen ; i++)
        message[i] = 0;

    return originLen;
}
