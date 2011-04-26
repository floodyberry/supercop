from Crypto.Cipher import AES
from binascii import hexlify

def cpart(j,i):
  cipher = AES.new(chr(0) * 16)
  return cipher.encrypt(chr(i) + chr(j) + chr(0) * 14)

def prec(j):
  return cpart(j,0) + cpart(j,1) + cpart(j,2) + cpart(j,3)

def reduce(s):
  bits = [0] * 512
  for i in range(len(s)):
    for j in range(8):
      bits[(i * 8 + j) % 509] ^= (1 & (ord(s[i]) >> j))
  return ''.join([chr(sum([bits[i * 8 + j] << j for j in range(8)])) for i in range(64)])

def c(m,i):
  return reduce(chr(0) * (16 * (112 - i)) + prec(m))

print "const unsigned char crypto_hashblocks_rfsb509_ref_matrix[16384] = {"
for j in range(256):
  print ''.join(["0x"+hexlify(i)+", " for i in c(j,112)])
print "};"
