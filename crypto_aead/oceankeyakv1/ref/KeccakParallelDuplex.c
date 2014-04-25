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
#include "KeccakParallelDuplex.h"
#include "ParallelKeccakFs.h"

int Keccak_ParallelDuplexInitializeAll(Keccak_ParallelDuplexInstances *instances, unsigned int rate, unsigned int capacity)
{
    unsigned int i;

    if (rate+capacity != KeccakF_width)
        return 1;
    if ((rate <= 2) || (rate > KeccakF_width))
        return 1;
    KeccakF_ParallelInitialize();
    instances->rate = rate;
    KeccakF_ParallelStateInitializeAll(instances->states);
    for(i=0; i<NumberOfParallelInstances; i++) {
        instances->byteInputIndex[i] = 0;
        instances->byteOutputIndex[i] = (instances->rate+7)/8;
    }
    return 0;
}

int Keccak_ParallelDuplexingAll(Keccak_ParallelDuplexInstances *instances, unsigned char delimitedSigmaEnd)
{
    unsigned char delimitedSigmaEnd1[1];
    const unsigned int rho_max = instances->rate - 2;
    unsigned int i;

    if (delimitedSigmaEnd == 0)
        return 1;

    delimitedSigmaEnd1[0] = delimitedSigmaEnd;
    // Last few bits, whose delimiter coincides with first bit of padding
    for(i=0; i<NumberOfParallelInstances; i++)
        KeccakF_ParallelStateXORBytesInLane(instances->states, i, instances->byteInputIndex[i]/KeccakF_laneInBytes,
            delimitedSigmaEnd1, instances->byteInputIndex[i]%KeccakF_laneInBytes, 1);
    // Second bit of padding
    KeccakF_ParallelStateComplementBitAll(instances->states, instances->rate - 1);

    KeccakF_ParallelStatePermuteAll(instances->states);

    for(i=0; i<NumberOfParallelInstances; i++) {
        instances->byteInputIndex[i] = 0;
        instances->byteOutputIndex[i] = 0;
    }
    return 0;
}

int Keccak_ParallelDuplexing(Keccak_ParallelDuplexInstances *instances, unsigned int instanceIndex, unsigned char delimitedSigmaEnd)
{
    unsigned char delimitedSigmaEnd1[1];
    const unsigned int rho_max = instances->rate - 2;
    unsigned int i;

    if (instanceIndex >= NumberOfParallelInstances)
        return 1;
    if (delimitedSigmaEnd == 0)
        return 1;

    delimitedSigmaEnd1[0] = delimitedSigmaEnd;
    // Last few bits, whose delimiter coincides with first bit of padding
    KeccakF_ParallelStateXORBytesInLane(instances->states, instanceIndex,
        instances->byteInputIndex[instanceIndex]/KeccakF_laneInBytes,
        delimitedSigmaEnd1, instances->byteInputIndex[instanceIndex]%KeccakF_laneInBytes, 1);
    // Second bit of padding
    KeccakF_ParallelStateComplementBit(instances->states, instanceIndex, instances->rate - 1);

    KeccakF_ParallelStatePermute(instances->states, instanceIndex);

    instances->byteInputIndex[instanceIndex] = 0;
    instances->byteOutputIndex[instanceIndex] = 0;
    return 0;
}

#define processInput(i, Operation) \
    if ((instances->byteInputIndex[i] == 0) && (localSize >= KeccakF_laneInBytes)) { \
        Operation##Lanes(instances->states, i, in, localSize/KeccakF_laneInBytes); \
        localSize = (localSize/KeccakF_laneInBytes)*KeccakF_laneInBytes; \
        in += localSize; \
        instances->byteInputIndex[i] += localSize; \
        inByteLen -= localSize; \
    } \
    else { \
        unsigned int offsetInLane = instances->byteInputIndex[i] % KeccakF_laneInBytes; \
        unsigned int bytesInLane = KeccakF_laneInBytes - offsetInLane; \
        if (bytesInLane > localSize) \
            bytesInLane = localSize; \
        Operation##BytesInLane(instances->states, i, instances->byteInputIndex[i]/KeccakF_laneInBytes, in, offsetInLane, bytesInLane); \
        in += bytesInLane; \
        instances->byteInputIndex[i] += bytesInLane; \
        inByteLen -= bytesInLane; \
    }

