typedef struct { 
      u16 L1[4];
      u16 L2[2];
      u16 L3;    
      u16 L4[2];
	  u16 L5[4];
	  u16 keystreamword;   /*a 16-bit keystream word*/
} Sablier_State; 


#define C1 0x1735
#define C2 0x9cb6

#define ROTR16(x,n)   ( ((x) >> (n))  | ((x) << (16 - n)) )


u16 rc[128] = {
	0x8000, 0x0000, 0x0000, 0x0000, 0x8000, 0x000a, 0x0000, 0x0002,
	0x8000, 0x0088, 0x8000, 0x0000, 0x0000, 0x008a, 0x8000, 0x008a,
	0x8000, 0x0002, 0x0000, 0x0000, 0x8000, 0x0008, 0x0000, 0x008a,
	0x8000, 0x0082, 0x0000, 0x0082, 0x0000, 0x008a, 0x0000, 0x0000,
	0x0000, 0x0088, 0x0000, 0x0008, 0x8000, 0x000a, 0x0000, 0x000a,
	0x0000, 0x0008, 0x8000, 0x008a, 0x8000, 0x0082, 0x8000, 0x0088,
	0x0000, 0x0088, 0x8000, 0x0088, 0x8000, 0x0088, 0x0000, 0x0082,
	0x0000, 0x0080, 0x8000, 0x0008, 0x0000, 0x0008, 0x0000, 0x0082,
	0x8000, 0x0008, 0x0000, 0x000a, 0x0000, 0x000a, 0x8000, 0x0002,
	0x8000, 0x0088, 0x0000, 0x000a, 0x0000, 0x0088, 0x0000, 0x0002,
	0x0000, 0x0002, 0x0000, 0x008a, 0x0000, 0x0082, 0x8000, 0x0088,
	0x8000, 0x0082, 0x8000, 0x008a, 0x0000, 0x0000, 0x8000, 0x0082,
	0x0000, 0x000a, 0x0000, 0x0082, 0x8000, 0x000a, 0x0000, 0x0082,
	0x0000, 0x0000, 0x0000, 0x0080, 0x8000, 0x0088, 0x8000, 0x0080,
	0x8000, 0x0002, 0x0000, 0x000a, 0x0000, 0x0000, 0x0000, 0x000a,
	0x8000, 0x0008, 0x0000, 0x0080, 0x0000, 0x008a, 0x0000, 0x0002
};


void CipherL4(Sablier_State *state,Sablier_State *tem_state)
{
	u16 L41,L42,La,Lb;

	L41 = state->L4[0] ^ state->L3;
    L42 = state->L4[1] ^ state->L3;
	
	La = (L41 >> 5)|(L42 << 11);
	Lb = (L41 << 11)|(L42 >> 5);

	tem_state->L2[0] = La;
	tem_state->L2[1] = Lb;
}


void CipherL5(Sablier_State *state,Sablier_State *tem_state)
{
	u16 t[4];

	t[0] = state->L5[0] ^ state->L5[1];
	t[1] = state->L5[1] ^ state->L4[0];
	t[2] = state->L5[2] ^ state->L4[1];
	t[3] = state->L5[3] ^ state->L5[2];

	tem_state->L1[0] = t[0] ^ t[2];
	tem_state->L1[1] = t[0];
	tem_state->L1[2] = t[3];
	tem_state->L1[3] = t[1] ^ t[3];
    
	tem_state->L1[0] = ROTR16(tem_state->L1[0],1);
	tem_state->L1[1] = ROTR16(tem_state->L1[1],3);
	tem_state->L1[2] = ROTR16(tem_state->L1[2],7);
	tem_state->L1[3] = ROTR16(tem_state->L1[3],11);
}

void InitCipherL3(Sablier_State *state, Sablier_State *tem_state, u8 round)
{
	tem_state->L3 = (state->L3) ^ ( ( ~(state->L2[0]) ) & (state->L2[1]) ) ^ rc[round] ; 
    tem_state->L3 = ROTR16(tem_state->L3,13);
}

void LCipherL3_normal(Sablier_State *state,Sablier_State *tem_state)
{
	tem_state->L3 = (state->L3) ^ ( ( ~(state->L2[0]) ) & (state->L2[1]) ) ^ C1; 
	tem_state->L3 = ROTR16(tem_state->L3,13);
}

