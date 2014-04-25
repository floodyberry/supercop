/*
The Keccak sponge function, designed by Guido Bertoni, Joan Daemen,
Michaël Peeters and Gilles Van Assche. For more information, feedback or
questions, please refer to our website: http://keccak.noekeon.org/

Implementation by the designers and Ronny Van Keer,
hereby denoted as "the implementer".

To the extent possible under law, the implementer has waived all copyright
and related or neighboring rights to the source code in this file.
http://creativecommons.org/publicdomain/zero/1.0/
*/

#include "ParallelKeccakFs.h"

#include "KeccakF-interface.h"

#define stateWithIndex(i) ((unsigned char *)states+(i*KeccakF_stateSizeInBytes))

void KeccakF_ParallelInitialize( void )
{
    KeccakF_Initialize();
}

void KeccakF_ParallelStateInitializeAll(void *states)
{
    unsigned int i;

    for(i=0; i<NumberOfParallelInstances; i++)
        KeccakF_StateInitialize(stateWithIndex(i));
}

void KeccakF_ParallelStateXORBytesInLane(void *states, unsigned int instanceIndex, unsigned int lanePosition, const unsigned char *data, unsigned int offset, unsigned int length)
{
    KeccakF_StateXORBytesInLane(stateWithIndex(instanceIndex), lanePosition, data, offset, length);
}

void KeccakF_ParallelStateXORLanes(void *states, unsigned int instanceIndex, const unsigned char *data, unsigned int laneCount)
{
    KeccakF_StateXORLanes(stateWithIndex(instanceIndex), data, laneCount);
}

void KeccakF_ParallelStateXORLanesAll(void *states, const unsigned char *data, unsigned int laneCount)
{
    unsigned int i;

    for(i=0; i<NumberOfParallelInstances; i++) {
        KeccakF_StateXORLanes(stateWithIndex(i), data, laneCount);
        data += laneCount*KeccakF_laneInBytes;
    }
}

void KeccakF_ParallelStateOverwriteBytesInLane(void *states, unsigned int instanceIndex, unsigned int lanePosition, const unsigned char *data, unsigned int offset, unsigned int length)
{
    KeccakF_StateOverwriteBytesInLane(stateWithIndex(instanceIndex), lanePosition, data, offset, length);
}

void KeccakF_ParallelStateOverwriteLanes(void *states, unsigned int instanceIndex, const unsigned char *data, unsigned int laneCount)
{
    KeccakF_StateOverwriteLanes(stateWithIndex(instanceIndex), data, laneCount);
}

void KeccakF_ParallelStateOverwriteLanesAll(void *states, const unsigned char *data, unsigned int laneCount)
{
    unsigned int i;

    for(i=0; i<NumberOfParallelInstances; i++) {
        KeccakF_StateOverwriteLanes(stateWithIndex(i), data, laneCount);
        data += laneCount*KeccakF_laneInBytes;
    }
}

void KeccakF_ParallelStateOverwriteWithZeroes(void *states, unsigned int instanceIndex, unsigned int byteCount)
{
    KeccakF_StateOverwriteWithZeroes(stateWithIndex(instanceIndex), byteCount);
}

void KeccakF_ParallelStateComplementBit(void *states, unsigned int instanceIndex, unsigned int position)
{
    KeccakF_StateComplementBit(stateWithIndex(instanceIndex), position);
}

void KeccakF_ParallelStateComplementBitAll(void *states, unsigned int position)
{
    unsigned int i;

    for(i=0; i<NumberOfParallelInstances; i++)
        KeccakF_StateComplementBit(stateWithIndex(i), position);
}

void KeccakF_ParallelStatePermute(void *states, unsigned int instanceIndex)
{
    KeccakF_StatePermute(stateWithIndex(instanceIndex));
}

void KeccakF_ParallelStatePermuteAll(void *states)
{
    unsigned int i;

    for(i=0; i<NumberOfParallelInstances; i++)
        KeccakF_StatePermute(stateWithIndex(i));
}

void KeccakF_ParallelStateExtractBytesInLane(const void *states, unsigned int instanceIndex, unsigned int lanePosition, unsigned char *data, unsigned int offset, unsigned int length)
{
    KeccakF_StateExtractBytesInLane(stateWithIndex(instanceIndex), lanePosition, data, offset, length);
}

void KeccakF_ParallelStateExtractLanes(const void *states, unsigned int instanceIndex, unsigned char *data, unsigned int laneCount)
{
    KeccakF_StateExtractLanes(stateWithIndex(instanceIndex), data, laneCount);
}

void KeccakF_ParallelStateExtractLanesAll(const void *states, unsigned char *data, unsigned int laneCount)
{
    unsigned int i;

    for(i=0; i<NumberOfParallelInstances; i++) {
        KeccakF_StateExtractLanes(stateWithIndex(i), data, laneCount);
        data += laneCount*KeccakF_laneInBytes;
    }
}

void KeccakF_ParallelStateExtractAndXORBytesInLane(const void *states, unsigned int instanceIndex, unsigned int lanePosition, unsigned char *data, unsigned int offset, unsigned int length)
{
    KeccakF_StateExtractAndXORBytesInLane(stateWithIndex(instanceIndex), lanePosition, data, offset, length);
}

void KeccakF_ParallelStateExtractAndXORLanes(const void *states, unsigned int instanceIndex, unsigned char *data, unsigned int laneCount)
{
    KeccakF_StateExtractAndXORLanes(stateWithIndex(instanceIndex), data, laneCount);
}

void KeccakF_ParallelStateExtractAndXORLanesAll(const void *states, unsigned char *data, unsigned int laneCount)
{
    unsigned int i;

    for(i=0; i<NumberOfParallelInstances; i++) {
        KeccakF_StateExtractAndXORLanes(stateWithIndex(i), data, laneCount);
        data += laneCount*KeccakF_laneInBytes;
    }
}