int Keccak_ParallelDuplexingFeedPartialInterleavedInput(Keccak_ParallelDuplexInstances *instances, const unsigned char *in, unsigned int inByteLen)
{
    const unsigned int rho_max = instances->rate - 2;
    const unsigned int rho_maxInBytes = rho_max/8;
    unsigned int i;
    unsigned int totalInputIndex = 0;
    unsigned int localSize;

    for(i=0; i<NumberOfParallelInstances; i++)
        totalInputIndex += instances->byteInputIndex[i];
    if (totalInputIndex+inByteLen > rho_maxInBytes*NumberOfParallelInstances)
        return 1;

    if ((totalInputIndex == 0) && ((rho_maxInBytes % KeccakF_laneInBytes) == 0) && (inByteLen == rho_maxInBytes*NumberOfParallelInstances)) {
        KeccakF_ParallelStateXORLanesAll(instances->states, in, rho_maxInBytes/KeccakF_laneInBytes);
        for(i=0; i<NumberOfParallelInstances; i++)
            instances->byteInputIndex[i] = rho_maxInBytes;
        return 0;
    }

    i = 0;
    while((instances->byteInputIndex[i] == rho_maxInBytes) && (i < NumberOfParallelInstances))
        i++;
    while(inByteLen > 0) {
        if (i >= NumberOfParallelInstances)
            return 1;
        localSize = inByteLen;
        if (localSize > rho_maxInBytes)
            localSize = rho_maxInBytes;
        processInput(i, KeccakF_ParallelStateXOR);
        if (instances->byteInputIndex[i] == rho_maxInBytes)
            i++;
    }
    return 0;
}

int Keccak_ParallelDuplexingFeedPartialSingleInput(Keccak_ParallelDuplexInstances *instances, unsigned int instanceIndex, const unsigned char *in, unsigned int inByteLen)
{
    const unsigned int rho_max = instances->rate - 2;
    unsigned int localSize;

    if (instanceIndex >= NumberOfParallelInstances)
        return 1;
    if ((instances->byteInputIndex[instanceIndex]+inByteLen)*8 > rho_max)
        return 1;

    while(inByteLen > 0) {
        localSize = inByteLen;
        processInput(instanceIndex, KeccakF_ParallelStateXOR);
    }
    return 0;
}

int Keccak_ParallelDuplexingFeedZeroes(Keccak_ParallelDuplexInstances *instances, unsigned int instanceIndex, unsigned int inByteLen)
{
    const unsigned int rho_max = instances->rate - 2;

    if (instanceIndex >= NumberOfParallelInstances)
        return 1;
    if ((instances->byteInputIndex[instanceIndex]+inByteLen)*8 > rho_max)
        return 1;

    instances->byteInputIndex[instanceIndex] += inByteLen;
    return 0;
}

int Keccak_ParallelDuplexingOverwritePartialInterleavedInput(Keccak_ParallelDuplexInstances *instances, const unsigned char *in, unsigned int inByteLen)
{
    const unsigned int rho_max = instances->rate - 2;
    const unsigned int rho_maxInBytes = rho_max/8;
    unsigned int i;
    unsigned int totalInputIndex = 0;
    unsigned int localSize;

    for(i=0; i<NumberOfParallelInstances; i++)
        totalInputIndex += instances->byteInputIndex[i];
    if (totalInputIndex+inByteLen > rho_maxInBytes*NumberOfParallelInstances)
        return 1;

    if ((totalInputIndex == 0) && ((rho_maxInBytes % KeccakF_laneInBytes) == 0) && (inByteLen == rho_maxInBytes*NumberOfParallelInstances)) {
        KeccakF_ParallelStateOverwriteLanesAll(instances->states, in, rho_maxInBytes/KeccakF_laneInBytes);
        for(i=0; i<NumberOfParallelInstances; i++)
            instances->byteInputIndex[i] = rho_maxInBytes;
        return 0;
    }

    i = 0;
    while((instances->byteInputIndex[i] == rho_maxInBytes) && (i < NumberOfParallelInstances))
        i++;
    while(inByteLen > 0) {
        if (i >= NumberOfParallelInstances)
            return 1;
        localSize = inByteLen;
        if (localSize > rho_maxInBytes)
            localSize = rho_maxInBytes;
        processInput(i, KeccakF_ParallelStateOverwrite);
        if (instances->byteInputIndex[i] == rho_maxInBytes)
            i++;
    }
    return 0;
}

