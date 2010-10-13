#include "portable.h"
#include "AESround.h"
#include "SHA3api_ref.h"
 
#define InternalRounds512 4
#define ExternalRounds512 16
#define ExpandedMessageSize512 (ExternalRounds512*4*(InternalRounds512)*2)

#define NonLinExpansionRegular(rk,position,x0,x1,x2,x3,y0,y1,y2,y3)\
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

#define NonLinExpansion112_512(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3)\
{\
        x0 = rk[81];\
        x1 = rk[82];\
        x2 = rk[83];\
        x3 = rk[80];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[112] = y0^rk[108]^~counter[0];\
        rk[113] = y1^rk[109]^~counter[1];\
        rk[114] = y2^rk[110]^~counter[2];\
        rk[115] = y3^rk[111]^counter[3];\
	x0 = rk[85];\
        x1 = rk[86];\
        x2 = rk[87];\
        x3 = rk[84];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[116] = y0^rk[112];\
        rk[117] = y1^rk[113];\
        rk[118] = y2^rk[114];\
        rk[119] = y3^rk[115];\
        x0 = rk[89];\
        x1 = rk[90];\
        x2 = rk[91];\
        x3 = rk[88];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[120] = y0^rk[116];\
        rk[121] = y1^rk[117];\
        rk[122] = y2^rk[118];\
        rk[123] = y3^rk[119];\
        x0 = rk[93];\
        x1 = rk[94];\
        x2 = rk[95];\
        x3 = rk[92];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[124] = y0^rk[120];\
        rk[125] = y1^rk[121];\
        rk[126] = y2^rk[122];\
        rk[127] = y3^rk[123];\
}


#define NonLinExpansion160(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3)\
{\
        x0 = rk[129];\
        x1 = rk[130];\
        x2 = rk[131];\
        x3 = rk[128];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[160] = y0^rk[156];\
        rk[161] = y1^rk[157];\
        rk[162] = y2^rk[158];\
        rk[163] = y3^rk[159];\
	x0 = rk[133];\
        x1 = rk[134];\
        x2 = rk[135];\
        x3 = rk[132];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[164] = y0^rk[160]^counter[3];\
        rk[165] = y1^rk[161]^counter[2];\
        rk[166] = y2^rk[162]^counter[1];\
        rk[167] = y3^rk[163]^~counter[0];\
        x0 = rk[137];\
        x1 = rk[138];\
        x2 = rk[139];\
        x3 = rk[136];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[168] = y0^rk[164];\
        rk[169] = y1^rk[165];\
        rk[170] = y2^rk[166];\
        rk[171] = y3^rk[167];\
        x0 = rk[141];\
        x1 = rk[142];\
        x2 = rk[143];\
        x3 = rk[140];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[172] = y0^rk[168];\
        rk[173] = y1^rk[169];\
        rk[174] = y2^rk[170];\
        rk[175] = y3^rk[171];\
}

#define NonLinExpansion240(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3)\
{\
        x0 = rk[209];\
        x1 = rk[210];\
        x2 = rk[211];\
        x3 = rk[208];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[240] = y0^rk[236];\
        rk[241] = y1^rk[237];\
        rk[242] = y2^rk[238];\
        rk[243] = y3^rk[239];\
	x0 = rk[213];\
        x1 = rk[214];\
        x2 = rk[215];\
        x3 = rk[212];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[244] = y0^rk[240]^~counter[3];\
        rk[245] = y1^rk[241]^~counter[2];\
        rk[246] = y2^rk[242]^~counter[1];\
        rk[247] = y3^rk[243]^counter[0];\
        x0 = rk[217];\
        x1 = rk[218];\
        x2 = rk[219];\
        x3 = rk[216];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[248] = y0^rk[244];\
        rk[249] = y1^rk[245];\
        rk[250] = y2^rk[246];\
        rk[251] = y3^rk[247];\
        x0 = rk[221];\
        x1 = rk[222];\
        x2 = rk[223];\
        x3 = rk[220];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[252] = y0^rk[248];\
        rk[253] = y1^rk[249];\
        rk[254] = y2^rk[250];\
        rk[255] = y3^rk[251];\
}

