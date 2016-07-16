/*
File: AVR8-rotate64.h

This code is originally by Daniel Otte (daniel.otte@rub.de) in 2006-2010 as part of the AVR-Crypto-Lib, and was then improved by Ronny Van Keer, STMicroelectronics, in 2010. 

Implementation by Daniel Otte and Ronny Van Keer,
hereby denoted as "the implementer".

To the extent possible under law, the implementer has waived all copyright
and related or neighboring rights to the source code in this file.
http://creativecommons.org/publicdomain/zero/1.0/
*/

#ifndef ROTATE64_H_
#define ROTATE64_H_

#include <stdint.h>


#define ROT_CODE(a) ((((a)/8+((((a)%8)>4)?1:0))<<4) | ((a) & 7))

uint64_t rotate64_1bit_left(uint64_t a);
uint64_t rotate64_1bit_right(uint64_t a);
uint64_t rotate64left_code(uint64_t a, int8_t code);

#endif /* ROTATE64_H_ */

