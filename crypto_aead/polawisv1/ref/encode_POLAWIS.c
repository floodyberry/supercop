//POLAWIS 1.0
//15-04-2014, Wysokinski Arkadiusz, e-mail: polawis@sedkomp.com.pl

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <gmp.h>

#define jak 32 
#define rp 301 //297 //301
#define ch 256
#define rund 8

int main(int argc, char *argv[])
{
	mpz_t apods,qg,q1g;
    mpz_init(apods); mpz_init(qg); mpz_init(q1g);
    mpz_t rop;
    mpz_init(rop);

    char *pp, *qq, *qq1, *klg[6], *komc, *kluczc;
    int dm, mm, m, dbg=1;

m=jak;

{mpz_ui_pow_ui(apods,ch,m); if (rp < 0) 
{mpz_sub_ui(apods,apods,abs(rp));} else {mpz_add_ui(apods,apods,rp);} mm=m;}

    mpz_ui_pow_ui(q1g,ch,m); mpz_sub_ui(q1g,q1g,1); qq1=mpz_get_str(NULL,10,q1g);
    if (mpz_cmp(apods,q1g) > 0) {mpz_set(qg,q1g);} else {mpz_set(qg,apods);
    mpz_sub_ui(qg,qg,1); } 
    qq=mpz_get_str(NULL,10,qg); 
    pp=mpz_get_str(NULL,10,apods); 

mpz_t hd1, hd2;
mpz_init(hd1); mpz_init(hd2);

mpz_t dhd1, dhd2;
mpz_init(dhd1); mpz_init(dhd2);

  FILE *in = stdin;  FILE *out = stdout; FILE *klucz = klucz; FILE *kom = kom;
    double fproc, modf;
    
    unsigned tab[6*m], kl[2*rund*m];
    double dklpom[8], de[8], dc[2*rund*m], dtab[6*m], w=1000000.1, dx1, dx2, dx3, dx4, dc1, dc2, dc3, dc4, da1, da2, da3, da4, db2, db3, db4;
    int dkl[32], dz=1;
    int tab_we[6*m];
    int   e4 = 1, b4 = 1, problem=0, prob=0;
    int j=rund, dj=8, i=0, ii, h=254, z=1, k=0, length=0;
    int mli=0, lli=0, lll=0, llt0=0, llt1=0, llt2=0, llt3=0, llt4=0, llt5=0, llt6=0, llt7=0, llt8=0, llt9=0, llt10=0, llt11=0, llt12=0, llt13=0;
    unsigned modi, hamdchr=0, hamdi, hamdmin=8, hamdmax=0, hamdit[9];
    double  hamd=0;
    unsigned dhamdchr=0, dhamdi, dhamdit[33], dhamdmin=0, dhamdmax=0;
    double  dhamd=0;
    int  stime;
    long ltime;
  long int  min, max, inne=0, suma=0, tab_chr[256];
  long int  mind, maxd, inned=0, sumad=0, tab_chrd[256];
    mpz_t  k1g, k2g, k3g, k4g, d2g, d3g, d1g, d4g;
    mpz_t  x1g, x2g, x3g, x4g, c2g, c3g, c1g, c4g;
    mpz_t  klpomg[rund+1], cg[2*rund+1], modig, lig, mng;
    mpz_t  pa2b2, pa3b3, pa4b4, m2d1;
    
mpz_init(k1g); mpz_init(k2g); mpz_init(k3g); mpz_init(k4g); 
mpz_init(d1g); mpz_init(d2g); mpz_init(d3g); mpz_init(d4g); 
mpz_init(x1g); mpz_init(x2g); mpz_init(x3g); mpz_init(x4g); 
mpz_init(c1g); mpz_init(c2g); mpz_init(c3g); mpz_init(c4g); 
for (i=0;i<=(2*rund);i++) {mpz_init(cg[i]);}
for (i=0;i<=(rund);i++) {mpz_init(klpomg[i]);}
mpz_init(modig); mpz_init(lig); mpz_init(mng);
mpz_init(pa2b2); mpz_init(pa3b3); mpz_init(pa4b4); mpz_init(m2d1);

mpz_t wy; mpz_t wy_p;
mpz_init(wy); mpz_init(wy_p);

void char_to_int_gmp(int poz){
int l=0, ll; 
	mpz_set_ui(wy,0);
	mpz_set_ui(wy_p,1);
	    for (ll=m-1;ll>=0;ll--) {
		mpz_ui_pow_ui(wy_p,ch,ll);
		mpz_mul_ui(wy_p,wy_p,tab_we[(poz*m+l)]);
	        mpz_add(wy,wy,wy_p);
	    l++;}
}

mpz_t wep; mpz_t we_p; mpz_t we_p2;
mpz_init(wep); mpz_init(we_p); mpz_init(we_p2);

void int_to_chargg(mpz_t we, int poz){
int l,ll;
    mpz_set(wep,we);
	mpz_ui_pow_ui(we_p,ch,m-1);
	mpz_tdiv_q(we_p2,wep,we_p);
	tab[(poz*m+0)]=mpz_get_ui(we_p2);
	    l=0; 
		for (ll=m-1;ll>1;ll--) {l++;
    		mpz_ui_pow_ui(we_p,ch,ll);
		mpz_mod(we_p,wep,we_p);
	        mpz_ui_pow_ui(we_p2,ch,ll-1);
		mpz_tdiv_q(we_p,we_p,we_p2);
		tab[(poz*m+l)]=mpz_get_ui(we_p);
		}
	mpz_mod_ui(we_p,wep,ch);
	tab[(poz*m+l+1)]=mpz_get_ui(we_p); }

        ltime = time(NULL);
	  stime = (unsigned) ltime/2;
//	    srand(stime);
    gmp_randstate_t state;
    gmp_randinit_default(state);
    gmp_randseed_ui(state,stime);

for (i=0;i<256;i++) {tab_chr[i]=0; }
for (i=0;i<256;i++) {tab_chrd[i]=0; }

for (i=0; i<=8; i++) {hamdit[i]=0;}

for (i=0; i<=8*4; i++) {dhamdit[i]=0;}

#include <sys/time.h>

struct timeval tv1,tv2;
struct timeval tvdiff;
struct timezone tz;

void timediff(struct timeval* a,struct timeval* b,struct timeval* result)
{    (result)->tv_sec  = (a)->tv_sec  - (b)->tv_sec;
    (result)->tv_usec = (a)->tv_usec - (b)->tv_usec;

    if((result)->tv_usec < 0)
    {
        --(result)->tv_sec;
        (result)->tv_usec += 1000000;
    }
} 

kluczc="./.key_gmp.txt";
komc="./.komchr.txt";
while (argc != 1)
    {
      if (strcmp (argv[1], "-k") == 0)
	{
	    kluczc=argv[2];
	  argv++;
	  argc--;
	}
      if (strcmp (argv[1], "-m") == 0)
	{
	    komc=argv[2];
	  argv++;
	  argc--;
	}
      if (strcmp (argv[1], "-s") == 0)
	{
	dbg=0;
	  argv++;
	  argc--;
	}
      if (strcmp (argv[1], "-z") == 0)
	{
	dz=0;
	  argv++;
	  argc--;
	}
      else
	{  argv++;
	  argc--; }
    }

kom = fopen( komc, "a+" );	    
if (dbg) { fprintf(kom,"\n -START KODING- \n");
	    fprintf(kom,"(%i:=%ibit)p=2^%i+(%i);\n p=%s;\n q=%s;\nq1=%s; \n",m,m*8,m*8,rp,pp,qq,qq1);
	     }
    /* first, record the start time */
    if(gettimeofday(&tv1,&tz)!=0)
        fprintf(kom,"\nWarning : could not gettimeofday() !");

    if (dbg) { fprintf(kom,"\ngettimeofday()=%i",tv1);}

klucz = fopen( kluczc, "rb" );	
while ( ((getc(klucz)) != EOF) ) {k++;}
if (k<(rund*2*m)) {length++; goto koniec;}
fclose(klucz);

klucz = fopen( kluczc, "rb" );	
fread(kl,m,2*rund,klucz);	
        for (i=0; i<2*rund; i++){
if (m>35) {mpz_import (cg[i], 1, 1, m*8*2, 0, 0, &kl[i]);}
else {
if (m<=4) {mpz_import (cg[i], 1, 1, m*1*1, 0, 0, &kl[i]);}
else { mpz_import (cg[i], 1, 1, m*8*1, 0, 0, &kl[i]);}
}
mpz_mod(cg[i],cg[i],apods);
}
fclose(klucz);

dm=m/4;
klucz = fopen( kluczc, "rb" );	
fread(kl,4,2*rund*dm,klucz);	
for (i=0; i<2*dj; i++)
{
dc[i]=0;
for (ii=0;ii<dm;ii++) {  
dc[i]=dc[i]+kl[i+(ii*2*dj)]/(100000000.0*dm);}
} 
db4=256.000000000000001; 
de[0]=db4; de[1]=db4/2; de[2]=64; de[3]=32; de[4]=16; de[5]=8; de[6]=4; de[7]=2;

if (dz) {
	for (i=0; i<(6*m); i++) { tab_we[i]=0; }
	da3=tab_we[2]; da4=tab_we[3]; db2=tab_we[4]; 
	db3=tab_we[5]; da1=tab_we[0]; da2=tab_we[1];

for (i=0;i<dj;i++) { dc1=dc[2*i+0]; dc4=dc[2*i+1];

	    dc2=(dc1*(da3-db3)+dc4*(da2+db2))/(da4+db4); 
	    dc3=(dc4*(da3+db3)-dc1*(da2-db2))/(da4+db4);
dx1=(2*da1*dc1+dc2*(da2+db2)+dc3*(da3+db3)+dc4*(da4+db4))/(2*(dc1*dc1+dc2*dc2+dc3*dc3+dc4*dc4));
	    dx2=((da2+db2)/(2*dc1))-((dc2/dc1)*dx1);
	    dx3=((da3+db3)/(2*dc1))-((dc3/dc1)*dx1);
	    dx4=((da4+db4)/(2*dc1))-((dc4/dc1)*dx1);

da1=dx1; da2=dx2; da3=dx3; da4=dx4; db2=dc2; db3=dc3;
dklpom[i]=dx1;
} //end for
for (i=1;i<dj;i++) { dc[2*i+1]=dklpom[i-1]/w; }

dtab[0]=dx1; dtab[1]=dx2; dtab[2]=dx3; dtab[3]=dx4;
dtab[4]=dc2; dtab[5]=dc3;

fwrite(dtab,1*sizeof(double),6,out);
} //end if

for (i=0;i<(6*m);i++) {mpz_urandomb(rop,state,8); tab_we[i]=(mpz_get_ui(rop)); }

	da3=tab_we[2]; da4=tab_we[3]; db2=tab_we[4]; 
	db3=tab_we[5]; da1=tab_we[0]; da2=tab_we[1];

for (i=0;i<dj;i++) { dc1=dc[2*i+0]; dc4=dc[2*i+1];
		    dc2=(dc1*(da3-db3)+dc4*(da2+db2))/(da4+db4); 
		    dc3=(dc4*(da3+db3)-dc1*(da2-db2))/(da4+db4);
dx1=(2*da1*dc1+dc2*(da2+db2)+dc3*(da3+db3)+dc4*(da4+db4))/(2*(dc1*dc1+dc2*dc2+dc3*dc3+dc4*dc4));
		    dx2=((da2+db2)/(2*dc1))-((dc2/dc1)*dx1);
		    dx3=((da3+db3)/(2*dc1))-((dc3/dc1)*dx1);
		    dx4=((da4+db4)/(2*dc1))-((dc4/dc1)*dx1);

da1=dx1; da2=dx2; da3=dx3; da4=dx4; db2=dc2; db3=dc3;
dklpom[i]=dx1; } //end for
for (i=1;i<dj;i++) { dc[2*i+1]=dklpom[i-1]/w; }

dtab[0]=dx1; dtab[1]=dx2; dtab[2]=dx3; dtab[3]=dx4;dtab[4]=dc2; dtab[5]=dc3;
fwrite(dtab,1*sizeof(double),6,out);

//differ header/key start
mpz_set(c1g,cg[0]);
mpz_mul_ui(c1g,c1g,2); mpz_mod(c1g,c1g,apods);
if ( (mpz_cmp_ui(c1g,0)==0) )
{ llt4++; goto koniec;}
else {

do {
for (i=0;i<(6*m);i++) {mpz_urandomb(rop,state,m); tab_we[i]=(mpz_get_ui(rop)); }

for (ii=0;ii<(m-1);ii++) {
for (i=0; i<6; i++) { tab_we[m*i+ii]=0; } }

char_to_int_gmp(4); mpz_set(c2g,wy);
char_to_int_gmp(5); mpz_set(c3g,wy);
char_to_int_gmp(0); mpz_set(x1g,wy);
char_to_int_gmp(1); mpz_set(x2g,wy);
char_to_int_gmp(2); mpz_set(x3g,wy);
char_to_int_gmp(3); mpz_set(x4g,wy);

mpz_set(d1g,cg[0]); mpz_set(d4g,cg[1]);
mpz_set(c1g,cg[0]); mpz_set(c4g,cg[1]);

       mpz_sub(lig,x3g,c3g); 
       mpz_mul(lig,lig,d1g); mpz_mod(lig,lig,apods);
       mpz_add(mng,x2g,c2g); 
       mpz_mul(mng,mng,d4g); mpz_mod(mng,mng,apods);
       mpz_add(lig,lig,mng); 
       mpz_add_ui(mng,x4g,e4);
	   mpz_invert(mng,mng,apods);
	   mpz_mul(d2g,lig,mng); mpz_mod(d2g,d2g,apods);

       mpz_sub(lig,x2g,c2g); 
       mpz_mul(lig,lig,d1g); mpz_mod(lig,lig,apods);
       mpz_add(mng,x3g,c3g); 
       mpz_mul(mng,mng,d4g); mpz_mod(mng,mng,apods);
       mpz_sub(lig,mng,lig);  
       mpz_add_ui(mng,x4g,e4);
	   mpz_invert(mng,mng,apods);
	   mpz_mul(d3g,lig,mng); mpz_mod(d3g,d3g,apods);

	mpz_mul(modig,c1g,c1g);    mpz_mod(modig,modig,apods);
	mpz_addmul(modig,c2g,c2g); mpz_mod(modig,modig,apods);
	mpz_addmul(modig,c3g,c3g); mpz_mod(modig,modig,apods);
	mpz_addmul(modig,c4g,c4g); mpz_mod(modig,modig,apods);
	    mpz_mul_ui(modig,modig,2); mpz_mod(modig,modig,apods);

mpz_add_ui(wy,x4g,e4); mpz_mod(wy,wy,apods);
mpz_mul_ui(wy_p,d1g,2); mpz_mod(wy_p,wy_p,apods);

} while ( !( (mpz_cmp_ui(modig,0)!=0) && (mpz_cmp_ui(wy,0)!=0) && (mpz_cmp_ui(d1g,0)!=0) && (mpz_cmp_ui(wy_p,0)!=0) ) );	
}
for (i=0;i<j;i++) { 
mpz_set(d1g,cg[2*i+0]); mpz_set(d4g,cg[2*i+1]);
mpz_set(c1g,cg[2*i+0]); mpz_set(c4g,cg[2*i+1]);

       mpz_sub(lig,x3g,c3g); 
       mpz_mul(lig,lig,d1g); mpz_mod(lig,lig,apods);
       mpz_add(mng,x2g,c2g); 
       mpz_mul(mng,mng,d4g); mpz_mod(mng,mng,apods);
       mpz_add(lig,lig,mng); 
       mpz_add_ui(mng,x4g,e4);
	   mpz_invert(mng,mng,apods);
	   mpz_mul(d2g,lig,mng); mpz_mod(d2g,d2g,apods);

       mpz_sub(lig,x2g,c2g);
       mpz_mul(lig,lig,d1g); mpz_mod(lig,lig,apods);
       mpz_add(mng,x3g,c3g); 
       mpz_mul(mng,mng,d4g); mpz_mod(mng,mng,apods);
       mpz_sub(lig,mng,lig); 
       mpz_add_ui(mng,x4g,e4);
	   mpz_invert(mng,mng,apods);
	   mpz_mul(d3g,lig,mng); mpz_mod(d3g,d3g,apods);

	mpz_mul(modig,d1g,d1g); mpz_mod(modig,modig,apods);
	mpz_addmul(modig,d2g,d2g); mpz_mod(modig,modig,apods);
	mpz_addmul(modig,d3g,d3g); mpz_mod(modig,modig,apods);
	mpz_addmul(modig,d4g,d4g); mpz_mod(modig,modig,apods);
	    mpz_mul_ui(modig,modig,2); mpz_mod(modig,modig,apods);
	mpz_mul_ui(lig,x1g,2);  mpz_mod(lig,lig,apods);
	mpz_mul(lig,lig,d1g);   mpz_mod(lig,lig,apods);
	mpz_add(mng,x2g,c2g); 
	mpz_addmul(lig,mng,d2g);mpz_mod(lig,lig,apods);
	mpz_add(mng,x3g,c3g); 
	mpz_addmul(lig,mng,d3g); mpz_mod(lig,lig,apods);
	mpz_add_ui(mng,x4g,e4);
	mpz_addmul(lig,mng,d4g);mpz_mod(lig,lig,apods);
	   mpz_invert(mng,modig,apods); mpz_mod(mng,mng,apods);
	   mpz_mul(k1g,lig,mng); mpz_mod(k1g,k1g,apods);
	
	mpz_add(lig,x2g,c2g); 
	mpz_mul_ui(mng,d1g,2);  mpz_mod(mng,mng,apods);
        mpz_invert(mng,mng,apods); 
        mpz_mul(k2g,lig,mng); mpz_mod(k2g,k2g,apods);	
        mpz_invert(lig,d1g,apods);
        mpz_mul(lig,d2g,lig);mpz_mod(lig,lig,apods);	
	mpz_mul(lig,lig,k1g);    mpz_mod(lig,lig,apods);
	    mpz_sub(k2g,k2g,lig);   mpz_mod(k2g,k2g,apods);

	mpz_add(lig,x3g,c3g); 
	mpz_mul_ui(mng,d1g,2);  mpz_mod(mng,mng,apods);
        mpz_invert(mng,mng,apods); 
        mpz_mul(k3g,lig,mng); mpz_mod(k3g,k3g,apods);	
        mpz_invert(lig,d1g,apods);
        mpz_mul(lig,d3g,lig);mpz_mod(lig,lig,apods);	
	mpz_mul(lig,lig,k1g);    mpz_mod(lig,lig,apods);
	    mpz_sub(k3g,k3g,lig);   mpz_mod(k3g,k3g,apods);
    
	mpz_add_ui(lig,x4g,e4); 
	mpz_mul_ui(mng,d1g,2);  mpz_mod(mng,mng,apods);
        mpz_invert(mng,mng,apods); 
        mpz_mul(k4g,lig,mng); mpz_mod(k4g,k4g,apods);	
        mpz_invert(lig,d1g,apods);
        mpz_mul(lig,d4g,lig);mpz_mod(lig,lig,apods);	
	mpz_mul(lig,lig,k1g);    mpz_mod(lig,lig,apods);
	    mpz_sub(k4g,k4g,lig);   mpz_mod(k4g,k4g,apods);

mpz_set(c2g,d2g); mpz_set(c3g,d3g);
mpz_set(x1g,k1g); mpz_set(x2g,k2g); mpz_set(x3g,k3g); mpz_set(x4g,k4g);

mpz_set(klpomg[i],x1g);
} //end for

for (i=1;i<j;i++) { mpz_set(cg[2*i+0],klpomg[i-1]); }

int_to_chargg(d2g,4);
int_to_chargg(d3g,5);
int_to_chargg(k1g,0);
int_to_chargg(k2g,1);
int_to_chargg(k3g,2);
int_to_chargg(k4g,3);

for (i=0; i<(6*m); i++) { putchar(tab[i]);}
//header end

k=0;
while ( !feof(in) )
{
while ( ((tab_we[k]=getchar()) != EOF) && ( k<((6*m)-1) )) {k++;}
mpz_set(d1g,cg[0]); mpz_set(d4g,cg[1]);
mpz_set(c1g,cg[0]); mpz_set(c4g,cg[1]);

char_to_int_gmp(4); mpz_set(c2g,wy);
char_to_int_gmp(5); mpz_set(c3g,wy);
char_to_int_gmp(0); mpz_set(x1g,wy);
char_to_int_gmp(1); mpz_set(x2g,wy);
char_to_int_gmp(2); mpz_set(x3g,wy);
char_to_int_gmp(3); mpz_set(x4g,wy);

       mpz_sub(lig,x3g,c3g); 
       mpz_mul(lig,lig,d1g);
       mpz_add(mng,x2g,c2g); 
       mpz_mul(mng,mng,d4g);
       mpz_add(lig,lig,mng); 
       mpz_add_ui(mng,x4g,e4);
	   mpz_invert(mng,mng,apods);
	   mpz_mul(d2g,lig,mng); mpz_mod(d2g,d2g,apods);

       mpz_sub(lig,x2g,c2g);
       mpz_mul(lig,lig,d1g);
       mpz_add(mng,x3g,c3g);
       mpz_mul(mng,mng,d4g);
       mpz_sub(lig,mng,lig); 
       mpz_add_ui(mng,x4g,e4);
	   mpz_invert(mng,mng,apods);
	   mpz_mul(d3g,lig,mng); mpz_mod(d3g,d3g,apods);

	mpz_mul(modig,c1g,c1g);
	mpz_addmul(modig,c2g,c2g);
	mpz_addmul(modig,c3g,c3g);
	mpz_addmul(modig,c4g,c4g);
	    mpz_mul_ui(modig,modig,2); mpz_mod(modig,modig,apods);

mpz_add_ui(wy,x4g,e4); mpz_mod(wy,wy,apods);
mpz_mul_ui(wy_p,c1g,2); mpz_mod(wy_p,wy_p,apods);
if ( ((tab_we[k])==EOF) || (mpz_cmp_ui(modig,0)==0) || (mpz_cmp_ui(wy_p,0)==0) || (mpz_cmp_ui(wy,0)==0) ||  (mpz_cmp(x1g,qg)>0) || (mpz_cmp(x2g,qg)>0) || (mpz_cmp(x3g,qg)>0) || (mpz_cmp(x4g,qg)>0) || (mpz_cmp(c2g,qg)>0) || (mpz_cmp(c3g,qg)>0) ) {

if ( (mpz_cmp_ui(wy_p,0)==0) ) 
{ llt4++; goto koniec;}
if ( (mpz_cmp_ui(wy,0)==0) ) 
{ llt5++; }
if ( (mpz_cmp_ui(modig,0)==0) ) 
{ llt6++; }
if ( (tab_we[k]==EOF) ) 
{ llt7++; }

if ( (mpz_cmp(x1g,qg)>0) ) 
{ llt8++; }
if ( (mpz_cmp(x2g,qg)>0) ) 
{ llt9++; }
if ( (mpz_cmp(x3g,qg)>0) ) 
{ llt10++; }
if ( (mpz_cmp(x4g,qg)>0) ) 
{ llt11++; }
if ( (mpz_cmp(c2g,qg)>0) ) 
{ llt12++; }
if ( (mpz_cmp(c3g,qg)>0) ) 
{ llt13++; }

lli++;
{ goto licznadQR; }
}

else {

for (i=0;i<j;i++) { 
mpz_set(d1g,cg[2*i+0]); mpz_set(d4g,cg[2*i+1]);
mpz_set(c1g,cg[2*i+0]); mpz_set(c4g,cg[2*i+1]);

mpz_add(pa2b2,x2g,c2g);
mpz_add(pa3b3,x3g,c3g);
mpz_add_ui(pa4b4,x4g,e4); 
mpz_mul_ui(m2d1,d1g,2);

       mpz_sub(lig,x3g,c3g);
       mpz_mul(lig,lig,d1g);
       mpz_mul(mng,pa2b2,d4g);
       mpz_add(lig,lig,mng);
	   mpz_invert(mng,pa4b4,apods);
	   mpz_mul(d2g,lig,mng); mpz_mod(d2g,d2g,apods);

       mpz_sub(lig,x2g,c2g);
       mpz_mul(lig,lig,d1g);
       mpz_mul(mng,pa3b3,d4g);
       mpz_sub(lig,mng,lig);
	   mpz_invert(mng,pa4b4,apods);
	   mpz_mul(d3g,lig,mng); mpz_mod(d3g,d3g,apods);

	mpz_mul(modig,c1g,c1g);
	mpz_addmul(modig,c2g,c2g);
	mpz_addmul(modig,c3g,c3g);
	mpz_addmul(modig,c4g,c4g);
	    mpz_mul_ui(modig,modig,2); mpz_mod(modig,modig,apods);

	mpz_mul(modig,d1g,d1g);
	mpz_addmul(modig,d2g,d2g);
	mpz_addmul(modig,d3g,d3g);
	mpz_addmul(modig,d4g,d4g);
	    mpz_mul_ui(modig,modig,2);
	mpz_mul_ui(lig,x1g,2);
	mpz_mul(lig,lig,d1g);
	mpz_addmul(lig,pa2b2,d2g);
	mpz_addmul(lig,pa3b3,d3g);
	mpz_addmul(lig,pa4b4,d4g);
	   mpz_invert(mng,modig,apods);
	   mpz_mul(k1g,lig,mng); mpz_mod(k1g,k1g,apods);

        mpz_invert(mng,m2d1,apods); 
        mpz_mul(k2g,pa2b2,mng);
        mpz_invert(lig,d1g,apods);
        mpz_mul(lig,d2g,lig);
	mpz_mul(lig,lig,k1g);
	    mpz_sub(k2g,k2g,lig);   mpz_mod(k2g,k2g,apods);

        mpz_invert(mng,m2d1,apods); 
        mpz_mul(k3g,pa3b3,mng);
        mpz_invert(lig,d1g,apods);
        mpz_mul(lig,d3g,lig);
	mpz_mul(lig,lig,k1g);
	    mpz_sub(k3g,k3g,lig);   mpz_mod(k3g,k3g,apods);

        mpz_invert(mng,m2d1,apods); 
        mpz_mul(k4g,pa4b4,mng);
        mpz_invert(lig,d1g,apods);
        mpz_mul(lig,d4g,lig);
	mpz_mul(lig,lig,k1g);
	    mpz_sub(k4g,k4g,lig);   mpz_mod(k4g,k4g,apods);

mpz_set(c2g,d2g); mpz_set(c3g,d3g);
mpz_set(x1g,k1g); mpz_set(x2g,k2g); mpz_set(x3g,k3g); mpz_set(x4g,k4g);

mpz_set(klpomg[i],x1g);

mpz_add_ui(wy,x4g,e4); mpz_mod(wy,wy,apods);
mpz_mul_ui(wy_p,c1g,2); mpz_mod(wy_p,wy_p,apods);

if ( (mpz_cmp_ui(wy_p,0)==0) ) 
{ llt0++; goto licznadQR; }

if ( (mpz_cmp_ui(c1g,0)==0) ) 
{ llt3++; goto licznadQR; }

if ( (mpz_cmp_ui(wy,0)==0) ) 
{ llt1++;  goto licznadQR; }

if ( (mpz_cmp_ui(modig,0)==0) ) 
{ llt2++;  goto licznadQR; }
} //end for

int_to_chargg(d2g,4);
int_to_chargg(d3g,5);
int_to_chargg(k1g,0);
int_to_chargg(k2g,1);
int_to_chargg(k3g,2);
int_to_chargg(k4g,3);

if ( (mpz_cmp(k1g,q1g)>0) || (mpz_cmp(k2g,q1g)>0) || (mpz_cmp(k3g,q1g)>0) || (mpz_cmp(k4g,q1g)>0) || (mpz_cmp(d2g,q1g)>0) || (mpz_cmp(d3g,q1g)>0) )
{
prob++;
licznadQR:
lll++;
for (i=0; i<(6*m); i++) { putchar(h); }

//additional R
if (dz) {
	da3=0; da4=0; db2=0; 
	db3=0; da1=0; da2=0;

for (i=0;i<dj;i++) { dc1=dc[2*i+0]; dc4=dc[2*i+1];

	    dc2=(dc1*(da3-db3)+dc4*(da2+db2))/(da4+db4); 
	    dc3=(dc4*(da3+db3)-dc1*(da2-db2))/(da4+db4);
dx1=(2*da1*dc1+dc2*(da2+db2)+dc3*(da3+db3)+dc4*(da4+db4))/(2*(dc1*dc1+dc2*dc2+dc3*dc3+dc4*dc4));
	    dx2=((da2+db2)/(2*dc1))-((dc2/dc1)*dx1);
	    dx3=((da3+db3)/(2*dc1))-((dc3/dc1)*dx1);
	    dx4=((da4+db4)/(2*dc1))-((dc4/dc1)*dx1);

da1=dx1; da2=dx2; da3=dx3; da4=dx4; db2=dc2; db3=dc3;
dklpom[i]=dx1;
} //end for
for (i=1;i<dj;i++) { dc[2*i+1]=dklpom[i-1]/w; }

dtab[0]=dx1; dtab[1]=dx2; dtab[2]=dx3; dtab[3]=dx4;
dtab[4]=dc2; dtab[5]=dc3;

fwrite(dtab,1*sizeof(double),6,out);
} //end if

//additional end

//additional Zp
mpz_set_ui(wy,0);

mpz_set(c2g,wy);
mpz_set(c3g,wy);
mpz_set(x1g,wy);
mpz_set(x2g,wy);
mpz_set(x3g,wy);
mpz_set(x4g,wy);

mpz_set(d1g,cg[0]); mpz_set(d4g,cg[1]);
mpz_set(c1g,cg[0]); mpz_set(c4g,cg[1]);

for (i=0;i<j;i++) { 
mpz_set(d1g,cg[2*i+0]); mpz_set(d4g,cg[2*i+1]);
mpz_set(c1g,cg[2*i+0]); mpz_set(c4g,cg[2*i+1]);

       mpz_sub(lig,x3g,c3g); 
       mpz_mul(lig,lig,d1g); mpz_mod(lig,lig,apods);
       mpz_add(mng,x2g,c2g); 
       mpz_mul(mng,mng,d4g); mpz_mod(mng,mng,apods);
       mpz_add(lig,lig,mng); 
       mpz_add_ui(mng,x4g,e4);
	   mpz_invert(mng,mng,apods);
	   mpz_mul(d2g,lig,mng); mpz_mod(d2g,d2g,apods);

       mpz_sub(lig,x2g,c2g);
       mpz_mul(lig,lig,d1g); mpz_mod(lig,lig,apods);
       mpz_add(mng,x3g,c3g); 
       mpz_mul(mng,mng,d4g); mpz_mod(mng,mng,apods);
       mpz_sub(lig,mng,lig); 
       mpz_add_ui(mng,x4g,e4);
	   mpz_invert(mng,mng,apods);
	   mpz_mul(d3g,lig,mng); mpz_mod(d3g,d3g,apods);

	mpz_mul(modig,d1g,d1g); mpz_mod(modig,modig,apods);
	mpz_addmul(modig,d2g,d2g); mpz_mod(modig,modig,apods);
	mpz_addmul(modig,d3g,d3g); mpz_mod(modig,modig,apods);
	mpz_addmul(modig,d4g,d4g); mpz_mod(modig,modig,apods);
	    mpz_mul_ui(modig,modig,2); mpz_mod(modig,modig,apods);
	mpz_mul_ui(lig,x1g,2);  mpz_mod(lig,lig,apods);
	mpz_mul(lig,lig,d1g);   mpz_mod(lig,lig,apods);
	mpz_add(mng,x2g,c2g); 
	mpz_addmul(lig,mng,d2g);mpz_mod(lig,lig,apods);
	mpz_add(mng,x3g,c3g); 
	mpz_addmul(lig,mng,d3g); mpz_mod(lig,lig,apods);
	mpz_add_ui(mng,x4g,e4);
	mpz_addmul(lig,mng,d4g);mpz_mod(lig,lig,apods);
	   mpz_invert(mng,modig,apods); mpz_mod(mng,mng,apods);
	   mpz_mul(k1g,lig,mng); mpz_mod(k1g,k1g,apods);
	
	mpz_add(lig,x2g,c2g); 
	mpz_mul_ui(mng,d1g,2);  mpz_mod(mng,mng,apods);
        mpz_invert(mng,mng,apods); 
        mpz_mul(k2g,lig,mng); mpz_mod(k2g,k2g,apods);	
        mpz_invert(lig,d1g,apods);
        mpz_mul(lig,d2g,lig);mpz_mod(lig,lig,apods);	
	mpz_mul(lig,lig,k1g);    mpz_mod(lig,lig,apods);
	    mpz_sub(k2g,k2g,lig);   mpz_mod(k2g,k2g,apods);

	mpz_add(lig,x3g,c3g); 
	mpz_mul_ui(mng,d1g,2);  mpz_mod(mng,mng,apods);
        mpz_invert(mng,mng,apods); 
        mpz_mul(k3g,lig,mng); mpz_mod(k3g,k3g,apods);	
        mpz_invert(lig,d1g,apods);
        mpz_mul(lig,d3g,lig);mpz_mod(lig,lig,apods);	
	mpz_mul(lig,lig,k1g);    mpz_mod(lig,lig,apods);
	    mpz_sub(k3g,k3g,lig);   mpz_mod(k3g,k3g,apods);
    
	mpz_add_ui(lig,x4g,e4); 
	mpz_mul_ui(mng,d1g,2);  mpz_mod(mng,mng,apods);
        mpz_invert(mng,mng,apods); 
        mpz_mul(k4g,lig,mng); mpz_mod(k4g,k4g,apods);	
        mpz_invert(lig,d1g,apods);
        mpz_mul(lig,d4g,lig);mpz_mod(lig,lig,apods);	
	mpz_mul(lig,lig,k1g);    mpz_mod(lig,lig,apods);
	    mpz_sub(k4g,k4g,lig);   mpz_mod(k4g,k4g,apods);

mpz_set(c2g,d2g); mpz_set(c3g,d3g);
mpz_set(x1g,k1g); mpz_set(x2g,k2g); mpz_set(x3g,k3g); mpz_set(x4g,k4g);

mpz_set(klpomg[i],x1g);
} //end for

for (i=1;i<j;i++) { mpz_set(cg[2*i+0],klpomg[i-1]); }

int_to_chargg(d2g,4);
int_to_chargg(d3g,5);
int_to_chargg(k1g,0);
int_to_chargg(k2g,1);
int_to_chargg(k3g,2);
int_to_chargg(k4g,3);

for (i=0; i<(6*m); i++) { putchar(tab[i]);}

//additional Zp end

for (ii=0;ii<m;ii++) {
	da3=tab_we[2+6*ii]+3; da4=tab_we[3+6*ii]; db2=tab_we[4+6*ii]+5; 
	db3=tab_we[5+6*ii]+7; da1=tab_we[0+6*ii]; da2=tab_we[1+6*ii]+11;

for (i=0;i<dj;i++) { dc1=dc[2*i+0]; dc4=dc[2*i+1];
db4=de[i];
		    dc2=(dc1*(da3-db3)+dc4*(da2+db2))/(da4+db4); 
		    dc3=(dc4*(da3+db3)-dc1*(da2-db2))/(da4+db4);
dx1=(2*da1*dc1+dc2*(da2+db2)+dc3*(da3+db3)+dc4*(da4+db4))/(2*(dc1*dc1+dc2*dc2+dc3*dc3+dc4*dc4));
		    dx2=((da2+db2)/(2*dc1))-((dc2/dc1)*dx1);
		    dx3=((da3+db3)/(2*dc1))-((dc3/dc1)*dx1);
		    dx4=((da4+db4)/(2*dc1))-((dc4/dc1)*dx1);

da1=dx1; da2=dx2; da3=dx3; da4=dx4; db2=dc2; db3=dc3;
dklpom[i]=dx1;
} //end for
for (i=1;i<dj;i++) { dc[2*i+1]=dklpom[i-1]/w; }

dtab[0+6*ii]=dx1; dtab[1+6*ii]=dx2; dtab[2+6*ii]=dx3; 
dtab[3+6*ii]=dx4; dtab[4+6*ii]=dc2; dtab[5+6*ii]=dc3;
} //end for 2

fwrite(dtab,1*sizeof(double),(6*m),out); //over R

const c=1000000000;
for (i=0; i<(6*m); i++) { 
if (tab_we[i]*c==dtab[i]*c) {dhamdchr++;}
mpz_set_ui(dhd1,tab_we[i]*c);
mpz_set_ui(dhd2,(int)dtab[i]*c);
dhamdi=mpz_hamdist(dhd1,dhd2);
dhamd=dhamd+dhamdi;
if (dhamdi>dhamdmax) {dhamdmax=dhamdi;}
if (dhamdi<dhamdmin) {dhamdmin=dhamdi;}
dhamdit[dhamdi]++;

tab_chrd[tab_we[i]]++;
	 }
}//end if BAD
else
{
mli++;

for (i=1;i<j;i++) { mpz_set(cg[2*i+1],klpomg[i-1]); }

for (i=0; i<(6*m); i++) { putchar(tab[i]);

if (tab_we[i]==tab[i]) {hamdchr++;}
mpz_set_ui(hd1,tab_we[i]);
mpz_set_ui(hd2,tab[i]);
hamdi=mpz_hamdist(hd1,hd2);
hamd=hamd+hamdi;
if (hamdi>hamdmax) {hamdmax=hamdi;}
if (hamdi<hamdmin) {hamdmin=hamdi;}
hamdit[hamdi]++;

tab_chr[tab[i]]++;
tab_chrd[tab_we[i]]++;
	}
}
} //end else BAD
k=0; 
} //endwhile

if (dbg) { 
fproc=100.0*(lll)/(lll+mli);
fprintf(kom,"\n%i; :%i: :%i: :%2.12f\% (%i)\n.(2*c1=0:%i) (a4+b4=0:%i) (2*suma^2=0:%i) (EOF:%i)...(x1:%i).(x2:%i).(x3:%i).(x4:%i)..(c2:%i).(c3:%i)", lll, lli, mli, fproc, prob ,llt4,llt5,llt6,llt7,llt8,llt9,llt10,llt11,llt12,llt13);
fprintf(kom,"\n..(2*c1=0:%i) (c1=0:%i) (a4+b4=0:%i) (2*suma^2=0:%i).\n",llt0,llt3,llt1,llt2);

fprintf(kom,"Length ciphertext = %i B\n",dz*4*12+4*12+6*m+mli*6*m+(lll)*(6*9*m+6*(m+8)));
fprintf(kom,"Excess ciphertext = %i B\n",dz*4*12+4*12+6*m+mli*0+(lll)*(6*9*m+6*(m+8)));
fprintf(kom,"Excess ciphertext = %f %%\n",100.0*(dz*4*12+4*12+6*m+(lll)*(6*9*m+6*(m+8)))/(dz*4*12+4*12+6*m+mli*6*m+(lll)*(6*9*m+6*(m+8))));
	}

    if(gettimeofday(&tv2,&tz)!=0)
        fprintf(kom,"\nWarning : could not gettimeofday() !");

    timediff(&tv2,&tv1,&tvdiff);

if (dbg) { 
    fprintf(kom,"Process ENKODING took (including I/O): %f sec",(tvdiff.tv_sec+0.000001*tvdiff.tv_usec));
    fprintf(kom,"\nProcess ENKODING took (including I/O): %f kB/sec",0.001*(dz*4*12+4*12+6*m+mli*6*m+(lll)*(6*9*m+6*(m+8)))/(tvdiff.tv_sec+0.000001*tvdiff.tv_usec));   
	}

if (dbg) { 
fprintf(kom,"\nNormalized HammingDistance (bit)  = %f (min:%i max:%i)",hamd/(6.0*mli*8*m),hamdmin,hamdmax);
fprintf(kom,"--> (RQ-int)  = %f (min:%i max:%i)",dhamd/(6.0*lll*32*m),dhamdmin,dhamdmax);
for (i=0; i<=8; i++) {fprintf(kom,"\n %i -> %-51i --> %-10i -> %-10i -> %-10i -> %-10i",i,hamdit[i],dhamdit[i],dhamdit[i+8],dhamdit[i+16],dhamdit[i+24] );}
fprintf(kom,"\nNormalized HammingDistance (char) = %-22f",1-hamdchr/(6.0*mli*m));
fprintf(kom,"--> (RQ-double) = %f",1-dhamdchr/(6.0*lll*32*m));

for (i=0;i<256;i++) { sumad=sumad+tab_chrd[i]; }
mind=tab_chrd[0];
maxd=tab_chrd[0];
for (i=0;i<256;i++) 
{
if (tab_chrd[i]>maxd) {maxd=tab_chrd[i];}
if (tab_chrd[i]<mind) {mind=tab_chrd[i];}
}
fprintf(kom,"\nStatistics for plaintext  characters : (%i%s%i) difference %i that is %f %% (%i) s:=%i",mind,"<",maxd,maxd-mind,100.0*(maxd-mind)/maxd, inned, sumad);

for (i=0;i<256;i++) { suma=suma+tab_chr[i]; }
min=tab_chr[0];
max=tab_chr[0];
for (i=0;i<256;i++) 
{
if (tab_chr[i]>max) {max=tab_chr[i];}
if (tab_chr[i]<min) {min=tab_chr[i];}
}
fprintf(kom,"\nStatistics for cipher characters (Zp): (%i%s%i) difference %i that is %f %% (%i) s:=%i",min,"<",max,max-min,100.0*(max-min)/max, inne, suma);	}
koniec:
if ( (mpz_cmp_ui(wy_p,0)==0) ) { fprintf(kom,"\n BAD KEY!!! \n"); }
if ( (length!=0) ) { fprintf(kom,"\n BAD LENGTH KEY!!! \n"); }

if (dbg) { fprintf(kom,"\n -END KODING- \n"); }
    
  fclose(kom);
  fclose(klucz);
  fclose( in );
  fclose( out );

    gmp_randclear(state);
    mpz_clear(rop);

mpz_clear(wy); mpz_clear(wy_p);
mpz_clear(wep); mpz_clear(we_p); mpz_clear(we_p2);
//mpz_clear(k1g);
mpz_clear(k2g); mpz_clear(k3g); mpz_clear(k4g); 
mpz_clear(d1g); mpz_clear(d2g); mpz_clear(d3g); mpz_clear(d4g); 
mpz_clear(x1g); mpz_clear(x2g); mpz_clear(x3g); mpz_clear(x4g); 
mpz_clear(c1g); mpz_clear(c2g); mpz_clear(c3g); mpz_clear(c4g); 
for (i=0;i<(2*rund);i++) {mpz_clear(cg[i]);}
for (i=0;i<(rund);i++) {mpz_clear(klpomg[i]);}
mpz_clear(modig);
mpz_clear(pa2b2); mpz_clear(pa3b3); mpz_clear(pa4b4); mpz_clear(m2d1);

mpz_clear(qg); mpz_clear(q1g);
mpz_clear(hd1); mpz_clear(hd2);
mpz_clear(dhd1); mpz_clear(dhd2);
} //endmain