#define NonLinExpansion304(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3)\
{\
        x0 = rk[273];\
        x1 = rk[274];\
        x2 = rk[275];\
        x3 = rk[272];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[304] = y0^rk[300];\
        rk[305] = y1^rk[301];\
        rk[306] = y2^rk[302];\
        rk[307] = y3^rk[303];\
	x0 = rk[277];\
        x1 = rk[278];\
        x2 = rk[279];\
        x3 = rk[276];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[308] = y0^rk[304];\
        rk[309] = y1^rk[305];\
        rk[310] = y2^rk[306];\
        rk[311] = y3^rk[307];\
        x0 = rk[281];\
        x1 = rk[282];\
        x2 = rk[283];\
        x3 = rk[280];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[312] = y0^rk[308];\
        rk[313] = y1^rk[309];\
        rk[314] = y2^rk[310];\
        rk[315] = y3^rk[311];\
        x0 = rk[285];\
        x1 = rk[286];\
        x2 = rk[287];\
        x3 = rk[284];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[316] = y0^rk[312]^counter[2];\
        rk[317] = y1^rk[313]^counter[3];\
        rk[318] = y2^rk[314]^counter[0];\
        rk[319] = y3^rk[315]^~counter[1];\
}

#define NonLinExpansion352(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3)\
{\
        x0 = rk[321];\
        x1 = rk[322];\
        x2 = rk[323];\
        x3 = rk[320];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[352] = y0^rk[348];\
        rk[353] = y1^rk[349];\
        rk[354] = y2^rk[350];\
        rk[355] = y3^rk[351];\
	x0 = rk[325];\
        x1 = rk[326];\
        x2 = rk[327];\
        x3 = rk[324];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[356] = y0^rk[352];\
        rk[357] = y1^rk[353];\
        rk[358] = y2^rk[354];\
        rk[359] = y3^rk[355];\
        x0 = rk[329];\
        x1 = rk[330];\
        x2 = rk[331];\
        x3 = rk[328];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[360] = y0^rk[356];\
        rk[361] = y1^rk[357];\
        rk[362] = y2^rk[358];\
        rk[363] = y3^rk[359];\
        x0 = rk[333];\
        x1 = rk[334];\
        x2 = rk[335];\
        x3 = rk[332];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[364] = y0^rk[360]^~counter[2];\
        rk[365] = y1^rk[361]^~counter[3];\
        rk[366] = y2^rk[362]^~counter[0];\
        rk[367] = y3^rk[363]^counter[1];\
}

#define NonLinExpansion432(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3)\
{\
        x0 = rk[401];\
        x1 = rk[402];\
        x2 = rk[403];\
        x3 = rk[400];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[432] = y0^rk[428];\
        rk[433] = y1^rk[429];\
        rk[434] = y2^rk[430];\
        rk[435] = y3^rk[431];\
	x0 = rk[405];\
        x1 = rk[406];\
        x2 = rk[407];\
        x3 = rk[404];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[436] = y0^rk[432];\
        rk[437] = y1^rk[433];\
        rk[438] = y2^rk[434];\
        rk[439] = y3^rk[435];\
        x0 = rk[409];\
        x1 = rk[410];\
        x2 = rk[411];\
        x3 = rk[408];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[440] = y0^rk[436]^counter[1];\
        rk[441] = y1^rk[437]^counter[0];\
        rk[442] = y2^rk[438]^counter[3];\
        rk[443] = y3^rk[439]^~counter[2];\
        x0 = rk[413];\
        x1 = rk[414];\
        x2 = rk[415];\
        x3 = rk[412];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[444] = y0^rk[440];\
        rk[445] = y1^rk[441];\
        rk[446] = y2^rk[442];\
        rk[447] = y3^rk[443];\
}

