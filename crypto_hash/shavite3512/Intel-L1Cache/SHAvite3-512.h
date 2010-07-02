#include "portable.h"
#include "AESround.h"
#include "SHA3api_ref.h"
 
#define NonLinExpansionRegular(rk,x0,x1,x2,x3,y0,y1,y2,y3,position)\
{\
        x0 = rk[position-31];\
        x1 = rk[position-30];\
        x2 = rk[position-29];\
        x3 = rk[position-32];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[position]   = y0^rk[position-4];\
        rk[position+1] = y1^rk[position-3];\
        rk[position+2] = y2^rk[position-2];\
        rk[position+3] = y3^rk[position-1];\
        x0 = rk[position-27];\
        x1 = rk[position-26];\
        x2 = rk[position-25];\
        x3 = rk[position-28];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[position+4] = y0^rk[position];\
        rk[position+5] = y1^rk[position+1];\
        rk[position+6] = y2^rk[position+2];\
        rk[position+7] = y3^rk[position+3];\
        x0 = rk[position-23];\
        x1 = rk[position-22];\
        x2 = rk[position-21];\
        x3 = rk[position-24];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[position+8]  = y0^rk[position+4];\
        rk[position+9]  = y1^rk[position+5];\
        rk[position+10] = y2^rk[position+6];\
        rk[position+11] = y3^rk[position+7];\
        x0 = rk[position-19];\
        x1 = rk[position-18];\
        x2 = rk[position-17];\
        x3 = rk[position-20];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[position+12] = y0^rk[position+8];\
        rk[position+13] = y1^rk[position+9];\
        rk[position+14] = y2^rk[position+10];\
        rk[position+15] = y3^rk[position+11];\
}


#define NonLinExpansion32(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3)\
{\
        x0 = rk[1];\
        x1 = rk[2];\
        x2 = rk[3];\
        x3 = rk[0];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[32] = y0^rk[28]^counter[0];\
        rk[33] = y1^rk[29]^counter[1];\
        rk[34] = y2^rk[30]^counter[2];\
        rk[35] = y3^rk[31]^~counter[3];\
	x0 = rk[5];\
        x1 = rk[6];\
        x2 = rk[7];\
        x3 = rk[4];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[36] = y0^rk[32];\
        rk[37] = y1^rk[33];\
        rk[38] = y2^rk[34];\
        rk[39] = y3^rk[35];\
        x0 = rk[9];\
        x1 = rk[10];\
        x2 = rk[11];\
        x3 = rk[8];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[40]  = y0^rk[36];\
        rk[41]  = y1^rk[37];\
        rk[42] = y2^rk[38];\
        rk[43] = y3^rk[39];\
        x0 = rk[13];\
        x1 = rk[14];\
        x2 = rk[15];\
        x3 = rk[12];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[44] = y0^rk[40];\
        rk[45] = y1^rk[41];\
        rk[46] = y2^rk[42];\
        rk[47] = y3^rk[43];\
}


#define NonLinExpansion160(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3)\
{\
        x0 = rk[1];\
        x1 = rk[2];\
        x2 = rk[3];\
        x3 = rk[0];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[32] = y0^rk[28];\
        rk[33] = y1^rk[29];\
        rk[34] = y2^rk[30];\
        rk[35] = y3^rk[31];\
	x0 = rk[5];\
        x1 = rk[6];\
        x2 = rk[7];\
        x3 = rk[4];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[36] = y0^rk[32]^counter[3];\
        rk[37] = y1^rk[33]^counter[2];\
        rk[38] = y2^rk[34]^counter[1];\
        rk[39] = y3^rk[35]^~counter[0];\
        x0 = rk[9];\
        x1 = rk[10];\
        x2 = rk[11];\
        x3 = rk[8];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[40] = y0^rk[36];\
        rk[41] = y1^rk[37];\
        rk[42] = y2^rk[38];\
        rk[43] = y3^rk[39];\
        x0 = rk[13];\
        x1 = rk[14];\
        x2 = rk[15];\
        x3 = rk[12];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[44] = y0^rk[40];\
        rk[45] = y1^rk[41];\
        rk[46] = y2^rk[42];\
        rk[47] = y3^rk[43];\
}

