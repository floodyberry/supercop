/*********************************************************
 *
 * Filename     : fugue.c
 *
 * Originator   : Charanjit S. Jutla
 *
 * Purpose      : Optimized Implementation of Fugue for
 *                224 and 256 bit hash sizes
 *
 *********************************************************/

#include <time.h>

#define FOUR_LONG_TABLES
#include "aestab.h"


#define IMPL_TYPE  _XMM
#define EXTRA_ROUND_IMPL_TYPE  _NON_XMM

#define FUGUE_SIZE 30
#define FUGUE_FAR 24



#define cat0 t0
#define cat1 t1
#define cat2 t2
#define cat3  t3

#define off(p,n) ((n+p+FUGUE_SIZE) % FUGUE_SIZE)
#define xxx(i)     xmm_state[ ((((i) + 60)  % 60 )/4) % 8]
#define mms(p,i)   xmm_state[((15 - i - 3*( ((-1)*(p) -3)/12)) %15 ) %8]

#define _xmm_xor(a,b)   _mm_xor_si128(a,b)
#define _xmm_srli(a,b)  _mm_srli_si128(a,b)
#define _xmm_alignr(a,b,r) _mm_alignr_epi8(a,b,r)
#define _xmm_slli(a,b)  _mm_slli_si128(a,b)
#define _xmm_and(a,b)   _mm_and_si128(a,b)
#define _xmm_shuffle(a,m) _mm_shuffle_si128(a,m)
#define xor_xmm(a,b) a = _xmm_xor(a,b)
#define _xmm_slli8(a,b) a = _mm_setzero_si128(); a = _mm_unpacklo_epi64(a,b); 

#define _shift_10_odd(a,b,p)   a = (__m128i) _mm_load_ss((float const *)& b);	
#define _shift_10_even(a,b,p)  a = (__m128i) _mm_insert_ps((__m128) t2, (__m128) xmm_out, 0x2b);

#define _shift_8_odd(a,b,p)    _xmm_slli8(a, b);
#define _shift_8_even(a,b,p)   
#define _shift_1_odd(a,b,p)    a = (__m128i) _mm_insert_ps((__m128) a, (__m128) b, 0x8e);
#define _shift_1_even(a,b,p)   a = (__m128i) _mm_load_ss((float const *)& b);	


#define tix_xmm_even(p,j,in)                      \
_shift_10_even(t2,xmm_out,p);		          \
 xor_xmm(xxx(10+(p)), t2);			  \
t0 = _mm_cvtsi32_si128( (((crypto_uint32 *) in)[j]));  \
 _shift_8_even(t0,t0,p);			  \
 xor_xmm(xxx(8+(p)),t0);			  \
 _shift_1_even(t3,xxx(24+(p)),p);


#define tix_xmm_odd(p,j,in)                       \
 _shift_10_odd(t2,xmm_out,p);		          \
 xor_xmm(xxx(10+(p)), t2);			  \
  t0 = _mm_cvtsi32_si128( (((crypto_uint32 *) in)[j])); 	\
_shift_8_odd(t2,t0,p);			          \
 xor_xmm(xxx(8+(p)),t2);		          \
 _shift_1_odd(t3,xxx(24+(p)),p);		  


#define tix(p,j,in)							\
  state[off(p,10)] ^= state[off(p,0)];  state[off(p,0)] = ((crypto_uint32 *)in)[j];  \
  state[off(p,8)]  ^= state[off(p,0)];  state[off(p,1)] ^= state[off(p,FUGUE_FAR)]
//------------------------------------------------------------------------------------------------------------------


#define cmix_even_1(p) \
  tmp_state = t3;\
xmm_out   = _xmm_srli(xmm_out,4);                            \
xmm_in    = _xmm_alignr(xxx(30+2+(p)), xxx(30+(p)), 12);      \
tmp_state = _xmm_xor(xmm_out,tmp_state);     /*set tmp state */      \
xmm_in    = _xmm_xor(xmm_in,tmp_state);   /* cmix- back*/	\
  t1 = _mm_cvtepu8_epi16(xmm_in);					\
t0        = (__m128i) _mm_insert_ps( (__m128) t0, (__m128) xmm_in, 0x90);	 \
  t0 = _mm_cvtepu8_epi16(t0);					\
            xor_xmm(xxx(15+(p)), tmp_state); /*cmix-forward */
     //1,2,3 in xmm_in,  0 in t0 
     //tmp_state has temp state 0: Z321

