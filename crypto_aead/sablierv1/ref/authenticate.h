#ifndef SABLIER_AUTHENTICATE_HEADER
#define SABLIER_AUTHENTICATE_HEADER

#include "sbox.h"

static uint8_t tag0, tag1, tag2, tag3,
stream0, stream1, stream2, stream3;

#define tag(i) (tag##i)
#define stream(i) (stream##i)
#define authenticate(m0, m1, s0, s1)\
	do{\
	tag(0) ^= s_up[m0][stream(0)] ^ s_down[m0][stream(1)] ^ s_up[m1][stream(1)] ^ s_down[m1][stream(2)];\
	tag(1) ^= s_up[m0][stream(1)] ^ s_down[m0][stream(2)] ^ s_up[m1][stream(2)] ^ s_down[m1][stream(3)];\
	tag(2) ^= s_up[m0][stream(2)] ^ s_down[m0][stream(3)] ^ s_up[m1][stream(3)] ^ s_down[m1][s0];\
	tag(3) ^= s_up[m0][stream(3)] ^ s_down[m0][s0] ^  s_up[m1][s0] ^ s_down[m1][s1];\
	stream(0) = stream(2);\
	stream(1) = stream(3);\
	stream(2) = s0;\
	stream(3) = s1;\
	}while(0)

#endif