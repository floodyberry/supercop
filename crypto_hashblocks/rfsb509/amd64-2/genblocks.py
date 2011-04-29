#!/usr/bin/env python

print "enter crypto_hashblocks_rfsb509_amd64_2"

print "int64 rp"
print "int64 bp"
print "int64 blen"

print "input rp"
print "input bp"
print "input blen"

print "int64 c1"
print "int64 c2"
print "int64 c3"
print "int64 c4"
print "int64 c5"
print "int64 c6"
print "int64 c7"

print "caller c1"
print "caller c2"
print "caller c3"
print "caller c4"
print "caller c5"
print "caller c6"
print "caller c7"

print "stack64 c1_stack"
print "stack64 c2_stack"
print "stack64 c3_stack"
print "stack64 c4_stack"
print "stack64 c5_stack"
print "stack64 c6_stack"
print "stack64 c7_stack"

print "c1_stack = c1"
print "c2_stack = c2"
print "c3_stack = c3"
print "c4_stack = c4"
print "c5_stack = c5"
print "c6_stack = c6"
print "c7_stack = c7"

print "int64 positions0"
print "int64 positions8"
print "int64 positions16"
print "int64 positions24"
print "int64 positions32"
print "int64 positions40"
print "int64 positions48"
print "int64 positions56"
print "int64 positions64"
print "int64 positions72"
print "int64 positions80"
print "int64 positions88"
print "int64 positions96"
print "int64 positions104"
print "int64 positions112"
print "int64 pos"
print "int64 pos0"
print "int64 pos1"
print "int64 pos2"
print "int64 pos3"
print "int64 pos4"
print "int64 pos5"
print "int64 pos6"
print "int64 pos7"

print "int6464 v0"
print "int6464 v1"
print "int6464 v2"
print "int6464 v3"
print "int6464 v4"
print "int6464 v5"
print "int6464 v6"
print "int6464 v7"

print "int6464 t0"
print "int6464 t1"
print "int6464 t2"
print "int6464 t3"
print "int6464 t4"
print "int6464 t5"
print "int6464 t6"
print "int6464 t7"

print "int6464 s0"
print "int6464 s1"
print "int6464 s2"
print "int6464 s3"
print "int6464 s4"
print "int6464 s5"
print "int6464 s6"
print "int6464 s7"

print "stack128 state0"
print "stack128 state1"
print "stack128 state2"
print "stack128 state3"
print "int6464 v"

print "int64 matrix"
print "matrix = crypto_hashblocks_rfsb509_amd64_2_matrix"
print "assign 4 to matrix"

print "stack64 rp_stack"
print "rp_stack = rp"

print "int64 mask"
print "(uint32) mask = 0x3fc0"
print "assign 8 to mask"

print "v = *(unaligned int128 *) (rp + 0)"
print "state0 = v"
print "v = *(unaligned int128 *) (rp + 16)"
print "state1 = v"
print "v = *(unaligned int128 *) (rp + 32)"
print "state2 = v"
print "v = *(unaligned int128 *) (rp + 48)"
print "state3 = v"

print "             unsigned<? blen -= 48"
print "goto done if unsigned<"

print "mainloop:"



print "positions0 = ((uint64 *)&state0)[0]"
print "positions8 = ((uint64 *)&state0)[1]"
print "pos3 = positions0"
print "(uint64) pos3 >>= 18"
print "pos3 &= mask"
print "pos2 = positions0"
print "(uint64) pos2 >>= 10"
print "pos2 &= mask"
print "pos1 = positions0"
print "(uint64) pos1 >>= 2"
print "pos1 &= mask"
print "pos0 = positions0"
print "pos0 <<= 6"
print "pos0 &= mask"
  
print "v0 = *(int128 *)(pos3 +  0 + matrix)"
print "v1 = *(int128 *)(pos3 + 16 + matrix)"
print "v2 = *(int128 *)(pos3 + 32 + matrix)"
print "v3 = *(int128 *)(pos3 + 48 + matrix)"
  
print "uint32323232 v1 ^= *(int128 *)(pos2 +  0 + matrix)"
print "uint32323232 v2 ^= *(int128 *)(pos2 + 16 + matrix)"
print "uint32323232 v3 ^= *(int128 *)(pos2 + 32 + matrix)"
print "v4 = *(int128 *)(pos2 + 48 + matrix)"
  
print "uint32323232 v2 ^= *(int128 *)(pos1 +  0 + matrix)"
print "uint32323232 v3 ^= *(int128 *)(pos1 + 16 + matrix)"
print "uint32323232 v4 ^= *(int128 *)(pos1 + 32 + matrix)"
print "v5 = *(int128 *)(pos1 + 48 + matrix)"
 
