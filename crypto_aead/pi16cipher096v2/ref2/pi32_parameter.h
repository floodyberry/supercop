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


/*mu-transformation*/ \
#define PI_MU_CONST { \
    0xF0E8E4E2, \
    0xE1D8D4D2, \
    0xD1CCCAC9, \
    0xC6C5C3B8  \
}

/*nu-transformation*/ \
#define PI_NY_CONST { \
    0xB4B2B1AC, \
    0xAAA9A6A5, \
    0xA39C9A99, \
    0x9695938E  \
}


/* FIXME */
#if 0
#define PI_MU_CONST { \
	0x8D8B8778, \
	0x7472716C, \
	0x6A696665, \
	0x635C5A59  \
}

#define PI_NY_CONST { \
	0x5655534E, \
	0x4D4B473C, \
	0x3A393635, \
	0x332E2D2B  \
}
#endif

#define PI_MU_ROT_CONST { 5, 11, 17, 23 }

#define PI_NY_ROT_CONST { 3, 10, 19, 29 }

#define PI_CONST {                                    \
  { 0x8D8B8778, 0x7472716C, 0x6A696665, 0x635C5A59 }, \
  { 0x5655534E, 0x4D4B473C, 0x3A393635, 0x332E2D2B }, \
  { 0x271E1D1B, 0x170FF0E8, 0xE4E2E1D8, 0xD4D2D1CC }, \
  { 0xCAC9C6C5, 0xC3B8B4B2, 0xB1ACAAA9, 0xA6A5A39C }, \
  { 0x9A999695, 0x938E8D8B, 0x87787472, 0x716C6A69 }, \
  { 0x6665635C, 0x5A595655, 0x534E4D4B, 0x473C3A39 }  \
}


#endif /* PI32_PARAMETER_H_ */
