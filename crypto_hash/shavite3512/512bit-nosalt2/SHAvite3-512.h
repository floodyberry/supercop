#include "portable.h"
#include "AESround.h"
#include "SHA3api_ref.h"
 
#define InternalRounds512 4
#define ExternalRounds512 14
#define ExpandedMessageSize512 (ExternalRounds512*4*(InternalRounds512)*2)

#define NonLinExpansionRegular0(rk,x0,x1,x2,x3,y0,y1,y2,y3)\
{\
        x0 = rk[1];\
        x1 = rk[2];\
        x2 = rk[3];\
        x3 = rk[0];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[0] = y0^rk[28];\
        rk[1] = y1^rk[29];\
        rk[2] = y2^rk[30];\
        rk[3] = y3^rk[31];\
	x0 = rk[5];\
        x1 = rk[6];\
        x2 = rk[7];\
        x3 = rk[4];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[4] = y0^rk[0];\
        rk[5] = y1^rk[1];\
        rk[6] = y2^rk[2];\
        rk[7] = y3^rk[3];\
        x0 = rk[9];\
        x1 = rk[10];\
        x2 = rk[11];\
        x3 = rk[8];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[8]  = y0^rk[4];\
        rk[9]  = y1^rk[5];\
        rk[10] = y2^rk[6];\
        rk[11] = y3^rk[7];\
        x0 = rk[13];\
        x1 = rk[14];\
        x2 = rk[15];\
        x3 = rk[12];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[12] = y0^rk[8];\
        rk[13] = y1^rk[9];\
        rk[14] = y2^rk[10];\
        rk[15] = y3^rk[11];\
}

#define NonLinExpansionRegular16(rk,x0,x1,x2,x3,y0,y1,y2,y3)\
{\
        x0 = rk[17];\
        x1 = rk[18];\
        x2 = rk[19];\
        x3 = rk[16];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[16] = y0^rk[12];\
        rk[17] = y1^rk[13];\
        rk[18] = y2^rk[14];\
        rk[19] = y3^rk[15];\
	x0 = rk[21];\
        x1 = rk[22];\
        x2 = rk[23];\
        x3 = rk[20];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[20] = y0^rk[16];\
        rk[21] = y1^rk[17];\
        rk[22] = y2^rk[18];\
        rk[23] = y3^rk[19];\
        x0 = rk[25];\
        x1 = rk[26];\
        x2 = rk[27];\
        x3 = rk[24];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[24] = y0^rk[20];\
        rk[25] = y1^rk[21];\
        rk[26] = y2^rk[22];\
        rk[27] = y3^rk[23];\
        x0 = rk[29];\
        x1 = rk[30];\
        x2 = rk[31];\
        x3 = rk[28];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[28] = y0^rk[24];\
        rk[29] = y1^rk[25];\
        rk[30] = y2^rk[26];\
        rk[31] = y3^rk[27];\
}


#define NonLinExpansion32(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3)\
{\
        x0 = rk[1];\
        x1 = rk[2];\
        x2 = rk[3];\
        x3 = rk[0];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[0] = y0^rk[28]^counter[0];\
        rk[1] = y1^rk[29]^counter[1];\
        rk[2] = y2^rk[30]^counter[2];\
        rk[3] = y3^rk[31]^counter[3];\
	x0 = rk[5];\
        x1 = rk[6];\
        x2 = rk[7];\
        x3 = rk[4];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[4] = y0^rk[0];\
        rk[5] = y1^rk[1];\
        rk[6] = y2^rk[2];\
        rk[7] = y3^rk[3];\
        x0 = rk[9];\
        x1 = rk[10];\
        x2 = rk[11];\
        x3 = rk[8];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[8] = y0^rk[4];\
        rk[9] = y1^rk[5];\
        rk[10] = y2^rk[6];\
        rk[11] = y3^rk[7];\
        x0 = rk[13];\
        x1 = rk[14];\
        x2 = rk[15];\
        x3 = rk[12];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[12] = y0^rk[8];\
        rk[13] = y1^rk[9];\
        rk[14] = y2^rk[10];\
        rk[15] = y3^rk[11];\
}


