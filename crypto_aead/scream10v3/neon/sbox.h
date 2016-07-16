/* Scream S-box */

#define SBOX(X) do {					\
    /* Temporary variables */				\
    __typeof(X[0]) __a, __b, __c, __d;			\
    /* APN function from SAC paper */			\
    __a   = (X[1] & X[2]) ^ X[0];			\
    __b   = (X[1] ^ X[3]);				\
    X[5] ^= __c = __a ^ X[2];				\
    X[6] ^= __a & X[3];					\
    X[7] ^= __c & __b;					\
    X[4] ^= (__c ^ X[3]) & (__b ^ X[2]);		\
    							\
    /* Class 13 */					\
    X[0] ^= __a = (X[4] & X[5]) ^ X[6];			\
    X[2] ^= __c = (X[5] | X[6]) ^ X[7];			\
    X[1] ^= __d = (  __a  & X[7]) ^ X[4];		\
    X[3] ^= __b = (  __c  & X[4]) ^ X[5];		\
    							\
    /* APN function from SAC paper (with 1 NOT) */	\
    __a   = ~(X[1] & X[2]) ^ X[0];			\
    __b   = (X[1] ^ X[3]);				\
    X[5] ^= __c = __a ^ X[2];				\
    X[6] ^= __a & X[3];					\
    X[7] ^= __c & __b;					\
    X[4] ^= (__c ^ X[3]) & (__b ^ X[2]);		\
  } while(0)

#define SBOX_Inv(X) do {				\
    /* Temporary variables */				\
    __typeof(X[0]) __a, __b, __c, __d;			\
    /* APN function from SAC paper (with 1 NOT) */	\
    __a   = ~(X[1] & X[2]) ^ X[0];			\
    __b   = (X[1] ^ X[3]);				\
    X[5] ^= __c = __a ^ X[2];				\
    X[6] ^= __a & X[3];					\
    X[7] ^= __c & __b;					\
    X[4] ^= (__c ^ X[3]) & (__b ^ X[2]);		\
    							\
    /* Class 13 */					\
    X[0] ^= __a = (X[4] & X[5]) ^ X[6];			\
    X[2] ^= __c = (X[5] | X[6]) ^ X[7];			\
    X[1] ^= __d = (  __a  & X[7]) ^ X[4];		\
    X[3] ^= __b = (  __c  & X[4]) ^ X[5];		\
    							\
    /* APN function from SAC paper */			\
    __a   = (X[1] & X[2]) ^ X[0];			\
    __b   = (X[1] ^ X[3]);				\
    X[5] ^= __c = __a ^ X[2];				\
    X[6] ^= __a & X[3];					\
    X[7] ^= __c & __b;					\
    X[4] ^= (__c ^ X[3]) & (__b ^ X[2]);		\
  } while(0)
