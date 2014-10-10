#define SECRETKEYBYTES (64+64+128+1+8) 
#define PUBLICKEYBYTES 128
#define BYTES 65 \

/*1:*/
#line 30 "rwb0fuz1024.w"

/*3:*/
#line 67 "rwb0fuz1024.w"

/*2:*/
#line 41 "rwb0fuz1024.w"

#include <stdint.h> 
#include <limits.h> 
#include <stdlib.h> 
#include <string.h> 

/*:2*/
#line 68 "rwb0fuz1024.w"


#include <gmp.h> 
#include <openssl/sha.h> 

extern void randombytes(uint8_t*buffer,unsigned long long length);

/*:3*/
#line 31 "rwb0fuz1024.w"

/*4:*/
#line 81 "rwb0fuz1024.w"

/*5:*/
#line 101 "rwb0fuz1024.w"

static void
init_random_prime(mpz_t n,unsigned size,unsigned mod8){
uint8_t buffer[256];
const unsigned bytes= size>>3;

if(bytes> sizeof(buffer))
abort();

mpz_init2(n,bytes);

for(;;){
randombytes(buffer,bytes);

mpz_import(n,bytes,1,1,0,0,buffer);
mpz_setbit(n,0);

if(mod8&2){
mpz_setbit(n,1);
}else{
mpz_clrbit(n,1);
}

if(mod8&4){
mpz_setbit(n,2);
}else{
mpz_clrbit(n,2);
}

if(mpz_probab_prime_p(n,32))
break;
}
}

/*:5*/
#line 82 "rwb0fuz1024.w"

/*16:*/
#line 363 "rwb0fuz1024.w"

static void
hash(mpz_t e,const uint8_t*m,unsigned mlen){
uint8_t element[128];
uint8_t counter[4]= {0};

SHA512_CTX shactx;
SHA512_Init(&shactx);
SHA512_Update(&shactx,m,mlen);
SHA512_Update(&shactx,counter,sizeof(counter));
SHA512_Final(element,&shactx);

counter[3]= 1;
SHA512_Init(&shactx);
SHA512_Update(&shactx,element,64);
SHA512_Update(&shactx,counter,sizeof(counter));
SHA512_Final(element+64,&shactx);

element[0]= 0;

mpz_init(e);
mpz_import(e,128,1,1,1,0,element);
}

/*:16*/
#line 83 "rwb0fuz1024.w"

/*27:*/
#line 600 "rwb0fuz1024.w"

static uint8_t
HMAC_SHA512(const uint8_t*key,
const uint8_t*value,unsigned valuelen){
unsigned i;
uint8_t keycopy[8];

for(i= 0;i<8;++i)
keycopy[i]= key[i]^0x5c;

SHA512_CTX shactx;
SHA512_Init(&shactx);
SHA512_Update(&shactx,keycopy,8);
SHA512_Update(&shactx,value,valuelen);

uint8_t t[64];
SHA512_Final(t,&shactx);

for(i= 0;i<8;++i)
keycopy[i]^= 0x6a;

SHA512_Init(&shactx);
SHA512_Update(&shactx,keycopy,8);
SHA512_Update(&shactx,t,sizeof(t));
SHA512_Final(t,&shactx);

return t[0];
}

/*:27*/
#line 84 "rwb0fuz1024.w"

/*12:*/
#line 233 "rwb0fuz1024.w"

static void
xgcd(mpz_t u,mpz_t v,mpz_t ip,mpz_t iq){
mpz_t p,q;
mpz_init_set(p,ip);
mpz_init_set(q,iq);

mpz_init_set_ui(u,1);
mpz_init_set_ui(v,0);

mpz_t x,y;
mpz_init_set_ui(x,0);
mpz_init_set_ui(y,1);

mpz_t s,t;
mpz_init(s);
mpz_init(t);

while(mpz_sgn(q)){
mpz_set(t,q);
mpz_fdiv_qr(s,q,p,q);
mpz_set(p,t);

mpz_set(t,x);
mpz_mul(x,s,x);
mpz_sub(x,u,x);
mpz_set(u,t);

mpz_set(t,y);
mpz_mul(y,s,y);
mpz_sub(y,v,y);
mpz_set(v,t);
}

mpz_clear(p);
mpz_clear(q);
mpz_clear(x);
mpz_clear(y);
mpz_clear(s);
mpz_clear(t);
}

/*:12*/
#line 85 "rwb0fuz1024.w"

/*6:*/
#line 142 "rwb0fuz1024.w"