print "uint32323232 v3 ^= *(int128 *)(pos0 +  0 + matrix)"
print "uint32323232 v4 ^= *(int128 *)(pos0 + 16 + matrix)"
print "uint32323232 v5 ^= *(int128 *)(pos0 + 32 + matrix)"
print "v6 = *(int128 *)(pos0 + 48 + matrix)"

print "pos7 = positions0"
print "(uint64) pos7 >>= 50"
print "pos7 &= mask"
print "pos6 = positions0"
print "(uint64) pos6 >>= 42"
print "pos6 &= mask"
print "pos5 = positions0"
print "(uint64) pos5 >>= 34"
print "pos5 &= mask"
print "pos4 = positions0"
print "(uint64) pos4 >>= 26"
print "pos4 &= mask"
 
 
print "# Reduce mod x^509-1"

print "t6 = v6"
print "uint6464 v6 >>= 61"
print "uint6464 t6 <<= 3"
print "s6[0,1,2,3] = v6[1,1,0,1]"
print "t6 ^= s6"
print "v2 ^= t6"
for k in range(5,3,-1):
  print "t"+str(k)+" = v"+str(k)
  print "uint6464 v"+str(k)+" >>= 61"
  print "uint6464 t"+str(k)+" <<= 3"
  print "s"+str(k)+"[0,1,2,3] = v"+str(k)+"[1,1,0,1]"
  print "v"+str(k)+" >>= 64"
  print "t"+str(k)+" ^= s"+str(k)
  print "v"+str(k-4)+" ^= t"+str(k)
  print "v"+str(k-3)+" ^= v"+str(k)
 
v=[0,1,2,3,4,5,6,7]

