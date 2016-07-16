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
#include "aestab.h"


#define IMPL_TYPE  _OPT
#define EXTRA_ROUND_IMPL_TYPE  _OPT

#define FUGUE_SIZE 30
#define FUGUE_FAR 24

#define column(i) col[i]
#define row(i) row[i]

#define uint_32t crypto_uint32
#define uint_8t crypto_uint8
#define uint_64t crypto_uint64


#define vector2words(rc,i) \
bytes2word(bval(rc[0],i),  bval(rc[1],i),   bval(rc[2],i),   bval(rc[3],i))

#define off(p,n) ((n+p+FUGUE_SIZE) % FUGUE_SIZE)

#define tix(p,j, input_array)							\
  state[off(p,4)] ^= state[off(p,0)];  state[off(p,0)] = ((uint_32t *)input_array)[j];  \
  state[off(p,14)]  ^= state[off(p,0)];   \
  state[off(p,20)]  ^= state[off(p,0)];   \
  state[off(p,8)] ^= state[off(p,1)]

/*
#define tix(p,j, input_array)							\
  state[off(p,10)] ^= state[off(p,0)];  state[off(p,0)] = ((crypto_uint32 *)input_array)[j];  \
  state[off(p,8)]  ^= state[off(p,0)];  state[off(p,1)] ^= state[off(p,FUGUE_FAR)]
*/

#define column_mix(p)\
  state[off(p,0)] ^= state[off(p,4)];  state[off(p,1)] ^= state[off(p,5)];  state[off(p,2)] ^= state[off(p,6)];\
  state[off(p,15)] ^= state[off(p,4)];  state[off(p,16)] ^= state[off(p,5)];  state[off(p,17)] ^= state[off(p,6)]


#define table_index_OPT(p,i,k) tmp = aes_style_table[k][bval(state[off(p,i)],k)]
#define xor_col_OPT(k,i) column(i) ^= tmp;
#define set_col_OPT(k,i) column(i) = tmp;
#define xor_row_xor_col_OPT(k,i) row(k) ^= tmp; column(i) ^= tmp;
#define xor_row_set_col_OPT(k,i) row(k) ^= tmp; column(i) = tmp;
#define set_row_xor_col_OPT(k,i) row(k) = tmp;  column(i) ^= tmp;
#define set_row_set_col_OPT(k,i) row(k) = tmp;  column(i) = tmp;

#define xor_short_form_i_eq_k(p,i,k,type)       \
table_index##type(p,i,k); xor_col##type(k,i)

#define xor_short_form_i_eq_k_col_first(p,i,k,type)     \
table_index##type(p,i,k);  set_col##type(k,i)

#define xor_short_form_i_neq_k(p,i,k,type)  \
table_index##type(p,i,k);   xor_row_xor_col##type(k,i)

#define xor_short_form_i_neq_k_col_first(p,i,k,type)  \
table_index##type(p,i,k); xor_row_set_col##type(k,i)

#define xor_short_form_i_neq_k_row_first(p,i,k,type)  \
table_index##type(p,i,k);  set_row_xor_col##type(k,i)

#define xor_short_form_i_neq_k_row_and_col_first(p,i,k,type)  \
table_index##type(p,i,k);   set_row_set_col##type(k,i)


#define xor_rc_3_0(p,i,k,type)  xor_short_form_i_neq_k_row_and_col_first(p,i,k,type)
#define xor_rc_3_1(p,i,k,type)  xor_short_form_i_neq_k_row_first(p,i,k,type)
#define xor_rc_3_2(p,i,k,type)  xor_short_form_i_neq_k_row_first(p,i,k,type)
#define xor_rc_3_3(p,i,k,type)  xor_short_form_i_eq_k(p,i,k,type)

//Note col 3 is being done first

#define xor_rc_0_0(p,i,k,type)  xor_short_form_i_eq_k_col_first(p,i,k,type)
#define xor_rc_0_1(p,i,k,type)  xor_short_form_i_neq_k(p,i,k,type)
#define xor_rc_0_2(p,i,k,type)  xor_short_form_i_neq_k(p,i,k,type)
#define xor_rc_0_3(p,i,k,type)  xor_short_form_i_neq_k_row_first(p,i,k,type)

