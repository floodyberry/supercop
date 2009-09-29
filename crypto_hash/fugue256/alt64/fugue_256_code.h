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

// set the IMPL_TYPE to _ASM for ASM_INLINE
// set it to _OPT64 for REFERENCE CODE
// eet it to _OPT for C OPTIMIZED
//same rules hold for EXTRA_ROUND_IMPL_TYPE, though they cant be set to _ASM...yet !
// ASS_INLINE will be used in some macro names as a suiffix _ASM
// REFERENCE code as suffix _OPT64
// and   C OPTIMIZED as _OPT

/* Uncomment the desired default configuration */
#if !defined(CONFIG_ASM_INLINE) && !defined(CONFIG_C_OPTIMIZED) && !defined(CONFIG_OPT64_CODE)
//#define CONFIG_ASM_INLINE
//#define CONFIG_C_OPTIMIZED
#define CONFIG_OPT64_CODE
#endif

#ifdef CONFIG_ASM_INLINE
#define IMPL_TYPE  _ASM
#if defined(__WORDSIZE) && (__WORDSIZE==64)
#define EXTRA_ROUND_OPT64
#endif
#endif

#ifdef CONFIG_C_OPTIMIZED
#define IMPL_TYPE  _OPT
#endif

#ifdef CONFIG_OPT64_CODE
#define IMPL_TYPE  _OPT64
#define EXTRA_ROUND_OPT64
#endif

#ifdef EXTRA_ROUND_OPT64
#define EXTRA_ROUND_IMPL_TYPE  _OPT64
#else
#define EXTRA_ROUND_IMPL_TYPE  _OPT
#endif

#define FUGUE_SIZE 30
#define FUGUE_FAR 24


#define column(i) col[i]
#define row(i) row[i]


#define vector2words(rc,i) \
bytes2word(bval(rc[0],i),  bval(rc[1],i),   bval(rc[2],i),   bval(rc[3],i))

#define off(p,n) ((n+p+FUGUE_SIZE) % FUGUE_SIZE)

#define tix(p,j, input_array)							\
  state[off(p,10)] ^= state[off(p,0)];  state[off(p,0)] = ((crypto_uint32 *)input_array)[j];  \
  state[off(p,8)]  ^= state[off(p,0)];  state[off(p,1)] ^= state[off(p,FUGUE_FAR)]

#define column_mix(p)\
  state[off(p,0)] ^= state[off(p,4)];  state[off(p,1)] ^= state[off(p,5)];  state[off(p,2)] ^= state[off(p,6)];\
  state[off(p,15)] ^= state[off(p,4)];  state[off(p,16)] ^= state[off(p,5)];  state[off(p,17)] ^= state[off(p,6)]

#define print_rc_ASM
/*printf("In type 0\n");
 printf("col: %x %x %x %x \n", b0,b1,b2,b3);*/

#define print_rc_OPT
/*printf("In type 2\n");
printf("col: %x %x %x %x \n", column(0),column(1),column(2),column(3));\
printf("row: %x %x %x %x \n", row(0), row(1), row(2), row(3));*/

#define print_rc_OPT64
/*printf("In type 1\n");
printf("col: %x %x %x %x \n", column(0),column(1),column(2),column(3));\
printf("row: %x %x %x %x \n", row[0], row[1], row[2], row[3]);*/

#define shift_edi0
#define shift_edi1 "shrl $8,%%edi\n\t"
#define shift_edi2 "shrl $16,%%edi\n\t"
#define shift_edi3 "shrl $24,%%edi\n\t"

#define asm_bval4(y,c,t)\
        asm ("movl %1, %0\n\t"\
             shift_edi##c \
             "andl $255, %%edi"\
             :"=D" (t)       \
             :"m" (y)   \
             :"memory"       \
             );

#define asm_set_template(c,t) \
        asm ("movl %0, %%esi\n\t"\
             :\
             :"m" (aes_style_table[c][t])\
             :"%esi"\
             );
#define asm_xor_template(c,t) \
        asm ("xorl %0, %%esi\n\t"\
             :\
             :"m" (aes_style_table[c][t])\
             :"%esi"\
             );

#define asm_xor_xor_template(reg,c,t) \
        asm ("xorl %%" reg ", %%esi\n\t"\
             "xorl %0, %%" reg "\n\t"\
             "xorl %%" reg ",%%esi\n\t"\
             :\
             :"m" (aes_style_table[c][t])\
             :"%" reg, "%esi"\
             );