#define NonLinExpansion160(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3)\
{\
        x0 = rk[1];\
        x1 = rk[2];\
        x2 = rk[3];\
        x3 = rk[0];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[0] = y0^rk[28];\
        rk[1] = y1^rk[29];\
        rk[2] = y2^rk[30];\
        rk[3] = y3^rk[31];\
	x0 = rk[5];\
        x1 = rk[6];\
        x2 = rk[7];\
        x3 = rk[4];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[4] = y0^rk[0]^counter[3];\
        rk[5] = y1^rk[1]^counter[2];\
        rk[6] = y2^rk[2]^counter[1];\
        rk[7] = y3^rk[3]^counter[0];\
        x0 = rk[9];\
        x1 = rk[10];\
        x2 = rk[11];\
        x3 = rk[8];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[8] = y0^rk[4];\
        rk[9] = y1^rk[5];\
        rk[10] = y2^rk[6];\
        rk[11] = y3^rk[7];\
        x0 = rk[13];\
        x1 = rk[14];\
        x2 = rk[15];\
        x3 = rk[12];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[12] = y0^rk[8];\
        rk[13] = y1^rk[9];\
        rk[14] = y2^rk[10];\
        rk[15] = y3^rk[11];\
}

#define NonLinExpansion304(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3)\
{\
        x0 = rk[17];\
        x1 = rk[18];\
        x2 = rk[19];\
        x3 = rk[16];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[16] = y0^rk[12];\
        rk[17] = y1^rk[13];\
        rk[18] = y2^rk[14];\
        rk[19] = y3^rk[15];\
	x0 = rk[21];\
        x1 = rk[22];\
        x2 = rk[23];\
        x3 = rk[20];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[20] = y0^rk[16];\
        rk[21] = y1^rk[17];\
        rk[22] = y2^rk[18];\
        rk[23] = y3^rk[19];\
        x0 = rk[25];\
        x1 = rk[26];\
        x2 = rk[27];\
        x3 = rk[24];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[24] = y0^rk[20];\
        rk[25] = y1^rk[21];\
        rk[26] = y2^rk[22];\
        rk[27] = y3^rk[23];\
        x0 = rk[29];\
        x1 = rk[30];\
        x2 = rk[31];\
        x3 = rk[28];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[28] = y0^rk[24]^counter[2];\
        rk[29] = y1^rk[25]^counter[3];\
        rk[30] = y2^rk[26]^counter[0];\
        rk[31] = y3^rk[27]^counter[1];\
}

#define NonLinExpansion432(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3)\
{\
        x0 = rk[17];\
        x1 = rk[18];\
        x2 = rk[19];\
        x3 = rk[16];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[16] = y0^rk[12];\
        rk[17] = y1^rk[13];\
        rk[18] = y2^rk[14];\
        rk[19] = y3^rk[15];\
	x0 = rk[21];\
        x1 = rk[22];\
        x2 = rk[23];\
        x3 = rk[20];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[20] = y0^rk[16];\
        rk[21] = y1^rk[17];\
        rk[22] = y2^rk[18];\
        rk[23] = y3^rk[19];\
        x0 = rk[25];\
        x1 = rk[26];\
        x2 = rk[27];\
        x3 = rk[24];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[24] = y0^rk[20]^counter[1];\
        rk[25] = y1^rk[21]^counter[0];\
        rk[26] = y2^rk[22]^counter[3];\
        rk[27] = y3^rk[23]^counter[2];\
        x0 = rk[29];\
        x1 = rk[30];\
        x2 = rk[31];\
        x3 = rk[28];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[28] = y0^rk[24];\
        rk[29] = y1^rk[25];\
        rk[30] = y2^rk[26];\
        rk[31] = y3^rk[27];\
}

#define LinExpansion512(rk,temp0,temp1)\
{\
   for (temp0=0,temp1=25;temp0<7;temp0++,temp1++)
      rk[temp0] = rk[temp0]^rk[temp1];\
   for (temp1=0;temp0<32;temp0++,temp1++)
      rk[temp0] = rk[temp0]^rk[temp1];\
}


