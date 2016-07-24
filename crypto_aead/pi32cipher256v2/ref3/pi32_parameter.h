/*
 * pi32_parameter.h
 *
 *  Created on: 2015-09-11
 *      Author: bg
 */

#ifndef PI32_PARAMETER_H_
#define PI32_PARAMETER_H_

typedef uint32_t word_t;

#define PI_WORD_SIZE 32

#define PI_TAG_BITS  256
#define PI_TAG_BYTES (PI_TAG_BITS / 8)

#define PI_MU_CONST_0 0xF0E8E4E2l
#define PI_MU_CONST_1 0xE1D8D4D2l
#define PI_MU_CONST_2 0xD1CCCAC9l
#define PI_MU_CONST_3 0xC6C5C3B8l

/*mu-transformation*/ \
#define PI_MU_CONST { \
    0xF0E8E4E2l, \
    0xE1D8D4D2l, \
    0xD1CCCAC9l, \
    0xC6C5C3B8l  \
}

#define PI_NY_CONST_0 0xB4B2B1ACl
#define PI_NY_CONST_1 0xAAA9A6A5l
#define PI_NY_CONST_2 0xA39C9A99l
#define PI_NY_CONST_3 0x9695938El

/*nu-transformation*/ \
#define PI_NY_CONST { \
    0xB4B2B1ACl, \
    0xAAA9A6A5l, \
    0xA39C9A99l, \
    0x9695938El  \
}

#define PI_MU_ROT_CONST_0 5
#define PI_MU_ROT_CONST_1 11
#define PI_MU_ROT_CONST_2 17
#define PI_MU_ROT_CONST_3 23

#define PI_MU_ROT_CONST { 5, 11, 17, 23 }

#define PI_NY_ROT_CONST_0 3
#define PI_NY_ROT_CONST_1 10
#define PI_NY_ROT_CONST_2 19
#define PI_NY_ROT_CONST_3 29

#define PI_NY_ROT_CONST { 3, 10, 19, 29 }

#define PI_CONST {                                        \
  { 0x8D8B8778l, 0x7472716Cl, 0x6A696665l, 0x635C5A59l }, \
  { 0x5655534El, 0x4D4B473Cl, 0x3A393635l, 0x332E2D2Bl }, \
  { 0x271E1D1Bl, 0x170FF0E8l, 0xE4E2E1D8l, 0xD4D2D1CCl }, \
  { 0xCAC9C6C5l, 0xC3B8B4B2l, 0xB1ACAAA9l, 0xA6A5A39Cl }, \
  { 0x9A999695l, 0x938E8D8Bl, 0x87787472l, 0x716C6A69l }, \
  { 0x6665635Cl, 0x5A595655l, 0x534E4D4Bl, 0x473C3A39l }  \
}


#endif /* PI32_PARAMETER_H_ */
