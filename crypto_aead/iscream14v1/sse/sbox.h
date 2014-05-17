/* iScream S-box */

#define Class13(A,B,C,D,X,Y,Z,T) do {		\
    __typeof(A) __a, __b, __c, __d;		\
    __a  = A & B;				\
    __a ^= C;					\
    __c  = B | C;				\
    __c ^=D;					\
    __d  = __a & D;				\
    __d ^= A;					\
    __b  = __c & A;				\
    __b ^= B;					\
    X ^= __a;					\
    Y ^= __b;					\
    Z ^= __c;					\
    T ^= __d;					\
  } while (0)

#define SBOX(x) do {						\
    Class13(x[4], x[5], x[6], x[7], x[0], x[1], x[2], x[3]);	\
    Class13(x[0], x[1], x[2], x[3], x[4], x[5], x[6], x[7]);	\
    Class13(x[4], x[5], x[6], x[7], x[0], x[1], x[2], x[3]);	\
  } while(0)
