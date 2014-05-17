#include "jhae.h"
#include <string.h>

// AES SBOX
const unsigned char AES_SBOX[] = {
    0x63, 0x7c, 0x77, 0x7b, 0xf2, 0x6b, 0x6f, 0xc5, 0x30, 0x01, 0x67, 0x2b, 0xfe, 0xd7, 0xab, 0x76,
    0xca, 0x82, 0xc9, 0x7d, 0xfa, 0x59, 0x47, 0xf0, 0xad, 0xd4, 0xa2, 0xaf, 0x9c, 0xa4, 0x72, 0xc0,
    0xb7, 0xfd, 0x93, 0x26, 0x36, 0x3f, 0xf7, 0xcc, 0x34, 0xa5, 0xe5, 0xf1, 0x71, 0xd8, 0x31, 0x15,
    0x04, 0xc7, 0x23, 0xc3, 0x18, 0x96, 0x05, 0x9a, 0x07, 0x12, 0x80, 0xe2, 0xeb, 0x27, 0xb2, 0x75,
    0x09, 0x83, 0x2c, 0x1a, 0x1b, 0x6e, 0x5a, 0xa0, 0x52, 0x3b, 0xd6, 0xb3, 0x29, 0xe3, 0x2f, 0x84,
    0x53, 0xd1, 0x00, 0xed, 0x20, 0xfc, 0xb1, 0x5b, 0x6a, 0xcb, 0xbe, 0x39, 0x4a, 0x4c, 0x58, 0xcf,
    0xd0, 0xef, 0xaa, 0xfb, 0x43, 0x4d, 0x33, 0x85, 0x45, 0xf9, 0x02, 0x7f, 0x50, 0x3c, 0x9f, 0xa8,
    0x51, 0xa3, 0x40, 0x8f, 0x92, 0x9d, 0x38, 0xf5, 0xbc, 0xb6, 0xda, 0x21, 0x10, 0xff, 0xf3, 0xd2,
    0xcd, 0x0c, 0x13, 0xec, 0x5f, 0x97, 0x44, 0x17, 0xc4, 0xa7, 0x7e, 0x3d, 0x64, 0x5d, 0x19, 0x73,
    0x60, 0x81, 0x4f, 0xdc, 0x22, 0x2a, 0x90, 0x88, 0x46, 0xee, 0xb8, 0x14, 0xde, 0x5e, 0x0b, 0xdb,
    0xe0, 0x32, 0x3a, 0x0a, 0x49, 0x06, 0x24, 0x5c, 0xc2, 0xd3, 0xac, 0x62, 0x91, 0x95, 0xe4, 0x79,
    0xe7, 0xc8, 0x37, 0x6d, 0x8d, 0xd5, 0x4e, 0xa9, 0x6c, 0x56, 0xf4, 0xea, 0x65, 0x7a, 0xae, 0x08,
    0xba, 0x78, 0x25, 0x2e, 0x1c, 0xa6, 0xb4, 0xc6, 0xe8, 0xdd, 0x74, 0x1f, 0x4b, 0xbd, 0x8b, 0x8a,
    0x70, 0x3e, 0xb5, 0x66, 0x48, 0x03, 0xf6, 0x0e, 0x61, 0x35, 0x57, 0xb9, 0x86, 0xc1, 0x1d, 0x9e,
    0xe1, 0xf8, 0x98, 0x11, 0x69, 0xd9, 0x8e, 0x94, 0x9b, 0x1e, 0x87, 0xe9, 0xce, 0x55, 0x28, 0xdf,
    0x8c, 0xa1, 0x89, 0x0d, 0xbf, 0xe6, 0x42, 0x68, 0x41, 0x99, 0x2d, 0x0f, 0xb0, 0x54, 0xbb, 0x16
};

// The constants of Artemia − 256 in the hexadecimal
// Nonzero bytes indeces: 0-3
const unsigned char C0[32] = {0x3b, 0x2d, 0x1e, 0x0f, 0x00, 0x00, 0x00, 0x00,
                              0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                              0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                              0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};

// Nonzero bytes indeces: 8-11
const unsigned char C1[32] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                              0x78, 0x69, 0x5a, 0x4b, 0x00, 0x00, 0x00, 0x00,
                              0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                              0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};

// Nonzero bytes indeces: 16-19
const unsigned char C2[32] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                              0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                              0xb4, 0xa5, 0x96, 0x87, 0x00, 0x00, 0x00, 0x00,
                              0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};

// Nonzero bytes indeces: 24-27
const unsigned char C3[32] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                              0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                              0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                              0xf0, 0xe1, 0xd2, 0xc3, 0x00, 0x00, 0x00, 0x00};

// Nonzero bytes indeces: 4-7
const unsigned char C4[32] = {0x00, 0x00, 0x00, 0x00, 0x5a, 0x4b, 0x3c, 0x2d,
                              0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                              0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                              0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};