#define cmix_even_2(p) \
mms(p,0)  = _xmm_alignr(tmp_state,xmm_out,12);  /*fixprevstate */ \
tmp_state = _xmm_srli(xmm_out,4);              /*set temp state */\
xmm_in    = _xmm_xor(tmp_state, xxx(30+(p)));      /*cmix-back */ \
  t1 = _mm_cvtepu8_epi16(xmm_in);					\
  t0 = (__m128i) _mm_insert_ps( (__m128) xmm_out, (__m128) xmm_in, 0x90);	 \
  t0 = _mm_cvtepu8_epi16(t0);					\
               \
t2 = (__m128i) _mm_insert_ps((__m128) xmm_out,(__m128) t2,0x1);	\
             xor_xmm(xxx(15+(p)), t2);              /*cmix-fwd */ \

     //1,2,3 in xmm_in,  0 in t0 
     //tmp_state has temp state 14: Z 0 29 28

#define cmix_odd_1(p) \
t2 = xmm_out ; \
xmm_out  = _xmm_srli(xmm_out,4);            \
xmm_in   = _xmm_srli(xxx(30+(p)),4);				  \
mms(p,1) = _xmm_alignr(tmp_state,t2,8);     /*fixprevstate*/ \
tmp_state=_xmm_xor(xmm_out,t3);               /*set temp state */ \
                                 \
t2       =  (__m128i) _mm_insert_ps((__m128) t2, (__m128) t2, 0xce); 	\
xmm_in   = _xmm_xor(xmm_in, tmp_state);        /*cmix-back*/ \
t1 = _mm_cvtepu8_epi16(xmm_in);					\
t0        = (__m128i) _mm_insert_ps( (__m128) t0, (__m128) xmm_in, 0x90);	 \
t0        = _mm_cvtepu8_epi16(t0);					\
          \
xfr      = tmp_state;		  \
         xor_xmm(xxx(15+2+(p)),t2) ;			   \

	  /* cmix fwd  delayed in xfr*/


#define cmix_odd_2(p) \
xmm_out1  = xmm_out; \
xmm_out1   = _xmm_srli(xmm_out1,4);          \
xmm_in    = _xmm_alignr(xxx(30+2+(p)),xxx(30+(p)),8);	   	\
xmm_in    = _xmm_xor(xmm_in, xmm_out1);       \
  t1 = _mm_cvtepu8_epi16(xmm_in);					\
t0 = (__m128i) _mm_insert_ps( (__m128) xmm_out, (__m128) xmm_in, 0x90);	 \
t0 = _mm_cvtepu8_epi16(t0);					\
                               \
mms(p,2)  = _xmm_alignr(tmp_state,xmm_out,4);\
                                  \
t2        = _xmm_alignr(xfr,xmm_out,8);			\
t3        = (__m128i) _mm_insert_ps((__m128) t3, (__m128) xmm_out, 0x77);	 \
          xor_xmm(xxx(15+(p)), t3) ;		\
          xor_xmm(xxx(15+2+(p)), t2)    ;   



#define column_mix(p)\
  state[off(p,0)] ^= state[off(p,4)];  state[off(p,1)] ^= state[off(p,5)];  state[off(p,2)] ^= state[off(p,6)];\
  state[off(p,15)] ^= state[off(p,4)];  state[off(p,16)] ^= state[off(p,5)];  state[off(p,17)] ^= state[off(p,6)]

//-----------------------------------------------------------------------------------------------------------
#define load_long_aes(p,i,k) \
  xmm_out = _mm_load_si128( (__m128i const *) &(aes_style_table[(6-i+k)%4][4*bval(tmp,k)]));

#define load_long_ext(p,i,k) \
  xmm_out = _mm_load_si128( (__m128i const *) &(aes_style_table[(6-i+k)%4][_mm_cvtsi128_si32(t0)]));

#define xor_long_aes(p,i,k) \
  xmm_out = _mm_xor_si128(xmm_out,_mm_load_si128( (__m128i const *) &(aes_style_table[(6-i+k)%4][4*bval(tmp,k)]))); \

