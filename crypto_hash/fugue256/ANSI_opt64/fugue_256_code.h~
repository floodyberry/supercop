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


#define vector2words(rc,i) \
bytes2word(bval(rc[0],i),  bval(rc[1],i),   bval(rc[2],i),   bval(rc[3],i))

#define off(p,n) ((n+p+2*FUGUE_SIZE) % FUGUE_SIZE)

#define tix(p,j,in)							\
  state[off(p,10)] ^= tmp_zero;  state[off(p,0)] = ((crypto_uint32 *)in)[j];  \
  state[off(p,8)]  ^= state[off(p,0)];  state[off(p,1)] ^= state[off(p,FUGUE_FAR)]


#define htix(p,j) \
  tmp_in = *(crypto_uint64 *) &((crypto_uint32 *)in)[j];	\
  state[off(p,1)] ^= state[off(p,FUGUE_FAR)];	\
  state[off(p,10)] ^= tmp_zero;  \
  state[off(p,8)]  ^= state[off(p,0)] = (crypto_uint32) tmp_in;		\
  state[off(p,-3)] ^= state[off(p,1)];  state[off(p,-2)] ^= state[off(p,2)];   \
state[off(p,-1)] ^= state[off(p,3)];\
  state[off(p,12)] ^= state[off(p,1)];  state[off(p,13)] ^= state[off(p,2)];   \
state[off(p,14)] ^= state[off(p,3)];\
  tmp_in = (crypto_uint32) (tmp_in >>32); 


#define gtix(p,j) \
  state[off(p,8)] ^= state[off(p,0)] = (crypto_uint32) (tmp_in);  \
  state[off(p,10)] ^= tmp_zero;  \
  state[off(p,1)]  ^= state[off(p,FUGUE_FAR)]


#define column_mix(p)\
  state[off(p,0)] ^= state[off(p,4)];   state[off(p,1)] ^= state[off(p,5)];   state[off(p,2)] ^= state[off(p,6)];\
  state[off(p,15)] ^= state[off(p,4)];  state[off(p,16)] ^= state[off(p,5)];  state[off(p,17)] ^= state[off(p,6)]



  //  *(uint_64t*) &(state[off(p,0)]) ^= *(uint_64t *) &(state[off(p,4)]);  state[off(p,2)] ^= state[off(p,6)]; \
  //  *(uint_64t*) &(state[off(p,15)]) ^= *(uint_64t*) &(state[off(p,4)]);  state[off(p,17)] ^= state[off(p,6)]


#define print_rc_OPT
/*printf("In type 2\n");
printf("col: %x %x %x %x \n", column(0),column(1),column(2),column(3));\
printf("row: %x %x %x %x \n", row(0), row(1), row(2), row(3));*/


#define put_back_to_b_OPT(i)  print_rc_OPT;


#define table_index_OPT(p,i,k) tmp = aes_style_table[k][bval(state[off(p,i)],k)]
#define xor_col_OPT(p,k,i) column(i) ^=  aes_style_table[k][bval(state[off(p,i)],k)]
#define set_col_OPT(p,k,i) column(i)  =  aes_style_table[k][bval(state[off(p,i)],k)]
#define xor_row_xor_col_OPT(p,k,i) row(k) ^= tmp; column(i) ^= tmp;
#define xor_row_set_col_OPT(p,k,i) row(k) ^= column(i) = aes_style_table[k][bval(state[off(p,i)],k)]
#define set_row_xor_col_OPT(p,k,i) column(i) ^= row(k) = aes_style_table[k][bval(state[off(p,i)],k)]
#define set_row_set_col_OPT(p,k,i) row(k) = column(i)  = aes_style_table[k][bval(state[off(p,i)],k)]


#define xor_short_form_i_eq_k(p,i,k,type)       \
  /*table_index##type(p,i,k);*/ xor_col##type(p,k,i)

#define xor_short_form_i_eq_k_col_first(p,i,k,type)     \
  /* table_index##type(p,i,k);*/  set_col##type(p,k,i)

#define xor_short_form_i_neq_k(p,i,k,type)  \
  table_index##type(p,i,k);   xor_row_xor_col##type(p,k,i)

#define xor_short_form_i_neq_k_col_first(p,i,k,type)  \
  /*  table_index##type(p,i,k);*/ xor_row_set_col##type(p,k,i)

#define xor_short_form_i_neq_k_row_first(p,i,k,type)  \
  /* table_index##type(p,i,k);*/  set_row_xor_col##type(p,k,i)

#define xor_short_form_i_neq_k_row_and_col_first(p,i,k,type)  \
  /* table_index##type(p,i,k);*/   set_row_set_col##type(p,k,i)

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
   xor_rc_##i##_0(p,i,0,type);\
   xor_rc_##i##_1(p,i,1,type); xor_rc_##i##_2(p,i,2,type); xor_rc_##i##_3(p,i,3,type)

#define xor_row_and_col(p,type) \
     xor_rc_outer(p,3,type); \
     xor_rc_outer(p,0,type); \
     xor_rc_outer(p,1,type); \
     xor_rc_outer(p,2,type); 