void LCipherL3_iv(Sablier_State *state,Sablier_State *tem_state)
{
	tem_state->L3 = (state->L3) ^ ( ( ~(state->L2[0]) ) & (state->L2[1]) ); 
	tem_state->L3 = ROTR16(tem_state->L3,13);
}

void HCipherL3_normal(Sablier_State *state,Sablier_State *tem_state)
{
	tem_state->L3 = (state->L3) ^ ( ( ~(state->L2[0]) ) & (state->L2[1]) ) ^ C2; 
	tem_state->L3 = ROTR16(tem_state->L3,13);
}

void HCipherL3_ad(Sablier_State *state,Sablier_State *tem_state)
{
	tem_state->L3 = (state->L3) ^ ( ( ~(state->L2[0]) ) & (state->L2[1]) ); 
	tem_state->L3 = ROTR16(tem_state->L3,13);
}

void CipherL2(Sablier_State *state,Sablier_State *tem_state)
{
	tem_state->L4[0] = state->L2[0] ^ ( ~(state->L1[0]) ) & (state->L1[1]);
	tem_state->L4[1] = state->L2[1] ^ ( ~(state->L1[2]) ) & (state->L1[3]);
}

void CipherL1(Sablier_State *state,Sablier_State *tem_state)
{
	tem_state->L5[0] = state->L1[0];
	tem_state->L5[1] = state->L1[1];
	tem_state->L5[2] = state->L1[2];
	tem_state->L5[3] = state->L1[3];
}


void OneStep(Sablier_State *state)                        /* one keystream generation step of Sablier */
{
	Sablier_State tem_state;

	memset(&tem_state, 0, sizeof(Sablier_State));

	CipherL5(state, &tem_state);
	CipherL4(state, &tem_state);
	LCipherL3_normal(state, &tem_state);
	CipherL2(state, &tem_state);
	CipherL1(state, &tem_state);

	CipherL5(&tem_state, state);
	CipherL4(&tem_state, state);
	HCipherL3_normal(&tem_state, state);
	CipherL2(&tem_state, state);
	CipherL1(&tem_state, state);

}


void InitOneStep(Sablier_State *state, u8 counter)          /* one Initialization step of Sablier: */
{
	Sablier_State tem_state;

	memset(&tem_state,0,sizeof(Sablier_State));

	CipherL5(state,&tem_state);
    CipherL4(state,&tem_state);
	InitCipherL3(state,&tem_state,counter);
	CipherL2(state,&tem_state);
	CipherL1(state,&tem_state);
	
	CipherL5(&tem_state,state);
    CipherL4(&tem_state,state);
	InitCipherL3(&tem_state,state,counter+1);
	CipherL2(&tem_state,state);
	CipherL1(&tem_state,state);
}


void OneStep_normal(Sablier_State *state)                   /* one keystream generation step of Sablier: a 16-bit keystream word is generated and stored in "state->keystreamword"; */
{
	Sablier_State tem_state;

	memset(&tem_state,0,sizeof(Sablier_State));

	CipherL5(state,&tem_state);
    CipherL4(state,&tem_state);
	LCipherL3_normal(state,&tem_state);
	CipherL2(state,&tem_state);
	CipherL1(state,&tem_state);
	
	CipherL5(&tem_state,state);
    CipherL4(&tem_state,state);
	HCipherL3_normal(&tem_state,state);
	CipherL2(&tem_state,state);
	CipherL1(&tem_state,state);

//	-------------------------------------------------

	CipherL5(state,&tem_state);
    CipherL4(state,&tem_state);
	LCipherL3_normal(state,&tem_state);
	CipherL2(state,&tem_state);
	CipherL1(state,&tem_state);
	
	CipherL5(&tem_state,state);
    CipherL4(&tem_state,state);
	HCipherL3_normal(&tem_state,state);
	CipherL2(&tem_state,state);
	CipherL1(&tem_state,state);
	
	state->keystreamword = ( state->L2[1] ^ state->L3 ^ state->L5[0] ^ state->L4[1] );
}