#define oneround(state0,state1,state2,state3,state4,state5,state6,state7,state8,state9,state10,state11,state12,state13,state14,state15,x0,x1,x2,x3,y0,y1,y2,y3,rk)\
{\
   x0 = state4^rk[0];\
   x1 = state5^rk[1];\
   x2 = state6^rk[2];\
   x3 = state7^rk[3];\
   roundAES(x0,x1,x2,x3,y0,y1,y2,y3,rk[4],rk[5],rk[6],rk[7]);\
   roundAES(y0,y1,y2,y3,x0,x1,x2,x3,rk[8],rk[9],rk[10],rk[11]);\
   roundAES(x0,x1,x2,x3,y0,y1,y2,y3,rk[12],rk[13],rk[14],rk[15]);\
   roundAESnokey(y0,y1,y2,y3,x0,x1,x2,x3);\
   state0^=x0;\
   state1^=x1;\
   state2^=x2;\
   state3^=x3;\
   x0 = state12^rk[16];\
   x1 = state13^rk[17];\
   x2 = state14^rk[18];\
   x3 = state15^rk[19];\
   roundAES(x0,x1,x2,x3,y0,y1,y2,y3,rk[20],rk[21],rk[22],rk[23]);\
   roundAES(y0,y1,y2,y3,x0,x1,x2,x3,rk[24],rk[25],rk[26],rk[27]);\
   roundAES(x0,x1,x2,x3,y0,y1,y2,y3,rk[28],rk[29],rk[30],rk[31]);\
   roundAESnokey(y0,y1,y2,y3,x0,x1,x2,x3);\
   state8^=x0;\
   state9^=x1;\
   state10^=x2;\
   state11^=x3;\
}