#define rotate_regs_OPT \
row(0)=shift_right64(row(0),8);\
row(1)=shift_right64(row(1),8);\
row(2)=shift_right64(row(2),8);\
row(3)=shift_left64 (row(3),24);



#define write_back_to_state_listed_OPT_0(p,i) \
  col0 = ((crypto_uint32) column(0)) ^ ((crypto_uint64)column(2) <<32);	\
  col1 = ((crypto_uint32) column(1)) ^ ((crypto_uint64)column(3) <<32); \
  col2 = ((crypto_uint32) column(2)) ^ ((crypto_uint64)column(0) <<32);	\
  col3 = ((crypto_uint32) column(3)) ^ ((crypto_uint64)column(1) <<32);	\
  col0col2  = ((row(0) ^ col0) & 0xff000000ffULL) ^	\
              ((row(1) ^ col1) & 0xff000000ff00ULL) ^	\
              ((row(2) ^ col2) & 0xff000000ff0000ULL) ^		\
              ((row(3) ^ col3) & 0xff000000ff000000ULL);	\
  rotate_regs_OPT 


#define write_back_to_state_listed_OPT_1(p,i) \
  col1col3  = ((row(0) ^ col1) & 0xff000000ffULL) ^    \
              ((row(1) ^ col2) & 0xff000000ff00ULL) ^	\
              ((row(2) ^ col3) & 0xff000000ff0000ULL) ^		\
              ((row(3) ^ col0) & 0xff000000ff000000ULL);


#define write_back_to_state_listed_OPT_2(p,i) \
  tmp_zero = (crypto_uint32) col0col2; \
  state[off(p,2)] = (crypto_uint32) (col0col2 >>32);
  

#define write_back_to_state_listed_OPT_3(p,i) \
  state[off(p,1)] = (crypto_uint32) col1col3; \
  state[off(p,3)] = (crypto_uint32) (col1col3 >>32);

#define write_back_to_state_indexed_OPT(p,i) \
    write_back_to_state_listed_OPT_##i(p,i)


/**************END************/

#define write_back_to_state(p,type) \
write_back_to_state_indexed##type(p,0);write_back_to_state_indexed##type(p,1);\
write_back_to_state_indexed##type(p,2);write_back_to_state_indexed##type(p,3);

#define super_mix(ptr,type)\
 xor_row_and_col(ptr,type); \
 write_back_to_state(ptr,type);

#define adjust_tmp_zero(ptr,type)  state[off(ptr,0)] = tmp_zero;


#define sub_round(ptr,type) \
             column_mix(ptr);   super_mix(ptr,type)

#define xsub_round(ptr,type) \
  column_mix(ptr);   super_mix(ptr,type); adjust_tmp_zero(ptr,type);

#define hsub_round(ptr,type) \
               super_mix(ptr,type); adjust_tmp_zero(ptr,type);

#define super_mix_convert(p,type) super_mix(p,type); adjust_tmp_zero(p,type);

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
           final_sub_round(ptr, 16,14); \
           empty_pretty_print(state, ptr, 30, "after fr2 subround 2"); \
           } \
           cross_mix(ptr,15);

#define final_round1(ptr,num,c) \
    for (j=0; j<c; j++)  \
      {xsub_round(((-3)*(2*((num+j)%5)+1)),EXTRA_ROUND_IMPL_TYPE);  \
        empty_update(ptr);empty_pretty_print(state, ptr, 30, "after fr1 subround 1"); \
       xsub_round(((-3)*(2*((num+j)%5)+2)),EXTRA_ROUND_IMPL_TYPE);  \
        empty_update(ptr);empty_pretty_print(state, ptr, 30, "after fr1 subround 2"); \
}



#define round(j,num,in,type)  \
  tix(((-3)*2*num),j,in);			      \
           xsub_round(((-3)*(2*num+1)),type); \
              empty_update(ptr); empty_pretty_print(state, ptr, 30, "after subround 1");\
             sub_round(((-3)*(2*num+2)),type); \
              empty_update(ptr); empty_pretty_print(state, ptr, 30, "after subround 2");



#define hround(j,num,type) \
         htix(((-3)*2*num),j); \
           hsub_round(((-3)*(2*num+1)),type); \
              empty_update(ptr); empty_pretty_print(state, ptr, 30, "after h  subround 1");\
             sub_round(((-3)*(2*num+2)),type); \
              empty_update(ptr); empty_pretty_print(state, ptr, 30, "after h subround 2");


#define ground(j,num,type) \
         gtix(((-3)*2*num),j); \
	 xsub_round(((-3)*(2*num+1)),type); \
         empty_update(ptr); empty_pretty_print(state, ptr, 30, "after g subround 1");\
           sub_round(((-3)*(2*num+2)),type); \
             empty_update(ptr); empty_pretty_print(state, ptr, 30, "afterg  subround 2");



#define empty_update(ptr) 
//ptr = (ptr-3 + FUGUE_SIZE) %FUGUE_SIZE;


#define update(ptr) \
ptr = (ptr-3 + FUGUE_SIZE) %FUGUE_SIZE;



#define empty_pretty_print(s,a,b,c)