#define NonLinExpansion480(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3)\
{\
        x0 = rk[449];\
        x1 = rk[450];\
        x2 = rk[451];\
        x3 = rk[448];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[480] = y0^rk[476];\
        rk[481] = y1^rk[477];\
        rk[482] = y2^rk[478];\
        rk[483] = y3^rk[479];\
	x0 = rk[453];\
        x1 = rk[454];\
        x2 = rk[455];\
        x3 = rk[452];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[484] = y0^rk[480];\
        rk[485] = y1^rk[481];\
        rk[486] = y2^rk[482];\
        rk[487] = y3^rk[483];\
        x0 = rk[457];\
        x1 = rk[458];\
        x2 = rk[459];\
        x3 = rk[456];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[488] = y0^rk[484]^~counter[1];\
        rk[489] = y1^rk[485]^~counter[0];\
        rk[490] = y2^rk[486]^~counter[3];\
        rk[491] = y3^rk[487]^counter[2];\
        x0 = rk[461];\
        x1 = rk[462];\
        x2 = rk[463];\
        x3 = rk[460];\
        roundAESnokey(x0,x1,x2,x3,y0,y1,y2,y3);\
        rk[492] = y0^rk[488];\
        rk[493] = y1^rk[489];\
        rk[494] = y2^rk[490];\
        rk[495] = y3^rk[491];\
}

#define LinExpansion512(rk,position,temp0,temp1,temp2)\
{\
   temp0=position; temp1=position-32; temp2=position-7;\
   for (;temp1<position;temp0++,temp1++,temp2++)\
     rk[temp0] = rk[temp1]^rk[temp2];\
}


