/* iScream S-box */

void Class13(crypto_uint16 X[4], crypto_uint16 Y[4]) {
  crypto_uint16 a, b, c, d;
  Y[0] ^= a = (X[0] & X[1]) ^ X[2];
  Y[2] ^= c = (X[1] | X[2]) ^ X[3];
  Y[3] ^= d = (  a  & X[3]) ^ X[0];
  Y[1] ^= b = (  c  & X[0]) ^ X[1];
}

#define SBOX(x) Class13(x+4, x), Class13(x, x+4), Class13(x+4, x)