int Keccak_ParallelDuplexingOverwritePartialSingleInput(Keccak_ParallelDuplexInstances *instances,  unsigned int instanceIndex, const unsigned char *in, unsigned int inByteLen)
{
    const unsigned int rho_max = instances->rate - 2;
    unsigned int localSize;

    if (instanceIndex >= NumberOfParallelInstances)
        return 1;
    if ((instances->byteInputIndex[instanceIndex]+inByteLen)*8 > rho_max)
        return 1;

    while(inByteLen > 0) {
        localSize = inByteLen;
        processInput(instanceIndex, KeccakF_ParallelStateOverwrite);
    }
    return 0;
}

int Keccak_ParallelDuplexingOverwriteWithZeroes(Keccak_ParallelDuplexInstances *instances, unsigned int instanceIndex, unsigned int inByteLen)
{
    const unsigned int rho_max = instances->rate - 2;
    unsigned int i;

    if (instanceIndex >= NumberOfParallelInstances)
        return 1;
    if (instances->byteInputIndex[instanceIndex] != 0)
        return 1;
    if (inByteLen*8 > rho_max)
        return 1;

    KeccakF_ParallelStateOverwriteWithZeroes(instances->states, instanceIndex, inByteLen);
    instances->byteInputIndex[instanceIndex] += inByteLen;

    return 0;
}

#define processOutput(i, Operation) \
    if ((instances->byteOutputIndex[i] == 0) && (localSize >= KeccakF_laneInBytes)) { \
        Operation##Lanes(instances->states, i, out, localSize/KeccakF_laneInBytes); \
        localSize = (localSize/KeccakF_laneInBytes)*KeccakF_laneInBytes; \
        out += localSize; \
        instances->byteOutputIndex[i] += localSize; \
        outByteLen -= localSize; \
    } \
    else { \
        unsigned int offsetInLane = instances->byteOutputIndex[i] % KeccakF_laneInBytes; \
        unsigned int bytesInLane = KeccakF_laneInBytes - offsetInLane; \
        if (bytesInLane > localSize) \
            bytesInLane = localSize; \
        Operation##BytesInLane(instances->states, i, instances->byteOutputIndex[i]/KeccakF_laneInBytes, out, offsetInLane, bytesInLane); \
        out += bytesInLane; \
        instances->byteOutputIndex[i] += bytesInLane; \
        outByteLen -= bytesInLane; \
    }

int Keccak_ParallelDuplexingGetFurtherInterleavedOutput(Keccak_ParallelDuplexInstances *instances, unsigned char *out, unsigned int outByteLen)
{
    const unsigned int rho_max = instances->rate - 2;
    const unsigned int rho_maxInBytes = rho_max/8;
    unsigned int i;
    unsigned int totalOutputIndex = 0;
    unsigned int localSize;

    for(i=0; i<NumberOfParallelInstances; i++)
        totalOutputIndex += instances->byteOutputIndex[i];
    if (totalOutputIndex+outByteLen > rho_maxInBytes*NumberOfParallelInstances)
        return 1;

    if ((totalOutputIndex == 0) && ((rho_maxInBytes % KeccakF_laneInBytes) == 0) && (outByteLen == rho_maxInBytes*NumberOfParallelInstances)) {
        KeccakF_ParallelStateExtractLanesAll(instances->states, out, rho_maxInBytes/KeccakF_laneInBytes);
        for(i=0; i<NumberOfParallelInstances; i++)
            instances->byteOutputIndex[i] = rho_maxInBytes;
        return 0;
    }

    i = 0;
    while((instances->byteOutputIndex[i] == rho_maxInBytes) && (i < NumberOfParallelInstances))
        i++;
    while(outByteLen > 0) {
        if (i >= NumberOfParallelInstances)
            return 1;
        localSize = outByteLen;
        if (localSize > rho_maxInBytes)
            localSize = rho_maxInBytes;
        processOutput(i, KeccakF_ParallelStateExtract);
        if (instances->byteOutputIndex[i] == rho_maxInBytes)
            i++;
    }
    return 0;
}