int
crypto_sign_rwb0fuz1024_gmp_keypair(uint8_t*pk,uint8_t*sk){
mpz_t p,q,n;

/*7:*/
#line 162 "rwb0fuz1024.w"

for(;;){
init_random_prime(p,512,3);
init_random_prime(q,512,7);
mpz_init(n);
mpz_mul(n,p,q);

if(mpz_scan1(n,1024-8)==ULONG_MAX){
mpz_clear(n);
mpz_clear(p);
mpz_clear(q);
}else{
break;
}
}

/*:7*/
#line 147 "rwb0fuz1024.w"

/*8:*/
#line 183 "rwb0fuz1024.w"

mpz_t u,v;
xgcd(u,v,p,q);
mpz_mul(u,u,p);

/*:8*/
#line 148 "rwb0fuz1024.w"

/*9:*/
#line 193 "rwb0fuz1024.w"

uint8_t hmac_secret[8];
randombytes(hmac_secret,sizeof(hmac_secret));

/*:9*/
#line 149 "rwb0fuz1024.w"

/*10:*/
#line 207 "rwb0fuz1024.w"

memset(sk,0,SECRETKEYBYTES);
mpz_export(sk,NULL,-1,8,-1,0,p);
mpz_export(sk+64,NULL,-1,8,-1,0,q);
mpz_export(sk+128,NULL,-1,8,-1,0,u);
sk[256]= mpz_sgn(u)<0?1:0;
memcpy(sk+257,hmac_secret,sizeof(hmac_secret));

memset(pk,0,PUBLICKEYBYTES);
mpz_export(pk,NULL,-1,8,-1,0,n);

/*:10*/
#line 150 "rwb0fuz1024.w"

/*11:*/
#line 218 "rwb0fuz1024.w"

mpz_clear(p);
mpz_clear(q);
mpz_clear(n);
mpz_clear(u);
mpz_clear(v);

/*:11*/
#line 151 "rwb0fuz1024.w"


return 0;
}

/*:6*/
#line 86 "rwb0fuz1024.w"


/*:4*/
#line 32 "rwb0fuz1024.w"

/*13:*/
#line 277 "rwb0fuz1024.w"

/*26:*/
#line 571 "rwb0fuz1024.w"

static int
is_quadratic_residue(mpz_t e,mpz_t p,mpz_t power){
mpz_t r,reduced_e;
mpz_init(r);
mpz_init(reduced_e);

mpz_mod(reduced_e,e,p);

mpz_powm(r,e,power,p);
mpz_mul(r,r,r);
mpz_mod(r,r,p);

const int result= 0==mpz_cmp(r,reduced_e);
mpz_clear(r);
mpz_clear(reduced_e);

return result;
}

/*:26*/
#line 278 "rwb0fuz1024.w"

/*28:*/
#line 650 "rwb0fuz1024.w"

static void
signature_compress(mpz_t zsig,mpz_t s,mpz_t n){
mpz_t vs[4];
mpz_init_set_ui(vs[0],0);
mpz_init_set_ui(vs[1],1);
mpz_init(vs[2]);
mpz_init(vs[3]);

mpz_t root;
mpz_init(root);
mpz_sqrt(root,n);

mpz_t cf;
mpz_init(cf);

unsigned i= 1;

do{
i= (i+1)&3;

if(i&1){
mpz_fdiv_qr(cf,s,s,n);
}else{
mpz_fdiv_qr(cf,n,n,s);
}
mpz_mul(vs[i],vs[(i-1)&3],cf);
mpz_add(vs[i],vs[i],vs[(i-2)&3]);
}while(mpz_cmp(vs[i],root)<0);

mpz_init(zsig);
mpz_set(zsig,vs[(i-1)&3]);

mpz_clear(root);
mpz_clear(cf);
mpz_clear(vs[0]);
mpz_clear(vs[1]);
mpz_clear(vs[2]);
mpz_clear(vs[3]);
}

/*:28*/
#line 279 "rwb0fuz1024.w"

/*14:*/
#line 289 "rwb0fuz1024.w"

