#!/usr/bin/env python

print str(0)+" enter crypto_hashblocks_rfsb509_amd64_1"

print str(1)+" int64 rp"
print str(2)+" int64 bp"
print str(3)+" int64 blen"

print str(4)+" input rp"
print str(5)+" input bp"
print str(6)+" input blen"

for i in range(1,8):
  print str(i*10+100)+" int64 c"+str(i)
  print str(i*10+101)+" caller c"+str(i)
  print str(i*10+102)+" stack64 c"+str(i)+"_stack"
  print str(i*10+103)+" c"+str(i)+"_stack = c"+str(i)

print str(200)+" stack128 state0"
print str(201)+" stack128 state1"
print str(202)+" stack128 state2"
print str(203)+" stack128 state3"
print str(204)+" int6464 v"

print str(210)+" int64 matrix"
print str(211)+" matrix = crypto_hashblocks_rfsb509_amd64_1_matrix"
print str(212)+" assign 4 to matrix"

print str(215)+" stack64 rp_stack"
print str(216)+" rp_stack = rp"

print str(230)+" int64 mask"
print str(231)+" (uint32) mask = 0x3fc0"
print str(232)+" assign 8 to mask"

for i in range(115):
  print str(300+i)+" int6464 f"+str(i)
for i in range(112):
  print str(500+i)+" int64 pos"+str(i)

print str(700)+" v = *(unaligned int128 *) (rp + 0)"
print str(701)+" state0 = v"
print str(702)+" v = *(unaligned int128 *) (rp + 16)"
print str(703)+" state1 = v"
print str(704)+" v = *(unaligned int128 *) (rp + 32)"
print str(705)+" state2 = v"
print str(706)+" v = *(unaligned int128 *) (rp + 48)"
print str(707)+" state3 = v"
print str(708)+" "
print str(800)+"              unsigned<? blen -= 48"
print str(801)+" goto done if unsigned<"
print str(802)+" "
print str(803)+" mainloop:"
print str(804)+" "

print str(900000)+" state3 = f111"
print str(900001)+" state2 = f112"
print str(900002)+" state1 = f113"
print str(900003)+" state0 = f114"
print str(900004)+" "
print str(900005)+" bp += 48"
print str(900006)+"                   unsigned<? blen -= 48"
print str(900007)+" goto mainloop if !unsigned<"
print str(900008)+" "
print str(900009)+" done:"
print str(900010)+" "
print str(900011)+" rp = rp_stack"
print str(900012)+" "
print str(900013)+" v = state0"
print str(900014)+" *(unaligned int128 *) (rp + 0) = v"
print str(900015)+" v = state1"
print str(900016)+" *(unaligned int128 *) (rp + 16) = v"
print str(900017)+" v = state2"
print str(900018)+" *(unaligned int128 *) (rp + 32) = v"
print str(900019)+" v = state3"
print str(900020)+" *(unaligned int128 *) (rp + 48) = v"
print str(900021)+" "
print str(900022)+" c1 = c1_stack"
print str(900023)+" c2 = c2_stack"
print str(900024)+" c3 = c3_stack"
print str(900025)+" c4 = c4_stack"
print str(900026)+" c5 = c5_stack"
print str(900027)+" c6 = c6_stack"
print str(900028)+" c7 = c7_stack"
print str(900029)+" "
print str(900030)+" int64 result"
print str(900031)+" result = blen + 48"
print str(900032)+" assign outputreg 0 to result"
print str(900033)+" "
print str(900034)+" leave"

for i in range(8):
  k = 8*i
  where = 1000*k + 10000 - 2000
  if i%2 == 0:
    print str(where+0)+" pos"+str(8*i+0)+" = ((uint64 *)&state"+str(i/2)+")[0]"
  else:
    print str(where+0)+" pos"+str(8*i+0)+" = ((uint64 *)&state"+str((i-1)/2)+")[1]"

for i in range(6):
  k = 8*(i+8)
  where = 1000*k + 10000 - 2000
  print str(where+0)+" pos"+str(8*(i+8)+0)+" = *(int64 *) (bp + "+str(8*i)+")"