// Nonzero bytes indeces: 20-23
const unsigned char C5[32] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                              0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                              0x00, 0x00, 0x00, 0x00, 0x96, 0x87, 0x78, 0x69,
                              0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};

const unsigned char *C[6] = {C0, C1, C2, C3, C4, C5};

void transformation_D1(unsigned char *x0, unsigned char *x1, unsigned char *x2, unsigned char *x3);
void transformation_D2(unsigned char *x0, unsigned char *x1, unsigned char *x2, unsigned char *x3);
void transformation_D3(unsigned char *x0, unsigned char *x1);

// Artemia-permutation-256
void artemia_permutation(unsigned char *X,
                         unsigned char *Y)
{
    int round, i;
    // Copy X into Y
    memcpy(Y, X, 2 * BLOCK_BYTE_SIZE * sizeof(unsigned char));

    for(round = 0 ; round < 6 ; round++){
        // XOR(X,C)
        for(i=0 ; i < 2*BLOCK_BYTE_SIZE ; i++)
            Y[i] ^= C[round][i];

        // D1
        transformation_D1(Y, Y+8, Y+16, Y+24);

        // S1
        for(i=0 ; i < 2*BLOCK_BYTE_SIZE ; i++)
            Y[i] = AES_SBOX[Y[i]];

        // D2
        transformation_D2(Y, Y+2, Y+4, Y+6);
        transformation_D2(Y+8, Y+10, Y+12, Y+14);
        transformation_D2(Y+16, Y+18, Y+20, Y+22);
        transformation_D2(Y+24, Y+26, Y+28, Y+30);

        // S2
        for(i=0 ; i < 2*BLOCK_BYTE_SIZE ; i++)
            Y[i] = AES_SBOX[Y[i]];

        // D3
        for(i=0 ; i<2*BLOCK_BYTE_SIZE ; i+=2)
            transformation_D3(Y+i, Y+i+1);

        // S3
        for(i=0 ; i < 2*BLOCK_BYTE_SIZE ; i++)
            Y[i] = AES_SBOX[Y[i]];
    }
}

void transformation_D1(unsigned char *x0,
                       unsigned char *x1,
                       unsigned char *x2,
                       unsigned char *x3)
{
    // Y0 = X0 ^ X2 ^ X3 ^ L(X1 ^ X3)
    // Y1 = X1 ^ X3 ^ Y0 ^ L(X2 ^ Y0)
    // Y2 = X2 ^ Y0 ^ Y1 ^ L(X3 ^ Y1)
    // Y3 = X3 ^ Y1 ^ Y2 ^ L(Y0 ^ Y2)
    //
    // L(X) = (X<<1) ^ (X>>15)

    const int LEN = 64;
    unsigned char temp[LEN/8];
    int i;
    unsigned char extL = 0, extR = 0, L = 0;

    // Compute Y0
    for(i=0 ; i<LEN/8 ; i++)    // temp = x1 ^ x3
        temp[i] = x1[i] ^ x3[i];

    for(i=0 ; i<LEN/8 ; i++){
        extL = i == 0 ? temp[i] << 1 : (temp[i] << 1) | (temp[i-1] >> 7);
        if(i==LEN/8-1) extR = 0;
        else if(i==LEN/8-2) extR = temp[LEN/8-1] >> 7;
        else extR = (temp[i+2] << 1) | (temp[i+1] >> 7);
        L = extL ^ extR;
        x0[i] = x0[i] ^ x2[i] ^ x3[i] ^ L; // save resulted value of Y0 in x0
    }

    // Compute Y1
    for(i=0 ; i<LEN/8 ; i++)    // temp = x2 ^ x0
        temp[i] = x2[i] ^ x0[i];

    for(i=0 ; i<LEN/8 ; i++){
        extL = i == 0 ? temp[i] << 1 : (temp[i] << 1) | (temp[i-1] >> 7);
        if(i==LEN/8-1) extR = 0;
        else if(i==LEN/8-2) extR = temp[LEN/8-1] >> 7;
        else extR = (temp[i+2] << 1) | (temp[i+1] >> 7);
        L = extL ^ extR;
        x1[i] = x1[i] ^ x3[i] ^ x0[i] ^ L; // save resulted value of Y1 in x1
    }

    // Compute Y2
    for(i=0 ; i<LEN/8 ; i++)    // temp = x3 ^ x1
        temp[i] = x3[i] ^ x1[i];

    for(i=0 ; i<LEN/8 ; i++){
        extL = i == 0 ? temp[i] << 1 : (temp[i] << 1) | (temp[i-1] >> 7);
        if(i==LEN/8-1) extR = 0;
        else if(i==LEN/8-2) extR = temp[LEN/8-1] >> 7;
        else extR = (temp[i+2] << 1) | (temp[i+1] >> 7);
        L = extL ^ extR;
        x2[i] = x2[i] ^ x0[i] ^ x1[i] ^ L; // save resulted value of Y2 in x2
    }

    // Compute Y3
    for(i=0 ; i<LEN/8 ; i++)    // temp = x2 ^ x0
        temp[i] = x0[i] ^ x2[i];

    for(i=0 ; i<LEN/8 ; i++){
        extL = i == 0 ? temp[i] << 1 : (temp[i] << 1) | (temp[i-1] >> 7);
        if(i==LEN/8-1) extR = 0;
        else if(i==LEN/8-2) extR = temp[LEN/8-1] >> 7;
        else extR = (temp[i+2] << 1) | (temp[i+1] >> 7);
        L = extL ^ extR;
        x3[i] = x3[i] ^ x1[i] ^ x2[i] ^ L; // save resulted value of Y3 in x3
    }

}

