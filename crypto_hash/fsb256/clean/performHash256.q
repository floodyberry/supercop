# Author: Peter Schwabe
# Public domain
# 2009-06-02

int64 statep

input statep

int64 bidx
int64 k
int64 l
int64 index
int64 i
int64 temp
int64 bufferp
int64 syndromep
int64 t0
int64 t1
int64 t2
int64 t3

int6464 s0
int6464 s1
int6464 s2
int6464 s3
int6464 s4
int6464 s5
int6464 s6
int6464 s7

int6464 s0t
int6464 s1t
int6464 s2t
int6464 s3t
int6464 s4t
int6464 s5t
int6464 s6t
int6464 s7t
enter performHash256

syndromep = *(uint64 *)(statep + 0)
bufferp = *(uint64 *)(statep + 16)

i = 0
s0 = 0
s1 = 0
s2 = 0
s3 = 0
s4 = 0
s5 = 0
s6 = 0
s7 = 0

  # BEGIN MACRO xor1024
  index = 0
  (uint8) index ^= *(uint8 *)(syndromep + 0)
  
  k = 0
  l = 10
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 16384
  (uint8) index ^= *(uint8 *)(syndromep + 1)
  
  k = 0
  l = 4
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 32768
  (uint8) index ^= *(uint8 *)(syndromep + 2)
  
  k = 1
  l = 6
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 49152
  (uint8) index ^= *(uint8 *)(syndromep + 3)
  
  k = 2
  l = 8
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 65536
  (uint8) index ^= *(uint8 *)(syndromep + 4)
  
  k = 3
  l = 10
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 81920
  (uint8) index ^= *(uint8 *)(syndromep + 5)
  
  k = 3
  l = 4
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 98304
  (uint8) index ^= *(uint8 *)(syndromep + 6)
  
  k = 4
  l = 6
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 114688
  (uint8) index ^= *(uint8 *)(syndromep + 7)
  
  k = 5
  l = 8
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 131072
  (uint8) index ^= *(uint8 *)(syndromep + 8)
  
  k = 6
  l = 10
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 147456
  (uint8) index ^= *(uint8 *)(syndromep + 9)
  
  k = 6
  l = 4
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 163840
  (uint8) index ^= *(uint8 *)(syndromep + 10)
  
  k = 7
  l = 6
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 180224
  (uint8) index ^= *(uint8 *)(syndromep + 11)
  
  k = 8
  l = 8
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 196608
  (uint8) index ^= *(uint8 *)(syndromep + 12)
  
  k = 9
  l = 10
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 212992
  (uint8) index ^= *(uint8 *)(syndromep + 13)
  
  k = 9
  l = 4
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 229376
  (uint8) index ^= *(uint8 *)(syndromep + 14)
  
  k = 10
  l = 6
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 245760
  (uint8) index ^= *(uint8 *)(syndromep + 15)
  
  k = 11
  l = 8
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 262144
  (uint8) index ^= *(uint8 *)(syndromep + 16)
  
  k = 12
  l = 10
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 278528
  (uint8) index ^= *(uint8 *)(syndromep + 17)
  
  k = 12
  l = 4
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 294912
  (uint8) index ^= *(uint8 *)(syndromep + 18)
  
  k = 13
  l = 6
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 311296
  (uint8) index ^= *(uint8 *)(syndromep + 19)
  
  k = 14
  l = 8
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 327680
  (uint8) index ^= *(uint8 *)(syndromep + 20)
  
  k = 15
  l = 10
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 344064
  (uint8) index ^= *(uint8 *)(syndromep + 21)
  
  k = 15
  l = 4
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 360448
  (uint8) index ^= *(uint8 *)(syndromep + 22)
  
  k = 16
  l = 6
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 376832
  (uint8) index ^= *(uint8 *)(syndromep + 23)
  
  k = 17
  l = 8
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 393216
  (uint8) index ^= *(uint8 *)(syndromep + 24)
  
  k = 18
  l = 10
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 409600
  (uint8) index ^= *(uint8 *)(syndromep + 25)
  
  k = 18
  l = 4
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 425984
  (uint8) index ^= *(uint8 *)(syndromep + 26)
  
  k = 19
  l = 6
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 442368
  (uint8) index ^= *(uint8 *)(syndromep + 27)
  
  k = 20
  l = 8
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 458752
  (uint8) index ^= *(uint8 *)(syndromep + 28)
  
  k = 21
  l = 10
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 475136
  (uint8) index ^= *(uint8 *)(syndromep + 29)
  
  k = 21
  l = 4
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 491520
  (uint8) index ^= *(uint8 *)(syndromep + 30)
  
  k = 22
  l = 6
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 507904
  (uint8) index ^= *(uint8 *)(syndromep + 31)
  
  k = 23
  l = 8
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 524288
  (uint8) index ^= *(uint8 *)(syndromep + 32)
  
  k = 24
  l = 10
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 540672
  (uint8) index ^= *(uint8 *)(syndromep + 33)
  
  k = 24
  l = 4
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 557056
  (uint8) index ^= *(uint8 *)(syndromep + 34)
  
  k = 25
  l = 6
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 573440
  (uint8) index ^= *(uint8 *)(syndromep + 35)
  
  k = 26
  l = 8
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 589824
  (uint8) index ^= *(uint8 *)(syndromep + 36)
  
  k = 27
  l = 10
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 606208
  (uint8) index ^= *(uint8 *)(syndromep + 37)
  
  k = 27
  l = 4
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 622592
  (uint8) index ^= *(uint8 *)(syndromep + 38)
  
  k = 28
  l = 6
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 638976
  (uint8) index ^= *(uint8 *)(syndromep + 39)
  
  k = 29
  l = 8
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 655360
  (uint8) index ^= *(uint8 *)(syndromep + 40)
  
  k = 30
  l = 10
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 671744
  (uint8) index ^= *(uint8 *)(syndromep + 41)
  
  k = 30
  l = 4
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 688128
  (uint8) index ^= *(uint8 *)(syndromep + 42)
  
  k = 31
  l = 6
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 704512
  (uint8) index ^= *(uint8 *)(syndromep + 43)
  
  k = 32
  l = 8
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 720896
  (uint8) index ^= *(uint8 *)(syndromep + 44)
  
  k = 33
  l = 10
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 737280
  (uint8) index ^= *(uint8 *)(syndromep + 45)
  
  k = 33
  l = 4
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 753664
  (uint8) index ^= *(uint8 *)(syndromep + 46)
  
  k = 34
  l = 6
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 770048
  (uint8) index ^= *(uint8 *)(syndromep + 47)
  
  k = 35
  l = 8
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 786432
  (uint8) index ^= *(uint8 *)(syndromep + 48)
  
  k = 36
  l = 10
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 802816
  (uint8) index ^= *(uint8 *)(syndromep + 49)
  
  k = 36
  l = 4
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 819200
  (uint8) index ^= *(uint8 *)(syndromep + 50)
  
  k = 37
  l = 6
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 835584
  (uint8) index ^= *(uint8 *)(syndromep + 51)
  
  k = 38
  l = 8
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 851968
  (uint8) index ^= *(uint8 *)(syndromep + 52)
  
  k = 39
  l = 10
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 868352
  (uint8) index ^= *(uint8 *)(syndromep + 53)
  
  k = 39
  l = 4
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 884736
  (uint8) index ^= *(uint8 *)(syndromep + 54)
  
  k = 40
  l = 6
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 901120
  (uint8) index ^= *(uint8 *)(syndromep + 55)
  
  k = 41
  l = 8
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 917504
  (uint8) index ^= *(uint8 *)(syndromep + 56)
  
  k = 42
  l = 10
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 933888
  (uint8) index ^= *(uint8 *)(syndromep + 57)
  
  k = 42
  l = 4
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 950272
  (uint8) index ^= *(uint8 *)(syndromep + 58)
  
  k = 43
  l = 6
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 966656
  (uint8) index ^= *(uint8 *)(syndromep + 59)
  
  k = 44
  l = 8
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 983040
  (uint8) index ^= *(uint8 *)(syndromep + 60)
  
  k = 45
  l = 10
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 999424
  (uint8) index ^= *(uint8 *)(syndromep + 61)
  
  k = 45
  l = 4
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1015808
  (uint8) index ^= *(uint8 *)(syndromep + 62)
  
  k = 46
  l = 6
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1032192
  (uint8) index ^= *(uint8 *)(syndromep + 63)
  
  k = 47
  l = 8
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1048576
  (uint8) index ^= *(uint8 *)(syndromep + 64)
  
  k = 48
  l = 10
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1064960
  (uint8) index ^= *(uint8 *)(syndromep + 65)
  
  k = 48
  l = 4
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1081344
  (uint8) index ^= *(uint8 *)(syndromep + 66)
  
  k = 49
  l = 6
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1097728
  (uint8) index ^= *(uint8 *)(syndromep + 67)
  
  k = 50
  l = 8
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1114112
  (uint8) index ^= *(uint8 *)(syndromep + 68)
  
  k = 51
  l = 10
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1130496
  (uint8) index ^= *(uint8 *)(syndromep + 69)
  
  k = 51
  l = 4
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1146880
  (uint8) index ^= *(uint8 *)(syndromep + 70)
  
  k = 52
  l = 6
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1163264
  (uint8) index ^= *(uint8 *)(syndromep + 71)
  
  k = 53
  l = 8
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1179648
  (uint8) index ^= *(uint8 *)(syndromep + 72)
  
  k = 54
  l = 10
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1196032
  (uint8) index ^= *(uint8 *)(syndromep + 73)
  
  k = 54
  l = 4
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1212416
  (uint8) index ^= *(uint8 *)(syndromep + 74)
  
  k = 55
  l = 6
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1228800
  (uint8) index ^= *(uint8 *)(syndromep + 75)
  
  k = 56
  l = 8
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1245184
  (uint8) index ^= *(uint8 *)(syndromep + 76)
  
  k = 57
  l = 10
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1261568
  (uint8) index ^= *(uint8 *)(syndromep + 77)
  
  k = 57
  l = 4
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1277952
  (uint8) index ^= *(uint8 *)(syndromep + 78)
  
  k = 58
  l = 6
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1294336
  (uint8) index ^= *(uint8 *)(syndromep + 79)
  
  k = 59
  l = 8
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1310720
  (uint8) index ^= *(uint8 *)(syndromep + 80)
  
  k = 60
  l = 10
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1327104
  (uint8) index ^= *(uint8 *)(syndromep + 81)
  
  k = 60
  l = 4
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1343488
  (uint8) index ^= *(uint8 *)(syndromep + 82)
  
  k = 61
  l = 6
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1359872
  (uint8) index ^= *(uint8 *)(syndromep + 83)
  
  k = 62
  l = 8
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1376256
  (uint8) index ^= *(uint8 *)(syndromep + 84)
  
  k = 63
  l = 10
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1392640
  (uint8) index ^= *(uint8 *)(syndromep + 85)
  
  k = 63
  l = 4
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1409024
  (uint8) index ^= *(uint8 *)(syndromep + 86)
  
  k = 64
  l = 6
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1425408
  (uint8) index ^= *(uint8 *)(syndromep + 87)
  
  k = 65
  l = 8
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1441792
  (uint8) index ^= *(uint8 *)(syndromep + 88)
  
  k = 66
  l = 10
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1458176
  (uint8) index ^= *(uint8 *)(syndromep + 89)
  
  k = 66
  l = 4
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1474560
  (uint8) index ^= *(uint8 *)(syndromep + 90)
  
  k = 67
  l = 6
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1490944
  (uint8) index ^= *(uint8 *)(syndromep + 91)
  
  k = 68
  l = 8
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1507328
  (uint8) index ^= *(uint8 *)(syndromep + 92)
  
  k = 69
  l = 10
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1523712
  (uint8) index ^= *(uint8 *)(syndromep + 93)
  
  k = 69
  l = 4
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1540096
  (uint8) index ^= *(uint8 *)(syndromep + 94)
  
  k = 70
  l = 6
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1556480
  (uint8) index ^= *(uint8 *)(syndromep + 95)
  
  k = 71
  l = 8
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1572864
  (uint8) index ^= *(uint8 *)(syndromep + 96)
  
  k = 72
  l = 10
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1589248
  (uint8) index ^= *(uint8 *)(syndromep + 97)
  
  k = 72
  l = 4
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1605632
  (uint8) index ^= *(uint8 *)(syndromep + 98)
  
  k = 73
  l = 6
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1622016
  (uint8) index ^= *(uint8 *)(syndromep + 99)
  
  k = 74
  l = 8
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1638400
  (uint8) index ^= *(uint8 *)(syndromep + 100)
  
  k = 75
  l = 10
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1654784
  (uint8) index ^= *(uint8 *)(syndromep + 101)
  
  k = 75
  l = 4
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1671168
  (uint8) index ^= *(uint8 *)(syndromep + 102)
  
  k = 76
  l = 6
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1687552
  (uint8) index ^= *(uint8 *)(syndromep + 103)
  
  k = 77
  l = 8
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1703936
  (uint8) index ^= *(uint8 *)(syndromep + 104)
  
  k = 78
  l = 10
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1720320
  (uint8) index ^= *(uint8 *)(syndromep + 105)
  
  k = 78
  l = 4
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1736704
  (uint8) index ^= *(uint8 *)(syndromep + 106)
  
  k = 79
  l = 6
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1753088
  (uint8) index ^= *(uint8 *)(syndromep + 107)
  
  k = 80
  l = 8
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1769472
  (uint8) index ^= *(uint8 *)(syndromep + 108)
  
  k = 81
  l = 10
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1785856
  (uint8) index ^= *(uint8 *)(syndromep + 109)
  
  k = 81
  l = 4
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1802240
  (uint8) index ^= *(uint8 *)(syndromep + 110)
  
  k = 82
  l = 6
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1818624
  (uint8) index ^= *(uint8 *)(syndromep + 111)
  
  k = 83
  l = 8
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1835008
  (uint8) index ^= *(uint8 *)(syndromep + 112)
  
  k = 84
  l = 10
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1851392
  (uint8) index ^= *(uint8 *)(syndromep + 113)
  
  k = 84
  l = 4
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1867776
  (uint8) index ^= *(uint8 *)(syndromep + 114)
  
  k = 85
  l = 6
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1884160
  (uint8) index ^= *(uint8 *)(syndromep + 115)
  
  k = 86
  l = 8
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1900544
  (uint8) index ^= *(uint8 *)(syndromep + 116)
  
  k = 87
  l = 10
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1916928
  (uint8) index ^= *(uint8 *)(syndromep + 117)
  
  k = 87
  l = 4
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1933312
  (uint8) index ^= *(uint8 *)(syndromep + 118)
  
  k = 88
  l = 6
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1949696
  (uint8) index ^= *(uint8 *)(syndromep + 119)
  
  k = 89
  l = 8
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1966080
  (uint8) index ^= *(uint8 *)(syndromep + 120)
  
  k = 90
  l = 10
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1982464
  (uint8) index ^= *(uint8 *)(syndromep + 121)
  
  k = 90
  l = 4
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 1998848
  (uint8) index ^= *(uint8 *)(syndromep + 122)
  
  k = 91
  l = 6
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 2015232
  (uint8) index ^= *(uint8 *)(syndromep + 123)
  
  k = 92
  l = 8
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 2031616
  (uint8) index ^= *(uint8 *)(syndromep + 124)
  
  k = 93
  l = 10
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 2048000
  (uint8) index ^= *(uint8 *)(syndromep + 125)
  
  k = 93
  l = 4
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 2064384
  (uint8) index ^= *(uint8 *)(syndromep + 126)
  
  k = 94
  l = 6
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024

  # BEGIN MACRO xor1024
  index = 2080768
  (uint8) index ^= *(uint8 *)(syndromep + 127)
  
  k = 95
  l = 8
  
  t0 = *(uint8 *)(bufferp + k)
  t0 <<= 8
  (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
  (uint64) t0 >>= l
  (uint32) t0 &= 0x3f
  t0 <<= 8
  index ^= t0
  bidx = index
  (uint32) bidx >>= 10
  (uint32) index &= 1023
  t0 = bidx * 2088
  t1 = index 
  (uint32) t1 &= 7
  t1 = t1 * 261
  t2 = 128
  t3 = index
  (uint32) t3 >>= 3
  t2 -= t3
  
  temp = &fsb256_first_line
  temp += t0
  temp += t1
  temp += t2
  
  (unaligned) s0t = *(int128 *)(temp + 0)
  (unaligned) s1t = *(int128 *)(temp + 16)
  (unaligned) s2t = *(int128 *)(temp + 32)
  (unaligned) s3t = *(int128 *)(temp + 48)
  (unaligned) s4t = *(int128 *)(temp + 64)
  (unaligned) s5t = *(int128 *)(temp + 80)
  (unaligned) s6t = *(int128 *)(temp + 96)
  (unaligned) s7t = *(int128 *)(temp + 112)
  s0 ^= s0t
  s1 ^= s1t
  s2 ^= s2t
  s3 ^= s3t
  s4 ^= s4t
  s5 ^= s5t
  s6 ^= s6t
  s7 ^= s7t
  # END MACRO xor1024


*(int128 *)(syndromep + 0) = s0
*(int128 *)(syndromep + 16) = s1
*(int128 *)(syndromep + 32) = s2
*(int128 *)(syndromep + 48) = s3
*(int128 *)(syndromep + 64) = s4
*(int128 *)(syndromep + 80) = s5
*(int128 *)(syndromep + 96) = s6
*(int128 *)(syndromep + 112) = s7

*(uint32 *)(statep + 24) = 0

leave
