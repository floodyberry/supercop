static const  uint64_t polynom = 0xE100000000000000LL;


static void GF128_shift_right(uint64_t  *h)
{
  uint64_t i = (h[0]&1LL)<<63;

  h[0] >>=1;
  h[1] = (h[1]>>1)| i;
}


static void GF128_double(uint64_t  *h)
{
  const uint64_t reduce = h[1]&1;

  GF128_shift_right(h);

  if(reduce) h[0]^=polynom;
}


static void GF128_triple(uint64_t  *h)
{
  uint64_t tmp[2];

  memcpy(tmp,h, BLOCKLEN);

  GF128_double(h);
  h[0]^=tmp[0];
  h[1]^=tmp[1];
}


static void GF128_quintuple(uint64_t  *h)
{
  uint64_t tmp[2];

  memcpy(tmp,h, BLOCKLEN);

  GF128_double(h);
  GF128_double(h);
  h[0]^=tmp[0];
  h[1]^=tmp[1];
}