#define xor_rc_1_0(p,i,k,type)  xor_short_form_i_neq_k_col_first(p,i,k,type)
#define xor_rc_1_1(p,i,k,type)  xor_short_form_i_eq_k(p,i,k,type)
#define xor_rc_1_2(p,i,k,type)  xor_short_form_i_neq_k(p,i,k,type)
#define xor_rc_1_3(p,i,k,type)  xor_short_form_i_neq_k(p,i,k,type)

#define xor_rc_2_0(p,i,k,type)  xor_short_form_i_neq_k_col_first(p,i,k,type)
#define xor_rc_2_1(p,i,k,type)  xor_short_form_i_neq_k(p,i,k,type)
#define xor_rc_2_2(p,i,k,type)  xor_short_form_i_eq_k(p,i,k,type)
#define xor_rc_2_3(p,i,k,type)  xor_short_form_i_neq_k(p,i,k,type)


#define xor_rc_outer(p,i,type)\
   xor_rc_##i##_0(p,i,0,type); xor_rc_##i##_1(p,i,1,type); xor_rc_##i##_2(p,i,2,type); xor_rc_##i##_3(p,i,3,type)

#define xor_row_and_col(p,type) \
     xor_rc_outer(p,3,type); \
     xor_rc_outer(p,0,type); \
     xor_rc_outer(p,1,type); \
     xor_rc_outer(p,2,type); \


#define rotate_regs_OPT(n)			\
row(0)=brot(row(0),n);\
row(1)=brot(row(1),n);\
row(2)=brot(row(2),n);\
row(3)=brot(row(3),n);

#define write_back_to_state_listed_OPT(p,i,a,b,c,d) \
  state[off(p,i)]= ((row(0)^column(a)) & 0xff) ^   \
                   ((row(1)^column(b)) & 0xff00) ^ \
                   ((row(2)^column(c)) & 0xff0000) ^ \
                   ((row(3)^column(d)) & 0xff000000)

#define write_back_to_state(p,type) \
  write_back_to_state_listed##type(p,0, 0,1,2,3); \
  write_back_to_state_listed##type(p,1, 1,2,3,0); rotate_regs##type(16); \
    write_back_to_state_listed##type(p,2, 2,3,0,1);rotate_regs##type(24);  \
     write_back_to_state_listed##type(p,3, 3,0,1,2)

#define super_mix(ptr,type)\
 xor_row_and_col(ptr,type); \
 write_back_to_state(ptr,type);

#define sub_round(ptr,type) \
             column_mix(ptr);   super_mix(ptr,type)

#define super_mix_convert(p,type) super_mix(p,type)

#define ror(state,n) ptr = ((ptr-n+FUGUE_SIZE) % FUGUE_SIZE)

#define cross_mix(p,cross) \
       state[off(p,4)] ^=state[off(p,0)]; \
       state[off(p,cross)] ^=state[off(p,0)]

#define final_sub_round(p,cross,n) \
        cross_mix(p,cross);\
       ror(state,n); super_mix_convert(p,EXTRA_ROUND_IMPL_TYPE)

#define final_round2(ptr,num,c)\
    for (j=0; j<c; j++)      \
         { final_sub_round(ptr, 15,15); \
            final_sub_round(ptr, 16,14);} \
             cross_mix(ptr,15);

#define final_round1(ptr,num,c) \
    for (j=0; j<c; j++)  \
      {sub_round(((-3)*(1*((num+j)%10)+1)),EXTRA_ROUND_IMPL_TYPE); }

#define empty_pretty_print(s,a,b,c)

#define round(j,num,in,type)			     \
  tix(((-3)*num),j,in);			     \
           sub_round(((-3)*(num+1)),type); 

#define update(ptr) \
ptr = (ptr-3 + FUGUE_SIZE) %FUGUE_SIZE;
