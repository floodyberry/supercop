#include "portable.h"
#include "AESround.h"
#include "SHA3api_ref.h"


#define InternalRounds 3
#define ExternalRounds 12

/* The message expansion takes a 16 words (stored in rk[0,.,15]) and */
/* the counter values to produce the full expanded message           */

/* Generates 16 more words in rk[] using the nonlinear expansion step */
/* new words: rk[16..31]					      */
#define NonLinExpansion(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3,index)\
{\
	x0 = rk[1];\
        x1 = rk[2];\
        x2 = rk[3];\
        x3 = rk[0];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
	rk[16] = y0^rk[12];\
	rk[17] = y1^rk[13];\
	rk[18] = y2^rk[14];\
	rk[19] = y3^rk[15];\
	if (index==16) {\
           rk[16] ^= counter[0];\
           rk[17] ^= ~counter[1];\
        }\
        x0 = rk[5];\
        x1 = rk[6];\
        x2 = rk[7];\
        x3 = rk[4];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[20] = y0^rk[16];\
        rk[21] = y1^rk[17];\
        rk[22] = y2^rk[18];\
        rk[23] = y3^rk[19];\
        if (index==80) {\
           rk[22] ^= counter[1];\
           rk[23] ^= ~counter[0];\
        }\
	x0 = rk[9];\
        x1 = rk[10];\
        x2 = rk[11];\
        x3 = rk[8];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[24] = y0^rk[20];\
        rk[25] = y1^rk[21];\
        rk[26] = y2^rk[22];\
        rk[27] = y3^rk[23];\
        if (index==48) {\
           rk[25] ^= counter[1];\
           rk[26] ^= ~counter[0];\
        }\
        x0 = rk[13];\
        x1 = rk[14];\
        x2 = rk[15];\
        x3 = rk[12];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[28] = y0^rk[24];\
        rk[29] = y1^rk[25];\
        rk[30] = y2^rk[26];\
        rk[31] = y3^rk[27];\
        if (index==112) {\
           rk[28] ^= counter[0];\
           rk[31] ^= ~counter[1];\
        }\
}

#define LinExpansion(rk,temp0,temp1,temp2)\
{\
   rk[0] = rk[16]^rk[29];\
   rk[1] = rk[17]^rk[30];\
   rk[2] = rk[18]^rk[31];\
   for (temp0=3, temp1=19, temp2=0;temp1<32;temp0++,temp1++,temp2++)\
      rk[temp0] = rk[temp1]^rk[temp2];\
}

#define left_round(state0,state1,state2,state3,state4,state5,state6,state7,x0,x1,x2,x3,y0,y1,y2,y3,rk,position)\
{\
   x0 = state4^rk[position];\
   x1 = state5^rk[position+1];\
   x2 = state6^rk[position+2];\
   x3 = state7^rk[position+3];\
   roundAES(x0,x1,x2,x3,y0,y1,y2,y3,rk[position+4],rk[position+5],rk[position+6],rk[position+7]);\
   roundAES(y0,y1,y2,y3,x0,x1,x2,x3,rk[(position+8)&0x1F],rk[(position+9)&0x1F],rk[(position+10)&0x1F],rk[(position+11)&0x1F]);\
   roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
   state0 ^= y0;\
   state1 ^= y1;\
   state2 ^= y2;\
   state3 ^= y3;\
}

#define right_round(state0,state1,state2,state3,state4,state5,state6,state7,x0,x1,x2,x3,y0,y1,y2,y3,rk,position)\
{\
   x0 = state0^rk[position];\
   x1 = state1^rk[position+1];\
   x2 = state2^rk[position+2];\
   x3 = state3^rk[position+3];\
   roundAES(x0,x1,x2,x3,y0,y1,y2,y3,rk[(position+4)&0x1F],rk[(position+5)&0x1F],rk[(position+6)&0x1F],rk[(position+7)&0x1F]);\
   roundAES(y0,y1,y2,y3,x0,x1,x2,x3,rk[(position+8)&0x1F],rk[(position+9)&0x1F],rk[(position+10)&0x1F],rk[(position+11)&0x1F]);\
   roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
   state4^=y0;\
   state5^=y1;\
   state6^=y2;\
   state7^=y3;\
}

