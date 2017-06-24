#include "common.h"
#ifndef PRESENT_H
#define PRESENT_H
//input two block but only one key, two block use the same key
void PRESENT80_enc(dqword *input, const unsigned char* userkey);
void PRESENT80_InitKEY(const unsigned char* userkey);
#endif