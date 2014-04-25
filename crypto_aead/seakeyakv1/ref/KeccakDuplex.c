/*
The Keccak sponge function, designed by Guido Bertoni, Joan Daemen,
Michaël Peeters and Gilles Van Assche. For more information, feedback or
questions, please refer to our website: http://keccak.noekeon.org/

Implementation by the designers,
hereby denoted as "the implementer".

To the extent possible under law, the implementer has waived all copyright
and related or neighboring rights to the source code in this file.
http://creativecommons.org/publicdomain/zero/1.0/
*/

#include <string.h>
#include "KeccakDuplex.h"
#include "KeccakF-interface.h"
#ifdef KeccakReference
#include "displayIntermediateValues.h"
#endif

int Keccak_DuplexInitialize(Keccak_DuplexInstance *instance, unsigned int rate, unsigned int capacity)
{
    if (rate+capacity != KeccakF_width)
        return 1;
    if ((rate <= 2) || (rate > KeccakF_width))
        return 1;
    KeccakF_Initialize();
    instance->rate = rate;
    KeccakF_StateInitialize(instance->state);
    instance->byteInputIndex = 0;
    instance->byteOutputIndex = (instance->rate+7)/8;
    return 0;
}

int Keccak_Duplexing(Keccak_DuplexInstance *instance, const unsigned char *sigmaBegin, unsigned int sigmaBeginByteLen, unsigned char *Z, unsigned int ZByteLen, unsigned char delimitedSigmaEnd)
{
    unsigned char delimitedSigmaEnd1[1];
    const unsigned int rho_max = instance->rate - 2;
    
    if (delimitedSigmaEnd == 0)
        return 1;
    if ((instance->byteInputIndex+sigmaBeginByteLen)*8 > rho_max)
        return 1;
    if (rho_max - sigmaBeginByteLen*8 < 7) {
        unsigned int maxBitsInDelimitedSigmaEnd = rho_max - sigmaBeginByteLen*8;
        if (delimitedSigmaEnd >= (1 << (maxBitsInDelimitedSigmaEnd+1)))
            return 1;
    }
    if (ZByteLen > (instance->rate+7)/8)
        return 1; // The output length must not be greater than the rate (rounded up to a byte)

    delimitedSigmaEnd1[0] = delimitedSigmaEnd;
    // Last few bits, whose delimiter coincides with first bit of padding
    KeccakF_StateXORBytesInLane(instance->state, (instance->byteInputIndex+sigmaBeginByteLen)/KeccakF_laneInBytes,
        delimitedSigmaEnd1, (instance->byteInputIndex+sigmaBeginByteLen)%KeccakF_laneInBytes, 1);
    // Second bit of padding
    KeccakF_StateComplementBit(instance->state, instance->rate - 1);

    if (instance->byteInputIndex > 0) {
        int result = Keccak_DuplexingFeedPartialInput(instance, sigmaBegin, sigmaBeginByteLen);
        if (result != 0)
            return result;
        KeccakF_StatePermute(instance->state);
        KeccakF_StateExtractLanes(instance->state, Z, ZByteLen/KeccakF_laneInBytes);
    }
    else {
        if ((sigmaBeginByteLen%KeccakF_laneInBytes) > 0) {
            unsigned int offsetBeyondLane = (sigmaBeginByteLen/KeccakF_laneInBytes)*KeccakF_laneInBytes;
            unsigned int beyondLaneBytes = sigmaBeginByteLen%KeccakF_laneInBytes;
            KeccakF_StateXORBytesInLane(instance->state, sigmaBeginByteLen/KeccakF_laneInBytes,
                sigmaBegin+offsetBeyondLane, 0, beyondLaneBytes);
        }

        #ifdef KeccakReference
        {
            unsigned char block[KeccakF_width/8];
            memcpy(block, sigmaBegin, sigmaBeginByteLen);
            block[sigmaBeginByteLen] = delimitedSigmaEnd;
            memset(block+sigmaBeginByteLen+1, 0, ((instance->rate+63)/64)*8-sigmaBeginByteLen-1);
            block[(instance->rate-1)/8] |= 1 << ((instance->rate-1) % 8);
            displayBytes(1, "Block to be absorbed (after padding)", block, (instance->rate+7)/8);
        }
        #endif

        KeccakF_StateXORPermuteExtract(instance->state, sigmaBegin, sigmaBeginByteLen/KeccakF_laneInBytes,
            Z, ZByteLen/KeccakF_laneInBytes);
    }

    if ((ZByteLen%KeccakF_laneInBytes) > 0) {
        unsigned int offsetBeyondLane = (ZByteLen/KeccakF_laneInBytes)*KeccakF_laneInBytes;
        unsigned int beyondLaneBytes = ZByteLen%KeccakF_laneInBytes;
        KeccakF_StateExtractBytesInLane(instance->state, ZByteLen/KeccakF_laneInBytes,
            Z+offsetBeyondLane, 0, beyondLaneBytes);
    }
    if (ZByteLen*8 > instance->rate) {
        unsigned char mask = (1 << (instance->rate % 8)) - 1;
        Z[ZByteLen-1] &= mask;
    }

    instance->byteInputIndex = 0;
    instance->byteOutputIndex = ZByteLen;

    return 0;
}

