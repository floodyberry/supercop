/*
File: AVR8-rotate64.h

This code is originally by Daniel Otte (daniel.otte@rub.de) in 2006-2010 as part of the AVR-Crypto-Lib, and was then improved by Ronny Van Keer, STMicroelectronics, in 2010. This code is hereby put in the public domain in agreement with the authors. It is given as is, without any guarantee.
*/

#ifndef ROTATE64_H_
#define ROTATE64_H_

#include <stdint.h>


#define ROT_CODE(a) ((((a)/8+((((a)%8)>4)?1:0))<<4) | ((a) & 7))

uint64_t rotate64_1bit_left(uint64_t a);
uint64_t rotate64_1bit_right(uint64_t a);
uint64_t rotate64left_code(uint64_t a, int8_t code);

#endif /* ROTATE64_H_ */

