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

#include <stdio.h>
#include <string.h>
#include "ParallelKeccakFs.h"

void accumulateBufferParallel(void *stateAccumulated, const unsigned char *buffer)
{
    KeccakF_ParallelStateXORLanesAll(stateAccumulated, buffer, 25);
    KeccakF_ParallelStatePermuteAll(stateAccumulated);
}

void accumulateStateParallel(void *stateAccumulated, const void *stateTest)
{
    unsigned char buffer[NumberOfParallelInstances*KeccakF_stateSizeInBytes];
    KeccakF_ParallelStateExtractLanesAll(stateTest, buffer, 25);
    accumulateBufferParallel(stateAccumulated, buffer);
}

void testParallelPermutationAndStateMgt()
{
    unsigned char stateAccumulated[NumberOfParallelInstances*KeccakF_stateSizeInBytes];
    unsigned char stateTest[NumberOfParallelInstances*KeccakF_stateSizeInBytes];

    KeccakF_ParallelInitialize();

    KeccakF_ParallelStateInitializeAll(stateAccumulated);

    memset(stateTest, 0xAA, sizeof(stateTest));

    // Testing KeccakF_ParallelStateInitializeAll()
    {
        KeccakF_ParallelStateInitializeAll(stateTest);
        accumulateStateParallel(stateAccumulated, stateTest);
    }
    KeccakF_ParallelStatePermuteAll(stateTest);

    // Testing KeccakF_ParallelStateXORBytesInLane()
    {
        unsigned char buffer[KeccakF_laneInBytes+8];
        unsigned i, lanePosition, offset, length, alignment, instanceIndex;

        for(instanceIndex=0; instanceIndex<NumberOfParallelInstances; instanceIndex++) {
            for(i=0; i<sizeof(buffer); i++)
                buffer[i] = 0xF3 + 5*i + 3*instanceIndex;

            for(lanePosition=0; lanePosition<25; lanePosition++)
            for(offset=0; offset<KeccakF_laneInBytes; offset++)
            for(length=(lanePosition == 1) ? 0 : (KeccakF_laneInBytes-offset); length<=KeccakF_laneInBytes-offset; length++) {
                alignment = (lanePosition+offset+length+instanceIndex+1)%8;
                KeccakF_ParallelStateXORBytesInLane(stateTest, instanceIndex, lanePosition, buffer+alignment, offset, length);
                accumulateStateParallel(stateAccumulated, stateTest);
            }
        }
    }
    KeccakF_ParallelStatePermuteAll(stateTest);

    // Testing KeccakF_ParallelStateXORLanes()
    {
        unsigned char buffer[KeccakF_width/8+8];
        unsigned i, laneCount, alignment, instanceIndex;
        
        for(instanceIndex=0; instanceIndex<NumberOfParallelInstances; instanceIndex++)
        for(laneCount=0; laneCount<=25; laneCount++) {
            alignment = (laneCount+instanceIndex+2)%8;
            for(i=0; i<KeccakF_width/8; i++)
                buffer[i+alignment] = 0x74 - 3*i + 8*alignment + 17*instanceIndex;
            KeccakF_ParallelStateXORLanes(stateTest, instanceIndex, buffer+alignment, laneCount);
            accumulateStateParallel(stateAccumulated, stateTest);
        }
    }
    KeccakF_ParallelStatePermuteAll(stateTest);

    // Testing KeccakF_ParallelStateXORLanesAll()
    {
        unsigned char buffer[NumberOfParallelInstances*KeccakF_width/8+8];
        unsigned i, laneCount, alignment;

        for(laneCount=0; laneCount<=25; laneCount++) {
            alignment = (laneCount+2)%8;
            for(i=0; i<NumberOfParallelInstances*KeccakF_width/8; i++)
                buffer[i+alignment] = 0x75 + 3*i - 8*alignment;
            KeccakF_ParallelStateXORLanesAll(stateTest, buffer+alignment, laneCount);
            accumulateStateParallel(stateAccumulated, stateTest);
        }
    }
    KeccakF_ParallelStatePermuteAll(stateTest);

    // Testing KeccakF_ParallelStateOverwriteBytesInLane()
    {
        unsigned char buffer[KeccakF_laneInBytes+8];
        unsigned i, lanePosition, offset, length, alignment, instanceIndex;
        
        for(instanceIndex=0; instanceIndex<NumberOfParallelInstances; instanceIndex++)
        for(lanePosition=0; lanePosition<25; lanePosition++)
        for(offset=0; offset<KeccakF_laneInBytes; offset++)
        for(length=(lanePosition == 2) ? 0 : (KeccakF_laneInBytes-offset); length<=KeccakF_laneInBytes-offset; length++) {
            alignment = (lanePosition+offset+length+instanceIndex+3)%8;
            for(i=0; i<sizeof(buffer); i++)
                buffer[i] = 0xF3 + 5*i + alignment + lanePosition + offset + length + instanceIndex;
            KeccakF_ParallelStateOverwriteBytesInLane(stateTest, instanceIndex, lanePosition, buffer+alignment, offset, length);
            accumulateStateParallel(stateAccumulated, stateTest);
        }
    }
    KeccakF_ParallelStatePermuteAll(stateTest);

    // Testing KeccakF_ParallelStateOverwriteLanes()
    {
        unsigned char buffer[KeccakF_width/8+8];
        unsigned i, laneCount, alignment, instanceIndex;
        
        for(instanceIndex=0; instanceIndex<NumberOfParallelInstances; instanceIndex++)
        for(laneCount=0; laneCount<=25; laneCount++) {
            alignment = (laneCount+instanceIndex+4)%8;
            for(i=0; i<KeccakF_width/8; i++)
                buffer[i+alignment] = 0x74 - 3*i + 8*alignment + laneCount + instanceIndex;
            KeccakF_ParallelStateOverwriteLanes(stateTest, instanceIndex, buffer+alignment, laneCount);
            accumulateStateParallel(stateAccumulated, stateTest);
        }
    }
    KeccakF_ParallelStatePermuteAll(stateTest);

    // Testing KeccakF_ParallelStateOverwriteLanesAll()
    {
        unsigned char buffer[NumberOfParallelInstances*KeccakF_width/8+8];
        unsigned i, laneCount, alignment;

        for(laneCount=0; laneCount<=25; laneCount++) {
            alignment = (laneCount+4)%8;
            for(i=0; i<NumberOfParallelInstances*KeccakF_width/8; i++)
                buffer[i+alignment] = 0x75 + 3*i - 8*alignment - laneCount;
            KeccakF_ParallelStateOverwriteLanesAll(stateTest, buffer+alignment, laneCount);
            accumulateStateParallel(stateAccumulated, stateTest);
        }
    }
    KeccakF_ParallelStatePermuteAll(stateTest);

    // Testing KeccakF_ParallelStateOverwriteWithZeroes()
    {
        unsigned byteCount, instanceIndex;
        
        for(instanceIndex=0; instanceIndex<NumberOfParallelInstances; instanceIndex++)
        for(byteCount=0; byteCount<=KeccakF_width/8; byteCount++) {
            KeccakF_ParallelStatePermuteAll(stateTest);
            KeccakF_ParallelStateOverwriteWithZeroes(stateTest, instanceIndex, byteCount);
            accumulateStateParallel(stateAccumulated, stateTest);
        }
    }
    KeccakF_ParallelStatePermuteAll(stateTest);

    // Testing KeccakF_ParallelStateComplementBit()
    {
        unsigned bitPosition, instanceIndex;

        for(instanceIndex=0; instanceIndex<NumberOfParallelInstances; instanceIndex++)
        for(bitPosition=0; bitPosition<KeccakF_width; bitPosition += (bitPosition < 128) ? (3+instanceIndex) : (47+instanceIndex)) {
            KeccakF_ParallelStateComplementBit(stateTest, instanceIndex, bitPosition);
            accumulateStateParallel(stateAccumulated, stateTest);
        }
    }
    KeccakF_ParallelStatePermuteAll(stateTest);

    // Testing KeccakF_ParallelStateComplementBitAll()
    {
        unsigned bitPosition;

        for(bitPosition=0; bitPosition<KeccakF_width; bitPosition += (bitPosition < 128) ? 1 : 19) {
            KeccakF_ParallelStateComplementBitAll(stateTest, bitPosition);
            accumulateStateParallel(stateAccumulated, stateTest);
        }
    }
    KeccakF_ParallelStatePermuteAll(stateTest);

    // Testing KeccakF_ParallelStateExtractBytesInLane()
    {
        unsigned char buffer[NumberOfParallelInstances*KeccakF_width/8+8];
        unsigned lanePosition, offset, length, alignment, instanceIndex;

        for(instanceIndex=0; instanceIndex<NumberOfParallelInstances; instanceIndex++)
        for(lanePosition=0; lanePosition<25; lanePosition++)
        for(offset=0; offset<KeccakF_laneInBytes; offset++)
        for(length=(lanePosition == 3) ? 0 : (KeccakF_laneInBytes-offset); length<=KeccakF_laneInBytes-offset; length++) {
            alignment = (lanePosition+offset+length+instanceIndex+5)%8;
            memset(buffer, 0x3C+lanePosition+offset+length+instanceIndex, sizeof(buffer));
            KeccakF_ParallelStateExtractBytesInLane(stateTest, instanceIndex, lanePosition, buffer+alignment, offset, length);
            accumulateBufferParallel(stateAccumulated, buffer+alignment);
        }
    }
    KeccakF_ParallelStatePermuteAll(stateTest);

    // Testing KeccakF_ParallelStateExtractLanes()
    {
        unsigned char buffer[NumberOfParallelInstances*KeccakF_width/8+8];
        unsigned laneCount, alignment, instanceIndex;
        
        for(instanceIndex=0; instanceIndex<NumberOfParallelInstances; instanceIndex++)
        for(laneCount=0; laneCount<=25; laneCount++) {
            alignment = (laneCount+instanceIndex+6)%8;
            memset(buffer, 0xD1+laneCount+32*alignment+4*instanceIndex, sizeof(buffer));
            KeccakF_ParallelStateExtractLanes(stateTest, instanceIndex, buffer+alignment, laneCount);
            accumulateBufferParallel(stateAccumulated, buffer+alignment);
        }
    }
    KeccakF_ParallelStatePermuteAll(stateTest);

    // Testing KeccakF_ParallelStateExtractLanesAll()
    {
        unsigned char buffer[NumberOfParallelInstances*KeccakF_width/8+8];
        unsigned laneCount, alignment;

        for(laneCount=0; laneCount<=25; laneCount++) {
            alignment = (laneCount+6)%8;
            memset(buffer, 0xD2-laneCount-32*alignment, sizeof(buffer));
            KeccakF_ParallelStateExtractLanesAll(stateTest, buffer+alignment, laneCount);
            accumulateBufferParallel(stateAccumulated, buffer+alignment);
        }
    }
    KeccakF_ParallelStatePermuteAll(stateTest);

    // Testing KeccakF_ParallelStateExtractAndXORBytesInLane()
    {
        unsigned char buffer[NumberOfParallelInstances*KeccakF_width/8+8];
        unsigned lanePosition, offset, length, alignment, instanceIndex;

        for(instanceIndex=0; instanceIndex<NumberOfParallelInstances; instanceIndex++)
        for(lanePosition=0; lanePosition<25; lanePosition++)
        for(offset=0; offset<KeccakF_laneInBytes; offset++)
        for(length=(lanePosition == 4) ? 0 : (KeccakF_laneInBytes-offset); length<=KeccakF_laneInBytes-offset; length++) {
            alignment = (lanePosition+offset+length+instanceIndex+7)%8;
            memset(buffer, 0x3C+lanePosition+offset+length+instanceIndex, sizeof(buffer));
            KeccakF_ParallelStateExtractAndXORBytesInLane(stateTest, instanceIndex, lanePosition, buffer+alignment, offset, length);
            accumulateBufferParallel(stateAccumulated, buffer+alignment);
        }
    }
    KeccakF_ParallelStatePermuteAll(stateTest);

    // Testing KeccakF_ParallelStateExtractAndXORLanes()
    {
        unsigned char buffer[NumberOfParallelInstances*KeccakF_width/8+8];
        unsigned laneCount, alignment, instanceIndex;
        
        for(instanceIndex=0; instanceIndex<NumberOfParallelInstances; instanceIndex++)
        for(laneCount=0; laneCount<=25; laneCount++) {
            alignment = (laneCount+instanceIndex+1)%8;
            memset(buffer, 0xD1+laneCount+32*alignment+instanceIndex, sizeof(buffer));
            KeccakF_ParallelStateExtractAndXORLanes(stateTest, instanceIndex, buffer+alignment, laneCount);
            accumulateBufferParallel(stateAccumulated, buffer+alignment);
        }
    }
    KeccakF_ParallelStatePermuteAll(stateTest);

    // Testing KeccakF_ParallelStateExtractAndXORLanesAll()
    {
        unsigned char buffer[NumberOfParallelInstances*KeccakF_width/8+8];
        unsigned laneCount, alignment;

        for(laneCount=0; laneCount<=25; laneCount++) {
            alignment = (laneCount+1)%8;
            memset(buffer, 0xD2-laneCount-32*alignment, sizeof(buffer));
            KeccakF_ParallelStateExtractAndXORLanesAll(stateTest, buffer+alignment, laneCount);
            accumulateBufferParallel(stateAccumulated, buffer+alignment);
        }
    }
    KeccakF_ParallelStatePermuteAll(stateTest);

    // Outputting the result
    {
        unsigned char buffer[NumberOfParallelInstances*KeccakF_width/8];
        unsigned int i;
        FILE *f;
        char fileName[100];
    
        KeccakF_ParallelStateExtractLanesAll(stateAccumulated, buffer, 25);
#ifdef Keyak
        sprintf(fileName, "TestParallel%dKeccakP-%d-12AndStateMgt.txt", NumberOfParallelInstances, KeccakF_width);
#else
        sprintf(fileName, "TestParallel%dKeccakF-%dAndStateMgt.txt", NumberOfParallelInstances, KeccakF_width);
#endif
        f = fopen(fileName, "w");
#ifdef Keyak
        fprintf(f, "Testing %d-way parallel Keccak-p[%d, nr=12] permutation and state management: ", NumberOfParallelInstances, KeccakF_width);
#else
        fprintf(f, "Testing %d-way parallel Keccak-f[%d] permutation and state management: ", NumberOfParallelInstances, KeccakF_width);
#endif
        for(i=0; i<NumberOfParallelInstances*KeccakF_width/8; i++)
            fprintf(f, "%02x ", buffer[i]);
        fprintf(f, "\n");
        fclose(f);
    }
}