#define asm_set_set_template(reg,c,t) \
        asm ("movl %0, %%" reg "\n\t"\
             "movl %%" reg ",%%esi\n\t"\
             :\
             :"m" (aes_style_table[c][t])\
             :"%" reg, "%esi"\
             );

#define asm_set_xor_template(reg,c,t) \
        asm ("movl %0, %%" reg "\n\t"\
             "xorl %%" reg ",%%esi\n\t"\
             :\
             :"m" (aes_style_table[c][t])\
             :"%" reg, "%esi"\
             );

#define asm_xor_set_template(reg,c,t) \
        asm ("movl %0, %%esi \n\t"\
             "xorl %%esi, %%" reg "\n\t"\
             :\
             :"m" (aes_style_table[c][t])\
             :"%" reg, "%esi"\
             );
#define put_back_to_b_ASM(i) \
asm (        "movl %%esi,%0\n\t"\
             :"=m" (b##i)\
             :\
             :"memory", "%esi"\
             );

#define put_back_to_b_OPT64(i)  print_rc_OPT64;
#define put_back_to_b_OPT(i)  print_rc_OPT;

/***if define (ASS_INLINE) *****/
#define table_index_ASM(p,i,k)  asm_bval4(state[off(p,i)],k,tmp)
#define asm_template0(xs_type,k,i,tmp)  xs_type("eax",k,tmp);
#define asm_template1(xs_type,k,i,tmp)  xs_type("ebx",k,tmp);
#define asm_template2(xs_type,k,i,tmp)  xs_type("ecx",k,tmp);
#define asm_template3(xs_type,k,i,tmp)  xs_type("edx",k,tmp);

#define xor_col_ASM(k,i) asm_xor_template(k,tmp);
#define set_col_ASM(k,i) asm_set_template(k,tmp);

#define xor_row_xor_col_ASM(k,i) asm_template##k(asm_xor_xor_template, k,i,tmp);
#define xor_row_set_col_ASM(k,i) asm_template##k(asm_xor_set_template, k,i,tmp);
#define set_row_xor_col_ASM(k,i) asm_template##k(asm_set_xor_template, k,i,tmp);
#define set_row_set_col_ASM(k,i) asm_template##k(asm_set_set_template, k,i,tmp);
/********ELSE*********/
#define table_index_OPT64(p,i,k) tmp = aes_style_table[k][bval(state[off(p,i)],k)]
#define xor_col_OPT64(k,i) column(i) ^= tmp;
#define set_col_OPT64(k,i) column(i) = tmp;
#define xor_row_xor_col_OPT64(k,i) row[k] ^= tmp;       column(i) ^= tmp;
#define xor_row_set_col_OPT64(k,i) row[k] ^= tmp;       column(i) = tmp;
#define set_row_xor_col_OPT64(k,i) row[k] = tmp;        column(i) ^= tmp;
#define set_row_set_col_OPT64(k,i) row[k] = tmp;        column(i) = tmp;
/**********ELSE *************/
#define table_index_OPT(p,i,k) tmp = aes_style_table[k][bval(state[off(p,i)],k)]
#define xor_col_OPT(k,i) column(i) ^= tmp;
#define set_col_OPT(k,i) column(i) = tmp;
#define xor_row_xor_col_OPT(k,i) row(k) ^= tmp; column(i) ^= tmp;
#define xor_row_set_col_OPT(k,i) row(k) ^= tmp; column(i) = tmp;
#define set_row_xor_col_OPT(k,i) row(k) = tmp;  column(i) ^= tmp;
#define set_row_set_col_OPT(k,i) row(k) = tmp;  column(i) = tmp;
/*******ENDIF *******/


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

#define xor_rc_0_0(p,i,k,type) xor_short_form_i_eq_k_col_first(p,i,k,type)
#define xor_rc_0_1(p,i,k,type)  xor_short_form_i_neq_k_row_first(p,i,k,type)
#define xor_rc_0_2(p,i,k,type)  xor_short_form_i_neq_k_row_first(p,i,k,type)
#define xor_rc_0_3(p,i,k,type)  xor_short_form_i_neq_k_row_first(p,i,k,type)

#define xor_rc_1_0(p,i,k,type)  xor_short_form_i_neq_k_row_and_col_first(p,i,k,type)
#define xor_rc_1_1(p,i,k,type) xor_short_form_i_eq_k(p,i,k,type)
#define xor_rc_1_2(p,i,k,type)  xor_short_form_i_neq_k(p,i,k,type)
#define xor_rc_1_3(p,i,k,type)  xor_short_form_i_neq_k(p,i,k,type)

#define xor_rc_2_0(p,i,k,type)  xor_short_form_i_neq_k_col_first(p,i,k,type)
#define xor_rc_2_1(p,i,k,type)  xor_short_form_i_neq_k(p,i,k,type)
#define xor_rc_2_2(p,i,k,type) xor_short_form_i_eq_k(p,i,k,type)
#define xor_rc_2_3(p,i,k,type)  xor_short_form_i_neq_k(p,i,k,type)

#define xor_rc_3_0(p,i,k,type)  xor_short_form_i_neq_k_col_first(p,i,k,type)
#define xor_rc_3_1(p,i,k,type)  xor_short_form_i_neq_k(p,i,k,type)
#define xor_rc_3_2(p,i,k,type)  xor_short_form_i_neq_k(p,i,k,type)
#define xor_rc_3_3(p,i,k,type) xor_short_form_i_eq_k(p,i,k,type)

#define xor_rc_outer(p,i,type)\
   xor_rc_##i##_0(p,i,0,type);\
   xor_rc_##i##_1(p,i,1,type); xor_rc_##i##_2(p,i,2,type); xor_rc_##i##_3(p,i,3,type)

#define xor_row_and_col(p,type) \
     xor_rc_outer(p,0,type); put_back_to_b##type(0)\
     xor_rc_outer(p,1,type); put_back_to_b##type(1)\
     xor_rc_outer(p,2,type); put_back_to_b##type(2) \
     xor_rc_outer(p,3,type); put_back_to_b##type(3)




/******if defined (ASS_INLINE) *******/

#define init_row_and_col_ASM

#define load_eax(mask) "movl %%eax,%%esi\n\t"\
                 "xorl %1,%%esi\n\t"\
                 "andl $" mask ",%%esi\n\t"\
                 "movl %%esi, %%edi\n\t"
#define xor_reg(reg,c,mask) \
             "movl %%" reg ",%%esi\n\t"\
             "xorl %" c ",%%esi\n\t"\
             "andl $" mask ",%%esi\n\t"\
             "xorl %%esi, %%edi\n\t"

#define rotate_regs\
 asm("ror $8,%%eax\n\t"\
     "ror $8,%%ebx\n\t"\
     "ror $8,%%ecx\n\t"\
     "ror $8,%%edx\n\t"\
     :\
     :\
     :"%eax","%ebx","%ecx","%edx")

/* can improve this write_back_to_state listed even when p, i are variables
   and not constants. Write now, if these are variables, there is no index register
   to put them into. So, if they are variables. They can be computed, before hand
   into a temporary variable, and then loaded into %esi, and then
   the final movl edi, %0 can be movl edi, %0(%esi).
*/

#define write_back_to_state_listed(p,i,a,b,c,ddd) \
 asm(load_eax("255") \
     xor_reg("ebx","2","65280") \
     xor_reg("ecx","3","16711680")  \
     xor_reg("edx","4","4278190080")\
     "movl %%edi,%0"\
     :"=m" (state[off(p,i)])\
     :"m" (a), "m" (b), "m" (c), "m" (ddd)\
     :"%esi","%edi","%eax","%ebx","%ecx","%edx");

#define write_back_to_state_listed0(p,i) \
 write_back_to_state_listed(p,i, b0,b1,b2,b3); rotate_regs

#define write_back_to_state_listed1(p,i) \
 write_back_to_state_listed(p,i, b1,b2,b3,b0); rotate_regs

#define write_back_to_state_listed2(p,i) \
 write_back_to_state_listed(p,i, b2,b3,b0,b1); rotate_regs

#define write_back_to_state_listed3(p,i) \
 write_back_to_state_listed(p,i, b3,b0,b1,b2)

#define write_back_to_state_indexed_ASM(p,i) \
    write_back_to_state_listed##i(p,i)

/*************ELSE**********/

#define rotate_regs_OPT \
row(0)=brot(row(0),24);\
row(1)=brot(row(1),24);\
row(2)=brot(row(2),24);\
row(3)=brot(row(3),24);

#define write_back_to_state_listed_OPT(p,i,a,b,c,d) \
  state[off(p,i)]= ((row(0)^column(a)) & 0xff) ^   \
                   ((row(1)^column(b)) & 0xff00) ^ \
                   ((row(2)^column(c)) & 0xff0000) ^ \
                   ((row(3)^column(d)) & 0xff000000)


#define write_back_to_state_listed_OPT_0(p,i) \
 write_back_to_state_listed_OPT(p,i, 0,1,2,3); rotate_regs_OPT

#define write_back_to_state_listed_OPT_1(p,i) \
 write_back_to_state_listed_OPT(p,i, 1,2,3,0); rotate_regs_OPT

#define write_back_to_state_listed_OPT_2(p,i) \
 write_back_to_state_listed_OPT(p,i, 2,3,0,1); rotate_regs_OPT

#define write_back_to_state_listed_OPT_3(p,i) \
 write_back_to_state_listed_OPT(p,i, 3,0,1,2)

#define write_back_to_state_indexed_OPT(p,i) \
    write_back_to_state_listed_OPT_##i(p,i)

#define init_row_and_col_OPT64    for (i=0; i<4;i++) row[i] = column(i)=0
#define init_row_and_col_OPT    column(0)=column(1)=column(2)=column(3)=0; row(0)= row(1)= row(2)=row(3) =0;


#define xor_col_to_rows_indexed_OPT64(i) \
row[i] ^= vector2words(col,i);       row[i] = brot(row[i],((32-8*i)&31));


#define xor_col_to_rows_ASM print_rc_ASM;
#define xor_col_to_rows_OPT print_rc_OPT;
#define xor_col_to_rows_OPT64 \
  print_rc_OPT64;\
  xor_col_to_rows_indexed_OPT64(0);  xor_col_to_rows_indexed_OPT64(1);  \
  xor_col_to_rows_indexed_OPT64(2);  xor_col_to_rows_indexed_OPT64(3);

#define write_back_to_state_indexed_OPT64(p,i) \
state[off(p,i)] = vector2words(row,i);

/**************END************/


#define write_back_to_state(p,type) \
write_back_to_state_indexed##type(p,0);write_back_to_state_indexed##type(p,1);\
write_back_to_state_indexed##type(p,2);write_back_to_state_indexed##type(p,3);

#define super_mix(ptr,type)\
 init_row_and_col##type;  \
 xor_row_and_col(ptr,type); \
 xor_col_to_rows##type; \
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
      {sub_round(((-3)*(2*((num+j)%5)+1)),EXTRA_ROUND_IMPL_TYPE); \
       sub_round(((-3)*(2*((num+j)%5)+2)),EXTRA_ROUND_IMPL_TYPE);}


#define round(j,num,in,type)						\
  tix(((-3)*2*num),j,in);						\
          empty_pretty_print(state, ptr, 30, "after tix");\
           sub_round(((-3)*(2*num+1)),type); \
            empty_update(ptr); empty_pretty_print(state, ptr, 30, "after subround 1");\
             sub_round(((-3)*(2*num+2)),type);\
              empty_update(ptr);empty_pretty_print(state, ptr, 30, "after subround 2");


#define dround(j,num,in,type)						\
  tix(((-3)*2*num),j,in);						\
          pretty_print(state, ptr, 30, "after tix");\
           sub_round(((-3)*(2*num+1)),type); \
            update(ptr); pretty_print(state, ptr, 30, "after subround 1");\
             sub_round(((-3)*(2*num+2)),type);\
              update(ptr);pretty_print(state, ptr, 30, "after subround 2");


//#define DEBUG 

#ifndef DEBUG
#define empty_pretty_print(s,a,b,c)
#define empty_update(ptr)
#else

#define empty_update(ptr) \
ptr = (ptr-3 + FUGUE_SIZE) %FUGUE_SIZE;


void empty_pretty_print (crypto_uint32 * state, int ptr, int n, char * st)
{
    int i,j;
    crypto_uint32 tmp;
    char next;

    printf("%s\n", st);
    for (i=0; i<n; i++)
    {
        tmp = state[off(ptr,i)];
        for (j=0; j<4; j++)
        {
            printf("%02x", (crypto_uint8) tmp & 0xff);
            tmp = tmp>>8;
        }
        printf(" ");
    }
    printf("\n\n");
    fflush(stdout);
    next = getchar();
}
#endif

#define update(ptr) \
ptr = (ptr-3 + FUGUE_SIZE) %FUGUE_SIZE;

void pretty_print (crypto_uint32 * state, int ptr, int n, char * st)
{
    int i,j;
    crypto_uint32 tmp;
    char next;

    printf("%s\n", st);
    for (i=0; i<n; i++)
    {
        tmp = state[off(ptr,i)];
        for (j=0; j<4; j++)
        {
            printf("%02x", (crypto_uint8) tmp & 0xff);
            tmp = tmp>>8;
        }
        printf(" ");
    }
    printf("\n\n");
    fflush(stdout);
    next = getchar();
}