int Keccak_DuplexingFeedPartialInput(Keccak_DuplexInstance *instance, const unsigned char *in, unsigned int inByteLen)
{
    const unsigned int rho_max = instance->rate - 2;

    if ((instance->byteInputIndex+inByteLen)*8 > rho_max)
        return 1;

    if ((instance->byteInputIndex == 0) && (inByteLen >= KeccakF_laneInBytes)) {
        KeccakF_StateXORLanes(instance->state, in, inByteLen/KeccakF_laneInBytes);
        in += (inByteLen/KeccakF_laneInBytes)*KeccakF_laneInBytes;
        instance->byteInputIndex += (inByteLen/KeccakF_laneInBytes)*KeccakF_laneInBytes;
        inByteLen -= (inByteLen/KeccakF_laneInBytes)*KeccakF_laneInBytes;
    }
    while(inByteLen > 0) {
        unsigned int offsetInLane = instance->byteInputIndex % KeccakF_laneInBytes;
        unsigned int bytesInLane = KeccakF_laneInBytes - offsetInLane;
        if (bytesInLane > inByteLen)
            bytesInLane = inByteLen;
        KeccakF_StateXORBytesInLane(instance->state, instance->byteInputIndex/KeccakF_laneInBytes, in, offsetInLane, bytesInLane);
        in += bytesInLane;
        instance->byteInputIndex += bytesInLane;
        inByteLen -= bytesInLane;
    }
    return 0;
}

int Keccak_DuplexingFeedZeroes(Keccak_DuplexInstance *instance, unsigned int inByteLen)
{
    const unsigned int rho_max = instance->rate - 2;

    if ((instance->byteInputIndex+inByteLen)*8 > rho_max)
        return 1;

    instance->byteInputIndex += inByteLen;
    return 0;
}

int Keccak_DuplexingOverwritePartialInput(Keccak_DuplexInstance *instance, const unsigned char *in, unsigned int inByteLen)
{
    const unsigned int rho_max = instance->rate - 2;

    if ((instance->byteInputIndex+inByteLen)*8 > rho_max)
        return 1;

    if ((instance->byteInputIndex == 0) && (inByteLen >= KeccakF_laneInBytes)) {
        KeccakF_StateOverwriteLanes(instance->state, in, inByteLen/KeccakF_laneInBytes);
        in += (inByteLen/KeccakF_laneInBytes)*KeccakF_laneInBytes;
        instance->byteInputIndex += (inByteLen/KeccakF_laneInBytes)*KeccakF_laneInBytes;
        inByteLen -= (inByteLen/KeccakF_laneInBytes)*KeccakF_laneInBytes;
    }
    while(inByteLen > 0) {
        unsigned int offsetInLane = instance->byteInputIndex % KeccakF_laneInBytes;
        unsigned int bytesInLane = KeccakF_laneInBytes - offsetInLane;
        if (bytesInLane > inByteLen)
            bytesInLane = inByteLen;
        KeccakF_StateOverwriteBytesInLane(instance->state, instance->byteInputIndex/KeccakF_laneInBytes, in, offsetInLane, bytesInLane);
        in += bytesInLane;
        instance->byteInputIndex += bytesInLane;
        inByteLen -= bytesInLane;
    }
    return 0;
}

