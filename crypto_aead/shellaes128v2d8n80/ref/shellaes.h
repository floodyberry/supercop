/*
 * SHELL-AES Reference C Implementation
 *
 * Copyright 2015:
 *     Lei Wang <wanglei_hb@sjtu.edu.cn>
 *              <shellaemode@gmail.com>
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

#define d 8
#define w 256
#define byte_length_nonce 10
#define byte_length_tag 16

void printf_byte_string(const u8 b[], unsigned long long int blen);

void xor_byte_string(const u8 byte1[], u8 byte2[], unsigned long long int blen);

void checksum_state_string(const u8 byte1[], u8 checksum[], unsigned long long int blen);

void KeySetupEnc(u32 mk[], u32 sk[], u8 L[], u8 Lprime[], u8 keyprime[], const u32 rk[], const u8 key[]);

void KeySetupDec(u32 mk[], u32 sk[], u32 isk[], u8 L[], u8 Lprime[], u8 keyprime[], const u32 rk[], const u8 key[]);

void PXMAC(const u32 mk[], const u32 sk[], const u8 L[], u8 v[], const u32 rk[], const u8 ad[], unsigned long long int adlen);

void CENC(const u32 rkprime[], u8 S[], u8 F[], const u8 nonce[], unsigned long long int ptlen);

void PXENC(const u32 mk[], const u32 sk[], const u8 L[], u8 V[], u8 Z[], const u32 rk[], const u8 I[], unsigned long long int ptlen);

void PXDEC(const u32 mk[], const u32 isk[], const u8 L[], u8 V[], const u8 Z[], const u32 rk[], u8 I[], unsigned long long int ctlen);

void XEXLayerEnc(const u32 rk[], const u8 Lprime[], const u8 Z[], u8 C[], unsigned long long int ctlen);

void XEXLayerDec(const u32 irk[], const u8 Lprime[], const u8 C[], u8 Z[], unsigned long long int ctlen);

void tagGen(const u32 rk[], const u8 checksum[], const u8 Lprime[], const u8 U[], const u8 F[], u8 T[], unsigned long long int ptlen);

int tagVef(const u32 rk[], const u8 checksum[], const u8 Lprime[], const u8 U[], const u8 F[], const u8 T[], unsigned long long int ptlen);

void shellaesEnc_fb(const u8 key[], const u8 nonce[], const u8 ad[], unsigned long long int adlen, const u8 p[], unsigned long long int ptlen, u8 c[], u8 tag[]);

int shellaesDecVef_fb(const u8 key[], const u8 nonce[], const u8 ad[], unsigned long long int adlen, const u8 c[], unsigned long long int ctlen, u8 p[], const u8 tag[]);

void shellaesEnc(const u8 key[], const u8 nonce[], const u8 ad[], unsigned long long int adlen, const u8 p[], unsigned long long int ptlen, u8 c[], unsigned long long int ctlen);

int shellaesDec(const u8 key[], const u8 nonce[], const u8 ad[], unsigned long long int adlen, const u8 c[], unsigned long long int ctlen, u8 p[], unsigned long long int* ptlen);