int
crypto_sign_rwb0fuz1024_gmp(uint8_t*sm,unsigned long long*smlen,
const uint8_t*m,unsigned long long mlen,
const uint8_t*sk){
mpz_t p,q,u,v,n;

/*15:*/
#line 317 "rwb0fuz1024.w"

mpz_init(p);
mpz_init(q);
mpz_init(u);
mpz_init(v);

mpz_import(p,8,-1,8,-1,0,sk);
mpz_import(q,8,-1,8,-1,0,sk+64);
mpz_import(u,16,-1,8,-1,0,sk+128);
if(sk[256])
mpz_neg(u,u);

mpz_init(n);
mpz_mul(n,p,q);

mpz_set_ui(v,1);
mpz_sub(v,v,u);

/*:15*/
#line 296 "rwb0fuz1024.w"

/*17:*/
#line 387 "rwb0fuz1024.w"

mpz_t elem;
hash(elem,m,mlen);

/*:17*/
#line 297 "rwb0fuz1024.w"

/*18:*/
#line 399 "rwb0fuz1024.w"

mpz_t pp1over4,qp1over4;

mpz_init_set(pp1over4,p);
mpz_add_ui(pp1over4,pp1over4,1);
mpz_cdiv_q_2exp(pp1over4,pp1over4,2);

mpz_init_set(qp1over4,q);
mpz_add_ui(qp1over4,qp1over4,1);
mpz_cdiv_q_2exp(qp1over4,qp1over4,2);

int a= is_quadratic_residue(elem,p,pp1over4);
int b= is_quadratic_residue(elem,q,qp1over4);

/*:18*/
#line 298 "rwb0fuz1024.w"

/*19:*/
#line 441 "rwb0fuz1024.w"

int mul_2= 0,negate= 0;

if(a^b){
mul_2= 1;
a^= 1;
}

if(!a)
negate= 1;

/*:19*/
#line 299 "rwb0fuz1024.w"

/*20:*/
#line 457 "rwb0fuz1024.w"

if(negate)
mpz_neg(elem,elem);

if(mul_2)
mpz_mul_2exp(elem,elem,1);

if(negate||mul_2)
mpz_mod(elem,elem,n);

/*:20*/
#line 300 "rwb0fuz1024.w"

/*21:*/
#line 481 "rwb0fuz1024.w"

const uint8_t r= HMAC_SHA512(sk+257,m,mlen);

/*:21*/
#line 301 "rwb0fuz1024.w"

/*22:*/
#line 504 "rwb0fuz1024.w"

mpz_t proot,qroot;

mpz_init_set(proot,elem);
mpz_powm(proot,elem,pp1over4,p);

mpz_init_set(qroot,elem);
mpz_powm(qroot,elem,qp1over4,q);

if(r&1)
mpz_neg(proot,proot);
if(r&2)
mpz_neg(qroot,qroot);

mpz_mul(proot,proot,v);
mpz_mul(qroot,qroot,u);
mpz_add(proot,proot,qroot);
mpz_mod(proot,proot,n);

/*:22*/
#line 302 "rwb0fuz1024.w"

/*23:*/
#line 527 "rwb0fuz1024.w"

mpz_t zsig;
signature_compress(zsig,proot,n);

/*:23*/
#line 303 "rwb0fuz1024.w"

/*24:*/
#line 539 "rwb0fuz1024.w"

memmove(sm+BYTES,m,mlen);
memset(sm,0,BYTES-1);
sm[BYTES-1]= (mul_2<<1)|negate;
mpz_export(sm,NULL,-1,1,1,0,zsig);
*smlen= mlen+BYTES;

/*:24*/
#line 304 "rwb0fuz1024.w"

/*25:*/
#line 546 "rwb0fuz1024.w"

mpz_clear(zsig);
mpz_clear(n);
mpz_clear(proot);
mpz_clear(qroot);
mpz_clear(pp1over4);
mpz_clear(qp1over4);
mpz_clear(elem);
mpz_clear(u);
mpz_clear(v);
mpz_clear(p);
mpz_clear(q);

/*:25*/
#line 305 "rwb0fuz1024.w"


return 0;
}

/*:14*/
#line 280 "rwb0fuz1024.w"


/*:13*/
#line 33 "rwb0fuz1024.w"

/*29:*/
#line 700 "rwb0fuz1024.w"

int
crypto_sign_rwb0fuz1024_gmp_open(unsigned char*m,unsigned long long*mlen,
const unsigned char*sm,unsigned long long smlen,
const unsigned char*pk){
int res= 0;

/*30:*/
#line 723 "rwb0fuz1024.w"

if(smlen<BYTES)
return-1;

mpz_t n,zsig;

mpz_init(n);
mpz_import(n,16,-1,8,-1,0,pk);
mpz_init(zsig);
mpz_import(zsig,64,-1,1,1,0,sm);
const uint8_t negate= sm[BYTES-1]&1;
const uint8_t mul_2= sm[BYTES-1]&2;

/*:30*/
#line 707 "rwb0fuz1024.w"

/*31:*/
#line 736 "rwb0fuz1024.w"

mpz_t elem;
hash(elem,sm+BYTES,smlen-BYTES);

/*:31*/
#line 708 "rwb0fuz1024.w"

/*20:*/
#line 457 "rwb0fuz1024.w"

if(negate)
mpz_neg(elem,elem);

if(mul_2)
mpz_mul_2exp(elem,elem,1);

if(negate||mul_2)
mpz_mod(elem,elem,n);

/*:20*/
#line 709 "rwb0fuz1024.w"

/*32:*/
#line 754 "rwb0fuz1024.w"

mpz_mul(zsig,zsig,zsig);
mpz_mul(zsig,zsig,elem);
mpz_mod(zsig,zsig,n);

if(0==mpz_sgn(zsig)){
res= -1;
goto out;
}

if(!mpz_perfect_square_p(zsig)){
res= -1;
goto out;
}

/*:32*/
#line 710 "rwb0fuz1024.w"


*mlen= smlen-BYTES;
memmove(m,sm+BYTES,*mlen);

out:
mpz_clear(zsig);
mpz_clear(elem);
mpz_clear(n);

return res;
}

/*:29*/
#line 34 "rwb0fuz1024.w"


/*:1*/