int Keccak_DuplexingOverwriteWithZeroes(Keccak_DuplexInstance *instance, unsigned int inByteLen)
{
    const unsigned int rho_max = instance->rate - 2;

    if ((instance->byteInputIndex != 0) || (inByteLen*8 > rho_max))
        return 1;

    KeccakF_StateOverwriteWithZeroes(instance->state, inByteLen);
    instance->byteInputIndex = inByteLen;

    return 0;
}

int Keccak_DuplexingGetFurtherOutput(Keccak_DuplexInstance *instance, unsigned char *out, unsigned int outByteLen)
{
    if ((outByteLen+instance->byteOutputIndex) > (instance->rate+7)/8)
        return 1; // The output length must not be greater than the rate (rounded up to a byte)

    if ((instance->byteOutputIndex == 0) && (outByteLen >= KeccakF_laneInBytes)) {
        KeccakF_StateExtractLanes(instance->state, out, outByteLen/KeccakF_laneInBytes);
        out += (outByteLen/KeccakF_laneInBytes)*KeccakF_laneInBytes;
        instance->byteOutputIndex += (outByteLen/KeccakF_laneInBytes)*KeccakF_laneInBytes;
        outByteLen -= (outByteLen/KeccakF_laneInBytes)*KeccakF_laneInBytes;
    }
    while(outByteLen > 0) {
        unsigned int offsetInLane = instance->byteOutputIndex % KeccakF_laneInBytes;
        unsigned int bytesInLane = KeccakF_laneInBytes-offsetInLane;
        if (bytesInLane > outByteLen)
            bytesInLane = outByteLen;
        KeccakF_StateExtractBytesInLane(instance->state, instance->byteOutputIndex/KeccakF_laneInBytes, out, offsetInLane, bytesInLane);
        out += bytesInLane;
        instance->byteOutputIndex += bytesInLane;
        outByteLen -= bytesInLane;
    }
    if (instance->byteOutputIndex*8 > instance->rate) {
        unsigned char mask = (1 << (instance->rate % 8)) - 1;
        out[-1] &= mask;
    }
    return 0;
}

int Keccak_DuplexingGetFurtherOutputAndXOR(Keccak_DuplexInstance *instance, unsigned char *out, unsigned int outByteLen)
{
    if ((outByteLen+instance->byteOutputIndex) > (instance->rate+7)/8)
        return 1; // The output length must not be greater than the rate (rounded up to a byte)

    if ((instance->byteOutputIndex == 0) && (outByteLen >= KeccakF_laneInBytes)) {
        KeccakF_StateExtractAndXORLanes(instance->state, out, outByteLen/KeccakF_laneInBytes);
        out += (outByteLen/KeccakF_laneInBytes)*KeccakF_laneInBytes;
        instance->byteOutputIndex += (outByteLen/KeccakF_laneInBytes)*KeccakF_laneInBytes;
        outByteLen -= (outByteLen/KeccakF_laneInBytes)*KeccakF_laneInBytes;
    }
    while(outByteLen > 0) {
        unsigned int offsetInLane = instance->byteOutputIndex % KeccakF_laneInBytes;
        unsigned int bytesInLane = KeccakF_laneInBytes-offsetInLane;
        if (bytesInLane > outByteLen)
            bytesInLane = outByteLen;
        KeccakF_StateExtractAndXORBytesInLane(instance->state, instance->byteOutputIndex/KeccakF_laneInBytes, out, offsetInLane, bytesInLane);
        out += bytesInLane;
        instance->byteOutputIndex += bytesInLane;
        outByteLen -= bytesInLane;
    }
    if (instance->byteOutputIndex*8 > instance->rate) {
        unsigned char mask = (1 << (instance->rate % 8)) - 1;
        out[-1] &= mask;
    }
    return 0;
}

unsigned int Keccak_DuplexGetInputIndex(Keccak_DuplexInstance *instance)
{
    return instance->byteInputIndex;
}

unsigned int Keccak_DuplexGetOutputIndex(Keccak_DuplexInstance *instance)
{
    return instance->byteOutputIndex;
}