#define NonLinExpansion304(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3)\
{\
        x0 = rk[17];\
        x1 = rk[18];\
        x2 = rk[19];\
        x3 = rk[16];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[48] = y0^rk[44];\
        rk[49] = y1^rk[45];\
        rk[50] = y2^rk[46];\
        rk[51] = y3^rk[47];\
	x0 = rk[21];\
        x1 = rk[22];\
        x2 = rk[23];\
        x3 = rk[20];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[52] = y0^rk[48];\
        rk[53] = y1^rk[49];\
        rk[54] = y2^rk[50];\
        rk[55] = y3^rk[51];\
        x0 = rk[25];\
        x1 = rk[26];\
        x2 = rk[27];\
        x3 = rk[24];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[56] = y0^rk[52];\
        rk[57] = y1^rk[53];\
        rk[58] = y2^rk[54];\
        rk[59] = y3^rk[55];\
        x0 = rk[29];\
        x1 = rk[30];\
        x2 = rk[31];\
        x3 = rk[28];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[60] = y0^rk[56]^counter[2];\
        rk[61] = y1^rk[57]^counter[3];\
        rk[62] = y2^rk[58]^counter[0];\
        rk[63] = y3^rk[59]^~counter[1];\
}

#define NonLinExpansion432(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3)\
{\
        x0 = rk[17];\
        x1 = rk[18];\
        x2 = rk[19];\
        x3 = rk[16];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[48] = y0^rk[44];\
        rk[49] = y1^rk[45];\
        rk[50] = y2^rk[46];\
        rk[51] = y3^rk[47];\
	x0 = rk[21];\
        x1 = rk[22];\
        x2 = rk[23];\
        x3 = rk[20];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[52] = y0^rk[48];\
        rk[53] = y1^rk[49];\
        rk[54] = y2^rk[50];\
        rk[55] = y3^rk[51];\
        x0 = rk[25];\
        x1 = rk[26];\
        x2 = rk[27];\
        x3 = rk[24];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[56] = y0^rk[52]^counter[1];\
        rk[57] = y1^rk[53]^counter[0];\
        rk[58] = y2^rk[54]^counter[3];\
        rk[59] = y3^rk[55]^~counter[2];\
        x0 = rk[29];\
        x1 = rk[30];\
        x2 = rk[31];\
        x3 = rk[28];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[60] = y0^rk[56];\
        rk[61] = y1^rk[57];\
        rk[62] = y2^rk[58];\
        rk[63] = y3^rk[59];\
}

#define LinExpansion512_0(rk,j)\
{\
   for (j=0;j<7;j++)\
       rk[j]=rk[j+121]^rk[j+96];\
   for (j=7;j<32;j++)\
       rk[j]=rk[j-7]^rk[j+96];\
}

#define LinExpansion512_64(rk,j)\
{\
   for (j=64;j<96;j++)\
       rk[j]=rk[j-7]^rk[j-32];\
}


#define oneround(state0,state1,state2,state3,state4,state5,state6,state7,state8,state9,state10,state11,state12,state13,state14,state15,x0,x1,x2,x3,y0,y1,y2,y3,rk,position)\
{\
   x0 = state4^rk[position+0];\
   x1 = state5^rk[position+1];\
   x2 = state6^rk[position+2];\
   x3 = state7^rk[position+3];\
   roundAES(x0,x1,x2,x3,y0,y1,y2,y3,rk[position+4],rk[position+5],rk[position+6],rk[position+7]);\
   roundAES(y0,y1,y2,y3,x0,x1,x2,x3,rk[position+8],rk[position+9],rk[position+10],rk[position+11]);\
   roundAES(x0,x1,x2,x3,y0,y1,y2,y3,rk[position+12],rk[position+13],rk[position+14],rk[position+15]);\
   roundAESnokey(y0,y1,y2,y3,x0,x1,x2,x3);\
   state0^=x0;\
   state1^=x1;\
   state2^=x2;\
   state3^=x3;\
   x0 = state12^rk[position+16];\
   x1 = state13^rk[position+17];\
   x2 = state14^rk[position+18];\
   x3 = state15^rk[position+19];\
   roundAES(x0,x1,x2,x3,y0,y1,y2,y3,rk[position+20],rk[position+21],rk[position+22],rk[position+23]);\
   roundAES(y0,y1,y2,y3,x0,x1,x2,x3,rk[position+24],rk[position+25],rk[position+26],rk[position+27]);\
   roundAES(x0,x1,x2,x3,y0,y1,y2,y3,rk[position+28],rk[position+29],rk[position+30],rk[position+31]);\
   roundAESnokey(y0,y1,y2,y3,x0,x1,x2,x3);\
   state8^=x0;\
   state9^=x1;\
   state10^=x2;\
   state11^=x3;\
}