void transformation_D2(unsigned char *x0,
                       unsigned char *x1,
                       unsigned char *x2,
                       unsigned char *x3)
{
    // Y0 = X0 ^ X2 ^ X3 ^ L(X1 ^ X3)
    // Y1 = X1 ^ X3 ^ Y0 ^ L(X2 ^ Y0)
    // Y2 = X2 ^ Y0 ^ Y1 ^ L(X3 ^ Y1)
    // Y3 = X3 ^ Y1 ^ Y2 ^ L(Y0 ^ Y2)
    //
    // L(X) = (X<<1) ^ (X>>1)

    const int LEN = 16;
    unsigned char temp[LEN/8];
    int i;
    unsigned char extL = 0, extR = 0, L = 0;

    // Compute Y0
    for(i=0 ; i<LEN/8 ; i++)    // temp = x1 ^ x3
        temp[i] = x1[i] ^ x3[i];

    for(i=0 ; i<LEN/8 ; i++){
        extL = i == 0 ? temp[i] << 1 : (temp[i] << 1) | (temp[i-1] >> 7);
        extR = i == LEN/8-1 ? temp[i] >> 1 : (temp[i] >> 1) | (temp[i+1] << 7);
        L = extL ^ extR;
        x0[i] = x0[i] ^ x2[i] ^ x3[i] ^ L; // save resulted value of Y0 in x0
    }

    // Compute Y1
    for(i=0 ; i<LEN/8 ; i++)    // temp = x2 ^ x0
        temp[i] = x2[i] ^ x0[i];

    for(i=0 ; i<LEN/8 ; i++){
        extL = i == 0 ? temp[i] << 1 : (temp[i] << 1) | (temp[i-1] >> 7);
        extR = i == LEN/8-1 ? temp[i] >> 1 : (temp[i] >> 1) | (temp[i+1] << 7);
        L = extL ^ extR;
        x1[i] = x1[i] ^ x3[i] ^ x0[i] ^ L; // save resulted value of Y1 in x1
    }

    // Compute Y2
    for(i=0 ; i<LEN/8 ; i++)    // temp = x3 ^ x1
        temp[i] = x3[i] ^ x1[i];

    for(i=0 ; i<LEN/8 ; i++){
        extL = i == 0 ? temp[i] << 1 : (temp[i] << 1) | (temp[i-1] >> 7);
        extR = i == LEN/8-1 ? temp[i] >> 1 : (temp[i] >> 1) | (temp[i+1] << 7);
        L = extL ^ extR;
        x2[i] = x2[i] ^ x0[i] ^ x1[i] ^ L; // save resulted value of Y2 in x2
    }

    // Compute Y3
    for(i=0 ; i<LEN/8 ; i++)    // temp = x2 ^ x0
        temp[i] = x0[i] ^ x2[i];

    for(i=0 ; i<LEN/8 ; i++){
        extL = i == 0 ? temp[i] << 1 : (temp[i] << 1) | (temp[i-1] >> 7);
        extR = i == LEN/8-1 ? temp[i] >> 1 : (temp[i] >> 1) | (temp[i+1] << 7);
        L = extL ^ extR;
        x3[i] = x3[i] ^ x1[i] ^ x2[i] ^ L; // save resulted value of Y3 in x3
    }

}

void transformation_D3(unsigned char *x0,
                       unsigned char *x1)
{
    // Y0 = X0 ^ L(X1)
    // Y1 = X1 ^ L(Y0)
    //
    // L(X) = (X<<1) ^ (X>>3)

    unsigned char temp, L = 0;

    // Compute Y0
    temp = *x1;
    L = (temp << 1) ^ (temp >> 3);
    x0[0] = x0[0] ^ L; // save resulted value of Y0 in x0

    // Compute Y1
    temp = *x0;
    L = (temp << 1) ^ (temp >> 3);
    x1[0] = x1[0] ^ L; // save resulted value of Y1 in x1
}