void E256(u32 pt[8], u32 ct[8], u32 message[16], u32 counter[2])
{
   u32 state0,state1,state2,state3,state4,state5,state6,state7,i,j,k;
   u32 x0,x1,x2,x3,y0,y1,y2,y3;
   u32 rk[32];

   state0=pt[0]; 
   state1=pt[1]; 
   state2=pt[2]; 
   state3=pt[3];
   state4=pt[4];
   state5=pt[5];
   state6=pt[6];
   state7=pt[7];
   for (i=0;i<16;i++) rk[i]=message[i];
   left_round(state0,state1,state2,state3,state4,state5,state6,state7,x0,x1,x2,x3,y0,y1,y2,y3,rk,0);
   NonLinExpansion(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3,16);
   right_round(state0,state1,state2,state3,state4,state5,state6,state7,x0,x1,x2,x3,y0,y1,y2,y3,rk,12);
   LinExpansion(rk,i,j,k);
   left_round(state0,state1,state2,state3,state4,state5,state6,state7,y0,y1,y2,y3,x0,x1,x2,x3,rk,24);
   right_round(state0,state1,state2,state3,state4,state5,state6,state7,y0,y1,y2,y3,x0,x1,x2,x3,rk,4);
   NonLinExpansion(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3,48);
   left_round(state0,state1,state2,state3,state4,state5,state6,state7,y0,y1,y2,y3,x0,x1,x2,x3,rk,16);
   LinExpansion(rk,i,j,k);
   right_round(state0,state1,state2,state3,state4,state5,state6,state7,y0,y1,y2,y3,x0,x1,x2,x3,rk,28);
   NonLinExpansion(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3,80);
   left_round(state0,state1,state2,state3,state4,state5,state6,state7,y0,y1,y2,y3,x0,x1,x2,x3,rk,8);
   right_round(state0,state1,state2,state3,state4,state5,state6,state7,y0,y1,y2,y3,x0,x1,x2,x3,rk,20);
   LinExpansion(rk,i,j,k);
   left_round(state0,state1,state2,state3,state4,state5,state6,state7,y0,y1,y2,y3,x0,x1,x2,x3,rk,0);
   NonLinExpansion(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3,112);
   right_round(state0,state1,state2,state3,state4,state5,state6,state7,y0,y1,y2,y3,x0,x1,x2,x3,rk,12);
   LinExpansion(rk,i,j,k);
   left_round(state0,state1,state2,state3,state4,state5,state6,state7,y0,y1,y2,y3,x0,x1,x2,x3,rk,24);
   right_round(state0,state1,state2,state3,state4,state5,state6,state7,y0,y1,y2,y3,x0,x1,x2,x3,rk,4);

   ct[0]=state0; 
   ct[1]=state1; 
   ct[2]=state2; 
   ct[3]=state3;
   ct[4]=state4;
   ct[5]=state5;
   ct[6]=state6;
   ct[7]=state7;

   return;
}

/* The actual compression function C_{256}                           */

void Compress256(const u8 *message_block, u8 *chaining_value, u64 counter)
{    
   u32 pt[8],ct[8];
   u32 msg_u32[16];
   u32 cnt[2];
   int i;

/* Translating all the inputs to 32-bit words			     */

   for (i=0;i<8;i++)
      pt[i]=U8TO32_LITTLE(chaining_value+4*i);

   for (i=0;i<16;i++)
      msg_u32[i]=U8TO32_LITTLE(message_block+4*i);

   cnt[1]=(u32)(counter>>32);
   cnt[0]=(u32)(counter & 0xFFFFFFFFULL);


/* Computing the encryption function				     */

   E256(pt, ct, msg_u32, cnt);


/* Davies-Meyer transformation 					     */
   
   for (i=0; i<8; i++)
       pt[i]^=ct[i];


/* Translating the output to 8-bit words			     */

   for (i=0; i<8; i++)
       U32TO8_LITTLE(chaining_value+i*4, pt[i]);

   return;
}
