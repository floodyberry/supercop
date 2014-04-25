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

int main( int argc, char *argv[] )
{	FILE *klucz = klucz; FILE *arch = arch;
    char *pp, *kluczc, *archc;
    int mm, m, stime, i, ii, warunek, k=0, ki=0, dbg=1;

    mpz_t rop, ax,apods,li,mn, amnd;
    mpz_init(rop);
    mpz_init(ax); mpz_init(apods); mpz_init(li); mpz_init(mn);
    mpz_init(amnd);

    m=jak;

{mpz_ui_pow_ui(apods,ch,m); if (rp < 0) 
{mpz_sub_ui(apods,apods,abs(rp));} else {mpz_add_ui(apods,apods,rp);} mm=m;}

    pp=mpz_get_str(NULL,10,apods); 

    char tab[rund*2*mm];
    mpz_t tabz[mm+1], tabg[rund*2*mm];
    long ltime;

unsigned mni (unsigned ali, unsigned amn)
{ mpz_set_ui(li,ali); mpz_set_ui(mn,amn);
mpz_mul(ax,li,mn); mpz_mod(ax,ax,apods);
return mpz_get_ui(ax); }

unsigned mnid (unsigned ali, mpz_t amnd)
{ mpz_set_ui(li,ali); 
mpz_mul(ax,li,amnd); mpz_mod(ax,ax,apods);
if (mpz_cmp_ui(ax,0)!=0)
{return 1; }
}
        ltime = time(NULL);
	  stime = (unsigned) ltime/2;
//    srand(stime);

    gmp_randstate_t state;
    gmp_randinit_default(state);
    gmp_randseed_ui(state,stime);

do {
for (i=0;i<(rund*2*mm);i++) {
do
{
mpz_urandomb(rop,state,8);
tab[i]=(mpz_get_ui(rop));
ki++;}
while (tab[i]==0);
}
warunek=1;

for (i=0;i<(rund*2*mm);i=i+2*mm) {

for (ii=(mm-1);ii>=0;ii--){
mpz_init_set_ui(tabz[ii],tab[i+ii]);
warunek=(warunek && (mnid(1,tabz[ii])!=0));
			}
mpz_init_set_ui(tabz[mm],0);

for (ii=(mm-1);ii>0;ii--){
mpz_ui_pow_ui(ax,ch,ii);
mpz_mul(ax,ax,tabz[ii]);
mpz_add(tabz[mm],tabz[mm],ax);
		    }
mpz_add(tabz[mm],tabz[mm],tabz[0]);

warunek=(warunek && ( (mnid(2,tabz[mm])!=0)) ); 
}
k++;
} while ( !warunek );

kluczc="./.key_gmp.txt";
archc="./.archkey_gmp.txt";
while (argc != 1)
    {
      if (strcmp (argv[1], "-k") == 0)
	{
	    kluczc=argv[2];
	  argv++;
	  argc--;
	}
      if (strcmp (argv[1], "-a") == 0)
	{
	    archc=argv[2];
	  argv++;
	  argc--;
	}
      if (strcmp (argv[1], "-s") == 0)
	{
	dbg=0;
	  argv++;
	  argc--;
	}
      else
	{  argv++;
	  argc--; }
    }

klucz = fopen( kluczc, "wb" );	
    fwrite(tab,1,rund*2*mm,klucz);
fclose(klucz);    

arch = fopen( archc, "ab" );	
    fwrite(tab,1,rund*2*mm,arch);
    fprintf(arch,"\n--end-key--(%i)\n",k);
fclose(arch);    

if (dbg) {
    printf("key generated in %i (%i) round, condition = %i\n",k,ki-k*i,warunek);
printf("(%i) %i bit, p=%s\n",m,mm*8,pp);
    for (i=0;i<(rund*2*mm);i++) {printf("%i ", tab[i] );}
    printf("\nfor encoding in %i rounds\n",rund);
	}

    gmp_randclear(state);
    mpz_clear(rop);
    mpz_clear(ax); mpz_clear(apods); mpz_clear(li); mpz_clear(mn);
    mpz_clear(amnd);
} //end main
