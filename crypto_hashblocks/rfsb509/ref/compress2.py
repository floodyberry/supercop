from Crypto.Cipher import AES
from binascii import hexlify

cipher = AES.new(chr(0) * 16)

def cpart(j,i):
  return cipher.encrypt(chr(i) + chr(j) + chr(0) * 14)

def prec(j):
  return cpart(j,0) + cpart(j,1) + cpart(j,2) + cpart(j,3)

def reduce(s):
  bits = [0] * 512
  for i in range(len(s)):
    for j in range(8):
      bits[(i * 8 + j) % 509] ^= (1 & (ord(s[i]) >> j))
  return ''.join([chr(sum([bits[i * 8 + j] << j for j in range(8)])) for i in range(64)])

def xor(s,t):
  return ''.join([chr(ord(s[i])^ord(t[i])) for i in range(len(s))])
    
def rfsb509compress(m):
  result = prec(ord(m[0]))
  for i in range(1,112):
    result = xor(prec(ord(m[i])),reduce(chr(0) * 16 + result))
  return reduce(result)

print hexlify(rfsb509compress([chr(i*(i+1)*(i+2)/6 % 256) for i in range(112)]))
