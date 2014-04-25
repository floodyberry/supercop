int64 x0
int64 x1

int64 r0
int64 r1
int64 r2
int64 r3

int64 rax
int64 rdx

int64 t

int64 mask

enter gfe_mul

  input_2 = input_2

  x0 = mem64[input_1 + 0]
  rax = mem64[input_2 + 0]
  (uint128) rdx rax = rax * x0
  r0 = rax
  r1 = rdx
  
  rax = mem64[input_2 + 8]
  (uint128) rdx rax = rax * x0
  carry? r1 += rax
  r2 = 0
  r2 += rdx + carry
  
  x1 = mem64[input_1 + 8]
  rax = mem64[input_2 + 0]
  (uint128) rdx rax = rax * x1
  carry? r1 += rax
  r2  += rdx + carry

  rax = mem64[input_2 + 8]
  (uint128) rdx rax = rax * x1
  carry? r2 += rax
  r3 = 0
  r3 += rdx + carry

  r3 = (r3.r2) << 1
  r2 = (r2.r1) << 1
  
  mask = mem64[mask63]

  r1 &= mask
  carry? r0 += r2
  r1 += r3 + carry

  t = r1
  (uint64) t >>= 63
  r1 &= mask

  carry? r0 += t
  t = 0
  r1 += t + carry

  mem64[input_0 + 0] = r0
  mem64[input_0 + 8] = r1
 
return
