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

#include <stdio.h>
#include "displayIntermediateValues.h"
#include "KeccakF-interface.h"

FILE *intermediateValueFile = 0;
int displayLevel = 0;

void displaySetIntermediateValueFile(FILE *f)
{
    intermediateValueFile = f;
}

void displaySetLevel(int level)
{
    displayLevel = level;
}

void displayBytes(int level, const char *text, const unsigned char *bytes, unsigned int size)
{
    unsigned int i;

    if ((intermediateValueFile) && (level <= displayLevel)) {
        fprintf(intermediateValueFile, "%s:\n", text);
        for(i=0; i<size; i++)
            fprintf(intermediateValueFile, "%02X ", bytes[i]);
        fprintf(intermediateValueFile, "\n");
        fprintf(intermediateValueFile, "\n");
    }
}

void displayBits(int level, const char *text, const unsigned char *data, unsigned int size, int MSBfirst)
{
    unsigned int i, iByte, iBit;

    if ((intermediateValueFile) && (level <= displayLevel)) {
        fprintf(intermediateValueFile, "%s:\n", text);
        for(i=0; i<size; i++) {
            iByte = i/8;
            iBit = i%8;
            if (MSBfirst)
                fprintf(intermediateValueFile, "%d ", ((data[iByte] << iBit) & 0x80) != 0);
            else
                fprintf(intermediateValueFile, "%d ", ((data[iByte] >> iBit) & 0x01) != 0);
        }
        fprintf(intermediateValueFile, "\n");
        fprintf(intermediateValueFile, "\n");
    }
}

void displayStateAsBytes(int level, const char *text, const unsigned char *state)
{
    displayBytes(level, text, state, KeccakF_width/8);
}

void displayStateAs32bitWords(int level, const char *text, const unsigned int *state)
{
    unsigned int i;

    if ((intermediateValueFile) && (level <= displayLevel)) {
        fprintf(intermediateValueFile, "%s:\n", text);
        for(i=0; i<KeccakF_width/64; i++) {
            fprintf(intermediateValueFile, "%08X:%08X", (unsigned int)state[2*i+0], (unsigned int)state[2*i+1]);
            if ((i%5) == 4)
                fprintf(intermediateValueFile, "\n");
            else
                fprintf(intermediateValueFile, " ");
        }
    }
}

void displayStateAsLanes(int level, const char *text, void *statePointer)
{
    unsigned int i;
#if (KeccakF_width == 1600)
    unsigned long long int *state = statePointer;
#endif
#if (KeccakF_width == 800)
    unsigned int *state = statePointer;
#endif
#if (KeccakF_width == 400)
    unsigned short *state = statePointer;
#endif
#if (KeccakF_width == 200)
    unsigned char *state = statePointer;
#endif

    if ((intermediateValueFile) && (level <= displayLevel)) {
        fprintf(intermediateValueFile, "%s:\n", text);
#if (KeccakF_width == 1600)
        for(i=0; i<KeccakF_width/64; i++) {
            fprintf(intermediateValueFile, "%08X", (unsigned int)(state[i] >> 32));
            fprintf(intermediateValueFile, "%08X", (unsigned int)(state[i] & 0xFFFFFFFFULL));
            if ((i%5) == 4)
                fprintf(intermediateValueFile, "\n");
            else
                fprintf(intermediateValueFile, " ");
        }
#endif
#if (KeccakF_width == 800)
        for(i=0; i<KeccakF_width/32; i++) {
            fprintf(intermediateValueFile, "%08X", state[i]);
            if ((i%5) == 4)
                fprintf(intermediateValueFile, "\n");
            else
                fprintf(intermediateValueFile, " ");
        }
#endif
#if (KeccakF_width == 400)
        for(i=0; i<KeccakF_width/16; i++) {
            fprintf(intermediateValueFile, "%04X ", state[i]);
            if ((i%5) == 4)
                fprintf(intermediateValueFile, "\n");
        }
#endif
#if (KeccakF_width == 200)
        for(i=0; i<KeccakF_width/8; i++) {
            fprintf(intermediateValueFile, "%02X ", state[i]);
            if ((i%5) == 4)
                fprintf(intermediateValueFile, "\n");
        }
#endif
    }
}

void displayRoundNumber(int level, unsigned int i)
{
    if ((intermediateValueFile) && (level <= displayLevel)) {
        fprintf(intermediateValueFile, "\n");
        fprintf(intermediateValueFile, "--- Round %d ---\n", i);
        fprintf(intermediateValueFile, "\n");
    }
}

void displayText(int level, const char *text)
{
    if ((intermediateValueFile) && (level <= displayLevel)) {
        fprintf(intermediateValueFile, "%s", text);
        fprintf(intermediateValueFile, "\n");
        fprintf(intermediateValueFile, "\n");
    }
}
