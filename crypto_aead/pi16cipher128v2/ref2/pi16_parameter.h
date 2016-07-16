/*
 * pi16_parameter.h
 *
 *  Created on: 07.09.2015
 *      Author: bg
 */

#ifndef PI16_PARAMETER_H_
#define PI16_PARAMETER_H_

typedef uint16_t word_t;

#define PI_WORD_SIZE 16

#define PI_TAG_BITS  128
#define PI_TAG_BYTES (PI_TAG_BITS / 8)


#define PI_MU_CONST { 0xF0E8, 0xE4E2, 0xE1D8, 0xD4D2 }

#define PI_MU_ROT_CONST { 1, 4, 9, 11 }

#define PI_NY_CONST { 0xD1CC, 0xCAC9, 0xC6C5, 0xC3B8 }


#define PI_NY_ROT_CONST { 2, 5, 7, 13 }

#define PI_CONST {                       \
  { 0xB4B2, 0xB1AC, 0xAAA9, 0xA6A5 },    \
  { 0xA39C, 0x9A99, 0x9695, 0x938E },    \
  { 0x8D8B, 0x8778, 0x7472, 0x716C },    \
  { 0x6A69, 0x6665, 0x635C, 0x5A59 },    \
  { 0x5655, 0x534E, 0x4D4B, 0x473C },    \
  { 0x3A39, 0x3635, 0x332E, 0x2D2B },    \
  { 0x271E, 0x1D1B, 0x170F, 0xF0E8 },    \
  { 0xE4E2, 0xE1D8, 0xD4D2, 0xD1CC }     \
}


#endif /* PI16_PARAMETER_H_ */