void E512(u32 pt[16], u32 ct[16], u32 message[32], u32 counter[4])
{
   u32 state0,state1,state,2,state3,state4,state5,state6,state7,state8,state9,state10,state11,state12,state13,state14,state15;
   u32 x0,x1,x2,x3,y0,y1,y2,y3,i,j,k;
   u32 rk[32];

   state0=pt[0]; 
   state1=pt[1]; 
   state2=pt[2]; 
   state3=pt[3];
   state4=pt[4];
   state5=pt[5];
   state6=pt[6];
   state7=pt[7];
   state8=pt[8]; 
   state9=pt[9]; 
   state10=pt[10]; 
   state11=pt[11];
   state12=pt[12];
   state13=pt[13];
   state14=pt[14];
   state15=pt[15];
   
   for (i=0;i<32;i++) rk[i]=message[i];
   oneround(state0,state1,state2,state3,state4,state5,state6,state7,state8,state9,state10,state11,state12,state13,state14,state15,x0,x1,x2,x3,y0,y1,y2,y3,rk,0);
   NonLinExpansion32(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3);
   NonLinExpansionRegular16(rk,x0,x1,x2,x3,y0,y1,y2,y3);
   oneround(state4,state5,state6,state7,state8,state9,state10,state11,state12,state13,state14,state15,state0,state1,state2,state3,x0,x1,x2,x3,y0,y1,y2,y3,rk,32);
   LinExpansion512(rk,i,j);
   oneround(state8,state9,state10,state11,state12,state13,state14,state15,state0,state1,state2,state3,state4,state5,state6,state7,x0,x1,x2,x3,y0,y1,y2,y3,rk,64);
   NonLinExpansionRegular0(rk,x0,x1,x2,x3,y0,y1,y2,y3);
   NonLinExpansionRegular16(rk,x0,x1,x2,x3,y0,y1,y2,y3);
   oneround(state12,state13,state14,state15,state0,state1,state2,state3,state4,state5,state6,state7,state8,state9,state10,state11,x0,x1,x2,x3,y0,y1,y2,y3,rk,96);
   LinExpansion512(rk,i,j);
   oneround(state0,state1,state2,state3,state4,state5,state6,state7,state8,state9,state10,state11,state12,state13,state14,state15,x0,x1,x2,x3,y0,y1,y2,y3,rk,128);
   NonLinExpansion160(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3);
   NonLinExpansionRegular16(rk,x0,x1,x2,x3,y0,y1,y2,y3);
   oneround(state4,state5,state6,state7,state8,state9,state10,state11,state12,state13,state14,state15,state0,state1,state2,state3,x0,x1,x2,x3,y0,y1,y2,y3,rk,160);

   LinExpansion512(rk,i,j);
   oneround(state8,state9,state10,state11,state12,state13,state14,state15,state0,state1,state2,state3,state4,state5,state6,state7,x0,x1,x2,x3,y0,y1,y2,y3,rk,192);
   NonLinExpansionRegular0(rk,224,x0,x1,x2,x3,y0,y1,y2,y3);
   NonLinExpansionRegular16(rk,240,x0,x1,x2,x3,y0,y1,y2,y3);
   oneround(state12,state13,state14,state15,state0,state1,state2,state3,state4,state5,state6,state7,state8,state9,state10,state11,x0,x1,x2,x3,y0,y1,y2,y3,rk,224);
   LinExpansion512(rk,i,j);
   oneround(state0,state1,state2,state3,state4,state5,state6,state7,state8,state9,state10,state11,state12,state13,state14,state15,x0,x1,x2,x3,y0,y1,y2,y3,rk,256);
   NonLinExpansionRegular0(rk,x0,x1,x2,x3,y0,y1,y2,y3);
   NonLinExpansion304(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3);
   oneround(state4,state5,state6,state7,state8,state9,state10,state11,state12,state13,state14,state15,state0,state1,state2,state3,x0,x1,x2,x3,y0,y1,y2,y3,rk,288);

   LinExpansion512(rk,i,j);
   oneround(state8,state9,state10,state11,state12,state13,state14,state15,state0,state1,state2,state3,state4,state5,state6,state7,x0,x1,x2,x3,y0,y1,y2,y3,rk,320);
   NonLinExpansionRegular0(rk,x0,x1,x2,x3,y0,y1,y2,y3);
   NonLinExpansionRegular16(rk,x0,x1,x2,x3,y0,y1,y2,y3);
   oneround(state12,state13,state14,state15,state0,state1,state2,state3,state4,state5,state6,state7,state8,state9,state10,state11,x0,x1,x2,x3,y0,y1,y2,y3,rk,352);
   LinExpansion512(rk,i,j);
   oneround(state0,state1,state2,state3,state4,state5,state6,state7,state8,state9,state10,state11,state12,state13,state14,state15,x0,x1,x2,x3,y0,y1,y2,y3,rk,384);
   NonLinExpansionRegular0(rk,x0,x1,x2,x3,y0,y1,y2,y3);
   NonLinExpansion432(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3);
   oneround(state4,state5,state6,state7,state8,state9,state10,state11,state12,state13,state14,state15,state0,state1,state2,state3,x0,x1,x2,x3,y0,y1,y2,y3,rk,416);

   ct[0]=state8; 
   ct[1]=state9; 
   ct[2]=state10; 
   ct[3]=state11;
   ct[4]=state12;
   ct[5]=state13;
   ct[6]=state14;
   ct[7]=state15;
   ct[8]=state0; 
   ct[9]=state1; 
   ct[10]=state2; 
   ct[11]=state3;
   ct[12]=state4;
   ct[13]=state5;
   ct[14]=state6;
   ct[15]=state7;

   return;
}

/* The actual compression function C_{512}                           */

void Compress512(const u8 *message_block, u8 *chaining_value, u64 counter)
{    
   u32 pt[16],ct[16];
   u32 msg_u32[32];
   u32 cnt[4];
   int i;

/* Translating all the inputs to 32-bit words                        */

   for (i=0;i<16;i++)
      pt[i]=U8TO32_LITTLE(chaining_value+4*i);

   for (i=0;i<32;i++)
      msg_u32[i]=U8TO32_LITTLE(message_block+4*i);

   cnt[1]=(u32)(counter>>32);
   cnt[0]=(u32)(counter & 0xFFFFFFFFULL);

/* Due to NIST specifications, there are no messages of length       */
/* longer than 2^64 that are expected				     */

   cnt[2]=0;
   cnt[3]=0;

/* Computing the encryption function                                 */

   E512(pt, ct, msg_u32, cnt);


/* Davies-Meyer transformation                                       */
 
   for (i=0;i<16;i++) 
       pt[i]^=ct[i]; 

/* Translating the output to 8-bit words                             */

   for(i=0; i<16; i++)
       U32TO8_LITTLE(chaining_value+i*4, pt[i]); 

   return;
}
