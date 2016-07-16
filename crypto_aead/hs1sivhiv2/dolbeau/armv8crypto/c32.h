/*
c32.h version $Date: 2016/01/30 18:21:09 $
D. J. Bernstein
Romain Dolbeau
Public domain.
*/

/* helper */
#define vrotlq_u32(a,b) vsliq_n_u32(vshrq_n_u32(a, 32-b),a,b)

/* do 32 bytes, no xor */
    uint32x4_t x_0, x_1, x_2, x_3;
    uint32x4_t t_1;

    x_0 = vld1q_u32(x +  0);
    x_1 = vld1q_u32(x +  4);
    x_2 = vld1q_u32(x +  8);
    x_3 = vld1q_u32(x + 12);

    for (i = 0 ; i < 20 ; i += 2) {
      x_0 = vaddq_u32(x_0, x_1);
      x_3 = veorq_u32(x_3, x_0);
      x_3 = vrotlq_u32(x_3, 16);

      x_2 = vaddq_u32(x_2, x_3);
      x_1 = veorq_u32(x_1, x_2);

/*       t_1 = x_1; */
/*       x_1 = vshlq_n_u32(x_1, 12); */
/*       t_1 = vshrq_n_u32(t_1, 20); */
/*       x_1 = veorq_u32(x_1, t_1); */
      x_1 = vrotlq_u32(x_1, 12);

      x_0 = vaddq_u32(x_0, x_1);
      x_3 = veorq_u32(x_3, x_0);
      x_0 = vextq_u32(x_0, x_0, 3);
      x_3 = vrotlq_u32(x_3, 8);

      x_2 = vaddq_u32(x_2, x_3);
      x_3 = vextq_u32(x_3, x_3, 2);
      x_1 = veorq_u32(x_1, x_2);
      x_2 = vextq_u32(x_2, x_2, 1);

/*       t_1 = x_1; */
/*       x_1 = vshlq_n_u32(x_1, 7); */
/*       t_1 = vshrq_n_u32(t_1, 25); */
/*       x_1 = veorq_u32(x_1, t_1); */
      x_1 = vrotlq_u32(x_1, 7);

      x_0 = vaddq_u32(x_0, x_1);
      x_3 = veorq_u32(x_3, x_0);
      x_3 = vrotlq_u32(x_3, 16);

      x_2 = vaddq_u32(x_2, x_3);
      x_1 = veorq_u32(x_1, x_2);

/*       t_1 = x_1; */
/*       x_1 = vshlq_n_u32(x_1, 12); */
/*       t_1 = vshrq_n_u32(t_1, 20); */
/*       x_1 = veorq_u32(x_1, t_1); */
      x_1 = vrotlq_u32(x_1, 12);

      x_0 = vaddq_u32(x_0, x_1);
      x_3 = veorq_u32(x_3, x_0);
      x_0 = vextq_u32(x_0, x_0, 1);
      x_3 = vrotlq_u32(x_3, 8);

      x_2 = vaddq_u32(x_2, x_3);
      x_3 = vextq_u32(x_3, x_3, 2);
      x_1 = veorq_u32(x_1, x_2);
      x_2 = vextq_u32(x_2, x_2, 3);

/*       t_1 = x_1; */
/*       x_1 = vshlq_n_u32(x_1, 7); */
/*       t_1 = vshrq_n_u32(t_1, 25); */
/*       x_1 = veorq_u32(x_1, t_1); */
      x_1 = vrotlq_u32(x_1, 7);
    }
    x_0 = vaddq_u32(x_0, vld1q_u32(x +  0));
    x_1 = vaddq_u32(x_1, vld1q_u32(x +  4));
    vst1q_u32((u32*)(out +  0),  x_0);
    vst1q_u32((u32*)(out + 16),  x_1);

#undef vrotlq_u32