void OneStep_ad(Sablier_State *state)                     /* one authenticating step for the associated data */
{
	Sablier_State tem_state;

	memset(&tem_state,0,sizeof(Sablier_State));

	CipherL5(state,&tem_state);
    CipherL4(state,&tem_state);
	LCipherL3_normal(state,&tem_state);
	CipherL2(state,&tem_state);
	CipherL1(state,&tem_state);
	
	CipherL5(&tem_state,state);
    CipherL4(&tem_state,state);
	HCipherL3_ad(&tem_state,state);
	CipherL2(&tem_state,state);
	CipherL1(&tem_state,state);

//	-------------------------------------------------

	CipherL5(state,&tem_state);
    CipherL4(state,&tem_state);
	LCipherL3_normal(state,&tem_state);
	CipherL2(state,&tem_state);
	CipherL1(state,&tem_state);
	
	CipherL5(&tem_state,state);
    CipherL4(&tem_state,state);
	HCipherL3_ad(&tem_state,state);
	CipherL2(&tem_state,state);
	CipherL1(&tem_state,state);
	
	state->keystreamword = ( state->L2[1] ^ state->L3 ^ state->L5[0] ^ state->L4[1] );
}

void OneStep_iv(Sablier_State *state)                              /* one authenticating step for the iv */
{
	Sablier_State tem_state;

	memset(&tem_state,0,sizeof(Sablier_State));

	CipherL5(state,&tem_state);
    CipherL4(state,&tem_state);
	LCipherL3_iv(state,&tem_state);
	CipherL2(state,&tem_state);
	CipherL1(state,&tem_state);
	
	CipherL5(&tem_state,state);
    CipherL4(&tem_state,state);
	HCipherL3_normal(&tem_state,state);
	CipherL2(&tem_state,state);
	CipherL1(&tem_state,state);

//	-------------------------------------------------

	CipherL5(state,&tem_state);
    CipherL4(state,&tem_state);
	LCipherL3_iv(state,&tem_state);
	CipherL2(state,&tem_state);
	CipherL1(state,&tem_state);
	
	CipherL5(&tem_state,state);
    CipherL4(&tem_state,state);
	HCipherL3_normal(&tem_state,state);
	CipherL2(&tem_state,state);
	CipherL1(&tem_state,state);
	
	state->keystreamword = ( state->L2[1] ^ state->L3 ^ state->L5[0] ^ state->L4[1] );
}


void Initloading(Sablier_State *state, const unsigned char *key, const unsigned char *iv)               /*this function initialize the internal state using 80-bit key and 80-bit IV*/
{
      /*expand the key and iv into the state*/

	  state->L1[3] = ( ((u16)key[3]) << 8 ) | iv[3];
	  state->L1[2] = ( ((u16)key[2]) << 8 ) | iv[2];
	  state->L1[1] = ( ((u16)key[1]) << 8 ) | iv[1];
	  state->L1[0] = ( ((u16)key[0]) << 8 ) | iv[0];

	  state->L2[0] = ( ((u16)key[4]) << 8 ) | iv[4];
	  state->L2[1] = ( ((u16)key[5]) << 8 ) | iv[5];

	  state->L3 = ( ((u16)iv[6]) << 8 ) | ( key[3] ^ iv[7] );

	  state->L4[1] = ( ((u16)(key[7] ^ iv[2]) ) << 8 ) | (key[7] ^ iv[3]);
	  state->L4[0] = ( ((u16)(key[6] ^ iv[0]) ) << 8 ) | (key[6] ^ iv[1]);

      state->L5[3] =  ( ((u16)(key[9] ^ iv[7]) ) << 8 ) | iv[9];
	  state->L5[2] =  ( ((u16)(key[8] ^ iv[6]) ) << 8 ) | iv[9];
	  state->L5[1] =  ( ((u16)(key[9] ^ iv[5]) ) << 8 ) | iv[8];
	  state->L5[0] =  ( ((u16)(key[8] ^ iv[4]) ) << 8 ) | iv[8];
     
}

void Initialization(Sablier_State *state, const unsigned char *key, const unsigned char *iv)
{
	 u8 i;
	 
	 Initloading(state, key, iv);                                    /*update the cipher for 64 rounds without generating output*/ 
     for (i = 0; i < 128; i+=2)InitOneStep(state,i);
	  
}