#define xor_long_ext(p,i,k) \
  xmm_out = _mm_xor_si128(xmm_out,_mm_load_si128( (__m128i const *) &(aes_style_table[(6-i+k)%4][_mm_cvtsi128_si32(t##k)]))); 



#define xor_rc_outer_NON_XMM(p,i)\
    tmp = state[off(p,i)]; \
    xor_long_aes(p,i,0);    \
    xor_long_aes(p,i,1);     \
    xor_long_aes(p,i,2);     \
    xor_long_aes(p,i,3);

#define xor_rc_outer1_NON_XMM(p,i) xor_rc_outer_NON_XMM(p,i)
#define xor_rc_outer2_NON_XMM(p,i) xor_rc_outer_NON_XMM(p,i)
#define xor_rc_outer0_NON_XMM(p,i) xor_rc_outer_NON_XMM(p,i)

#define xor_rc_outer2_XMM(p,i)\


#define extract_xor(t,out,i,k,j)    \
  out =  _mm_xor_si128(out, \
           _mm_load_si128( (__m128i const *) &(aes_style_table[(6-i+k)%4] \
	   [_mm_extract_epi16(t,j)]))); 

#define extract_load(t,out,i,k,j)		\
  out =   \
           _mm_load_si128( (__m128i const *) &(aes_style_table[(6-i+k)%4] \
	   [_mm_extract_epi16(t,j)])); 

#define xor_rc_outer0_XMM(p,i)\
  /*  xmm_in = _xmm_srli(xmm_in,8);	*/	\
  


#define xor_rc_outer1_XMM(p,i) /*blank */   \
  extract_xor(t1,xmm_out1,1,0,4);  \
         extract_xor(t0,xmm_out,2,0,4);   \
extract_xor(t1,xmm_out1,1,1,5);  \
          extract_xor(t0,xmm_out,2,1,5);\
extract_xor(t1,xmm_out1,1,2,6);  \
          extract_xor(t0,xmm_out,2,2,6); \
extract_xor(t1,xmm_out1,1,3,7); \
         extract_xor(t0,xmm_out,2,3,7);

#define xor_rc_outer3_NON_XMM(p,i)\
    tmp = state[off(p,i)];   \
    load_long_aes(p,i,0);    \
    xor_long_aes(p,i,1);     \
    xor_long_aes(p,i,2);     \
    xor_long_aes(p,i,3);\


#define xor_rc_outer3_XMM(p,i)\
  t1 = _mm_slli_epi16(t1,2); \
  t0 = _mm_slli_epi16(t0,2); \
  extract_load(t0,xmm_out2,3,0,0);	     \
     extract_load(t1,xmm_out1, 0,0,0);    \
  extract_xor(t0,xmm_out2,3,1,1);  \
          extract_xor(t1,xmm_out1,0,1,1);  \
 extract_xor(t0,xmm_out2,3,2,2);   \
         extract_xor(t1,xmm_out1,0,2,2);  \
	 extract_xor(t0,xmm_out2, 3,3,3); \
         extract_xor(t1,xmm_out1,0,3,3);  \

#define xor_row_and_col(p,type)  xor_row_and_col##type(p)

#define xor_row_and_col_NON_XMM(p)		\
  xor_rc_outer3_NON_XMM(p,3); \
 xmm_out = _mm_alignr_epi8(xmm_out, xmm_out, 4);  \
  xor_rc_outer0_NON_XMM(p,0); \
  xmm_out = _mm_alignr_epi8(xmm_out, xmm_out,4); \
  xor_rc_outer1_NON_XMM(p,1); \
  xmm_out = _mm_alignr_epi8(xmm_out, xmm_out,4); \
  xor_rc_outer2_NON_XMM(p,2); 


#define xor_row_and_col_XMM(p)			\
xor_rc_outer3_XMM(p,3); \
   xmm_out = _mm_alignr_epi8(xmm_out2, xmm_out2, 12);  \
   xmm_out1 = _mm_alignr_epi8(xmm_out1, xmm_out1,4); \
xor_rc_outer1_XMM(p,1); \
  xmm_out1 = _mm_alignr_epi8(xmm_out1, xmm_out1,4); \
  /*  xor_rc_outer2_XMM(p,2);	*/		    \
  xmm_out = _xmm_xor(xmm_out,xmm_out1);

//------------------------------------------------------------------------------------------------------------

#define write_back_to_state_listed_0_XMM(p,i) \
  xmm_out = _mm_shuffle_epi8(xmm_out,row_shuffle_mask); 

#define write_back_to_state_listed_1_XMM(p,i) 
#define write_back_to_state_listed_2_XMM(p,i) 
#define write_back_to_state_listed_3_XMM(p,i) 
//-------------------------------------------------------------------------------------------------------------

#define rotate_regs_NON_XMM \
  t1 = _mm_srli_si128(t1, 4);\
  t2 = _mm_srli_si128(t2, 8);\
  t3 = _mm_srli_si128(t3,12);  \

#define write_back_to_state_listed_0_NON_XMM(p,i) \
  xmm_out = _mm_shuffle_epi8(xmm_out,row_shuffle_mask); \
  t1=t2=t3 = xmm_out; \
  state[off(p,i)] = _mm_cvtsi128_si32 (xmm_out);  \
  rotate_regs_NON_XMM

#define write_back_to_state_listed_1_NON_XMM(p,i) \
  state[off(p,i)] = _mm_cvtsi128_si32 (t##i);  \

#define write_back_to_state_listed_2_NON_XMM(p,i) \
  state[off(p,i)] = _mm_cvtsi128_si32 (t##i);  \


#define write_back_to_state_listed_3_NON_XMM(p,i) \
  state[off(p,i)] = _mm_cvtsi128_si32 (t##i);  

#define write_back_to_state(p,type) \
  write_back_to_state_listed_0##type(p,0); \
  write_back_to_state_listed_1##type(p,1);\
  write_back_to_state_listed_2##type(p,2);\
  write_back_to_state_listed_3##type(p,3)

#define super_mix(ptr,type)\
 xor_row_and_col(ptr,type); \
 write_back_to_state(ptr,type);

#define sub_round(ptr,type) \
             column_mix(ptr);   super_mix(ptr,type)

#define sub_round_var(ptr,type,variety)			\
             cmix##variety(ptr);   super_mix(ptr,type)


#define ror(state,n) ptr = ((ptr-n+FUGUE_SIZE) % FUGUE_SIZE)

#define cross_mix(p,cross) \
       state[off(p,4)] ^=state[off(p,0)]; \
       state[off(p,cross)] ^=state[off(p,0)]

#define final_sub_round(p,cross,n) \
        cross_mix(p,cross);\
       ror(state,n); super_mix(p,EXTRA_ROUND_IMPL_TYPE)

#define final_round2(ptr,num,c)\
    for (j=0; j<c; j++)      \
         { final_sub_round(ptr, 15,15); \
    empty_pretty_print_256(state,ptr,30,"final ROUND2 part 1");\
            final_sub_round(ptr, 16,14);\
    empty_pretty_print_256(state,ptr,30,"final ROUND2 part 1");\
	 } \
             cross_mix(ptr,15);

#define final_round1(ptr,num,c) \
    for (j=0; j<c; j++)  \
      {\
empty_pretty_print_256(state, ((-3)*(2*((num+j)%5)+1)), 30, "bef final rnd 1"); \
    sub_round(((-3)*(2*((num+j)%5)+1)),EXTRA_ROUND_IMPL_TYPE); \
empty_pretty_print_256(state, ((-3)*(2*((num+j)%5)+1)), 30, "final round 1"); \
        sub_round(((-3)*(2*((num+j)%5)+2)),EXTRA_ROUND_IMPL_TYPE);\
empty_pretty_print_256(state, ((-3)*(2*((num+j)%5)+2)), 30, "final round 2"); \
      }


#define round(j,num,in,type)			     \
  tix(((-3)*2*num),j,in);			     \
           sub_round(((-3)*(2*num+1)),type); \
             sub_round(((-3)*(2*num+2)),type);

#define e_round(j,num,in,type)			     \
          tix_xmm_even(((-3)*2*num),j,in);	       \
	  sub_round_var(((-3)*(2*num+1)),type, _even_1);  \
	  empty_print_xmm(xmm_out,"after e_round 1");     \
	  sub_round_var(((-3)*(2*num+2)),type, _even_2); \
	  empty_print_xmm(xmm_out,"after e_round 2");


#define o_round(j,num,in,type)			     \
          tix_xmm_odd(((-3)*2*num),j,in);	     \
	  sub_round_var(((-3)*(2*num+1)),type, _odd_1);	\
	  empty_print_xmm(xmm_out,"after o_round 1");     \
	  sub_round_var(((-3)*(2*num+2)),type, _odd_2); \
	  empty_print_xmm(xmm_out,"after o_round 2");         

#define update(ptr) \
ptr = (ptr-3 + FUGUE_SIZE) %FUGUE_SIZE;

#define empty_print_xmm(a,b) 
// print_xmm(a,b)

void print_xmm(__m128i xmm_var, const char * s)
{ int i;
  printf("%s: \n",s);
  for   (i=0; i<16; i++)
    printf("%x ", ((crypto_uint8 *) &xmm_var)[i]);
  printf("\n");
}

#define empty_pretty_print_256(a,b,n,st) 
//pretty_print_256(a,b,n,st)


void pretty_print_256 (crypto_uint32 * state, int ptr, int n, char * st)
{
    int i,j;
    crypto_uint32 tmp;

    printf("%s\n", st);
    for (i=0; i<n; i++)
    {
        tmp = state[off(ptr,i)];
        for (j=0; j<4; j++)
        {
            printf("%02x", (crypto_uint8)tmp);
            tmp = tmp>>8;
        }
        printf(" ");
    }
    printf("\n\n");
}
