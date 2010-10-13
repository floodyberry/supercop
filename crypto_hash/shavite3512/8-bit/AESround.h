#ifndef AESROUND_H
#define AESROUND_H

#include "portable.h"

/* The AES Sbox */
static const u8 Sbox[256] = {
 99, 124, 119, 123, 242, 107, 111, 197,  48,   1, 103,  43, 254, 215, 171, 118,
202, 130, 201, 125, 250,  89,  71, 240, 173, 212, 162, 175, 156, 164, 114, 192,
183, 253, 147,  38,  54,  63, 247, 204,  52, 165, 229, 241, 113, 216,  49,  21,
  4, 199,  35, 195,  24, 150,   5, 154,   7,  18, 128, 226, 235,  39, 178, 117,
  9, 131,  44,  26,  27, 110,  90, 160,  82,  59, 214, 179,  41, 227,  47, 132,
 83, 209,   0, 237,  32, 252, 177,  91, 106, 203, 190,  57,  74,  76,  88, 207,
208, 239, 170, 251,  67,  77,  51, 133,  69, 249,   2, 127,  80,  60, 159, 168,
 81, 163,  64, 143, 146, 157,  56, 245, 188, 182, 218,  33,  16, 255, 243, 210,
205,  12,  19, 236,  95, 151,  68,  23, 196, 167, 126,  61, 100,  93,  25, 115,
 96, 129,  79, 220,  34,  42, 144, 136,  70, 238, 184,  20, 222,  94,  11, 219,
224,  50,  58,  10,  73,   6,  36,  92, 194, 211, 172,  98, 145, 149, 228, 121,
231, 200,  55, 109, 141, 213,  78, 169, 108,  86, 244, 234, 101, 122, 174,   8,
186, 120,  37,  46,  28, 166, 180, 198, 232, 221, 116,  31,  75, 189, 139, 138,
112,  62, 181, 102,  72,   3, 246,  14,  97,  53,  87, 185, 134, 193,  29, 158,
225, 248, 152,  17, 105, 217, 142, 148, 155,  30, 135, 233, 206,  85,  40, 223,
140, 161, 137,  13, 191, 230,  66, 104,  65, 153,  45,  15, 176,  84, 187,  22
};

u8 DblGF2 (u8 element) {
   u8 temp;
   if (element&0x80) {
      temp = element << 1;
      temp ^= 0x1B;
   }
   else
      temp = element << 1;
   return temp; 
}

u8 f(u8 inp0, u8 inp1, u8 inp2, u8 inp3) {
   return (inp1^inp2^inp3^DblGF2(inp0^inp1));
}

/* u32 MixColumns(u8 inp0, u8 inp1, u8 inp2, u8 inp3) {
   u8 a,b,c,d;
   u32 temp;
   d = f(inp0,inp1,inp2,inp3);
   temp = d<<24 ;
   c = f(inp1,inp2,inp3,inp0);
   temp ^= c << 16;
   b = f(inp2,inp3,inp0,inp1);
   temp ^= b << 8;
   a = f(inp3,inp0,inp1,inp2);
   temp ^= a;

   return temp;
} */

 u32 MixColumns(u8 inp0, u8 inp1, u8 inp2, u8 inp3) {
   u8 a,b,c,d;
   u32 temp;
   d = f(inp3,inp0,inp1,inp2);
   temp = d<<24 ;
   c = f(inp2,inp3,inp0,inp1);
   temp ^= c << 16;
   b = f(inp1,inp2,inp3,inp0);
   temp ^= b << 8;
   a = f(inp0,inp1,inp2,inp3);
   temp ^= a;

   return temp;
} 

/* #define roundAES(u32 input[4], u32 output[4], u32 key[4]) */
#define roundAES(input0,input1,input2,input3,output0,output1,output2,output3,key0,key1,key2,key3)\
{\
   u8 temp0,temp1,temp2,temp3,temp4,temp5,temp6,temp7;\
   temp0=input0 & 0xff;\
   temp1=(input1>>8) & 0xff;\
   temp2=(input2>>16) & 0xff;\
   temp3=input3>>24;\
   temp4=Sbox[temp0];\
   temp5=Sbox[temp1];\
   temp6=Sbox[temp2];\
   temp7=Sbox[temp3];\
   output0 = MixColumns(temp4,temp5,temp6,temp7)^key0; \
   temp0=input1 & 0xff;\
   temp1=(input2>>8) & 0xff;\
   temp2=(input3>>16) & 0xff;\
   temp3=input0>>24;\
   temp4=Sbox[temp0];\
   temp5=Sbox[temp1];\
   temp6=Sbox[temp2];\
   temp7=Sbox[temp3];\
   output1 = MixColumns(temp4,temp5,temp6,temp7)^key1;\
   temp0=input2 & 0xff;\
   temp1=(input3>>8) & 0xff;\
   temp2=(input0>>16) & 0xff;\
   temp3=input1>>24;\
   temp4=Sbox[temp0];\
   temp5=Sbox[temp1];\
   temp6=Sbox[temp2];\
   temp7=Sbox[temp3];\
   output2 = MixColumns(temp4,temp5,temp6,temp7)^key2;\
   temp0=input3 & 0xff;\
   temp1=(input0>>8) & 0xff;\
   temp2=(input1>>16) & 0xff;\
   temp3=input2>>24;\
   temp4=Sbox[temp0];\
   temp5=Sbox[temp1];\
   temp6=Sbox[temp2];\
   temp7=Sbox[temp3];\
   output3 = MixColumns(temp4,temp5,temp6,temp7)^key3;\
}
   
/* #define roundAESnokey(u32 input[4], u32 output[4]) */
#define roundAESnokey(input0,input1,input2,input3,output0,output1,output2,output3)\
{\
   u8 temp0,temp1,temp2,temp3,temp4,temp5,temp6,temp7;\
   temp0=input0 & 0xff;\
   temp1=(input1>>8) & 0xff;\
   temp2=(input2>>16) & 0xff;\
   temp3=input3>>24;\
   temp4=Sbox[temp0];\
   temp5=Sbox[temp1];\
   temp6=Sbox[temp2];\
   temp7=Sbox[temp3];\
   output0 = MixColumns(temp4,temp5,temp6,temp7); \
   temp0=input1 & 0xff;\
   temp1=(input2>>8) & 0xff;\
   temp2=(input3>>16) & 0xff;\
   temp3=input0>>24;\
   temp4=Sbox[temp0];\
   temp5=Sbox[temp1];\
   temp6=Sbox[temp2];\
   temp7=Sbox[temp3];\
   output1 = MixColumns(temp4,temp5,temp6,temp7);\
   temp0=input2 & 0xff;\
   temp1=(input3>>8) & 0xff;\
   temp2=(input0>>16) & 0xff;\
   temp3=input1>>24;\
   temp4=Sbox[temp0];\
   temp5=Sbox[temp1];\
   temp6=Sbox[temp2];\
   temp7=Sbox[temp3];\
   output2 = MixColumns(temp4,temp5,temp6,temp7);\
   temp0=input3 & 0xff;\
   temp1=(input0>>8) & 0xff;\
   temp2=(input1>>16) & 0xff;\
   temp3=input2>>24;\
   temp4=Sbox[temp0];\
   temp5=Sbox[temp1];\
   temp6=Sbox[temp2];\
   temp7=Sbox[temp3];\
   output3 = MixColumns(temp4,temp5,temp6,temp7);\
}

#endif
