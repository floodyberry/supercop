/*
 * pi16_parameter.h
 *
 *  Created on: 2015-09-07
 *      Author: bg
 */

#ifndef PI16_PARAMETER_H_
#define PI16_PARAMETER_H_

typedef uint16_t word_t;

#define PI_WORD_SIZE 16

#define PI_TAG_BITS  128
#define PI_TAG_BYTES (PI_TAG_BITS / 8)

#define PI_MU_CONST_0 0xF0E8
#define PI_MU_CONST_1 0xE4E2
#define PI_MU_CONST_2 0xE1D8
#define PI_MU_CONST_3 0xD4D2

#define PI_MU_CONST { 0xF0E8, 0xE4E2, 0xE1D8, 0xD4D2 }

#define PI_MU_ROT_CONST_0 1
#define PI_MU_ROT_CONST_1 4
#define PI_MU_ROT_CONST_2 9
#define PI_MU_ROT_CONST_3 11

#define PI_MU_ROT_CONST { 1, 4, 9, 11 }

#define PI_NY_CONST { 0xD1CC, 0xCAC9, 0xC6C5, 0xC3B8 }

#define PI_NY_CONST_0 0xD1CC
#define PI_NY_CONST_1 0xCAC9
#define PI_NY_CONST_2 0xC6C5
#define PI_NY_CONST_3 0xC3B8

#define PI_NY_ROT_CONST_0 2
#define PI_NY_ROT_CONST_1 5
#define PI_NY_ROT_CONST_2 7
#define PI_NY_ROT_CONST_3 13

#define PI_NY_ROT_CONST { 2, 5, 7, 13 }

#define PI_CONST {                       \
  { 0xB4B2, 0xB1AC, 0xAAA9, 0xA6A5 },    \
  { 0xA39C, 0x9A99, 0x9695, 0x938E },    \
  { 0x8D8B, 0x8778, 0x7472, 0x716C },    \
  { 0x6A69, 0x6665, 0x635C, 0x5A59 },    \
  { 0x5655, 0x534E, 0x4D4B, 0x473C },    \
  { 0x3A39, 0x3635, 0x332E, 0x2D2B }     \
}

/* precomputed */
#define PI_CONST_PRECOMP {                  \
		{ 0xac4e, 0xc92e, 0xd4af, 0x7b3f }, \
		{ 0xcb4c, 0xfc30, 0x4952, 0x45d3 }, \
		{ 0xc306, 0x75ad, 0x3401, 0x03bd }, \
		{ 0x6d8d, 0xc60d, 0x4c2b, 0x565b }, \
		{ 0xfa29, 0x0861, 0x9bd1, 0xae55 }, \
		{ 0xade6, 0xb7bf, 0xab20, 0x3673 }  \
}



#endif /* PI16_PARAMETER_H_ */
