/*
 * Joltik=/=-128-64 Optimized (vperm) C Implementation
 * 
 * Copyright 2014:
 *     Jeremy Jean <JJean@ntu.edu.sg>
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of the
 * License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301, USA.
 * 
 */

#include <stdint.h>

void TweakeyScheduleTK2        (const uint8_t subkeys[], const uint8_t subkeys2[]);
void TweakeyScheduleTK2_reverse(const uint8_t subkeys[], const uint8_t subkeys2[]);

void aesTweakEncrypt(const uint8_t pt[], 
                     const uint8_t subkeys[], 
                     const uint8_t tweak[], 
                     uint8_t ct[]);

void aesTweakDecrypt(const uint8_t ct[],
                     const uint8_t subkeys[], 
                     const uint8_t tweak[], 
                     uint8_t pt[]);
