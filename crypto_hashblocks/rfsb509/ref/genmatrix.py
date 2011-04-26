from Crypto.Cipher import AES
from binascii import hexlify

def cpart(j,i):
  cipher = AES.new(chr(0) * 16)
  return cipher.encrypt(chr(i) + chr(j) + chr(0) * 14)

def prec(j):
  return cpart(j,0) + cpart(j,1) + cpart(j,2) + cpart(j,3)

def c(j):
  result = prec(j)
  first = chr(ord(result[0]) ^ (ord(result[63]) >> 5))
  last = chr(ord(result[63]) & 31)
  return first + result[1:63] + last

print "const unsigned char crypto_hashblocks_rfsb509_ref_matrix[16384] = {"
for j in range(256):
  print ''.join(["0x"+hexlify(i)+", " for i in c(j)])
print "};"
