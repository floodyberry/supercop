# takes 3 hours on a fast machine

from Crypto.Cipher import AES
from Crypto.Hash import SHA256
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

def hash(m):
  mlen = len(m)
  mpad = m
  while len(mpad) % 48 != 40:
    mpad = mpad + chr(0)
  for i in range(8):
    mpad = mpad + chr((mlen / 256**i) % 256)
  result = chr(0) * 64
  for i in range(0,len(mpad),48):
    result = rfsb509compress(result + mpad[i:i+48])
  h = SHA256.new(result)
  return h.digest()

m = []
for i in range(4096):
  h = hash(''.join(m))
  for j in range(len(m)):
    m[j] = chr(ord(m[j]) ^ ord(h[j % 32]))
  m = m + [h[0]]
h = hash(''.join(m))
  
print hexlify(h)