void E512(u32 pt[16], u32 ct[16], u32 message[32], u32 counter[4])
{
   u32 state[16];
   u32 x0,x1,x2,x3,y0,y1,y2,y3,i,j,k;
   u32 rk[32*4];

   state[0]=pt[0]; 
   state[1]=pt[1]; 
   state[2]=pt[2]; 
   state[3]=pt[3];
   state[4]=pt[4];
   state[5]=pt[5];
   state[6]=pt[6];
   state[7]=pt[7];
   state[8]=pt[8]; 
   state[9]=pt[9]; 
   state[10]=pt[10]; 
   state[11]=pt[11];
   state[12]=pt[12];
   state[13]=pt[13];
   state[14]=pt[14];
   state[15]=pt[15];
   
   for (i=0;i<32;i++) rk[i]=message[i];
   oneround(state[0],state[1],state[2],state[3],state[4],state[5],state[6],state[7],state[8],state[9],state[10],state[11],state[12],state[13],state[14],state[15],x0,x1,x2,x3,y0,y1,y2,y3,rk,0);

   for (i=0;i<3;i++) {
      if (i==0) 
         NonLinExpansion32(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3);
      if (i==1) 
         NonLinExpansion160(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3);
      if (i==2) 
         NonLinExpansionRegular(rk,x0,x1,x2,x3,y0,y1,y2,y3,32);

      if (i==2) 
         { NonLinExpansion304(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3);}
      else
         NonLinExpansionRegular(rk,x0,x1,x2,x3,y0,y1,y2,y3,48);

      oneround(state[12],state[13],state[14],state[15],state[0],state[1],state[2],state[3],state[4],state[5],state[6],state[7],state[8],state[9],state[10],state[11],x0,x1,x2,x3,y0,y1,y2,y3,rk,32);

      LinExpansion512_64(rk,j);

      oneround(state[8],state[9],state[10],state[11],state[12],state[13],state[14],state[15],state[0],state[1],state[2],state[3],state[4],state[5],state[6],state[7],x0,x1,x2,x3,y0,y1,y2,y3,rk,64);

      NonLinExpansionRegular(rk,x0,x1,x2,x3,y0,y1,y2,y3,96);
      NonLinExpansionRegular(rk,x0,x1,x2,x3,y0,y1,y2,y3,112);

      oneround(state[4],state[5],state[6],state[7],state[8],state[9],state[10],state[11],state[12],state[13],state[14],state[15],state[0],state[1],state[2],state[3],x0,x1,x2,x3,y0,y1,y2,y3,rk,96);
   
      LinExpansion512_0(rk,j);
   
      oneround(state[0],state[1],state[2],state[3],state[4],state[5],state[6],state[7],state[8],state[9],state[10],state[11],state[12],state[13],state[14],state[15],x0,x1,x2,x3,y0,y1,y2,y3,rk,0);
   }

   NonLinExpansionRegular(rk,x0,x1,x2,x3,y0,y1,y2,y3,32);
   NonLinExpansion432(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3);
   oneround(state[12],state[13],state[14],state[15],state[0],state[1],state[2],state[3],state[4],state[5],state[6],state[7],state[8],state[9],state[10],state[11],x0,x1,x2,x3,y0,y1,y2,y3,rk,32);
   

   ct[0]=state[8]; 
   ct[1]=state[9]; 
   ct[2]=state[10]; 
   ct[3]=state[11];
   ct[4]=state[12];
   ct[5]=state[13];
   ct[6]=state[14];
   ct[7]=state[15];
   ct[8]=state[0]; 
   ct[9]=state[1]; 
   ct[10]=state[2]; 
   ct[11]=state[3];
   ct[12]=state[4];
   ct[13]=state[5];
   ct[14]=state[6];
   ct[15]=state[7];

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