#define oneround(state0,state1,state2,state3,state4,state5,state6,state7,state8,state9,state10,state11,state12,state13,state14,state15,x0,x1,x2,x3,y0,y1,y2,y3,rk,position)\
{\
   x0 = state4^rk[position];\
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
   u32 rk[ExpandedMessageSize512];

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
   NonLinExpansion32(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3);
   NonLinExpansionRegular(rk,48,x0,x1,x2,x3,y0,y1,y2,y3);
   oneround(state[12],state[13],state[14],state[15],state[0],state[1],state[2],state[3],state[4],state[5],state[6],state[7],state[8],state[9],state[10],state[11],x0,x1,x2,x3,y0,y1,y2,y3,rk,32);
   LinExpansion512(rk,64,i,j,k);
   oneround(state[8],state[9],state[10],state[11],state[12],state[13],state[14],state[15],state[0],state[1],state[2],state[3],state[4],state[5],state[6],state[7],x0,x1,x2,x3,y0,y1,y2,y3,rk,64);
   NonLinExpansionRegular(rk,96,x0,x1,x2,x3,y0,y1,y2,y3);
   NonLinExpansion112_512(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3);
   oneround(state[4],state[5],state[6],state[7],state[8],state[9],state[10],state[11],state[12],state[13],state[14],state[15],state[0],state[1],state[2],state[3],x0,x1,x2,x3,y0,y1,y2,y3,rk,96);
   LinExpansion512(rk,128,i,j,k);
   oneround(state[0],state[1],state[2],state[3],state[4],state[5],state[6],state[7],state[8],state[9],state[10],state[11],state[12],state[13],state[14],state[15],x0,x1,x2,x3,y0,y1,y2,y3,rk,128);
   NonLinExpansion160(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3);
   NonLinExpansionRegular(rk,176,x0,x1,x2,x3,y0,y1,y2,y3);
   oneround(state[12],state[13],state[14],state[15],state[0],state[1],state[2],state[3],state[4],state[5],state[6],state[7],state[8],state[9],state[10],state[11],x0,x1,x2,x3,y0,y1,y2,y3,rk,160);
   LinExpansion512(rk,192,i,j,k);
   oneround(state[8],state[9],state[10],state[11],state[12],state[13],state[14],state[15],state[0],state[1],state[2],state[3],state[4],state[5],state[6],state[7],x0,x1,x2,x3,y0,y1,y2,y3,rk,192);
   NonLinExpansionRegular(rk,224,x0,x1,x2,x3,y0,y1,y2,y3);
   NonLinExpansion240(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3);
   oneround(state[4],state[5],state[6],state[7],state[8],state[9],state[10],state[11],state[12],state[13],state[14],state[15],state[0],state[1],state[2],state[3],x0,x1,x2,x3,y0,y1,y2,y3,rk,224);
   LinExpansion512(rk,256,i,j,k);
   oneround(state[0],state[1],state[2],state[3],state[4],state[5],state[6],state[7],state[8],state[9],state[10],state[11],state[12],state[13],state[14],state[15],x0,x1,x2,x3,y0,y1,y2,y3,rk,256);
   NonLinExpansionRegular(rk,288,x0,x1,x2,x3,y0,y1,y2,y3);
   NonLinExpansion304(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3);
   oneround(state[12],state[13],state[14],state[15],state[0],state[1],state[2],state[3],state[4],state[5],state[6],state[7],state[8],state[9],state[10],state[11],x0,x1,x2,x3,y0,y1,y2,y3,rk,288);
   LinExpansion512(rk,320,i,j,k);
   oneround(state[8],state[9],state[10],state[11],state[12],state[13],state[14],state[15],state[0],state[1],state[2],state[3],state[4],state[5],state[6],state[7],x0,x1,x2,x3,y0,y1,y2,y3,rk,320);
   NonLinExpansion352(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3);
   NonLinExpansionRegular(rk,368,x0,x1,x2,x3,y0,y1,y2,y3);
   oneround(state[4],state[5],state[6],state[7],state[8],state[9],state[10],state[11],state[12],state[13],state[14],state[15],state[0],state[1],state[2],state[3],x0,x1,x2,x3,y0,y1,y2,y3,rk,352);
   LinExpansion512(rk,384,i,j,k);
   oneround(state[0],state[1],state[2],state[3],state[4],state[5],state[6],state[7],state[8],state[9],state[10],state[11],state[12],state[13],state[14],state[15],x0,x1,x2,x3,y0,y1,y2,y3,rk,384);
   NonLinExpansionRegular(rk,416,x0,x1,x2,x3,y0,y1,y2,y3);
   NonLinExpansion432(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3);
   oneround(state[12],state[13],state[14],state[15],state[0],state[1],state[2],state[3],state[4],state[5],state[6],state[7],state[8],state[9],state[10],state[11],x0,x1,x2,x3,y0,y1,y2,y3,rk,416);
   LinExpansion512(rk,448,i,j,k);
   oneround(state[8],state[9],state[10],state[11],state[12],state[13],state[14],state[15],state[0],state[1],state[2],state[3],state[4],state[5],state[6],state[7],x0,x1,x2,x3,y0,y1,y2,y3,rk,448);
   NonLinExpansion480(rk,counter,x0,x1,x2,x3,y0,y1,y2,y3);
   NonLinExpansionRegular(rk,496,x0,x1,x2,x3,y0,y1,y2,y3);
   oneround(state[4],state[5],state[6],state[7],state[8],state[9],state[10],state[11],state[12],state[13],state[14],state[15],state[0],state[1],state[2],state[3],x0,x1,x2,x3,y0,y1,y2,y3,rk,480);
   
   ct[0]=state[0]; 
   ct[1]=state[1]; 
   ct[2]=state[2]; 
   ct[3]=state[3];
   ct[4]=state[4];
   ct[5]=state[5];
   ct[6]=state[6];
   ct[7]=state[7];
   ct[8]=state[8]; 
   ct[9]=state[9]; 
   ct[10]=state[10]; 
   ct[11]=state[11];
   ct[12]=state[12];
   ct[13]=state[13];
   ct[14]=state[14];
   ct[15]=state[15];

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