for i in range(14):
  for j in range(8):
    k = 8*i+j
    where = 1000*k
    if j == 7:
      print str(where+9555)+" (uint64) pos"+str(k)+" >>= "+str(j*8-6)
    elif j >= 4:
      print str(where+9545)+" pos"+str(k+1)+" = pos"+str(k)
      print str(where+9555)+" (uint64) pos"+str(k)+" >>= "+str(j*8-6)
    else:
      print str(where+9545)+" pos"+str(k+1)+" = pos"+str(k)
      if j == 0:
        print str(where+9555)+" (uint32) pos"+str(k)+" <<= "+str(6-j*8)
      else:
        print str(where+9555)+" (uint32) pos"+str(k)+" >>= "+str(j*8-6)
    print str(where+9565)+" (uint32) pos"+str(k)+" &= mask"
    if j == 7:
      print str(where+9575)+" assign 14 to pos"+str(k)
    if j == 6:
      print str(where+9575)+" assign 15 to pos"+str(k)
    if j == 5:
      print str(where+9575)+" assign 4 to pos"+str(k)
    if j == 4:
      print str(where+9575)+" assign 7 to pos"+str(k)


print str(0*1000+11500)+" f"+str(0)+" = *(int128 *) (pos"+str(0)+" + 48 + matrix)"
  
print str(0*1000+11700)+" f"+str(1)+" = *(int128 *) (pos"+str(0)+" + 32 + matrix)"
print str(1*1000+11500)+" uint32323232 f"+str(1)+" ^= *(int128 *) (pos"+str(1)+" + 48 + matrix)"
  
print str(0*1000+11600)+" f"+str(2)+" = *(int128 *) (pos"+str(0)+" + 16 + matrix)"
print str(1*1000+11700)+" uint32323232 f"+str(2)+" ^= *(int128 *) (pos"+str(1)+" + 32 + matrix)"
print str(2*1000+11500)+" uint32323232 f"+str(2)+" ^= *(int128 *) (pos"+str(2)+" + 48 + matrix)"
  
for i in range(3,112):
  if i == 3:
    print str((i-3)*1000+11800)+" f"+str(i)+" = *(int128 *) (pos"+str(i - 3)+" + 0 + matrix)"
  else:
    print str((i-3)*1000+11800)+" uint32323232 f"+str(i)+" ^= *(int128 *) (pos"+str(i - 3)+" + 0 + matrix)"
  print str((i-1)*1000+11700)+" uint32323232 f"+str(i)+" ^= *(int128 *) (pos"+str(i - 1)+" + 32 + matrix)"
  print str((i-2)*1000+11600)+" uint32323232 f"+str(i)+" ^= *(int128 *) (pos"+str(i - 2)+" + 16 + matrix)"
  print str(i*1000+11500)+" uint32323232 f"+str(i)+" ^= *(int128 *) (pos"+str(i)+" + 48 + matrix)"
  
print str(109*1000+11800)+" uint32323232 f"+str(112)+" ^= *(int128 *) (pos"+str(109)+" + 0 + matrix)"
print str(111*1000+11700)+" uint32323232 f"+str(112)+" ^= *(int128 *) (pos"+str(111)+" + 32 + matrix)"
print str(110*1000+11600)+" uint32323232 f"+str(112)+" ^= *(int128 *) (pos"+str(110)+" + 16 + matrix)"
  
print str(110*1000+11800)+" uint32323232 f"+str(113)+" ^= *(int128 *) (pos"+str(110)+" + 0 + matrix)"
print str(111*1000+11600)+" uint32323232 f"+str(113)+" ^= *(int128 *) (pos"+str(111)+" + 16 + matrix)"
  
print str(111*1000+11800)+" uint32323232 f"+str(114)+" ^= *(int128 *) (pos"+str(111)+" + 0 + matrix)"
  
for i in range(111):
  print str(i*1000+11650)+" v = f"+str(i)
  print str(i*1000+11660)+" uint6464 f"+str(i)+" <<= 3"
  print str(i*1000+11710)+" uint6464 v >>= 61"
  print str(i*1000+11720)+" f"+str(i + 4)+"[0,1,2,3] = v[1,1,0,1]"
  print str(i*1000+12130)+" v >>= 64"
  print str(i*1000+12150)+" f"+str(i + 4)+" ^= f"+str(i)
  print str(i*1000+12160)+" f"+str(i + 3)+" ^= v"
  
print str(111*1000+12100)+" v = f"+str(111)
print str(111*1000+12110)+" uint6464 v >>= 61"
print str(111*1000+12120)+" v >>= 64"
print str(111*1000+12130)+" f"+str(114)+" ^= v"
print str(111*1000+12140)+" f"+str(111)+" &= crypto_hashblocks_rfsb509_amd64_1_MASK125"