##for i in range(4,128,4):
for i in range(4,112,4):

  for k in range(0,len(v)):
    v[k] = (v[k]+4)%8
 
  if i+4 in range(8,56,8):
    print "positions"+str(i+12)+" = ((uint64 *)&state"+str((i+12)/16)+")["+str(((i+12)/8)%2)+"]"
  elif i+4 in range(56,104,8):
    print "positions"+str(i+12)+" = *(int64 *)(bp + "+str(i-52)+")"

  print "uint32323232 v"+str(v[4])+" ^= *(int128 *)(pos"+str(v[2])+" + 48 + matrix)"
  print "uint32323232 v"+str(v[4])+" ^= *(int128 *)(pos"+str(v[1])+" + 32 + matrix)"
  print "uint32323232 v"+str(v[4])+" ^= *(int128 *)(pos"+str(v[0])+" + 16 + matrix)"
  print "v"+str(v[3])+" = *(int128 *)(pos"+str(v[3])+" + 48 + matrix)"
  print "uint32323232 v"+str(v[3])+" ^= *(int128 *)(pos"+str(v[2])+" + 32 + matrix)"
  print "uint32323232 v"+str(v[3])+" ^= *(int128 *)(pos"+str(v[1])+" + 16 + matrix)"
  print "uint32323232 v"+str(v[3])+" ^= *(int128 *)(pos"+str(v[0])+" +  0 + matrix)"

  print "t"+str(v[7])+" = v"+str(v[7])
  print "uint6464 v"+str(v[7])+" >>= 61"
  print "uint6464 t"+str(v[7])+" <<= 3"
  print "s"+str(v[7])+"[0,1,2,3] = v"+str(v[7])+"[1,1,0,1]"
  print "v"+str(v[7])+" >>= 64"
  print "t"+str(v[7])+" ^= s"+str(v[7])
  print "v"+str(v[4])+" ^= v"+str(v[7])
  print "v"+str(v[3])+" ^= t"+str(v[7])

  if i in range(8,112,8):
    print "pos7 = positions"+str(i)
    print "(uint64) pos7 >>= 50"
    print "pos7 &= mask"
  elif i < 124:
    print "pos3 = positions"+str(i+4)
    print "(uint64) pos3 >>= 18"
    print "pos3 &= mask"

  print "uint32323232 v"+str(v[6])+" ^= *(int128 *)(pos"+str(v[0])+" + 48 + matrix)"
  print "v"+str(v[2])+" = *(int128 *)(pos"+str(v[3])+" + 32 + matrix)"
  print "uint32323232 v"+str(v[2])+" ^= *(int128 *)(pos"+str(v[2])+" + 16 + matrix)"
  print "uint32323232 v"+str(v[2])+" ^= *(int128 *)(pos"+str(v[1])+" +  0 + matrix)"

  print "t"+str(v[6])+" = v"+str(v[6])
  print "uint6464 v"+str(v[6])+" >>= 61"
  print "uint6464 t"+str(v[6])+" <<= 3"
  print "s"+str(v[6])+"[0,1,2,3] = v"+str(v[6])+"[1,1,0,1]"
  print "v"+str(v[6])+" >>= 64"
  print "t"+str(v[6])+" ^= s"+str(v[6])
  print "v"+str(v[3])+" ^= v"+str(v[6])
  print "v"+str(v[2])+" ^= t"+str(v[6])

  if i in range(8,112,8):
    print "pos6 = positions"+str(i)
    print "(uint64) pos6 >>= 42"
    print "pos6 &= mask"
  elif i < 108:
    print "pos2 = positions"+str(i+4)
    print "(uint64) pos2 >>= 10"
    print "pos2 &= mask"

  print "uint32323232 v"+str(v[5])+" ^= *(int128 *)(pos"+str(v[0])+" + 32 + matrix)"
  print "uint32323232 v"+str(v[5])+" ^= *(int128 *)(pos"+str(v[1])+" + 48 + matrix)"
  print "v"+str(v[1])+" = *(int128 *)(pos"+str(v[3])+" + 16 + matrix)"
  print "uint32323232 v"+str(v[1])+" ^= *(int128 *)(pos"+str(v[2])+" +  0 + matrix)"

  print "t"+str(v[5])+" = v"+str(v[5])
  print "uint6464 v"+str(v[5])+" >>= 61"
  print "uint6464 t"+str(v[5])+" <<= 3"
  print "s"+str(v[5])+"[0,1,2,3] = v"+str(v[5])+"[1,1,0,1]"
  print "v"+str(v[5])+" >>= 64"
  print "t"+str(v[5])+" ^= s"+str(v[5])
  print "v"+str(v[2])+" ^= v"+str(v[5])
  print "v"+str(v[1])+" ^= t"+str(v[5])

  if i in range(8,112,8):
    print "pos5 = positions"+str(i)
    print "(uint64) pos5 >>= 34"
    print "pos5 &= mask"
  elif i < 124:
    print "pos1 = positions"+str(i+4)
    print "(uint64) pos1 >>= 2"
    print "pos1 &= mask"
  
  print "v"+str(v[0])+" = *(int128 *)(pos"+str(v[3])+" +  0 + matrix)"

  print "t"+str(v[4])+" = v"+str(v[4])
  print "uint6464 v"+str(v[4])+" >>= 61"
  print "uint6464 t"+str(v[4])+" <<= 3"
  print "s"+str(v[4])+"[0,1,2,3] = v"+str(v[4])+"[1,1,0,1]"
  print "v"+str(v[4])+" >>= 64"
  print "t"+str(v[4])+" ^= s"+str(v[4])
  print "v"+str(v[1])+" ^= v"+str(v[4])
  print "v"+str(v[0])+" ^= t"+str(v[4])
  
  if i in range(8,112,8):
    print "pos4 = positions"+str(i)
    print "(uint64) pos4 >>= 26"
    print "pos4 &= mask"
  elif i < 124:
    print "pos0 = positions"+str(i+4)
    print "pos0 <<= 6"
    print "pos0 &= mask"

#print "# XXX: Reduce 3 upper bits"
print "t"+str(v[3])+" = v"+str(v[3])
print "uint6464 t"+str(v[3])+" >>= 61"
print "t"+str(v[3])+" >>= 64"
print "v"+str(v[0])+" ^= t"+str(v[3])
print "v"+str(v[3])+" &= crypto_hashblocks_rfsb509_amd64_2_MASK125"

print "state0 = v"+str(v[0])
print "state1 = v"+str(v[1])
print "state2 = v"+str(v[2])
print "state3 = v"+str(v[3])


print "bp += 48"
print "                  unsigned<? blen -= 48"
print "goto mainloop if !unsigned<"

print "done:"

print "rp = rp_stack"

print "v = state0"
print "*(unaligned int128 *) (rp + 0) = v"
print "v = state1"
print "*(unaligned int128 *) (rp + 16) = v"
print "v = state2"
print "*(unaligned int128 *) (rp + 32) = v"
print "v = state3"
print "*(unaligned int128 *) (rp + 48) = v"

print "c1 = c1_stack"
print "c2 = c2_stack"
print "c3 = c3_stack"
print "c4 = c4_stack"
print "c5 = c5_stack"
print "c6 = c6_stack"
print "c7 = c7_stack"

print "int64 result"
print "result = blen + 48"
print "assign outputreg 0 to result"

print "leave"
