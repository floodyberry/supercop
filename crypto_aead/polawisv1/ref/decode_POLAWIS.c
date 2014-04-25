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

    int rount(double number){ return (number >= 0) ? (int)(number + 0.5) : (int)(number - 0.5); }

int main(int argc, char *argv[])
{	mpz_t apods;
    mpz_init(apods);
    char *pp , *klg[6], *kluczc, *komc;
    int dm, mm,m, dbg=1, dz=1, auth=1;

m=jak;

{mpz_ui_pow_ui(apods,ch,m); if (rp < 0) 
{mpz_sub_ui(apods,apods,abs(rp));} else {mpz_add_ui(apods,apods,rp);} mm=m;}

    FILE *in = stdin; FILE *out = stdout; FILE *klucz = klucz;  FILE *kom = kom;
    unsigned b4 = 1, e4 = 1 , kl[2*rund*m], tab_wy[6*m], tab[6*m];
    int j=rund, dj=8, i, ii, h=254, k=0, stan, length=0, dtab_wy[6*m], dkl[32], mli=0,lll=0, warunek;
    double dklpom[8], de[8], dc[2*rund*m], w=1000000.1, dtab[6*m], dx1, dx2, dx3, dx4, dc2, dc3, dc1, dc4, db4, dy1, dy2, dy3, dy4, dz2, dz3;
    long int  min, max, inne=0, suma=0, tab_chr[256];
    long int  mind, maxd, inned=0, sumad=0, tab_chrd[256];
    mpz_t  k1g, k2g, k3g, k4g, d2g, d3g, d1g, d4g;
    mpz_t  x1g, x2g, x3g, x4g, c2g, c3g, c1g, c4g;
    mpz_t klpomg[rund], cg[2*rund];
  
mpz_init(k1g); mpz_init(k2g); mpz_init(k3g); mpz_init(k4g); 
mpz_init(d1g); mpz_init(d2g); mpz_init(d3g); mpz_init(d4g); 
mpz_init(x1g); mpz_init(x2g); mpz_init(x3g); mpz_init(x4g); 
mpz_init(c1g); mpz_init(c2g); mpz_init(c3g); mpz_init(c4g); 
for (i=0;i<(2*rund);i++) {mpz_init(cg[i]);}
for (i=0;i<(rund);i++) {mpz_init(klpomg[i]);}

#include <sys/time.h>
struct timeval tv1,tv2;
struct timeval tvdiff;
struct timezone tz;
void timediff(struct timeval* a,struct timeval* b,struct timeval* result)
{    (result)->tv_sec  = (a)->tv_sec  - (b)->tv_sec;
    (result)->tv_usec = (a)->tv_usec - (b)->tv_usec;
    if((result)->tv_usec < 0)
    {   --(result)->tv_sec; (result)->tv_usec += 1000000;    }	}

for (i=0;i<256;i++) {tab_chr[i]=0; }
for (i=0;i<256;i++) {tab_chrd[i]=0; }

mpz_t wy; mpz_t wy_p;
mpz_init(wy); mpz_init(wy_p);

void char_to_int_gmp(int poz){
int l=0, ll; 
	mpz_set_ui(wy,0);
	mpz_set_ui(wy_p,1);
	    for (ll=m-1;ll>=0;ll--) {
		mpz_ui_pow_ui(wy_p,ch,ll);
		mpz_mul_ui(wy_p,wy_p,tab[(poz*m+l)]);
	        mpz_add(wy,wy,wy_p);
	    l++;}
	mpz_mod(wy,wy,apods);
}

mpz_t wep; mpz_t we_p; mpz_t we_p2;
mpz_init(wep); mpz_init(we_p); mpz_init(we_p2);

void int_to_chargg(mpz_t we, int poz){
int l,ll;
    mpz_set(wep,we);
	mpz_ui_pow_ui(we_p,ch,m-1);
	mpz_tdiv_q(we_p2,wep,we_p);
	tab_wy[(poz*m+0)]=mpz_get_ui(we_p2);
	    l=0; 
		for (ll=m-1;ll>1;ll--) {l++;
    		mpz_ui_pow_ui(we_p,ch,ll);
		mpz_mod(we_p,wep,we_p);
	        mpz_ui_pow_ui(we_p2,ch,ll-1);
		mpz_tdiv_q(we_p,we_p,we_p2);
		tab_wy[(poz*m+l)]=mpz_get_ui(we_p);
		}
	mpz_mod_ui(we_p,wep,ch);
	tab_wy[(poz*m+l+1)]=mpz_get_ui(we_p); }

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
if (dbg) {  fprintf(kom,"\n--start dekoding-- \n");
	    fprintf(kom,"(%i:=%ibits)p= 2^%i+(%i) \n",m,m*8,m*8,rp);
	    }
    /* first, record the start time */
    if(gettimeofday(&tv1,&tz)!=0)
        fprintf(kom,"\nWarning : could not gettimeofday() !");

klucz = fopen( kluczc , "rb" );	
while ( ((getc(klucz)) != EOF) ) {k++;}
if (k<(rund*2*m)) {length++; goto koniec;}
fclose(klucz);

klucz = fopen( kluczc , "rb" );	
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

mpz_set(c1g,cg[0]);
mpz_mul_ui(c1g,c1g,2); mpz_mod(c1g,c1g,apods);

if ( (mpz_cmp_ui(c1g,0)==0) )
{ goto koniec;}

{   
if (dz) {
    fread(dtab,1*sizeof(double),6,in);

    dc2=dtab[4]; dc3=dtab[5]; dx1=dtab[0]; dx2=dtab[1]; dx3=dtab[2]; dx4=dtab[3];
for (i=dj;i>0;i--) {
    dc1=dc[2*i-2]; dc4=dc[2*i-1];

    dy1=dx1*dc1-dx2*dc2-dx3*dc3-dx4*dc4; dy2=dx2*dc1+dx1*dc2-dx4*dc3+dx3*dc4;
    dy3=dx3*dc1+dx4*dc2+dx1*dc3-dx2*dc4; dy4=2*dx4*dc1+2*dx1*dc4-db4;
    dz2=dx2*dc1+dx1*dc2+dx4*dc3-dx3*dc4; dz3=dx3*dc1-dx4*dc2+dx1*dc3+dx2*dc4;

dx1=dy1; dx2=dy2; dx3=dy3; dx4=dy4; dc2=dz2; dc3=dz3;
dklpom[i-1]=dx1;
}	

for (i=dj;i>1;i--) { dc[2*i-1]=dklpom[i-1]/w; }

    dtab_wy[0]=rount(dy1); dtab_wy[1]=rount(dy2);
    dtab_wy[2]=rount(dy3); dtab_wy[3]=rount(dy4);
    dtab_wy[4]=rount(dz2); dtab_wy[5]=rount(dz3);

if (dbg) { for (i=0;i<6;i++) {fprintf(kom,":%i:",dtab_wy[i]);} }

if (dbg) { 
if ((dtab_wy[0]!=0)||(dtab_wy[1]!=0)||(dtab_wy[2]!=0)||(dtab_wy[3]!=0)||(dtab_wy[4]!=0)||(dtab_wy[5]!=0) ) 
{fprintf(kom," INVALID  KEY \n");} else { fprintf(kom," KEY OK\n");} }

if ((dtab_wy[0]!=0)||(dtab_wy[1]!=0)||(dtab_wy[2]!=0)||(dtab_wy[3]!=0)||(dtab_wy[4]!=0)||(dtab_wy[5]!=0) ) 
{ goto koniec;}
} //end if

    fread(dtab,1*sizeof(double),6,in);

    dc2=dtab[4]; dc3=dtab[5]; dx1=dtab[0]; dx2=dtab[1]; dx3=dtab[2]; dx4=dtab[3];
for (i=dj;i>0;i--) {
    dc1=dc[2*i-2]; dc4=dc[2*i-1];

    dy1=dx1*dc1-dx2*dc2-dx3*dc3-dx4*dc4; dy2=dx2*dc1+dx1*dc2-dx4*dc3+dx3*dc4;
    dy3=dx3*dc1+dx4*dc2+dx1*dc3-dx2*dc4; dy4=2*dx4*dc1+2*dx1*dc4-db4;
    dz2=dx2*dc1+dx1*dc2+dx4*dc3-dx3*dc4; dz3=dx3*dc1-dx4*dc2+dx1*dc3+dx2*dc4;

dx1=dy1; dx2=dy2; dx3=dy3; dx4=dy4; dc2=dz2; dc3=dz3;
dklpom[i-1]=dx1;
}	
for (i=dj;i>1;i--) { dc[2*i-1]=dklpom[i-1]/w; }

    dtab_wy[0]=rount(dy1); dtab_wy[1]=rount(dy2);
    dtab_wy[2]=rount(dy3); dtab_wy[3]=rount(dy4);
    dtab_wy[4]=rount(dz2); dtab_wy[5]=rount(dz3);
    }

if (dbg) { for (i=0;i<6;i++) {fprintf(kom,":%i:",dtab_wy[i]);} fprintf(kom,"\n"); }

//differ header start
for (k=0; k<(6*m); k++) {tab[k]=getchar(); }

char_to_int_gmp(4); mpz_set(d2g,wy);
char_to_int_gmp(5); mpz_set(d3g,wy);
char_to_int_gmp(0); mpz_set(k1g,wy);
char_to_int_gmp(1); mpz_set(k2g,wy);
char_to_int_gmp(2); mpz_set(k3g,wy);
char_to_int_gmp(3); mpz_set(k4g,wy);

for (i=j;i>0;i--) {
    mpz_set(d1g,cg[2*i-2]); mpz_set(d4g,cg[2*i-1]); 

       mpz_mul(x1g,k1g,d1g); mpz_mod(x1g,x1g,apods);
    mpz_submul(x1g,k2g,d2g); mpz_mod(x1g,x1g,apods);
    mpz_submul(x1g,k3g,d3g); mpz_mod(x1g,x1g,apods);
    mpz_submul(x1g,k4g,d4g); mpz_mod(x1g,x1g,apods);
       mpz_mul(x2g,k2g,d1g); mpz_mod(x2g,x2g,apods);
    mpz_addmul(x2g,k1g,d2g); mpz_mod(x2g,x2g,apods);
    mpz_submul(x2g,k4g,d3g); mpz_mod(x2g,x2g,apods);
    mpz_addmul(x2g,k3g,d4g); mpz_mod(x2g,x2g,apods);
       mpz_mul(x3g,k3g,d1g); mpz_mod(x3g,x3g,apods);
    mpz_addmul(x3g,k4g,d2g); mpz_mod(x3g,x3g,apods);
    mpz_addmul(x3g,k1g,d3g); mpz_mod(x3g,x3g,apods);
    mpz_submul(x3g,k2g,d4g); mpz_mod(x3g,x3g,apods);
       mpz_mul(x4g,k4g,d1g); mpz_mod(x4g,x4g,apods);
    mpz_addmul(x4g,k4g,d1g); mpz_mod(x4g,x4g,apods);
    mpz_addmul(x4g,k1g,d4g); mpz_mod(x4g,x4g,apods);
    mpz_addmul(x4g,k1g,d4g); mpz_mod(x4g,x4g,apods);
    mpz_sub_ui(x4g,x4g,e4); mpz_mod(x4g,x4g,apods);
       mpz_mul(c2g,k2g,d1g); mpz_mod(c2g,c2g,apods);
    mpz_addmul(c2g,k1g,d2g); mpz_mod(c2g,c2g,apods);
    mpz_addmul(c2g,k4g,d3g); mpz_mod(c2g,c2g,apods);
    mpz_submul(c2g,k3g,d4g); mpz_mod(c2g,c2g,apods);
       mpz_mul(c3g,k3g,d1g); mpz_mod(c3g,c3g,apods);
    mpz_submul(c3g,k4g,d2g); mpz_mod(c3g,c3g,apods);
    mpz_addmul(c3g,k1g,d3g); mpz_mod(c3g,c3g,apods);
    mpz_addmul(c3g,k2g,d4g); mpz_mod(c3g,c3g,apods);

mpz_set(klpomg[i-1],x1g);
mpz_set(k1g,x1g); mpz_set(k2g,x2g); mpz_set(k3g,x3g); mpz_set(k4g,x4g); mpz_set(d2g,c2g); mpz_set(d3g,c3g);
}	
for (i=j;i>1;i--) { mpz_set(cg[2*i-2],klpomg[i-1]); }
//header end

tab[0]=getchar();
while( !feof(in) )
{
for (k=1; k<(6*m); k++) {tab[k]=getchar(); }

char_to_int_gmp(4); mpz_set(d2g,wy);
char_to_int_gmp(5); mpz_set(d3g,wy);
char_to_int_gmp(0); mpz_set(k1g,wy);
char_to_int_gmp(1); mpz_set(k2g,wy);
char_to_int_gmp(2); mpz_set(k3g,wy);
char_to_int_gmp(3); mpz_set(k4g,wy);

if (tab[0]==h) { warunek=(tab[0]==h);for (i=1;i<(6*m);i++) {warunek=(warunek && (tab[i]==h));} }
else {warunek=0;}

if ( warunek )
    {
    lll++;

//addition R

if (dz) {
    fread(dtab,1*sizeof(double),6,in);

    dc2=dtab[4]; dc3=dtab[5]; dx1=dtab[0]; dx2=dtab[1]; dx3=dtab[2]; dx4=dtab[3];
for (i=dj;i>0;i--) {
    dc1=dc[2*i-2]; dc4=dc[2*i-1];

    dy1=dx1*dc1-dx2*dc2-dx3*dc3-dx4*dc4; dy2=dx2*dc1+dx1*dc2-dx4*dc3+dx3*dc4;
    dy3=dx3*dc1+dx4*dc2+dx1*dc3-dx2*dc4; dy4=2*dx4*dc1+2*dx1*dc4-db4;
    dz2=dx2*dc1+dx1*dc2+dx4*dc3-dx3*dc4; dz3=dx3*dc1-dx4*dc2+dx1*dc3+dx2*dc4;

dx1=dy1; dx2=dy2; dx3=dy3; dx4=dy4; dc2=dz2; dc3=dz3;
dklpom[i-1]=dx1;
}	

for (i=dj;i>1;i--) { dc[2*i-1]=dklpom[i-1]/w; }

    dtab_wy[0]=rount(dy1); dtab_wy[1]=rount(dy2);
    dtab_wy[2]=rount(dy3); dtab_wy[3]=rount(dy4);
    dtab_wy[4]=rount(dz2); dtab_wy[5]=rount(dz3);

if (dbg) { for (i=0;i<6;i++) {fprintf(kom,":%i:",dtab_wy[i]);} }

if (dbg) { 
if ((dtab_wy[0]!=0)||(dtab_wy[1]!=0)||(dtab_wy[2]!=0)||(dtab_wy[3]!=0)||(dtab_wy[4]!=0)||(dtab_wy[5]!=0) ) 
{auth=0; fprintf(kom," INVALID  KEY, end on R\n");} else { fprintf(kom," KEY OK, end on R\n");} }

if ((dtab_wy[0]!=0)||(dtab_wy[1]!=0)||(dtab_wy[2]!=0)||(dtab_wy[3]!=0)||(dtab_wy[4]!=0)||(dtab_wy[5]!=0) ) 
{ goto koniec;}
}
//addition end

//addition Zp
for (k=0; k<(6*m); k++) {tab[k]=getchar(); }

char_to_int_gmp(4); mpz_set(d2g,wy);
char_to_int_gmp(5); mpz_set(d3g,wy);
char_to_int_gmp(0); mpz_set(k1g,wy);
char_to_int_gmp(1); mpz_set(k2g,wy);
char_to_int_gmp(2); mpz_set(k3g,wy);
char_to_int_gmp(3); mpz_set(k4g,wy);

for (i=j;i>0;i--) {
    mpz_set(d1g,cg[2*i-2]); mpz_set(d4g,cg[2*i-1]); 

       mpz_mul(x1g,k1g,d1g); mpz_mod(x1g,x1g,apods);
    mpz_submul(x1g,k2g,d2g); mpz_mod(x1g,x1g,apods);
    mpz_submul(x1g,k3g,d3g); mpz_mod(x1g,x1g,apods);
    mpz_submul(x1g,k4g,d4g); mpz_mod(x1g,x1g,apods);
       mpz_mul(x2g,k2g,d1g); mpz_mod(x2g,x2g,apods);
    mpz_addmul(x2g,k1g,d2g); mpz_mod(x2g,x2g,apods);
    mpz_submul(x2g,k4g,d3g); mpz_mod(x2g,x2g,apods);
    mpz_addmul(x2g,k3g,d4g); mpz_mod(x2g,x2g,apods);
       mpz_mul(x3g,k3g,d1g); mpz_mod(x3g,x3g,apods);
    mpz_addmul(x3g,k4g,d2g); mpz_mod(x3g,x3g,apods);
    mpz_addmul(x3g,k1g,d3g); mpz_mod(x3g,x3g,apods);
    mpz_submul(x3g,k2g,d4g); mpz_mod(x3g,x3g,apods);
       mpz_mul(x4g,k4g,d1g); mpz_mod(x4g,x4g,apods);
    mpz_addmul(x4g,k4g,d1g); mpz_mod(x4g,x4g,apods);
    mpz_addmul(x4g,k1g,d4g); mpz_mod(x4g,x4g,apods);
    mpz_addmul(x4g,k1g,d4g); mpz_mod(x4g,x4g,apods);
    mpz_sub_ui(x4g,x4g,e4); mpz_mod(x4g,x4g,apods);
       mpz_mul(c2g,k2g,d1g); mpz_mod(c2g,c2g,apods);
    mpz_addmul(c2g,k1g,d2g); mpz_mod(c2g,c2g,apods);
    mpz_addmul(c2g,k4g,d3g); mpz_mod(c2g,c2g,apods);
    mpz_submul(c2g,k3g,d4g); mpz_mod(c2g,c2g,apods);
       mpz_mul(c3g,k3g,d1g); mpz_mod(c3g,c3g,apods);
    mpz_submul(c3g,k4g,d2g); mpz_mod(c3g,c3g,apods);
    mpz_addmul(c3g,k1g,d3g); mpz_mod(c3g,c3g,apods);
    mpz_addmul(c3g,k2g,d4g); mpz_mod(c3g,c3g,apods);

mpz_set(klpomg[i-1],x1g);
mpz_set(k1g,x1g); mpz_set(k2g,x2g); mpz_set(k3g,x3g); mpz_set(k4g,x4g); mpz_set(d2g,c2g); mpz_set(d3g,c3g);
}	
for (i=j;i>1;i--) { mpz_set(cg[2*i-2],klpomg[i-1]); }

    dtab_wy[0]=mpz_get_ui(x1g); dtab_wy[1]=mpz_get_ui(x2g);
    dtab_wy[2]=mpz_get_ui(x3g); dtab_wy[3]=mpz_get_ui(x4g);
    dtab_wy[4]=mpz_get_ui(c2g); dtab_wy[5]=mpz_get_ui(c3g);

if (dbg) { for (i=0;i<6;i++) {fprintf(kom,":%i:",dtab_wy[i]);} }

if (dbg) { 
if ((dtab_wy[0]!=0)||(dtab_wy[1]!=0)||(dtab_wy[2]!=0)||(dtab_wy[3]!=0)||(dtab_wy[4]!=0)||(dtab_wy[5]!=0) ) 
{auth=0; fprintf(kom," INVALID  KEY, end on Zp\n");} else { fprintf(kom," KEY OK, end on Zp\n");} }

if ((dtab_wy[0]!=0)||(dtab_wy[1]!=0)||(dtab_wy[2]!=0)||(dtab_wy[3]!=0)||(dtab_wy[4]!=0)||(dtab_wy[5]!=0) ) 
{ goto koniec;}
//addition Zp end

    fread(dtab,1*sizeof(double),(6*m),in);

for (ii=0;ii<m;ii++) {
    dc2=dtab[4+6*ii]; dc3=dtab[5+6*ii]; dx1=dtab[0+6*ii]; 
    dx2=dtab[1+6*ii]; dx3=dtab[2+6*ii]; dx4=dtab[3+6*ii];

for (i=dj;i>0;i--) {
    dc1=dc[2*i-2]; dc4=dc[2*i-1];

    dy1=dx1*dc1-dx2*dc2-dx3*dc3-dx4*dc4; dy2=dx2*dc1+dx1*dc2-dx4*dc3+dx3*dc4;
    dy3=dx3*dc1+dx4*dc2+dx1*dc3-dx2*dc4; dy4=2*dx4*dc1+2*dx1*dc4-de[i-1];
    dz2=dx2*dc1+dx1*dc2+dx4*dc3-dx3*dc4; dz3=dx3*dc1-dx4*dc2+dx1*dc3+dx2*dc4;

dx1=dy1; dx2=dy2; dx3=dy3; dx4=dy4; dc2=dz2; dc3=dz3;
dklpom[i-1]=dx1;
}	

for (i=dj;i>1;i--) { dc[2*i-1]=dklpom[i-1]/w; }

    dtab_wy[0+6*ii]=rount(dy1); dtab_wy[1+6*ii]=rount(dy2)-11;
    dtab_wy[2+6*ii]=rount(dy3)-3; dtab_wy[3+6*ii]=rount(dy4);
    dtab_wy[4+6*ii]=rount(dz2)-5; dtab_wy[5+6*ii]=rount(dz3)-7;
} //end for 2

        for (i=0;i<(6*m);i++) {	tab_chrd[tab[i]]++;	}

    i=0;
    while ( (i<(6*m)) && (dtab_wy[i]!=EOF) ) {fputc(dtab_wy[i],out);
    	tab_chr[dtab_wy[i]]++;
     i++;}
    }
else
    {
mli++;
for (i=j;i>0;i--) {
    mpz_set(d1g,cg[2*i-2]); mpz_set(d4g,cg[2*i-1]); 

       mpz_mul(x1g,k1g,d1g);
    mpz_submul(x1g,k2g,d2g);
    mpz_submul(x1g,k3g,d3g);
    mpz_submul(x1g,k4g,d4g); mpz_mod(x1g,x1g,apods);
       mpz_mul(x2g,k2g,d1g);
    mpz_addmul(x2g,k1g,d2g);
    mpz_submul(x2g,k4g,d3g);
    mpz_addmul(x2g,k3g,d4g); mpz_mod(x2g,x2g,apods);
       mpz_mul(x3g,k3g,d1g);
    mpz_addmul(x3g,k4g,d2g);
    mpz_addmul(x3g,k1g,d3g);
    mpz_submul(x3g,k2g,d4g); mpz_mod(x3g,x3g,apods);
       mpz_mul(x4g,k4g,d1g);
    mpz_addmul(x4g,k4g,d1g);
    mpz_addmul(x4g,k1g,d4g);
    mpz_addmul(x4g,k1g,d4g);
    mpz_sub_ui(x4g,x4g,e4); mpz_mod(x4g,x4g,apods);
       mpz_mul(c2g,k2g,d1g);
    mpz_addmul(c2g,k1g,d2g);
    mpz_addmul(c2g,k4g,d3g);
    mpz_submul(c2g,k3g,d4g); mpz_mod(c2g,c2g,apods);
       mpz_mul(c3g,k3g,d1g);
    mpz_submul(c3g,k4g,d2g);
    mpz_addmul(c3g,k1g,d3g);
    mpz_addmul(c3g,k2g,d4g); mpz_mod(c3g,c3g,apods);

mpz_set(klpomg[i-1],x1g);
mpz_set(k1g,x1g); mpz_set(k2g,x2g); mpz_set(k3g,x3g); mpz_set(k4g,x4g); mpz_set(d2g,c2g); mpz_set(d3g,c3g);
}	
for (i=j;i>1;i--) { mpz_set(cg[2*i-1],klpomg[i-1]); }

int_to_chargg(c2g,4);
int_to_chargg(c3g,5);
int_to_chargg(x1g,0);
int_to_chargg(x2g,1);
int_to_chargg(x3g,2);
int_to_chargg(x4g,3);

        for (i=0;i<(6*m);i++) {putchar(tab_wy[i]);
	tab_chr[tab_wy[i]]++;
	tab_chrd[tab[i]]++;	}
	
    }//end else BAD
tab[0]=getchar();
} //endwhile

    if(gettimeofday(&tv2,&tz)!=0)
     fprintf(kom,"\nWarning : could not gettimeofday() !"); 

    if (dbg) { fprintf(kom,"\ngettimeofday()=%i",tv2); }

    timediff(&tv2,&tv1,&tvdiff);

if (dbg) { fprintf(kom,"\nProcess DEKODING took (including I/O): %f sec",(tvdiff.tv_sec+0.000001*tvdiff.tv_usec)); }
    
if (dbg) { fprintf(kom,"\nProcess DEKODING took (including I/O): %f kB/sec",0.001*((8*12+6*m+mli*6*m+(lll)*(6*9*m+6*(m+8)))/(tvdiff.tv_sec + 0.000001*tvdiff.tv_usec))); }

if (dbg) {
for (i=0;i<256;i++) {
sumad=sumad+tab_chrd[i]; }
mind=tab_chrd[0];
maxd=tab_chrd[0];
for (i=0;i<256;i++) 
{
if (tab_chrd[i]>maxd) {maxd=tab_chrd[i];}
if (tab_chrd[i]<mind) {mind=tab_chrd[i];}
}
fprintf(kom,"\nStatistics for cipher characters(ZpQ): (%i%s%i) difference %i that is %f %% (%i) s:=%i",mind,"<",maxd,maxd-mind,100.0*(maxd-mind)/maxd, inned, sumad);

for (i=0;i<256;i++) {
suma=suma+tab_chr[i]; }
min=tab_chr[0];
max=tab_chr[0];
for (i=0;i<256;i++) 
{
if (tab_chr[i]>max) {max=tab_chr[i];}
if (tab_chr[i]<min) {min=tab_chr[i];}
}
fprintf(kom,"\nStatistics for plaintext  characters : (%i%s%i) difference %i that is %f %% (%i) s:=%i",min,"<",max,max-min,100.0*(max-min)/max, inne, suma);
}

koniec:
mpz_mul_ui(c1g,c1g,2); mpz_mod(c1g,c1g,apods);
if ( (mpz_cmp_ui(c1g,0)==0) ) { fprintf(kom,"\n BAD KEY !!! \n"); }
if ( (length!=0) ) { fprintf(kom,"\n BAD LENGTH KEY !!! \n"); }

if (dbg) { 
	    if (auth==0) fprintf(kom,"\n AUTHORIZATION BAD!!!");
	    fprintf(kom,"\n--end dekod--\n"); }
	fclose(kom);
	fclose(klucz);
	fclose(in); 
	fclose(out);

mpz_clear(k1g); mpz_clear(k2g); mpz_clear(k3g); mpz_clear(k4g); 
mpz_clear(d1g); mpz_clear(d2g); mpz_clear(d3g); mpz_clear(d4g); 
mpz_clear(x1g); mpz_clear(x2g); mpz_clear(x3g); mpz_clear(x4g); 
mpz_clear(c1g); mpz_clear(c2g); mpz_clear(c3g); mpz_clear(c4g); 
for (i=0;i<(2*rund);i++) {mpz_clear(cg[i]);}
for (i=0;i<(rund);i++) {mpz_clear(klpomg[i]);}

mpz_clear(wy); mpz_clear(wy_p);
mpz_clear(wep); mpz_clear(we_p); mpz_clear(we_p2);
mpz_clear(apods); 
} //endmain