int Keccak_ParallelDuplexingGetFurtherSingleOutput(Keccak_ParallelDuplexInstances *instances, unsigned int instanceIndex, unsigned char *out, unsigned int outByteLen)
{
    const unsigned int rho_max = instances->rate - 2;
    unsigned int localSize;

    if (instanceIndex >= NumberOfParallelInstances)
        return 1;
    if ((instances->byteOutputIndex[instanceIndex]+outByteLen)*8 > rho_max)
        return 1;

    while(outByteLen > 0) {
        localSize = outByteLen;
        processOutput(instanceIndex, KeccakF_ParallelStateExtract);
    }
    return 0;
}

int Keccak_ParallelDuplexingGetFurtherInterleavedOutputAndXOR(Keccak_ParallelDuplexInstances *instances, unsigned char *out, unsigned int outByteLen)
{
    const unsigned int rho_max = instances->rate - 2;
    const unsigned int rho_maxInBytes = rho_max/8;
    unsigned int i;
    unsigned int totalOutputIndex = 0;
    unsigned int localSize;

    for(i=0; i<NumberOfParallelInstances; i++)
        totalOutputIndex += instances->byteOutputIndex[i];
    if (totalOutputIndex+outByteLen > rho_maxInBytes*NumberOfParallelInstances)
        return 1;

    if ((totalOutputIndex == 0) && ((rho_maxInBytes % KeccakF_laneInBytes) == 0) && (outByteLen == rho_maxInBytes*NumberOfParallelInstances)) {
        KeccakF_ParallelStateExtractAndXORLanesAll(instances->states, out, rho_maxInBytes/KeccakF_laneInBytes);
        for(i=0; i<NumberOfParallelInstances; i++)
            instances->byteOutputIndex[i] = rho_maxInBytes;
        return 0;
    }

    i = 0;
    while((instances->byteOutputIndex[i] == rho_maxInBytes) && (i < NumberOfParallelInstances))
        i++;
    while(outByteLen > 0) {
        if (i >= NumberOfParallelInstances)
            return 1;
        localSize = outByteLen;
        if (localSize > rho_maxInBytes)
            localSize = rho_maxInBytes;
        processOutput(i, KeccakF_ParallelStateExtractAndXOR);
        if (instances->byteOutputIndex[i] == rho_maxInBytes)
            i++;
    }
    return 0;
}

int Keccak_ParallelDuplexingGetFurtherSingleOutputAndXOR(Keccak_ParallelDuplexInstances *instances, unsigned int instanceIndex, unsigned char *out, unsigned int outByteLen)
{
    const unsigned int rho_max = instances->rate - 2;
    unsigned int localSize;

    if (instanceIndex >= NumberOfParallelInstances)
        return 1;
    if ((instances->byteOutputIndex[instanceIndex]+outByteLen)*8 > rho_max)
        return 1;

    while(outByteLen > 0) {
        localSize = outByteLen;
        processOutput(instanceIndex, KeccakF_ParallelStateExtractAndXOR);
    }
    return 0;
}

unsigned int Keccak_ParallelDuplexGetTotalInputIndex(Keccak_ParallelDuplexInstances *instances)
{
    unsigned int totalInputIndex = 0;
    unsigned int i;

    for(i=0; i<NumberOfParallelInstances; i++)
        totalInputIndex += instances->byteInputIndex[i];
    return totalInputIndex;
}

unsigned int Keccak_ParallelDuplexGetInputIndex(Keccak_ParallelDuplexInstances *instances, unsigned int instanceIndex)
{
    if (instanceIndex >= NumberOfParallelInstances)
        return 0;
    else
        return instances->byteInputIndex[instanceIndex];
}

unsigned int Keccak_ParallelDuplexGetOutputIndex(Keccak_ParallelDuplexInstances *instances, unsigned int instanceIndex)
{
    if (instanceIndex >= NumberOfParallelInstances)
        return 0;
    else
        return instances->byteOutputIndex[instanceIndex];
}
